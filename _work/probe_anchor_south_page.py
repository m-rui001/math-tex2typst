r"""Page evidence for the `anchor: "south"` law: where does such a box actually land?

`_work/measure_anchor_autoheight_lines.py` says a `#box` that declares no `height:` is held by
CeTz's `anchor:` about 2.1pt (one line) to 7.5pt (four lines) too high -- the box's bottom edge ends
up above the coordinate pgf would put it on, while the top edge is exact.

This walks the products for a `content(..., [#box(...)], anchor: "south")` whose body is a short
label, finds that label's rectangle on the rendered page, and prints the nearest drawn line/arrow
endpoint: in TikZ a `label=below:...` box's top edge touches the point it hangs from, so the
distance from the box's BOTTOM edge to that same point is what the law predicts to be off.

Usage:  python _work/probe_anchor_south_page.py [stem-prefix ...]
"""
import glob
import os
import re
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

SOUTH = re.compile(r'content\(\(([-\d., ]+)\),\s*\[#box\((.*?)\)\]\s*, anchor: "south"\)')


def body_text(args):
    """The label's own words, stripped of the markup our emitter wraps around them."""
    words = re.sub(r"#\w+[^[\n]*", " ", args.split("[", 1)[1] if "[" in args else args)
    words = re.sub(r"\$[^$]*\$", " ", words)
    return " ".join(w for w in re.split(r"[\[\](){}\\,;]+", words) if w.strip() and len(w) > 3)


def main():
    stems = [a for a in sys.argv[1:] if not a.startswith("-")]
    paths = (sorted(glob.glob(os.path.join(ROOT, "typst", s + "*", "main.typ")))[0]
             if stems else sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))))
    shown = 0
    for path in paths:
        stem = os.path.basename(os.path.dirname(path))
        if stems and not any(stem.startswith(s) for s in stems):
            continue
        cands = []
        for ln in open(path, encoding="utf-8", errors="replace"):
            m = SOUTH.search(ln)
            if not m:
                continue
            text = body_text(m.group(2))
            if 4 <= len(text) <= 26:
                cands.append((m.group(1), m.group(2), text))
        if not cands:
            continue
        pdf = os.path.join(ROOT, "typst", stem, "main.pdf")
        if not os.path.exists(pdf):
            continue
        doc = fitz.open(pdf)
        for at, args, text in cands:
            where = None
            for i, page in enumerate(doc):
                r = page.search_for(text)
                if r:
                    where = (i, page, r[0])
                    break
            if where is None:
                continue
            i, page, hit = where
            band = None
            for d in page.get_drawings():
                rr = d["rect"]
                if rr.contains(hit) and rr.height < 60 and rr.width < 300:
                    band = rr if band is None or rr.get_area() < band.get_area() else band
            if band is None:
                continue
            ends = []
            for d in page.get_drawings():
                for it in d["items"]:
                    if it[0] == "l":
                        ends += [it[1], it[2]]
            near = min(ends, key=lambda p: abs(p.x - (band.x0 + band.x1) / 2)
                       + abs(p.y - band.y1)) if ends else None
            print("%-46s p%-3d box y0=%.1f y1=%.1f  at=(%s)  nearest line end (%.1f, %.1f) "
                  "=%.1f pt below box bottom  %r"
                  % (stem[:46], i + 1, band.y0, band.y1, at.strip(), near.x, near.y,
                     near.y - band.y1, text[:24]))
            shown += 1
            if shown >= 12:
                return
        doc.close()


if __name__ == "__main__":
    main()
