r"""#99 second cut: is a ring missing under those centre-sitting degenerate lines?

probe99's attribution put 12 of the 24 emissions on calls with `stroke: none`, and several of them sit
on the very coordinate the author gave a `\fill ... circle(r)` / `ellipse`: (2.20,-4.62) for
A-Torsion-Free-That-Is-Not, (0,0) for A-Linear-Clock, Quantitative and The-critical. A zero-length
subpath is no ink under either engine, so the row would be closed -- unless that degenerate call is
what our circle handler ships INSTEAD of the ring, in which case the page has lost the annulus.

This prints, for every picture of a face paper, the whole canvas with the degenerate lines marked, so
the ring's own path can be seen next to them. Read through the emitter again (spy on `cetz.build`), and
`typst/` is not written.

  python _work/probe99b_circle_context.py      # -> _work/label99b_circle_context.txt
"""
import io
import os
import sys
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
TMP = os.path.join(WORK, "_m99b_out")
OUT = os.path.join(WORK, "label99b_circle_context.txt")
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.path.insert(0, WORK)

from t2t import cetz, convert  # noqa: E402
from probe98_loop_face import DEGEN, shipped_lines, source_of  # noqa: E402

VERBS = Counter()
_caught = []
_real_build = cetz.build


def _spy(tikz, colors=None, line_cm=None):
    out = _real_build(tikz, colors, line_cm)
    _caught.append((tikz, out))
    return out


def faces():
    order = []
    for stem in sorted(os.listdir(os.path.join(ROOT, "typst"))):
        full = os.path.join(ROOT, "typst", stem, "main.typ")
        if os.path.isfile(full) and shipped_lines(full):
            order.append(stem)
    return order


def main():
    if not os.path.isdir(TMP):
        os.makedirs(TMP)
    cetz.build = _spy
    lines = ["", "== canvases holding a degenerate line(), with every path verb counted"]
    for stem in faces():
        src = source_of(stem)
        if not src:
            lines.append("\n### %s  (no flat source)" % stem)
            continue
        del _caught[:]
        try:
            convert.convert_paper(src, os.path.join(TMP, stem), stem)
        except Exception as exc:                              # noqa: BLE001
            lines.append("\n### %s  pipeline raised %r" % (stem, exc))
            continue
        seen = set()
        for core, emission in _caught:
            if not emission or core in seen:
                continue
            deg = [ln for ln in emission.splitlines() if DEGEN.search(ln)]
            if not deg:
                continue
            seen.add(core)
            verbs = Counter(m.group(1) for m in
                            re_find(r"^\s*(line|curve|bezier|circle|ellipse|rect|polygon)\(", emission))
            lines.append("\n### %s" % stem[:70])
            lines.append("    paths=%s  degenerate=%d" % (dict(verbs), len(deg)))
            for ln in emission.splitlines():
                if ln.strip():
                    lines.append(("  >>> " if DEGEN.search(ln) else "      ") + ln.strip()[:150])
    cetz.build = _real_build
    text = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text[:3000])
    return 0


def re_find(pattern, text):
    import re
    return re.finditer(pattern, text, re.M)


if __name__ == "__main__":
    sys.exit(main())
