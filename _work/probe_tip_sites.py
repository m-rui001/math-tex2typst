r"""What the two new read sites give, before the test asserts them (round 43).

pgf lets a `>=<name>` be written on a statement, inside a `/.style` the statement invokes, or in the
picture head, and the innermost one wins (`_work/measure_tikz_tips.py`, `site:` cases). This prints the
canvas for each spelling so the assertions in `tools/test_t2t.py` quote what the emitter really gives.
"""
import io
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
import pathlib

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "tools"))
from t2t import cetz  # noqa: E402

CASES = [
    ("statement, both ends", r"\begin{tikzpicture}\draw[<->,>=Stealth] (0,0) -- (2,0);"
                             r"\draw[->] (0,1) -- (2,1);\end{tikzpicture}"),
    ("statement order flipped", r"\begin{tikzpicture}\draw[>=latex,->] (0,0) -- (2,0);"
                                r"\end{tikzpicture}"),
    ("style declares it", r"\begin{tikzpicture}[>=Stealth,arrow/.style={->,>=latex}]"
                          r"\draw[arrow] (0,0) -- (2,0);\draw[->] (0,1) -- (2,1);"
                          r"\end{tikzpicture}"),
    ("head braced", r"\begin{tikzpicture}[>={Latex}]\draw[->] (0,0) -- (2,0);"
                    r"\end{tikzpicture}"),
    ("head braced with space", r"\begin{tikzpicture}[>= {Stealth}]\draw[->] (0,0) -- (2,0);"
                              r"\end{tikzpicture}"),
    ("named tip beats the default", r"\begin{tikzpicture}[>=latex]\draw[-{Stealth}] (0,0) -- (2,0);"
                                   r"\end{tikzpicture}"),
    ("unknown name keeps its characters", r"\begin{tikzpicture}[>=Stealth,"
                                          r"t/.style={->,>=Triangle}]\draw[t] (0,0) -- (2,0);"
                                          r"\end{tikzpicture}"),
]

for name, pic in CASES:
    built = cetz.build(pic)
    print("== %s" % name)
    for line in (built or "REFUSED").splitlines():
        if "mark:" in line or line == "REFUSED":
            print("   %s" % line.strip())
