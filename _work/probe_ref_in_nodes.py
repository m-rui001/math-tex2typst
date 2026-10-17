"""Count raw LaTeX cross-reference labels that reach a page as literal text inside a canvas.

A `\ref{sec:arithmetic}` in node text should print a number; when it prints its own label the
reader sees 'Section sec:arithmetic'. Only canvases are looked at -- body refs go through the
resolver that already handles the rest of the document.
"""
import glob
import os
import re
import sys

LABELLED = re.compile(r"[A-Za-z][A-Za-z0-9_-]*:[A-Za-z][A-Za-z0-9_.-]*")

papers = {}
samples = []
for src in sorted(glob.glob("typst/*/main.typ")):
    text = open(src, encoding="utf-8", errors="replace").read()
    n = 0
    for m in re.finditer(r"#cetz\.canvas\(\{.*?\n\}\)", text, re.S):
        for line in m.group(0).splitlines():
            if "content(" not in line:
                continue
            # a resolved ref is a number in the text; a label still carries its colon form
            found = LABELLED.findall(line)
            n += len(found)
            if found and len(samples) < 25:
                samples.append((src.split(os.sep)[1][:40], found[:4]))
    if n:
        papers[src.split(os.sep)[1][:60]] = n

print("occurrences: %d ; papers: %d" % (sum(papers.values()), len(papers)))
for p, n in sorted(papers.items(), key=lambda kv: -kv[1])[:12]:
    print("%4d  %s" % (n, p))
print("--- samples")
for p, f in samples:
    print("%-42s %s" % (p, f))
