"""Build the Purely-Cosmetic structure figure (the one with rounded box/.style) and print it."""
import io
import pathlib
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

src = (ROOT / "_work" / "flat" /
       "Purely-Cosmetic-Surgery-on-Knots-in-the-Three-Sphere-September-23-2026.tex").read_text(
    encoding="utf-8", errors="replace")
mark = src.find("rounded corners=2pt")
i = src.rfind("\\begin{tikzpicture}", 0, mark)
j = src.find("\\end{tikzpicture}", mark) + len("\\end{tikzpicture}")
print("span", i, j)
canvas = cetz.build(src[i:j])
print("REFUSED" if canvas is None else canvas)
