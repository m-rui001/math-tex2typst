r"""Corpus-wide before/after for the name reader: replay every picture of every flat paper
through `build()` and hash the canvas it answers.

Run twice, once against the live tree and once against the sandbox, and diff the two reports. A
picture that drew before and answers None now is a regression, the other direction is a gain, and a
changed hash is a canvas whose geometry moved and has to be read by hand. The papers' own macros are
not expanded here: both runs get the identical text, so any difference is the reader, not the input.

Usage: python _work/pic-3d/corpus_all.py <tree-on-sys.path> <out-file>
"""
import glob
import hashlib
import io
import re
import sys

sys.path.insert(0, sys.argv[1])
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
from t2t import cetz  # noqa: E402

PICS = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
rows, total, drawn = [], 0, 0
for path in sorted(glob.glob(r"E:\math\_work\flat\*.tex")):
    src = open(path, encoding="utf-8", errors="replace").read()
    name = path.split("\\")[-1][:-4]
    for n, pic in enumerate(PICS.finditer(src)):
        total += 1
        try:
            got = cetz.build(pic.group(0))
        except Exception as exc:                        # a crash is its own answer
            rows.append("%s#%d EXCEPTION %s" % (name, n, type(exc).__name__))
            continue
        if got is None:
            rows.append("%s#%d None" % (name, n))
        else:
            drawn += 1
            rows.append("%s#%d %s" % (name, n, hashlib.md5(str(got).encode()).hexdigest()[:8]))
with open(sys.argv[2], "w", encoding="utf-8") as fh:
    fh.write("\n".join(rows) + "\n")
print("pictures", total, "drawn", drawn, "refused", total - drawn)
