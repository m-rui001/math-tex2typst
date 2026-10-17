"""What encloses the caption in the three papers still losing a body?"""
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
BEGIN = re.compile(r"\\begin\{([A-Za-z*]+)\}")


def enclosing(text, at):
    stack = []
    for m in BEGIN.finditer(text, 0, at):
        name = m.group(1)
        end = re.compile(r"\\end\{%s\*?\}" % re.escape(name)).search(text, m.end())
        if end and end.start() > at:
            stack.append((name, m.start()))
    return stack


for name, needle in CASES.items():
    text = (ROOT / "_work" / "flat" / (name + ".tex")).read_text(encoding="utf-8", errors="replace")
    i = text.find(needle)
    stack = enclosing(text, i)
    print("== %s" % name[:52])
    print("   enclosing:", [(n, "%.0f" % (i - s)) for n, s in stack])
    # nearest \end{minipage} before the caption
    pre = text[:i]
    j = pre.rfind("\\end{minipage}")
    print("   nearest \\end{minipage} at %d (%.0f before caption)" % (j, i - j) if j >= 0 else "   no minipage")
    k = pre.rfind("\\begin{")
    print("   nearest \\begin: %s" % re.sub(r"\s+", " ", pre[k:k + 40]))
