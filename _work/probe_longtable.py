"""Does adding `longtable` to the float set put its picture back under its caption?

Monkeypatches the three float regexes in `prep` (no live edit) and converts a paper whose empty
figures came from a `longtable` caption.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import prep  # noqa: E402
from t2t.convert import convert_paper  # noqa: E402

NAME = "Complex-Matrix-Multiplication-Below-2.258-and-Rectangular-Bounds-September-24-2026"
ENVS = "figure|table|longtable"
prep.FLOAT_REGION = re.compile(r"\\begin\{(%s)\*?\}.*?\\end\{\1\*?\}" % ENVS, re.S)
prep.FLOAT_HEAD = re.compile(r"\\begin\{(%s)(\*?)\}" % ENVS)
prep.FLOAT_END = re.compile(r"\\end\{(?:%s)\*?\}" % ENVS)

out = ROOT / "_work" / "_ltchk" / NAME
out.mkdir(parents=True, exist_ok=True)
rep = convert_paper(str(ROOT / "_work" / "flat" / (NAME + ".tex")), str(out), NAME)
print("ok", rep.get("ok"), "compile_ok", rep.get("compile_ok"))
main = (out / "main.typ").read_text(encoding="utf-8", errors="replace")
print("empty figures:", len(re.findall(r"#figure\(\s*\[\],", main)))
print("caption kept:", "Exact coefficients" in main)
for m in re.finditer(r"#figure\(|#table\(|table\(", main):
    print("   @%d %s" % (m.start(), re.sub(r"\s+", " ", main[m.start():m.start() + 80])))
