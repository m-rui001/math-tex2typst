r"""Ask the real compile gate which double-head mark CeTz draws.

tikzcd's 'two heads' is the epimorphism tip >>; CeTz names its marks after TikZ's arrow
tips, so the candidates are '>->>' and '>>'. compiles() is the same gate the converter
uses, so a mark it rejects costs a refused diagram and nothing worse.
"""
import io
import pathlib
import subprocess
import sys
import tempfile

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402


def gate(mark):
    canvas = ('#cetz.canvas({\n  import cetz.draw: *\n'
              '  content((0, 0), [$A$])\n  content((0, 1.7), [$B$])\n'
              '  line((0, 0.3), (0, 1.4), mark: (end: "%s"))\n})' % mark)
    got = cetz.sane(canvas) and cetz.compiles(canvas)
    print("%-8s sane+compiles: %s" % (mark, got))
    return got


for mark in (">", ">->>", ">>", ">->", "<->"):
    gate(mark)

# a whole refused diagram, drawn with the winning mark by hand
src = r"""\begin{tikzcd}
W_L \arrow[r,"\varphi"] \arrow[d,two heads,"\rho_P"'] & U \arrow[d,"\psi"] \\
V \arrow[r,"\eta"'] & W
\end{tikzcd}"""
print("\nconverts today:", bool(cetz.convert(src)))
print(cetz.build_cd(src) or "refused")
