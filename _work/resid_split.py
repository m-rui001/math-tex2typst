# -*- coding: utf-8 -*-
u"""把 unres_census 的残留面拆两档：落在行内代码反引号里的逐字引用 vs 正文中的使用。"""
import io, json, os, re, glob

TBL = json.load(io.open(os.path.join(u"_work", u"preamble_tables.json"), encoding="utf-8"))
# KaTeX 本身就认识的命令不算泄漏，与 param_macro_expand.py / unres_census.js 同一份名单。
KNOWN = set([u"\\mathscr", u"\\mathbb", u"\\mathrm", u"\\mathbf", u"\\boldsymbol",
             u"\\operatorname", u"\\text", u"\\boxed", u"\\substack", u"\\displaystyle"])
notes = sorted(glob.glob(os.path.join(u"研究笔记", u"D*.md")))
tot = code = body = braced_tot = bare_tot = 0
per = {}
for f in notes:
    key = os.path.basename(f).split(u"-")[0]
    e = TBL.get(key)
    if not e or not e.get(u"unresolved"):
        continue
    text = io.open(f, encoding=u"utf-8", errors=u"replace").read()
    lines = text.split(u"\n")
    fence = False
    n_code = n_body = n_braced = n_bare = 0
    for ln in lines:
        if ln.startswith(u"```"):
            fence = not fence
            continue
        if fence:
            continue
        if re.search(u"newcommand|renewcommand|\\\\def\\b|DeclareMath", ln):
            continue
        segs = ln.split(u"`")
        for mac in e[u"unresolved"]:
            if mac in KNOWN:
                continue
            pat = re.compile(re.escape(mac) + u"(?![A-Za-z])")
            for i, s in enumerate(segs):
                c = len(pat.findall(s))
                if not c:
                    continue
                if i % 2 == 1:
                    n_code += c
                else:
                    n_body += c
                    braced = len(re.findall(re.escape(mac) + u"\\s*\\{", s))
                    n_braced += min(braced, c)
                    n_bare += max(0, c - braced)
    tot += n_code + n_body
    code += n_code
    body += n_body
    braced_tot += n_braced
    bare_tot += n_bare
    if n_code:
        per[key] = (n_code, n_body)

print(u"residual_total=%d  inline_code=%d  body=%d  (body braced=%d bare=%d)" % (
    tot, code, body, braced_tot, bare_tot))
items = sorted(per.items(), key=lambda kv: -kv[1][0])[:12]
for k, v in items:
    print(u"  %-6s code=%-4d body=%d" % (k, v[0], v[1]))
