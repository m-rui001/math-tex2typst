r"""Print one paper's picture source and the canvas the converter builds from it.

Used to read a rendered figure's defect back to a statement: which node options the author wrote,
and what the canvas does with them.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
sys.stdout.reconfigure(errors="replace")
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
name = sys.argv[1]
path = next((ROOT / "_work" / "flat").glob(name + "*.tex"))
text = path.read_text(encoding="utf-8", errors="replace")
which = int(sys.argv[2]) if len(sys.argv) > 2 else 0
pic = PIC.findall(text)[which]
print("=== SOURCE ===")
print(pic)
print("=== CANVAS ===")
print(cetz.build(pic) or "(refused)")
