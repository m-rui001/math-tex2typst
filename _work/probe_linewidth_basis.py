r"""How many pictures set their basis from \linewidth / \textwidth?

CeTz's `_transform` needs a length it can express in Typst; `\linewidth` is the width of the running
column at render time, so a picture whose `x=`/`y=` option is a `\linewidth` fraction cannot get a
basis and the whole picture is quoted instead of drawn. Count the pictures and name them.
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd)\}(.*?)\\end\{\1\}", re.S)
OPTS = re.compile(r"^\s*\[(.*?)\]", re.S)
LINELIKE = re.compile(r"\\(?:text|line|column)width")

hits = []
for tex in sorted(os.listdir(os.path.join(ROOT, "_work", "flat"))):
    if not tex.endswith(".tex"):
        continue
    src = open(os.path.join(ROOT, "_work", "flat", tex), encoding="utf-8", errors="replace").read()
    for i, m in enumerate(PICTURE.finditer(src)):
        head = OPTS.match(m.group(2))
        if not head:
            continue
        bad = sorted({g.group(0) for g in LINELIKE.finditer(head.group(1))})
        if bad:
            hits.append((tex[:-4][:44], i, bad, head.group(1).replace("\n", " ")[:110]))

print("pictures with a \\linewidth/\\textwidth basis option: %d over %d papers"
      % (len(hits), len(set(h[0] for h in hits))))
for paper, i, bad, opts in hits:
    print("   %-44s #%d %s | %s" % (paper, i, ",".join(bad), opts.encode("unicode_escape", "replace").decode()[:110]))
