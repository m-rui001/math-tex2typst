r"""Find the exact construct each refused picture stops on.

Runs the production stage pipeline (expand_def -> expand_foreach -> expand_def ->
expand_pgfmath -> expand_ifnum) from the sandbox cetz.py over the three refused
pictures copied verbatim from _work/refused_pic_detail.txt, printing where a pass
returns None.
"""
import sys
sys.path.insert(0, r"E:\math\_work\pic-pgfmath")
from t2t import cetz

PICS = {}
text = open(r"E:\math\_work\refused_pic_detail.txt", encoding="utf-8").read()
blocks = text.split("### ")
want = ("Finite-cylinder", "Universal-Tensor", "Critical-strip-crossing-mass")
for b in blocks:
    if not b.strip():
        continue
    name = b.splitlines()[0]
    if any(name.startswith(w) for w in want):
        src = b[b.index("\\begin{tikzpicture}"):]
        src = src[:src.index("\\end{tikzpicture}") + len("\\end{tikzpicture}")]
        PICS[name] = src

STAGES = [("def", cetz.expand_def), ("foreach", cetz.expand_foreach),
          ("def2", cetz.expand_def), ("pgfmath", cetz.expand_pgfmath),
          ("ifnum", cetz.expand_ifnum)]

for name, pic in sorted(PICS.items()):
    print("=" * 70)
    print(name)
    body = pic[pic.index("}") + 1:]  # drop the [options] head like canvas() does
    m = cetz.re.match(r"\\begin\{tikzpicture\}", pic)
    head, pos = cetz._opts_at(pic[m.end():].lstrip(), 0)
    body = pic[m.end():].lstrip()[pos:]
    end = body.rfind("\\end{tikzpicture}")
    body = body[:end]
    for label, fn in STAGES:
        out = fn(body)
        if out is None:
            print("STOPPED at", label)
            break
        body = out
    else:
        print("survived all stages; remainder begins:")
        print(body[:400])
        continue
    if label == "pgfmath":
        b = body
        while True:
            mm = cetz.PGFMATH_DEF.search(b)
            if not mm:
                break
            txt, after = cetz.bracketed(b, mm.end()) if b[mm.end():mm.end()+1] == "{" else (None, 0)
            print("pgfmath def:", mm.group(0), "| expr:", repr(txt), "| expr() =", cetz.expr(cetz._values_of(txt or "", {})))
            b = b[after:] if txt is not None else b[mm.end():]
    if label == "ifnum":
        b = body
        while True:
            mm = cetz.IFNUM.search(b)
            if not mm:
                break
            print("ifnum site:", repr(b[mm.start():mm.start()+60]))
            lhs, i = cetz._int_term(b, mm.end())
            print("  lhs:", lhs, "next char:", repr(b[i:i+1]))
            b = b[mm.end():]
