"""List papers whose tikzpictures contain a grid or an \\ifnum, and say whether CeTz takes them.

Read-only over _work/flat: it calls cetz.build on the picture source but never touches typst/.
Run after a batch to aim the screenshot check at the figures the new rules just won.

Usage: python _work/probe_new_pictures.py
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz

PICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
KEYS = {"grid": re.compile(r"\bgrid\b"), "ifnum": re.compile(r"\\ifnum\b")}

for path in sorted((ROOT / "_work/flat").glob("*.tex")):
    hits = {}
    for m in PICTURE.finditer(path.read_text(encoding="utf-8", errors="replace")):
        body = m.group(0)
        for label, rx in KEYS.items():
            if rx.search(body):
                hits.setdefault(label, []).append(bool(cetz.convert(body)))
    if hits:
        print("%-58s %s" % (path.stem[:58], " ".join(
            "%s=%d/%d" % (k, sum(v), len(v)) for k, v in sorted(hits.items()))))
