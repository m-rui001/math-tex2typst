r"""Replay the refusal sites with the sandbox passes, step by step.

1. Critical-strip: expand_ifnum returns None somewhere -- walk the loop by hand and print the
   site that fails.
2. Finite-cylinder: count the \pgfmathsetmacro definitions the unrolled foreach leaves, and check
   whether expand_pgfmath's loop cap or a lazy-value collapse is the blocker.
"""
import sys, re
sys.path.insert(0, r"E:\math\_work\pic-pgfmath")
from t2t import cetz

text = open(r"E:\math\_work\refused_pic_detail.txt", encoding="utf-8").read()
PICS = {}
for b in text.split("### "):
    if not b.strip():
        continue
    name = b.splitlines()[0]
    src = b[b.index("\\begin{tikzpicture}"):]
    src = src[:src.index("\\end{tikzpicture}") + len("\\end{tikzpicture}")]
    PICS[name.split("#")[0]] = src


def staged(pic, until):
    m = cetz.re.match(r"\\begin\{tikzpicture\}", pic)
    head, pos = cetz._opts_at(pic[m.end():].lstrip(), 0)
    body = pic[m.end():].lstrip()[pos:]
    body = body[:body.rfind("\\end{tikzpicture}")]
    for label, fn in (("def", cetz.expand_def), ("foreach", cetz.expand_foreach),
                      ("def2", cetz.expand_def), ("pgfmath", cetz.expand_pgfmath),
                      ("ifnum", cetz.expand_ifnum)):
        if label == "def2":
            continue
        body = fn(body)
        if body is None:
            return None, label
        if label == until:
            return body, label
    return body, "done"


# ---- 1. Critical-strip: step through expand_ifnum by hand -----------------
body, label = staged(PICS["Critical-strip-crossing-mass-on-the-honeycomb-lattice-September-26-2026"], "pgfmath")
print("critical-strip survived pgfmath?", body is not None)
b = body
for step in range(80):
    m = cetz.IFNUM.search(b)
    if not m:
        print("ifnum loop finished after", step, "steps")
        break
    lhs, i = cetz._int_term(b, m.end())
    j = i
    while j < len(b) and b[j] in " \t\n":
        j += 1
    if lhs is None or j >= len(b) or b[j] not in "=<>":
        print("FAIL at operand scan, step", step, repr(b[m.start():m.start()+70]))
        print("  lhs", lhs, "next", repr(b[j:j+1]))
        break
    op, k = b[j], j + 1
    rhs, k = cetz._int_term(b, k)
    if rhs is None:
        print("FAIL rhs not a number, step", step, repr(b[m.start():m.start()+70]))
        break
    while k < len(b) and b[k] in " \t\n":
        k += 1
    depth, else_at, t = 1, -1, k
    bad = None
    while t < len(b):
        tok = cetz.COND_TOKEN.search(b, t)
        if tok is None or tok.group(0) == "\\or":
            bad = "no \\fi / \\or"
            break
        if tok.group(0).startswith("\\if"):
            depth += 1
        elif tok.group(0) == "\\fi":
            depth -= 1
            if depth == 0:
                break
        elif tok.group(0) == "\\else" and depth == 1 and else_at < 0:
            else_at = tok.start()
        t = tok.end()
    if bad or depth != 0:
        print("FAIL branch scan, step", step, bad, repr(b[m.start():m.start()+70]))
        break
    then_to = else_at if else_at >= 0 else tok.start()
    taken = b[k:then_to] if cetz._cmp(op, lhs, rhs) else (
        b[else_at + 5:tok.start()] if else_at >= 0 else "")
    b = b[:m.start()] + taken + b[tok.end():]
else:
    print("hit 80 steps without finishing")

# ---- 2. Finite-cylinder --------------------------------------------------
fc, _ = staged(PICS["Finite-cylinder-approximation-of-ruled-sets-September-27-2026"], "foreach")
print("finite-cylinder defs after foreach:", fc.count("\\pgfmathsetmacro"))
ut, _ = staged(PICS["Universal-Tensor-Squares-for-Symmetric-Groups-September-24-2026"], "foreach")
print("universal-tensor defs after foreach:", ut.count("\\pgfmath"))

# does a redefined macro collapse to the last value today?
probe = (r"\pgfmathsetmacro{\a}{1}\draw (0,0) -- (\a,0);"
         r"\pgfmathsetmacro{\a}{2}\draw (0,0) -- (\a,0);")
print("redefine fold ->", repr(cetz.expand_pgfmath(probe)))
