"""Show the float around the caption that still loses its body, for the three papers left."""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]

CASES = {
    "An-explicit-power-saving-for-the-exact-discrete-Fourier-transform-September-25-2026":
        "quantitative proof",
    "An-integral-scalar-curvature-bound-for-real-simplicial-volume-October-5-2026":
        "reflected resolution",
    "The-sharp-factor-of-IID-threshold-for-the-free-Ising-model-on-regular-trees-September-26-2026":
        "two averages",
}
for name, needle in CASES.items():
    text = (ROOT / "_work" / "flat" / (name + ".tex")).read_text(encoding="utf-8", errors="replace")
    i = text.find(needle)
    print("== %s  (caption at %d)" % (name[:52], i))
    if i < 0:
        print("   caption text not found")
        continue
    # print the 900 chars before the caption and 120 after
    lo = max(0, i - 900)
    seg = text[lo:i + 120]
    seg = re.sub(r"\n{2,}", "\n", seg)
    print(seg[-1000:])
    print("-" * 70)
