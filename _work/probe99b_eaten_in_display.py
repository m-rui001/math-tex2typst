# -*- coding: utf-8 -*-
r"""Are all the `\hspace{<len>}` sites PROSE_DIALECT eats inside a display-math span?

`convert.bake_math_hspace` protects only display-maths sites, so this checks coverage: every eaten
site must sit inside a `display_math_spans` span, or the fix misses it.

  python _work/probe99b_eaten_in_display.py
"""
import glob
import io
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.path.insert(0, os.path.join(ROOT, "_work"))
from t2t import convert, prep  # noqa: E402

EAT = prep.PROSE_DIALECT[0][0]


def inside(pos, spans):
    return any(s <= pos < e for s, e in spans)


def main():
    tot = covered = 0
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(path)[:-4]
        text = io.open(path, encoding="utf-8", errors="replace").read()
        eaten = [m for m in EAT.finditer(text) if m.group(0).startswith("\\hspace")]
        if not eaten:
            continue
        spans = convert.display_math_spans(text)
        for m in eaten:
            tot += 1
            if inside(m.start(), spans):
                covered += 1
            else:
                ctx = text[max(0, m.start() - 26):m.end() + 18].replace("\n", "\\n")
                print("  NOT IN DISPLAY %-46s %r" % (stem[:46], ctx))
    print("eaten sites = %d, inside a display span = %d" % (tot, covered))
    return 0


if __name__ == "__main__":
    sys.exit(main())
