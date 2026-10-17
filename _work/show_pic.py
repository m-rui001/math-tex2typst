"""One picture, as the source wrote it and as our canvas came out.

The eye finds a wrong drawing long before a diff finds it, so print the two spellings side by
side: pass a paper prefix and, optionally, which picture of that paper to show.
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
which = int(sys.argv[2]) if len(sys.argv) > 2 else 0
path = next(p for p in sorted((ROOT / "_work" / "flat").glob(sys.argv[1] + "*.tex")))
pics = PIC.findall(path.read_text(encoding="utf-8", errors="replace"))
print(" ".join(pics[which].split()))
print("\n----- build -----")
canvas = cetz.build(pics[which])
print(canvas if canvas else "refused")
print("\n----- build_cd on the same chunk -----")
cd = cetz.build_cd(pics[which])
print(cd if cd else "refused")
