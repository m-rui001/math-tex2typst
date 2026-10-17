"""The same picture as the two inputs disagree: _work/flat and the preprint the run reads.

A canvas that appears in the output but cannot be reproduced from the flat copy means the two
sources differ, so print both spellings of the picture and what the gate says about each.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
needle = sys.argv[1]
key = sys.argv[2] if len(sys.argv) > 2 else "/.style"
for label, path in (
        ("flat", next((ROOT / "_work" / "flat").glob(needle + "*.tex"))),
        ("preprint", next(p for p in (ROOT / "preprints").iterdir()
                          if p.name.startswith(needle)))):
    files = [path] if path.suffix else sorted(path.rglob("*.tex"))
    for f in files:
        for pic in PIC.findall(f.read_text(encoding="utf-8", errors="replace")):
            if key not in pic:
                continue
            print("== %s (%s) %d chars -> %s" % (
                label, "/".join(f.parts[-2:]), len(pic),
                "draws" if cetz.build(pic) else "refused"))
            print(" ".join(pic.split())[:400])
