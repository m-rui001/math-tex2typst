"""Census + compile gate for the grown-frame spelling.

A sized, framed node whose label has a line break is now emitted as a Typst `box` whose width the
author declared and whose height Typst measures. This walks every flat picture, counts the canvases
that carry the new line, prints the reproducing node, and COMPILES a sample of them: a spelling that
fails `compiles` would drop each affected paper back to quoted LaTeX, so the sample is the gate
before a batch (nothing here runs while a batch is in flight).
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

LC = 15.79
PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
DEFINECOLOR = re.compile(r"\\definecolor\{([-\w]+)\}\{(\w+)\}\{([^{}]*)\}")
GROWN = re.compile(r"^\s+content\(\([^()]*\), \[#box\(width: ", re.M)

hit = []
built = refused = 0
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    paper = path.name[:-4]
    src = path.read_text(encoding="utf-8", errors="replace")
    pal = {}
    for m in DEFINECOLOR.finditer(src):
        pal[m.group(1)] = (m.group(2), m.group(3))
    for m in PICTURE.finditer(src):
        core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), LC)
        canvas = cetz.build(core, pal) or cetz.build_cd(core)
        if canvas is None:
            refused += 1
            continue
        built += 1
        if GROWN.search(canvas):
            hit.append((paper, canvas))

papers = set(p for p, _ in hit)
print("built: %d ; refused statically: %d" % (built, refused))
print("canvases carrying the grown frame: %d over %d papers, %d nodes"
      % (len(hit), len(papers), sum(len(GROWN.findall(c)) for _, c in hit)))

for paper, canvas in hit[:3]:
    for line in canvas.splitlines():
        if line.startswith("content(("):
            print("  %s: %s" % (paper, line[:300]))

# compile one canvas per affected paper; the spelling is the same everywhere, so this is
# a sample of the shapes the corpus actually writes (fills, radii, maths in the label).
fails = seen = 0
rest = set(papers)
for paper, canvas in hit:
    if paper not in rest:
        continue
    rest.discard(paper)
    seen += 1
    if not cetz.compiles(canvas):
        fails += 1
        print("COMPILE FAIL: %s" % paper)
print("compiled %d canvases, failures: %d" % (seen, fails))
