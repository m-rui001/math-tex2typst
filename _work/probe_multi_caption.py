"""Floats that hold more than one captioned object.

One `\begin{table}` with three tabulars, each with its own `\caption` and `\label`, is legal
LaTeX and numbers the three tables in sequence. Pandoc gives every table inside the float the
float's last caption and keeps only one label, so the emitter repeats a caption and the other
references dangle. Count how many papers carry such a float, split by environment.
"""
import pathlib
import re
import sys

FLOAT = re.compile(r"\\begin\{(table|figure)\*?\}(.*?)\\end\{\1\}", re.S)
CAPTION = re.compile(r"\\caption\{")
LABEL = re.compile(r"\\label\{([^{}]*)\}")

rows = {}
for path in sorted(pathlib.Path("_work", "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    for env, body in FLOAT.findall(src):
        caps = len(CAPTION.findall(body))
        if caps < 2:
            continue
        rows.setdefault(path.stem, []).append((env, caps, len(LABEL.findall(body))))

print({"papers": len(rows), "floats": sum(len(v) for v in rows.values())})
for stem, hits in list(rows.items())[:14]:
    print("  %-62s %s" % (stem[:62], hits))
