r"""Corpus-wide before/after for the pgfmath passes.

Run it twice, once with the live tree on sys.path and once with the sandbox, and diff the two
reports: a picture that converted before and refuses now is a regression, the other direction is
a gain. Every picture in _work/flat carrying \pgfmath or \ifnum is replayed through build(), the
converter without the compile gate.
"""
import glob
import hashlib
import re
import sys

sys.path.insert(0, sys.argv[1])
from t2t import cetz

PICS = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
rows = []
for path in sorted(glob.glob(r"E:\math\_work\flat\*.tex")):
    src = open(path, encoding="utf-8", errors="replace").read()
    for n, pic in enumerate(PICS.finditer(src)):
        text = pic.group(0)
        if "\\pgfmath" not in text and "\\ifnum" not in text:
            continue
        got = None
        try:
            got = cetz.build(text)
        except Exception as exc:                        # a crash is its own answer
            got = "EXCEPTION " + type(exc).__name__
        mark = "None" if got is None else ("RAW" if got == "RAW" else
                                           hashlib.md5(str(got).encode()).hexdigest()[:8]
                                           if not isinstance(got, str) or got != "EXCEPTION"
                                           else got)
        if isinstance(got, str) and got.startswith("EXCEPTION"):
            mark = got
        rows.append("%s#%d %s" % (path.split("\\")[-1][:-4], n, mark))
print("\n".join(rows))
print("TOTAL", len(rows), "CONVERTED", sum(1 for r in rows if "None" not in r))
