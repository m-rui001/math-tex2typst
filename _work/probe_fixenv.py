"""Does teaching `lift_captions` about a custom float env put the picture back under its caption?

Monkeypatches `prep.FLOAT_REGION` (no live edit) to also match the env named on the command line,
converts the paper into a scratch directory, and reports whether the orphaned `#figure([], ...)`
went away and a canvas came back inside it.
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

NAME = "The-Grothendieck-homotopy-hypothesis-via-elementary-expansions-September-24-2026"
ENVS = "figure|table|fixedfigure"
prep.FLOAT_REGION = re.compile(r"\\begin\{(%s)\*?\}.*?\\end\{\1\*?\}" % ENVS, re.S)
prep.FLOAT_HEAD = re.compile(r"\\begin\{(%s)(\*?)\}" % ENVS)
prep.FLOAT_END = re.compile(r"\\end\{(?:%s)\*?\}" % ENVS)

out = ROOT / "_work" / "_envchk" / NAME
out.mkdir(parents=True, exist_ok=True)
rep = convert_paper(str(ROOT / "_work" / "flat" / (NAME + ".tex")), str(out), NAME)
print("ok", rep.get("ok"), "compile_ok", rep.get("compile_ok"))
main = (out / "main.typ").read_text(encoding="utf-8", errors="replace")
print("empty figures:", len(re.findall(r"#figure\(\s*\[\],", main)))
for m in re.finditer(r"#figure\(\s*\[\],", main):
    print("   ", re.sub(r"\s+", " ", main[m.start():m.start() + 90]))
print("canvases:", len(re.findall(r"#cetz\.canvas", main)))
