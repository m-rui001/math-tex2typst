"""Attribute the on-ink emitter face to a mechanism, one canvas at a time.

  python _work/probe87_onink_mechanism.py [controlNN_rows.json]            # pairs + emitted content() calls
  python _work/probe87_onink_mechanism.py [controlNN_rows.json] src        # + the source picture's statements
  python _work/probe87_onink_mechanism.py [controlNN_rows.json] shot       # + a 300 dpi crop of the crossing

The rows file names the generation being attributed (the same one handed to `probe85b_emitter_face.py`);
without it the face is the one the join probe defaults to.

`label81_pairs.json` keeps only (depth, dx, dy, text, text, window) per on-ink pair, so the two
spans' own boxes have to be re-read through `probe81.decide` -- the same gauge functions, not a
private copy. The texts in that file are space-stripped (`\u0075ncappedban` is one span's display,
not the page), which is why statements are matched by geometry and read together with the source.
"""
import io
import json
import os
import re
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, WORK)
import probe81_label_box_face as g  # noqa: E402
import probe85b_emitter_face as F  # noqa: E402

DEPTH = 3.0


def face_canvases(ctl_name):
    ctl = {(r["stem"], r["k"]): r for r in F.load(ctl_name)}
    out = {}
    for rec in F.load("label81_pairs.json"):
        stem, k = rec[0], rec[1]
        c = ctl.get((stem, k))
        if not c or c.get("ctl") is None or c["ctl"][1]:
            continue
        deep = [t for t in rec[4] if t[0] > DEPTH]
        if deep:
            out[(stem, k)] = deep
    return out


def src_statements(stem, k):
    """The source statements of the diagram this canvas sits at: source order is the mapping
    (probe84 refuses a paper whose canvas count differs from its picture count)."""
    import probe84_control_face as C
    path, pics = C.pictures(stem)
    if not pics or k >= len(pics):
        return None, []
    body = pics[k]
    stmts = [s.strip() for s in re.split(r";\s*\n|;\s*(?=\\)", body) if s.strip()]
    return k, stmts


def main():
    modes = set(sys.argv[1:])
    rows_file = next((m for m in modes if m.endswith(".json")), F.FACE_DEFAULT_CTL)
    modes.discard(rows_file)
    by_canvas = face_canvases(rows_file)
    canvases = g.canvases()
    print("on-ink face: %d rows over %d canvases / %d papers"
          % (sum(len(v) for v in by_canvas.values()), len(by_canvas),
             len({s for s, _ in by_canvas})), flush=True)
    groups = {}
    for (stem, k), wanted in sorted(by_canvas.items(), key=lambda x: -max(t[0] for t in x[1])):
        head, block = canvases[(stem, k)]
        got = g.render(block, "87m", head)
        print("\n=== %s#%d  worst %.2f  (%d rows)"
              % (stem[:50], k, max(t[0] for t in wanted), len(wanted)), flush=True)
        if not got:
            print("  typst refused its own product")
            continue
        rects, ink, pdf = got
        found, both = g.decide(pdf, rects, ink)
        keep = [t for t in both if t[0] > DEPTH]
        for t in keep:
            depth, dx, dy, t1, t2, window, b1, b2 = t[:8]
            shape = ("same-baseline" if dy < 3.0 else
                     "stacked" if dx < 6.0 and dy >= 3.0 else "apart-in-x")
            groups.setdefault(shape, []).append((stem, k, round(depth, 2)))
            print("  %.2f  dx%5.2f dy%5.2f  %-22r x %-22r  %s" % (depth, dx, dy, t1, t2, shape))
            print("        box1=(%.1f,%.1f,%.1f,%.1f)  w%.1f h%.1f"
                  % (b1.x0, b1.y0, b1.x1, b1.y1, b1.width, b1.height))
            print("        box2=(%.1f,%.1f,%.1f,%.1f)  w%.1f h%.1f"
                  % (b2.x0, b2.y0, b2.x1, b2.y1, b2.width, b2.height))
        print("  -- content() calls carrying those texts --")
        shown = set()
        for t in keep:
            for text in (t[3], t[4]):
                for i, line in enumerate(block.splitlines(), 1):
                    probe = text[:2].replace("×", "x")
                    if i in shown or not probe or probe not in line:
                        continue
                    shown.add(i)
                    print("     %3d: %s" % (i, line.strip()[:170]))
        if "src" in modes:
            got_src, stmts = src_statements(stem, k)
            print("  -- source picture %s --" % ("?" if got_src is None else str(got_src)))
            for s in stmts[:40]:
                print("     " + s.replace("\n", " ")[:170])
        if "shot" in modes:
            box = None
            for t in keep:
                box = t[6] if box is None else box | t[6]
                box = box | t[7]
            box = (box + (-9, -9, 9, 9)) & fitz.Rect(0, 0, 30 * 28.35, 22 * 28.35)
            doc = fitz.open(pdf)
            name = os.path.join(WORK, "shot87_%s_%d.png" % (stem[:16], k))
            doc[0].get_pixmap(clip=box, dpi=300).save(name)
            doc.close()
            print("  crop %.0fx%.0fpt -> %s" % (box.width, box.height, os.path.relpath(name, ROOT)))
    print("\nshape tally:")
    for shape, rows in sorted(groups.items(), key=lambda x: -len(x[1])):
        print("  %-14s %2d rows / %2d canvases" % (shape, len(rows), len({(r[0], r[1]) for r in rows})))
    return 0


if __name__ == "__main__":
    sys.exit(main())
