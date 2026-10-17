r"""Which papers carry the widest `rounded corners` radii, for the side-by-side crop.

The two engines differ only once the radius stops fitting on the edge (pgf keeps a straight piece of
the short side, CeTz lets the arcs take it over), so the crops worth looking at are the largest
written radii on the shortest rectangles -- plus one plain default case to show the common one.
Prints, per candidate: the paper, the picture number, the radius, and the rectangle's own size in cm.
"""
import glob
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))

from t2t import convert, prep, cetz as cetzmod  # noqa: E402

RC = re.compile(r"rounded\s+corners(?:=\s*([0-9.]+)pt)?")
PAIR = re.compile(r"\(\s*([-\d.]+)\s*,\s*([-\d.]+)\s*\)\s*rectangle\s*\(\s*([-\d.]+)\s*,\s*([-\d.]+)\s*\)")


def main():
    rows = []
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(path)[:-4]
        src = open(path, encoding="utf-8", errors="replace").read()
        pre_text, body = prep.split_document(src)
        p = prep.parse_preamble(pre_text)
        body = prep.scale_linewidth_in_minipages(body)
        body = prep.unwrap_boxes(body)
        pics = convert.TIKZ_SPAN.findall(body)
        if not pics:
            continue
        scopes = convert.picture_scopes(body, p.macros)
        for i, pic in enumerate(pics):
            table, decls = scopes[i]
            if decls:
                pic = convert.with_declarations(pic, decls)
            pic = prep.expand_macros(pic, table)
            if "rounded corners" not in pic:
                continue
            m = RC.search(pic)
            radius = float(m.group(1)) if m and m.group(1) else 4.0
            rect = PAIR.search(pic)
            if not rect:
                continue
            x0, y0, x1, y1 = (float(v) for v in rect.groups())
            short = min(abs(x1 - x0), abs(y1 - y0))
            rows.append((radius, short, stem, i + 1))
    rows.sort(key=lambda r: -(r[0] - 2 * r[1]))
    print("radius  short-side  over-large?  paper  pic")
    for radius, short, stem, idx in rows[:14]:
        print("%6.1fpt %10.2fcm  %s  %-44s %d"
              % (radius, short, "TOO BIG" if radius / 28.346 > short / 2 else "fits", stem[:44], idx))
    print("... %d rectangle statements with the key, of which over-large: %d"
          % (len(rows), sum(1 for r in rows if r[0] / 28.346 > r[1] / 2)))


if __name__ == "__main__":
    main()
