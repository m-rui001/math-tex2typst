r"""Print the full source of each family-A caption's surroundings, from the outermost open env.

`probe_env.py` says a caption stands in minipage/proof/fixedfigure, but whether the whole drawing
is inside that same box decides where the material has to travel. The enclosing environment is
therefore printed whole, from a few hundred characters before its \\begin.
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
FLAT = os.path.join(os.path.dirname(os.path.dirname(
    os.path.dirname(os.path.abspath(__file__)))), "_work", "flat")

CASES = [
    ("An-integral-scalar", 5747),
    ("The-Grothendieck-homotopy", 1049),
    ("The-Grothendieck-homotopy", 1640),
    ("The-sharp-factor-of-IID", 3209),
    ("The-maximum-number-of-mutually-unbiased", 4317),
    ("Conditional-information-under", 1672),
]
ENV = re.compile(r"\\(begin|end)\{([A-Za-z@*]+)\}")


def flat_for(prefix):
    for name in sorted(os.listdir(FLAT)):
        # resolved by glob only: the ledger truncates names and a date suffix is unrecallable
        if name.startswith(prefix) and name.endswith(".tex"):
            return os.path.join(FLAT, name)
    raise SystemExit("no flat file for %r" % prefix)


def enclosing(src, line):
    pos = len(src.split("\n")[:line - 1]) + len(src.split("\n")[line - 1]) // 2
    stack = []
    for m in ENV.finditer(src):
        if m.start() >= pos:
            break
        if m.group(1) == "begin":
            stack.append((m.group(2), m.start()))
        elif stack:
            for i in range(len(stack) - 1, -1, -1):
                if stack[i][0].rstrip("*") == m.group(2).rstrip("*"):
                    del stack[i]
                    break
    return stack


for prefix, line in CASES:
    path = flat_for(prefix)
    src = open(path, encoding="utf-8", errors="replace").read()
    stack = enclosing(src, line)
    print("=" * 92)
    print("%s line %d  enclosing: %s" % (os.path.basename(path)[:50], line,
                                         [n for n, _ in stack]))
    if stack:
        start = stack[0][1]
        print(src[max(0, start - 700):start + 5200])
