r"""Print the LaTeX source of the pictures #70 stopped lifting, with their display envelope.

A canvas whose every coordinate is (0, 0) means the maths converter read the picture as formula text
before CeTz ever saw it, so the thing to look at is what stands around `\begin{tikzpicture}` in the
flat source -- the `$`/`\[ \]` envelope and the coordinates the picture writes.
"""
import io
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = r"E:\math"
PAPER = sys.argv[1]
BODY = int(sys.argv[2]) if len(sys.argv) > 2 else 1200

text = open(ROOT + r"\_work\flat\%s.tex" % PAPER, encoding="utf-8").read()
for i, m in enumerate(re.finditer(r"\\begin\{tikzpicture\}", text)):
    print("========== picture %d at %d" % (i, m.start()))
    print(text[max(0, m.start() - 240):m.start() + BODY])
