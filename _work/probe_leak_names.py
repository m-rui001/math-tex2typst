r"""Every leaked figure-maths command name, with pandoc's raw Typst answer and its occurrence count.

Splits the names into: those pandoc spells, those it echoes (letters are the right rendering), and
those it answers some other way (a bare glyph, an empty string, or nothing at all) -- the last group
is where a symbol may still be missing.
"""
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "_work"))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")
from probe_tex_defined_words import figure_words  # noqa: E402
from t2t import cetz  # noqa: E402


def pandoc(w):
    p = subprocess.run(["pandoc", "-f", "latex", "-t", "typst"],
                       input=("$\\%s$" % w).encode(), capture_output=True)
    return p.stdout.decode("utf-8", "replace").strip()


def main():
    defined = set()
    with open(os.path.join(ROOT, "_work", "cscheck", "words.txt")) as fh:
        for line in fh:
            parts = line.split()
            if len(parts) == 2 and parts[0] == "YES":
                defined.add(parts[1])
    counts = figure_words()[0]
    missing = {w: n for w, n in counts.items()
               if w in defined and "\\" + w not in cetz.MATH_SYMBOLS}
    print("missing names %d, occurrences %d\n" % (len(missing), sum(missing.values())))
    rows = []
    for w in sorted(missing, key=lambda w: -missing[w]):
        raw = pandoc(w)
        m = re.match(r"^\$(.*?)\$$", raw, re.S)
        if m:
            v = " ".join(m.group(1).split())
            kind = "echo" if v == w else "spell"
            rows.append((kind, w, missing[w], v))
        else:
            rows.append(("other", w, missing[w], raw[:40]))
    for kind in ("spell", "echo", "other"):
        print("== %s ==" % kind)
        for k, w, n, v in rows:
            if k == kind:
                print("   %-20s %-5d -> %r" % (w, n, v))
        print()


if __name__ == "__main__":
    main()
