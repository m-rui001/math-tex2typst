"""Measure the tikzcd defect family in emitted canvases.

Symptoms measured
  leaked  canvas labels that still carry a LaTeX environment/command name (gathered, arrow, ...)
  tall    canvases whose drawn extent exceeds one page of text height
  cells   tikzcd cells written as multi-line `gathered` blocks (their line breaks are lost)
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
LEAK = re.compile(r"\b(gathered|tikzcd|arrow|begin|end|textbf|textit|substack|array)\b")

leaked = {}
for main in sorted((ROOT / "typst").glob("*/main.typ")):
    t = main.read_text(encoding="utf-8", errors="replace")
    hits = []
    for m in re.finditer(r"content\(\([^)]*\), \[([^\]]*)\]\)", t):
        if LEAK.search(m.group(1)):
            hits.append(m.group(1).strip()[:60])
    if hits:
        leaked[main.parent.name] = hits
print("papers with leaked env/command names in canvas labels: %d" % len(leaked))
for name, hits in leaked.items():
    print("   %-58s %d  %s" % (name[:58], len(hits), hits[0]))

# canvases taller than one page of text (us-letter content height ~ 792 - 2*72 = 648pt = ~22.9cm)
tall = []
for main in sorted((ROOT / "typst").glob("*/main.typ")):
    t = main.read_text(encoding="utf-8", errors="replace")
    for m in re.finditer(r"#figure\(\s*\n?\s*canvas\(\{", t):
        seg = t[m.start():]
        end = seg.find("\n})", 10)
        blk = seg[: end if end > 0 else 200000]
        ys = [float(y) for _, y in re.findall(r"\((-?\d+(?:\.\d+)?), (-?\d+(?:\.\d+)?)\)", blk)]
        if ys:
            h = max(ys) - min(ys)
            if h > 20.0:
                tall.append((round(h, 1), main.parent.name))
tall.sort(reverse=True)
print("canvases taller than 20cm of text height: %d" % len(tall))
for h, name in tall[:10]:
    print("   %5.1f cm  %s" % (h, name[:64]))

# tikzcd cells written as gathered blocks, per paper
cells = 0
papers = 0
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    t = path.read_text(encoding="utf-8", errors="replace")
    n = 0
    for m in re.finditer(r"\\begin\{tikzcd\}.*?\\end\{tikzcd\}", t, re.S):
        n += len(re.findall(r"\\begin\{gathered\}", m.group(0)))
    if n:
        cells += n
        papers += 1
print("tikzcd cells written as gathered blocks: %d in %d papers" % (cells, papers))
