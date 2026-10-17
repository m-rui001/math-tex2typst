r"""Change surface of the bend fix: the old control formula stubbed back in.

The new `_bend_controls` routes a bend through `_tangent_controls`, so a keyword census cannot say how
many canvases actually move. This monkeypatches the name back to the formula the converter used before
(the chord's circular-arc apex, one control for both ends, `sign` -1 for left) and diffs the two builds
of every picture of every flat paper, counting canvases changed, pictures newly refused or rescued, and
the papers involved.
"""
import glob
import math
import os
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))

from t2t import convert, prep, cetz as cetzmod  # noqa: E402


def old_bend_control(a, b, sign, deg):
    """The formula this round replaced: `bend` as its own circular-arc approximation."""
    dx, dy = b[0] - a[0], b[1] - a[1]
    length = math.hypot(dx, dy)
    if length == 0:
        return None
    off = length * math.tan(math.radians(deg) / 4) * sign
    ux, uy = dx / length, dy / length
    return ((a[0] + b[0]) / 2 - uy * off, (a[1] + b[1]) / 2 + ux * off)


def old_controls(a, b, bend):
    theta = bend[0]
    # the old pair carried -1 for `left`, the new one the signed turn off the chord
    return (old_bend_control(a, b, -1 if theta > 0 else 1, abs(theta)),) * 2


def main():
    changed, lost, gained, papers = 0, 0, 0, set()
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(path)[:-4]
        src = open(path, encoding="utf-8", errors="replace").read()
        if "bend" not in src:
            continue
        pre_text, body = prep.split_document(src)
        table = prep.parse_preamble(pre_text)
        body = prep.scale_linewidth_in_minipages(body)
        body = prep.unwrap_boxes(body)
        scopes = convert.picture_scopes(body, table.macros)
        touched = False
        for pic, (macros, decls) in zip(convert.TIKZ_SPAN.findall(body), scopes):
            if "bend" not in pic:
                continue
            if decls:
                pic = convert.with_declarations(pic, decls)
            pic = prep.expand_macros(pic, macros)
            new = cetzmod.build(pic, table.colors, convert.line_cm(table))
            live = cetzmod._bend_controls
            cetzmod._bend_controls = old_controls
            try:
                was = cetzmod.build(pic, table.colors, convert.line_cm(table))
            finally:
                cetzmod._bend_controls = live
            if was == new:
                continue
            touched = True
            if was is not None and new is None:
                lost += 1
            elif was is None and new is not None:
                gained += 1
            else:
                changed += 1
        if touched:
            papers.add(stem)
    print("canvases changed %d, refused by the new code %d, rescued %d, papers %d"
          % (changed, lost, gained, len(papers)))


if __name__ == "__main__":
    main()
