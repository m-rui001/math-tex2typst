# -*- coding: utf-8 -*-
r"""The papers `bake_math_hspace` changes = those with an eaten `\hspace{<len>}` inside a display
span.  Writes them one per line to `_work/regen_hspace_bake.txt` (the regen list), and prints the
two A already rebuilt in run141 so the delta is explicit.

  python _work/probe99c_list_bake_papers.py
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
OUT = os.path.join(ROOT, "_work", "regen_hspace_bake.txt")
# A's run141 (regen102) already rebuilt these two with the new code
IN_RUN141 = {"A-rational-obstruction-to-strong-chromatic-splitting-at-height-three-September-25-2026",
             "The-Campana-Peternell-conjecture-in-dimension-six-September-25-2026"}


def inside(pos, spans):
    return any(s <= pos < e for s, e in spans)


def main():
    hit = []
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(path)[:-4]
        text = io.open(path, encoding="utf-8", errors="replace").read()
        eaten = [m for m in EAT.finditer(text) if m.group(0).startswith("\\hspace")]
        if not eaten:
            continue
        spans = convert.display_math_spans(text)
        if any(inside(m.start(), spans) for m in eaten):
            hit.append(stem)
    print("papers bake_math_hspace changes = %d" % len(hit))
    for s in hit:
        print("  %s%s" % (s, "   [already in run141]" if s in IN_RUN141 else ""))
    todo = [s for s in hit if s not in IN_RUN141]
    io.open(OUT, "w", encoding="utf-8", newline="\n").write("\n".join(todo) + "\n")
    print("wrote %d names to %s" % (len(todo), os.path.relpath(OUT, ROOT)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
