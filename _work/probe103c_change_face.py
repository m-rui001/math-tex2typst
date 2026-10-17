"""#103c: the change face of giving every anchored node the box pgf pins it on, corpus-wide.

The law this project prices a change with (轴 68 / #81) is the same base read twice: the committed
products under `typst/` are the run151 emission (old law -- the default `inner sep` was written as
0.1cm, was the turn's reward only, and an unturned anchored label got no pad at all), and this runs
every flat source through the pipeline's own `convert.convert_paper` into a scratch directory.  A
paper whose regenerated `main.typ` differs is one the fix moves.

The change arrives in three visible families and they are counted apart, not summed:
  PAD-NEW    `padding:` tokens this round adds (an anchored label that carried none)
  PAD-PRICE  changed lines that already carried a `padding:` and now carry the class size's one
  BOX-WIDTH  changed lines that grow a `#box(width: ...)` by two seps

Nothing here writes under `typst/`.

  python _work/probe103c_change_face.py                 # -> _work/label103c_change_face.txt
  python _work/probe103c_change_face.py <stem> ...      # only those papers, with their changed lines
"""
import difflib
import io
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
PROD = os.path.join(ROOT, "typst")
OUTDIR = os.path.join(ROOT, "_work", "_m103c_out")
OUT = os.path.join(ROOT, "_work", "label103c_change_face.txt")
sys.path.insert(0, os.path.join(ROOT, "tools"))

from t2t import convert  # noqa: E402


def main():
    only = set(sys.argv[1:])
    os.makedirs(OUTDIR, exist_ok=True)
    stems = sorted(d[:-4] for d in os.listdir(FLAT) if d.endswith(".tex"))
    if only:
        stems = [s for s in stems if s in only]
    rows = []
    detail = []
    built = refused = 0
    pad_was = pad_now = 0
    for stem in stems:
        prod = os.path.join(PROD, stem, "main.typ")
        if not os.path.isfile(prod):
            continue  # a paper with no product of its own is not this change's face
        out = os.path.join(OUTDIR, stem)
        os.makedirs(out, exist_ok=True)
        convert.convert_paper(os.path.join(FLAT, stem + ".tex"), out, stem)
        new = os.path.join(out, "main.typ")
        now = io.open(new, encoding="utf-8").read() if os.path.isfile(new) else ""
        was = io.open(prod, encoding="utf-8").read()
        pad_was += was.count("padding:")
        pad_now += now.count("padding:")
        canvases_now = now.count("#cetz.canvas(")
        canvases_was = was.count("#cetz.canvas(")
        if canvases_now != canvases_was:
            # a picture that starts or stops drawing is a different kind of change than a node
            # that moves, and it has to be named rather than buried in a line count
            detail.append("CANVAS %s: %d -> %d" % (stem, canvases_was, canvases_now))
            built += canvases_now > canvases_was
            refused += canvases_now < canvases_was
        if now == was:
            continue
        lines = [l for l in difflib.unified_diff(was.splitlines(), now.splitlines(), n=0,
                                                 lineterm="")
                 if (l.startswith("+") or l.startswith("-"))
                 and not l.startswith(("+++", "---"))]
        added = [l for l in lines if l.startswith("+")]
        # this round adds a `padding:` to a label that had none; the tokens it added are that
        # population, and the changed lines that carry a `padding:` already had one to be repriced
        gained = now.count("padding:") - was.count("padding:")
        with_pad = sum(1 for l in added if "padding:" in l)
        box_width = sum(1 for l in added if "#box(width:" in l)
        if only:
            detail.extend("%s  %s" % (stem, l[:240]) for l in lines)
        rows.append((stem, len(added), max(0, gained), max(0, with_pad - gained), box_width))
    text = ("papers changed: %d of %d regenerated\n"
            "canvas count changed: %d built / %d refused\n"
            "padding: tokens: %d -> %d (%+d new)\n"
            "changed lines carrying a pad that was already there (repriced): %d\n"
            "changed lines carrying a #box(width:) (grown by two seps): %d\n"
            "papers gaining at least one pad: %d\n"
            "papers whose only change is a repriced pad or a wider box: %d\n"
            "total changed lines: %d"
            % (len(rows), len(stems), built, refused, pad_was, pad_now, pad_now - pad_was,
               sum(r[3] for r in rows), sum(r[4] for r in rows),
               sum(1 for r in rows if r[2]),
               sum(1 for r in rows if r[2] == 0), sum(r[1] for r in rows)))
    body = "\n".join("%s  %3d  PAD-NEW=%d  PAD-PRICE=%d  BOX-WIDTH=%d" % r for r in
                     sorted(rows, key=lambda x: (-x[1], x[0])))
    io.open(OUT, "w", encoding="utf-8").write(text + "\n" + body + "\n" + "\n".join(detail) + "\n")
    print(text)
    print(body)
    if detail:
        print("\n".join(detail[:60]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
