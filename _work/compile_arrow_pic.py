"""Compile the picture the new arrow test builds, and print what typst says.

`cetz.convert` returned None for it, so one of the emitted `mark:` spellings is not valid Typst --
which spelling, and with which error, is the whole question. Each line is compiled alone as well, so
the failing shape is named rather than guessed.
"""
import os
import re
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")
from t2t import cetz  # noqa: E402

PIC = (r"\begin{tikzpicture}[>=stealth,flow/.style={-{Stealth[length=2mm]},draw=red},"
       r"both/.style={{Latex[length=1.3mm]}-{Latex[length=1.3mm]}}]"
       r"\draw[flow] (0,0) -- (2,0);\draw[|-|] (0,1) -- (2,1);"
       r"\draw[both] (0,2) -- (2,2);\draw (0,3) -- (2,3);\end{tikzpicture}")


def compile_(canvas, label):
    with tempfile.TemporaryDirectory() as tmp:
        src = os.path.join(tmp, "t.typ")
        open(src, "w", encoding="utf-8").write(
            cetz.HEADER + "#set page(width: 300pt, height: 300pt)\n" + canvas)
        r = subprocess.run(["typst", "compile", src, os.path.join(tmp, "t.pdf")],
                           capture_output=True)
    err = (r.stderr or b"").decode("utf-8", "replace")
    print("== %s -> rc=%d" % (label, r.returncode))
    for line in err.splitlines():
        if line.strip():
            print("   " + re.sub(r"[^\x20-\x7e]", "?", line)[:150])


def main():
    built = cetz.build(PIC) or ""
    compile_(built, "whole canvas")
    lines = [l.strip() for l in built.splitlines() if l.strip().startswith("line(")]
    for i, l in enumerate(lines):
        compile_(cetz.HEADER.rstrip() + "\n#cetz.canvas({\n  import cetz.draw: *\n  %s\n})\n" % l,
                 "line %d" % i)
    print(built)


if __name__ == "__main__":
    main()
