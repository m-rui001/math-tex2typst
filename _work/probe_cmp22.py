"""Did the #22 change alter the Complex-Matrix longtable, or was the doubled header already there?

Converts the paper twice: once with the live float regexes, once with the pre-#22 set (figure|table
only), and diffs the table region.
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


def run(tag):
    out = ROOT / "_work" / "_cmp22" / tag / NAME
    out.mkdir(parents=True, exist_ok=True)
    rep = convert_paper(str(ROOT / "_work" / "flat" / (NAME + ".tex")), str(out), NAME)
    return (out / "main.typ").read_text(encoding="utf-8", errors="replace"), rep


live, rep1 = run("new")
# restore the pre-#22 float set
prep.FLOAT_REGION = re.compile(r"\\begin\{(figure|table)\*?\}.*?\\end\{\1\*?\}", re.S)
old, rep2 = run("old")

for tag, text in (("new", live), ("old", old)):
    print("== %s  compile=%s" % (tag, (rep1 if tag == "new" else rep2).get("compile_ok")))
    i = text.find("Exact coefficients")
    print(re.sub(r"\n{2,}", "\n", text[max(0, i - 700):i + 90])[-820:])
    print("-" * 70)
