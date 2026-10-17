r"""Survey which float constructs the six papers actually use, and where each problem caption sits.

Counts alone do not say which environment a caption stands in; this prints the enclosing
environment name for every \\caption of the affected papers, so the mechanism per case is read
from the source rather than assumed from the routine that might handle it.
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
FLAT = os.path.join(os.path.dirname(os.path.dirname(
    os.path.dirname(os.path.abspath(__file__)))), "_work", "flat")

PREFIXES = ["An-integral-scalar", "The-Grothendieck-homotopy", "The-sharp-factor-of-IID",
            "Complex-Matrix-Multiplication", "Conditional-information-under",
            "The-maximum-number-of-mutually-unbiased"]
ENV = re.compile(r"\\(begin|end)\{([A-Za-z@*]+)\}")
CAP = re.compile(r"\\caption\b")
NEEDLES = ["reflected resolution", "Exact coefficients", "Fourier substitutions",
           "Two-sweep inputs", "Sweep bounds and their Fourier", "A tree in one depth",
           "solid arrows form the tree", "SHA-256 digests", "two averages in the half-path"]


def flat_for(prefix):
    for name in sorted(os.listdir(FLAT)):
        if name.startswith(prefix) and name.endswith(".tex"):
            return os.path.join(FLAT, name)
    raise SystemExit("no flat file for %r" % prefix)


def stack_at(src, pos):
    """The open-environment names enclosing `pos`, outermost first."""
    stack = []
    for m in ENV.finditer(src):
        if m.start() >= pos:
            break
        if m.group(1) == "begin":
            stack.append(m.group(2))
        elif stack:
            for i in range(len(stack) - 1, -1, -1):
                if stack[i].rstrip("*") == m.group(2).rstrip("*"):
                    del stack[i]
                    break
    return stack


for prefix in PREFIXES:
    path = flat_for(prefix)
    src = open(path, encoding="utf-8", errors="replace").read()
    print("=" * 90)
    print(os.path.basename(path))
    print("counts: figure=%d minipage=%d longtable=%d captionof=%d tabular=%d table=%d picture=%d"
          % (len(re.findall(r"\\begin\{figure\*?\}", src)),
             src.count(r"\begin{minipage}"), src.count(r"\begin{longtable}"),
             src.count(r"\captionof"), src.count(r"\begin{tabular"),
             len(re.findall(r"\\begin\{table\*?\}", src)), src.count(r"\begin{picture}")))
    for m in CAP.finditer(src):
        line = src.count("\n", 0, m.start()) + 1
        text = src[m.end():m.end() + 70].replace("\n", " ")
        mark = "  <<<" if any(n in src[m.end():m.end() + 300] for n in NEEDLES) else ""
        print("  line %-6s in %-38s %s%s" % (line, "/".join(stack_at(src, m.start()))[-38:],
                                             text[:60], mark))
