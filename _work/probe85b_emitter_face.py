"""Cross the collision census with its pdflatex controls and print the emitter work list.

Two files already hold the measurements; this only joins them, because the join is the part
that was mis-counted twice:
  _work/label81_pairs.json   per canvas [stem, k, [boxes, ink], foreign[], onink[]], depth at t[0]
                             priced on letters (probe81.decide)
  _work/control88_rows.json per canvas our/ctl pair counts and our/ctl family maxima, the ctl side
                             built from the source diagram at the canvas's own index (probe84)

A canvas is "control clean" for a family when the author's own TikZ shows ZERO pairs of that
family -- a smaller number on the control is not clean, it is 轴 67's "the author collides too".
Rows are not unique events: a label invaded by two region rectangles appears twice, so the
count is reported both ways and the dedup key is stated.
"""
import io
import json
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
DEPTH = 3.0
FACE_DEFAULT_CTL = "control88_rows.json"


def load(name):
    with io.open(os.path.join(WORK, name), encoding="utf-8") as fh:
        return json.load(fh)


def face(pairs_name="label81_pairs.json", ctl_name=FACE_DEFAULT_CTL, depth=DEPTH):
    ctl = {(r["stem"], r["k"]): r for r in load(ctl_name)}
    rows = {"foreign": [], "onink": []}
    for rec in load(pairs_name):
        stem, k = rec[0], rec[1]
        c = ctl.get((stem, k))
        if not c or c.get("ctl") is None:
            continue
        for fam, idx in (("foreign", 3), ("onink", 4)):
            if c["ctl"][0 if fam == "foreign" else 1]:
                continue
            for t in rec[idx]:
                if t[0] > depth:
                    rows[fam].append([stem, k, round(t[0], 2), t[3], t[4] if fam == "onink" else ""])
    return rows


def uniq(rows, fam):
    key = (lambda r: (r[0], r[1], r[3])) if fam == "foreign" else (lambda r: (r[0], r[1], r[3], r[4]))
    return {key(r): r for r in rows}.values()


def summary(rows, depth, ctl_name):
    out = ["emitter face at depth >%g pt, on the %s population joined to %s"
           % (depth, "label81_pairs", ctl_name)]
    both = []
    for fam in ("onink", "foreign"):
        u = uniq(rows[fam], fam)
        canv = sorted({(r[0], r[1]) for r in rows[fam]})
        out.append("%s: rows %d (unique %d) over %d canvases / %d papers"
                   % (fam, len(rows[fam]), len(u), len(canv), len({r[0] for r in rows[fam]})))
        both += canv
    out.append("union: %d canvases / %d papers" % (len(set(both)), len({c[0] for c in both})))
    for fam in ("onink", "foreign"):
        out.append("\n-- %s --" % fam)
        for r in sorted(rows[fam], key=lambda x: -x[2]):
            out.append("   %5.2f  %s#%d  %r%s" % (r[2], r[0][:56], r[1], r[3],
                                                  (" vs %r" % r[4]) if fam == "onink" else ""))
    return "\n".join(out)


if __name__ == "__main__":
    depth = float(sys.argv[1]) if len(sys.argv) > 1 else DEPTH
    ctl = sys.argv[2] if len(sys.argv) > 2 else FACE_DEFAULT_CTL
    text = summary(face(ctl_name=ctl), depth, ctl)
    print(text)
    # the face file is named from the rows it was joined from, so a re-run can never land on the
    # reading it is being compared against
    with io.open(os.path.join(WORK, ctl.replace("control", "label").replace("_rows.json", "_face.txt")),
                 "w", encoding="utf-8") as fh:
        fh.write(text + "\n")
