"""Classify what the source figure floats hold where we emitted empty content.

An empty `#figure([], caption: ...)` means the body of the float produced nothing, so the
question is what that body was written in: a placeholder we substituted away, an environment
pandoc drops, or a picture that never reached the emitter.
"""
import glob
import re
import sys
from collections import Counter
from pathlib import Path

FIGURE = re.compile(r"\\begin\{figure\*?\}(.*?)\\end\{figure\*?\}", re.S)
MARKS = [
    ("tikzpicture", re.compile(r"\\begin\{tikzpicture\}")),
    ("tikzcd", re.compile(r"\\begin\{tikzcd\}")),
    ("includegraphics", re.compile(r"\\includegraphics")),
    ("pspicture", re.compile(r"\\begin\{pspicture|\\psset")),
    ("xy-pic", re.compile(r"\\xymatrix|\\begin\{CD\}")),
    ("array-math", re.compile(r"\\begin\{array|\\begin\{matrix|\\begin\{pmatrix")),
    ("tabular", re.compile(r"\\begin\{tabular")),
]


def classify(body):
    for name, rx in MARKS:
        if rx.search(body):
            return name
    stripped = re.sub(r"\\caption\{.*?\}", "", body, flags=re.S)
    stripped = re.sub(r"\\label\{[^{}]*\}|\\centering|\\[\[\]]|\\nonumber", "", stripped)
    return "prose-only" if stripped.strip() else "caption-only"


def main():
    empties = int(sys.argv[1]) if len(sys.argv) > 1 else 209
    counts = Counter()
    papers = Counter()
    shown = 0
    for path in sorted(Path("typst").glob("*/main.typ")):
        text = path.read_text(encoding="utf-8", errors="replace")
        n = len(re.findall(r"#figure\(\s*\[\],", text))
        if not n:
            continue
        name = path.parent.name
        flat = Path("_work", "flat", name + ".tex")
        if not flat.exists():
            counts["no-source"] += n
            continue
        src = flat.read_text(encoding="utf-8", errors="replace")
        for m in FIGURE.finditer(src):
            kind = classify(m.group(1))
            counts[kind] += 1
            papers[kind] += 1 if kind != "caption-only" else 0
    print("empty-figure occurrences counted: %d" % sum(counts.values()))
    for kind, n in counts.most_common():
        print("%5d  %-16s papers=%d" % (n, kind, papers[kind]))
    if shown == 0 and counts:
        pass


main()
