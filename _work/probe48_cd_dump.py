r"""The CD face of the converter, one flattened line per canvas -- for diffing a law across two runs.

`build_cd`'s label side, its clearance constant and its bend are all being changed at once, and the
churn has to be measured, not guessed. A stub of the old law would have to reimplement three things
inside one function, so this gauge takes the other honest route: dump every CD canvas the batch road
produces, edit, dump again, and diff the two files. The lines that differ are the canvases that
changed and the papers to regenerate; a canvas present in one file and not the other is lost or gained.

The basis is the page's own: tikzcd and CD reach Typst through `emit.math_text`, which calls
`cetz.convert` on the display string -- `build` and `build_cd` replayed here without the `sane` or
compile gates, so a diagram neither builds counts as a blind spot rather than as clean.

    python _work/probe48_cd_dump.py _work/cd48_before.txt
"""
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")
from t2t import cetz  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
CD_SRC = re.compile(r"\\begin\{(?:tikzcd|CD)\}.*?\\end\{(?:tikzcd|CD)\}", re.S)


def main():
    out = sys.argv[1] if len(sys.argv) > 1 else os.path.join(ROOT, "_work", "cd48_dump.txt")
    built = refused = 0
    with open(out, "w", encoding="utf-8") as fh:
        for name in sorted(os.listdir(FLAT)):
            if not name.endswith(".tex"):
                continue
            src = open(os.path.join(FLAT, name), encoding="utf-8", errors="replace").read()
            for i, m in enumerate(CD_SRC.finditer(src)):
                core = cetz.strip_envelope(m.group(0))
                canvas = cetz.build(core) or cetz.build_cd(core)
                if not canvas:
                    refused += 1
                    continue
                built += 1
                fh.write("%s\t%02d\t%s\n" % (name[:-4], i, " ".join(canvas.split())))
    print("CD canvases: built %d, refused %d -- written to %s" % (built, refused, out))


if __name__ == "__main__":
    main()
