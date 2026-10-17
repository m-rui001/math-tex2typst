"""Convert the eight papers that carried an empty figure into a scratch dir and count again."""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t.convert import convert_paper  # noqa: E402

PAPERS = [
    "A-positive-solution-to-Tingleys-problem-September-23-2026",
    "An-explicit-power-saving-for-the-exact-discrete-Fourier-transform-September-25-2026",
    "An-integral-scalar-curvature-bound-for-real-simplicial-volume-October-5-2026",
    "Complex-Matrix-Multiplication-Below-2.258-and-Rectangular-Bounds-September-24-2026",
    "Conditional-information-under-deterministic-coordinate-sweeps-September-26-2026",
    "The-Grothendieck-homotopy-hypothesis-via-elementary-expansions-September-24-2026",
    "The-maximum-number-of-mutually-unbiased-bases-in-dimension-six-September-24-2026",
    "The-sharp-factor-of-IID-threshold-for-the-free-Ising-model-on-regular-trees-September-26-2026",
]
EMPTY = re.compile(r"#figure\(\s*\[\],")

total = 0
for name in PAPERS:
    out = ROOT / "_work" / "_fixchk" / name
    out.mkdir(parents=True, exist_ok=True)
    rep = convert_paper(str(ROOT / "_work" / "flat" / (name + ".tex")), str(out), name)
    main = (out / "main.typ").read_text(encoding="utf-8", errors="replace")
    n = len(EMPTY.findall(main))
    total += n
    print("%-52s compile=%s empty=%d cetz=%d" % (
        name[:52], rep.get("compile_ok"),
        n, len(re.findall(r"#cetz\.canvas", main))))
print("TOTAL empty figures: %d" % total)
