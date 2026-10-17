r"""Estimate how often a CeTz node's text is wider than the box CeTz gave it.

CeTz emits `content((x1,y1),(x2,y2), [text])`, so the box is on the page but the text width is not
measured. Estimate the text width in cm (1em = 0.35 cm at 10pt, subscripts and superscripts counted
smaller) and call it a spill when the estimate exceeds the box. A heuristic: the numbers only mean
something after a spill site is looked at, so the report prints the worst offenders first.

Usage: python _work/probe_text_spill.py [top-count]
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CONTENT = re.compile(r"content\(\((-?[\d.]+), *(-?[\d.]+)\), *\((-?[\d.]+), *(-?[\d.]+)\), "
                     r"\[(.*?)\]", re.S)
EM = 0.35


def text_width(body):
    """Rough typeset width of a Typst content string, in cm."""
    body = re.sub(r"\\\$", "", body)
    total = 0.0
    for part in re.split(r"(\$[^$]*\$)", body):
        if not part:
            continue
        if part.startswith("$"):
            inner = part[1:-1]
            inner = re.sub(r"\\[A-Za-z]+", "W", inner)      # \varphi ~ one letter
            inner = re.sub(r"[_^]\{[^{}]*\}", "", inner)    # dropped: attached, half width
            total += len(inner.replace(" ", "")) * 0.55 * EM
        else:
            words = re.findall(r"[A-Za-z0-9]+", part)
            total += sum(len(w) * 0.5 * EM + 0.18 * EM for w in words)
    return total


rows = []
seen = 0
for paper in sorted(os.listdir(os.path.join(ROOT, "typst"))):
    path = os.path.join(ROOT, "typst", paper, "main.typ")
    if not os.path.isfile(path):
        continue
    source = open(path, encoding="utf-8", errors="replace").read()
    for m in CONTENT.finditer(source):
        seen += 1
        x1, x2, body = float(m.group(1)), float(m.group(3)), m.group(4)
        box = abs(x2 - x1)
        need = text_width(body)
        if box <= 0 or need <= 1.25 * box:
            continue
        rows.append((need / box, paper, box, need, body.strip()[:60]))

rows.sort(reverse=True)
spill_papers = len(set(r[1] for r in rows))
print("content boxes: %d ; estimated spills: %d over %d papers"
      % (seen, len(rows), spill_papers))
print("ratio >2 : %d ; >1.5 : %d"
      % (sum(1 for r in rows if r[0] > 2), sum(1 for r in rows if r[0] > 1.5)))
for ratio, paper, box, need, body in rows[:int(sys.argv[1]) if len(sys.argv) > 1 else 15]:
    print("  %5.2fx  box %.2f need %.2f  %-34s  %s"
          % (ratio, box, need, paper[:34], body.encode("unicode_escape", "replace").decode()[:60]))
