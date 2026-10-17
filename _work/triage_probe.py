# -*- coding: utf-8 -*-
import io, json, re, collections, os

W = "E:/math/_work/"
ROOT = "E:/math/" + "\u7814\u7a76\u7b14\u8bb0"  # 研究笔记
B = chr(92)
D = chr(36)

sites = []
for line in io.open(W + "katex_sites.jsonl", encoding="utf-8"):
    line = line.strip()
    if line:
        sites.append(json.loads(line))

# cache note text + macro-definition map per note
cache = {}
def notetext(fn):
    if fn not in cache:
        cache[fn] = io.open(os.path.join(ROOT, fn), encoding="utf-8").read()
    return cache[fn]

# definition patterns: \newcommand{\X}[n]{body} / \DeclareMathOperator{\X}{body}
DECL = re.compile(
    r"\\(?:DeclareMathOperator|DeclarePairedDelimiter|newcommand|renewcommand|"
    r"providecommand)\s*\*?\s*\{\s*\\([A-Za-z]+)\s*\}")

def _body_after(txt, i):
    """From index i (just after the {name} group), skip optional [n],
    return (nargs, body) of the following {...} definition body."""
    while i < len(txt) and txt[i] in " \t":
        i += 1
    nargs = "0"
    if i < len(txt) and txt[i] == "[":
        j = txt.find("]", i)
        if j > 0:
            nargs = txt[i + 1:j].strip()
            i = j + 1
    while i < len(txt) and txt[i] in " \t":
        i += 1
    if i < len(txt) and txt[i] == "{":
        depth = 0
        for k in range(i, min(len(txt), i + 200)):
            if txt[k] == "{":
                depth += 1
            elif txt[k] == "}":
                depth -= 1
                if depth == 0:
                    return nargs, txt[i + 1:k]
    return nargs, ""

def defs_in(fn):
    txt = notetext(fn)
    d = {}
    for m in DECL.finditer(txt):
        name = m.group(1)
        if name in d:
            continue
        nargs, body = _body_after(txt, m.end())
        d[name] = (nargs, body[:80])
    return d

bytok = collections.defaultdict(list)
byclass = collections.defaultdict(list)
for s in sites:
    (bytok if s["tok"] else byclass)[s["tok"] or s["errClass"]].append(s)

out = io.open(W + "triage_report.txt", "wb")
def p(x=""):
    out.write((x + "\n").encode("utf-8"))

p("############ UNDEF TOKENS (per-note preamble check) ############")
for t, ss in sorted(bytok.items(), key=lambda x: -len(x[1])):
    p("")
    p("TOKEN %s  count=%d" % (t, len(ss)))
    name = t[1:]
    for s in ss[:3]:
        fn = s["file"]
        dd = defs_in(fn)
        info = dd.get(name)
        p("  %s:%d  defined_in_note=%s" % (
            os.path.basename(fn).split("-")[0], s["line"],
            (repr(info) if info else "NO")))
        body = s["body"]
        p("      body: %s" % body[:160].replace("\n", "\\n"))
        if s["lineText"]:
            p("      line: %s" % s["lineText"][:200])

p("")
p("############ OTHER CLASSES (samples) ############")
for c, ss in sorted(byclass.items(), key=lambda x: -len(x[1])):
    p("")
    p("CLASS [%s]  count=%d" % (c, len(ss)))
    for s in ss[:4]:
        p("  %s:%d kind=%s" % (os.path.basename(s["file"]).split("-")[0], s["line"], s["kind"]))
        p("      body: %s" % s["body"][:170].replace("\n", "\\n"))
out.close()

raw = io.open(W + "triage_report.txt", "rb").read()
assert b"\r" not in raw, "CR found"
print("report bytes=%d cr-free" % len(raw))
