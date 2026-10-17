r"""The A-boundary appendix float, at the three stages it passes through.

Prints the prepared LaTeX that prep lifted out of the source, the pandoc blocks that came of it,
and the Typst the emitter wrote, so the loss is located by measurement and not by reading code.
"""
import io
import json
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
WORKTEX = os.path.join(FLAT, "_work_tex")
A = "A-boundary-field-gap-for-the-spin-one-Heisenberg-chain-September-24-2026"
P = "Positive-scalar-curvature-and-uniform-codimension-two-width-September-23-2026"

tex = open(os.path.join(WORKTEX, A + ".tex"), encoding="utf-8", errors="replace").read()
i = tex.find("Every allowed entry")
print("=" * 90)
print("PREPARED LATEX (A-boundary, from the first appendix caption to the float end)")
print(tex[i - 900:tex.find("\\end{table}", i + 2600) + 12])

js = json.load(open(os.path.join(WORKTEX, A + ".json"), encoding="utf-8"))["blocks"]
for k in range(116, 124):
    node = js[k]
    text = json.dumps(node, ensure_ascii=False)
    caps = re.findall(r'"Str", "c": "([A-Za-z ,.\-]{6,})"', text)[:6]
    print("--- block %d %s :: %s" % (k, node["t"], " | ".join(caps)[:200]))

print("=" * 90)
print("PREPARED LATEX (Positive-scalar, the collar figure)")
ptex = open(os.path.join(WORKTEX, P + ".tex"), encoding="utf-8", errors="replace").read()
j = ptex.find("collar-figure")
print(ptex[j - 200:j + 200])
print("=" * 90)
typ = open(os.path.join(ROOT, "_work", "_probe_labels",
                        A[:40], "main.typ"), encoding="utf-8", errors="replace").read()
k = typ.find("Every allowed entry")
print("GENERATED TYPST (A-boundary appendix region)")
print(typ[k - 400:k + 2200])
