r"""Verbatim JSON of the blocks the shape probe produced.

Prints pandoc's Figure/Table/Div blocks from _work/probe_labels_pandoc.tex in full so the exact
home of a second \label is visible: the identifier of the float, a Span inside its content, or a
Span inside its caption.
"""
import io
import json
import os
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TEX = os.path.join(ROOT, "_work", "probe_labels_pandoc.tex")
OUT = os.path.join(ROOT, "_work", "_probe_labels", "pandoc.json")
subprocess.run([os.environ.get("PANDOC", "pandoc"), TEX, "-f", "latex", "-t", "json",
                "-o", OUT], capture_output=True, text=True, encoding="utf-8")
blocks = json.load(open(OUT, encoding="utf-8"))["blocks"]
for i in (1, 2, 3, 4, 5, 6, 7, 9):
    print("=== block %d ===" % i)
    print(json.dumps(blocks[i], ensure_ascii=False)[:1800])
    print()
