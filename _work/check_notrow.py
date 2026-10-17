"""A row break straight after a parenthesis must survive clean().

\\substack{a,b\\(a,b)=1} ends a substack row with '\\' and then opens a group with '(';
a strip that reads the second backslash as its own command turns that into \\( and drops
the row break. Run: python _work/check_notrow.py
"""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import mathconv  # noqa: E402

BS = chr(92)
CASES = [
    (BS + BS.join(["\\substack{a,b", "(a,b)=1}"]), "row break kept", True),
    (r"\sum_{\substack{b,f" + BS + BS + r"(b,f)=1}}^{*}", "row break kept", True),
    (r"x \(y+z\) w", "inline delimiters gone", False),
    (r"a \[ b \] c", "display delimiters gone", False),
]

for src, name, keeps_row in CASES:
    out = mathconv.clean(src, {})
    rows = out.count(BS + BS)
    print("%-26s rows=%d  %s" % (name, rows, " ".join(out.split())))
    assert (rows > 0) == keeps_row, name
print("ok")
