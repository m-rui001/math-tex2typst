# -*- coding: utf-8 -*-
# 带参宏泄漏腿。preamble_tables.json 把带 #1/#2 的宏记成 unresolved（0 参展开器不会替换参数），
# 这些宏 KaTeX 全不认，产物里会把命令名印成字母。本脚本按该篇素材自己的定义精确代入。
# 约束：只碰 unresolved 名单；素材里找不到定义就不动（登记不发明）；实参必须是花括号形，
# 单 token 形（\norm x）不动并计数；定义体里的裸竖线换成 \lvert/\rVert 同义写法，
# 免得台账格内竖线计数被改动；跳过围栏、行内代码段与 \newcommand 自述行。
import glob, io, json, os, re, sys

APPLY = u"--apply" in sys.argv
SHOW = u"--show" in sys.argv
SINGLE = u"--single" in sys.argv
PILOT = [a for a in sys.argv[1:] if not a.startswith(u"--")]
TBL = json.load(io.open(u"_work/preamble_tables.json", encoding="utf-8"))
EXCL = set(io.open(u".tools/inflight.txt", encoding="utf-8").read().split())
KNOWN = set([u"\\mathscr", u"\\mathbb", u"\\mathrm", u"\\mathbf", u"\\boldsymbol",
             u"\\operatorname", u"\\text", u"\\boxed", u"\\substack", u"\\displaystyle"])
CS = r"\\[A-Za-z@]+"
# 定义体里的控制字若紧贴字母（素材常写 \left\lvert#1\right\rvert），代入实参后就会融合成新命令。
# 展开产物落地前先统一补一枚空格；\middle 是真命令，必须排除。
FUSE = re.compile(u"\\\\(lVert|rVert|Vert|lvert|rvert|mid(?!dle))(?=[A-Za-z])")


def strip_comment(line):
    i = 0
    while i < len(line):
        if line[i] == u"%":
            k = i - 1
            while k >= 0 and line[k] == u"\\":
                k -= 1
            if (i - k - 1) % 2 == 0:
                return line[:i]
        i += 1
    return line


def brace_body(s, i):
    d, j = 0, i
    while j < len(s):
        if s[j] == u"{":
            d += 1
        elif s[j] == u"}":
            d -= 1
            if d == 0:
                return s[i + 1:j], j + 1
        j += 1
    return None, i


def material_text(dirname):
    out = []
    for root, ds, fs in os.walk(os.path.join(u"preprints", dirname)):
        for f in fs:
            if f.endswith((u".tex", u".sty", u".cls")):
                b = io.open(os.path.join(root, f), "rb").read().decode("utf-8", "replace")
                out.append(u"\n".join(strip_comment(l) for l in b.split(u"\n")))
    return u"\n".join(out)


def find_defs(src, want):
    res = {}
    pat = re.compile(r"\\(?:re|new|provide|DeclareRobust)?command\s*\{?(" + CS + r")\}?\s*(?:\[(\d)\])?\s*")
    for m in pat.finditer(src):
        name = m.group(1)
        if name not in want or name in res:
            continue
        i = src.find(u"{", m.end() - 1)
        if i < 0 or i > m.end():
            continue
        body, _ = brace_body(src, i)
        if body is not None:
            res[name] = (int(m.group(2) or 1), body)
    pat2 = re.compile(r"\\def\s*(" + CS + r")\s*((?:#[^{}]+)*)\s*")
    for m in pat2.finditer(src):
        name = m.group(1)
        if name not in want or name in res:
            continue
        i = src.find(u"{", m.end() - 1)
        if i < 0 or i > m.end():
            continue
        body, _ = brace_body(src, i)
        if body is not None:
            res[name] = (len(re.findall(r"#", m.group(2))), body)
    # mathtools 的成对定界符形式：素材里 \norm \abs \ip \floor \set 都走这条，
    # 上面的 command 正则一条也抓不到。
    pat3 = re.compile(r"\\DeclarePairedDelimiter(X)?\s*\{?(" + CS + r")\}?\s*"
                      r"(?:\[(\d)\])?\s*")
    for m in pat3.finditer(src):
        is_x, name, nn = m.group(1), m.group(2), m.group(3)
        if name not in want or name in res:
            continue
        bodies, ok, i = [], True, m.end()
        for _ in range(3 if is_x else 2):
            while i < len(src) and src[i] in u" \t\n":
                i += 1
            if i >= len(src) or src[i] != u"{":
                ok = False
                break
            b, i = brace_body(src, i)
            if b is None:
                ok = False
                break
            bodies.append(b)
        if not ok:
            continue
        code = bodies[2] if is_x else u"#1"
        res[name] = (int(nn or 1),
                     u"\\left" + bodies[0] + u" " + code + u" \\right" + bodies[1])
    return res


def body_safe(body):
    r"""定义体不得引入裸竖线：\| 与 | 都换成成对的 \lVert/\rVert、\lvert/\rvert。"""
    b = body.replace(u"\\left\\|", u"\\left\\lVert ").replace(u"\\right\\|", u"\\right\\rVert ")
    for big in (u"\\bigg", u"\\Bigg", u"\\big", u"\\Big"):
        b = b.replace(big + u"\\|", big + u"\\lVert ")
    b = b.replace(u"\\|", u"\\Vert ")
    if u"|" in b:
        parts, out, open_ = b.split(u"|"), [], False
        out.append(parts[0])
        for seg in parts[1:]:
            out.append((u"\\lvert " if not open_ else u"\\rvert ") + seg)
            open_ = not open_
        b = u"".join(out)
    return b


def take_args(line, pos, n):
    """实参取法：花括号形永远接受；--single 时再认 TeX 的「下一枚 token」（控制序列或单个字母数字）。
    token 形若紧跟 `_`/`^` 就放弃——展开后上下标会挂到闭符上，与作者本意可能分叉，这种留在 noargs 账上。"""
    i, vals = pos, []
    for _ in range(n):
        while i < len(line) and line[i] in u" \t":
            i += 1
        if i >= len(line):
            return None
        if line[i] == u"{":
            body, i = brace_body(line, i)
            if body is None:
                return None
            vals.append(body)
            continue
        if not SINGLE:
            return None
        m = re.match(CS, line[i:])
        if m:
            tok, step = m.group(0), m.end()
        elif line[i].isalnum():
            tok, step = line[i], 1
        else:
            return None
        if line[i + step:i + step + 1] in (u"_", u"^"):
            return None
        vals.append(tok)
        i += step
    return vals, i


def expand_line(line, defs, st):
    src0 = line
    for _ in range(200):
        hit = None
        for mac, (n, body) in defs.items():
            k = line.find(mac)
            while k >= 0:
                after = line[k + len(mac):k + len(mac) + 1]
                if after.isalpha():
                    k = line.find(mac, k + 1)
                    continue
                got = take_args(line, k + len(mac), n)
                if not got:
                    st[u"noargs|" + mac] = st.get(u"noargs|" + mac, 0) + 1
                    return line
                vals, end = got
                rep = body
                for idx in range(n, 0, -1):
                    rep = rep.replace(u"#" + str(idx), vals[idx - 1])
                if u"#" in rep:
                    st[u"leftarg|" + mac] = st.get(u"leftarg|" + mac, 0) + 1
                    return line
                rep = FUSE.sub(u"\\\\\\g<1> ", rep)
                if SINGLE and rep in src0:
                    # 记号定义句里「\Zmod m = \Z/m\Z」这种：展开产物已在原行出现过，展开＝收成恒等式。
                    st[u"taut|" + mac] = st.get(u"taut|" + mac, 0) + 1
                    return line
                line = line[:k] + rep + line[end:]
                st[mac] = st.get(mac, 0) + 1
                hit = True
                break
            if hit:
                break
        if not hit:
            return line
    return line


rows = []
for f in sorted(glob.glob(u"研究笔记/D*.md")):
    key = re.match(r"D\d+", os.path.basename(f)).group(0)
    if key in EXCL or key not in TBL or (PILOT and key not in PILOT):
        continue
    want = set(m for m in (TBL[key].get(u"unresolved") or []) if m not in KNOWN)
    raw = io.open(f, "rb").read().decode("utf-8")
    if not any(m in raw for m in want):
        continue
    defs = dict((m, (n, body_safe(b))) for m, (n, b) in find_defs(
        material_text(TBL[key][u"dir"]), want).items())
    st = {}
    lines, fence = raw.split(u"\n"), False
    orig = list(lines)
    for i, l in enumerate(lines):
        if l.startswith(u"```"):
            fence = not fence
            continue
        if fence or u"newcommand" in l or u"renewcommand" in l:
            continue
        segs = l.split(u"`")
        lines[i] = u"`".join(expand_line(s, defs, st) if j % 2 == 0 else s
                             for j, s in enumerate(segs))
    new = u"\n".join(lines)
    exp = sum(v for k2, v in st.items() if u"|" not in k2)
    na = sum(v for k2, v in st.items() if k2.startswith(u"noargs|"))
    la = sum(v for k2, v in st.items() if k2.startswith(u"leftarg|"))
    ta = sum(v for k2, v in st.items() if k2.startswith(u"taut|"))
    und = sorted(want - set(defs))
    if not (exp or na or la):
        continue
    detail = u" ".join(u"%s x%d" % (k2, v) for k2, v in
                       sorted((x for x in st.items() if u"|" not in x[0]), key=lambda y: -y[1]))[:120]
    rows.append((key, exp, na, la, ta, len(raw.encode("utf-8")), len(new.encode("utf-8")),
                 detail, u"noDef=" + u",".join(und)[:60]))
    if SHOW:
        n = 0
        for i in range(len(lines)):
            if lines[i] == orig[i]:
                continue
            n += 1
            print(u"  --- %s:%d\n  OLD %s\n  NEW %s" % (key, i + 1, orig[i].strip()[:150],
                                                        lines[i].strip()[:150]))
            if n >= 6:
                break
    if APPLY and not SHOW:
        assert u"\r" not in new
        assert new.count(u"`") == raw.count(u"`")
        assert new.count(u"$") == raw.count(u"$")
        assert new.count(u"|") <= raw.count(u"|")
        tag = u"pre-single" if SINGLE else u"pre-param"
        io.open(u"_work/%s.%s.md" % (key, tag), "wb").write(raw.encode("utf-8"))
        io.open(f, "wb").write(new.encode("utf-8"))

for r in rows:
    print(u"%-6s exp=%-5d noargs=%-4d leftarg=%-3d taut=%-3d bytes %d->%d  %s  %s" % r[:9])
print(u"APPLY=%s SINGLE=%s notes=%d expanded=%d noargs=%d leftarg=%d taut=%d bytes=%+d" % (
    APPLY, SINGLE, len(rows), sum(r[1] for r in rows), sum(r[2] for r in rows),
    sum(r[3] for r in rows), sum(r[4] for r in rows), sum(r[6] - r[5] for r in rows)))
