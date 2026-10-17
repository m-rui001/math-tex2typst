r"""What does pandoc leave behind for a `\text{ZQMCITE...}` token, and can a note ride with it?"""
import io
import sys
import pathlib

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "tools"))
from t2t import mathconv  # noqa: E402

REFS = {"Birkar2023": ("ZQMCITEBirkar2023", "")}
CASES = [
    r"$ \vol(\overline A)\ge M^{-n} \qquad\text{\citep[Corollary~1.4]{Birkar2023}}. $",
    r"$ a=b \qquad\text{\citep{Birkar2023}} $",
    r"$ a=b \text{ see \citep{Birkar2023} here} $",
]
got, refused, err = mathconv.convert_formulas(CASES, REFS)
for i, tex in enumerate(CASES):
    print("IN :", tex)
    print("OUT:", repr(got.get(i)))
    print()
print("refused:", refused, "err:", (err or "")[:200])
