"""For each paper still showing an empty `#figure([], ...)`, find the float env its caption sits in.

`lift_captions` only knows `figure` and `table`; a caption inside any other float-like environment
is lifted into a stand-in float of its own, leaving the drawing behind. This lists the environment
each orphaned caption came from, so the fix can name them.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]

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

NEWENV = re.compile(r"\\newenvironment\{([A-Za-z*]+)\}")
BEGIN = re.compile(r"\\begin\{([A-Za-z*]+)\}")


def env_of_caption(text, cap_at):
    """The innermost \\begin{X} still open at cap_at."""
    stack = []
    for m in BEGIN.finditer(text, 0, cap_at):
        name = m.group(1)
        end = re.compile(r"\\end\{%s\*?\}" % re.escape(name)).search(text, m.end())
        if end and end.start() > cap_at:
            stack.append(name)
    return stack[-1] if stack else None


for name in PAPERS:
    path = ROOT / "_work" / "flat" / (name + ".tex")
    text = path.read_text(encoding="utf-8", errors="replace")
    envs = sorted(set(NEWENV.findall(text)))
    print("== %s" % name[:52])
    print("   newenvironment: %s" % (envs or "-"))
    for m in re.finditer(r"\\caption\b", text):
        env = env_of_caption(text, m.start())
        if env and env not in ("figure", "figure*", "table", "table*"):
            snippet = re.sub(r"\s+", " ", text[m.start():m.start() + 70])
            print("   caption in <%s>: %s" % (env, snippet[:66]))
