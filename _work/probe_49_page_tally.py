r"""Reconcile the #49 frames: what a fresh build writes against what the page carries.

The face probe counted 430 lines that flip under the stroke leg; the regenerated pages carry 427
`stroke: none` frames. A difference of three is either a picture the batch draws differently (a float
it lifted, a canvas whose compile gate took the other branch) or a frame this probe counts and the
emitter never writes, so the two are printed per paper and only the papers where they disagree are
named.
"""
import pathlib
import re
import sys
from collections import Counter

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz, prep  # noqa: E402
from t2t.convert import line_cm  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)


def main():
    fresh = Counter()
    for src in sorted((ROOT / "_work" / "flat").glob("*.tex")):
        text = src.read_text(encoding="utf-8", errors="replace")
        try:
            wide = line_cm(prep.parse_preamble(text))
        except Exception:
            wide = None
        for m in PIC.finditer(text):
            core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), wide)
            canvas = cetz.build(core)
            if canvas:
                n = canvas.count("stroke: none")
                if n:
                    fresh[src.stem] += n
    page = Counter()
    for typ in sorted((ROOT / "typst").glob("*/main.typ")):
        n = typ.read_text(encoding="utf-8", errors="replace").count("stroke: none")
        if n:
            page[typ.parent.name] += n
    print("fresh %d frames in %d papers, page %d frames in %d papers"
          % (sum(fresh.values()), len(fresh), sum(page.values()), len(page)))
    for name in sorted(set(fresh) | set(page)):
        if fresh[name] != page[name]:
            print("  %-52s fresh %d  page %d" % (name[:52], fresh[name], page[name]))


if __name__ == "__main__":
    main()
