r"""Static audit of the emitted Typst for shapes that are not the language or the page's rules.

Typst compiling is only the floor: a canvas parked inside `$ $`, a LaTeX control word that reached
the prose, a reference that prints its own key, an unbalanced `$` on a code line all compile or hide
behind a caption and still read wrong on the page. Each check names the file and the line, because
the face decides whether it is a rule to fix in `tools` or one paper's quirk.
"""
import glob
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")

CHECKS = [
    ("canvas inside a formula", re.compile(r"\$[^$\n]*#cetz\.canvas")),
    ("unresolved reference printed as ??", re.compile(r"\[\?\?\]")),
    ("LaTeX control word left in prose", re.compile(r"\\(?:cite|ref|eqref|autoref|pageref"
                                                    r"|bibitem|item|LaTeX|textbf|texttt)\b")),
    ("LaTeX tie before a reference", re.compile(r"~\\(?:ref|eqref|cite)")),
    (r"\[ or \] left as literal maths delimiter", re.compile(r"(?<!\\)\\[\[\]]")),
    ("marker token anywhere", re.compile(r"Z\s?Q\s?T\s?2\s?T")),
    ("double percent comment", re.compile(r"^\s*%%")),
    ("empty figure content", re.compile(r"#figure\(\s*\[\s*\]\s*,")),
    ("math delimiter unbalanced on a code line", re.compile(r"^\s*(?!#)[^$]*\$[^$]*$")),
    ("raw latex quoted block", re.compile(r"#raw\(block: true")),
]

tally = {}
examples = {}
for path in sorted(glob.glob(os.path.join(r"E:\math", "typst", "*", "main.typ"))):
    name = os.path.basename(os.path.dirname(path))
    lines = open(path, encoding="utf-8").read().split("\n")
    for label, rx in CHECKS:
        for i, line in enumerate(lines, 1):
            if rx.search(line):
                tally[label] = tally.get(label, 0) + 1
                examples.setdefault(label, []).append("%s:%d %s" % (name[:44], i, line[:78]))
                break

print("%-46s %s" % ("check", "hits"))
for label, _ in CHECKS:
    print("%-46s %d" % (label, tally.get(label, 0)))
    for line in examples.get(label, [])[:3]:
        print("      %s" % line)
