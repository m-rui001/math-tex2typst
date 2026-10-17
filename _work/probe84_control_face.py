r"""Give the collision census a pdflatex side: is each flagged crossing ours, or the author's own?

The census (`_work/probe81_label_box_face.py`) measures ink on the pages we build. It has no control,
so a crossing the author's real TikZ also draws sits in the same population as one we invented. This
probe takes every canvas in `_work/label81_pairs.json`, takes the source diagram at its own index --
canvases are emitted in the order the pictures sit in the source, and a paper whose canvas count
differs from its picture count is refused rather than guessed -- compiles that one diagram as a
`standalone` page with pdflatex (`tikzpicture`, `tikzcd` and the older `CD` are all diagrams), and
runs **the same gauge functions** (`boxes_and_ink`, `hits`, `confirmed`) over the control page. Two
counts of the same measurement, one on our render and one on TikZ's.

  python _work/probe84_control_face.py <limit|-> <rows.json>

Rows land in the named file; the print is the tally per family plus the top mismatches.
A `boxes=0` control means pdflatex drew no frame this gauge recognises, which is a hole in the gauge,
not a clean page -- those rows are counted separately and never read as "faithful". A control page
that still carries `@` is the same hole in another shape: the `CD` environment never loaded, so the
arrow syntax was set as text and its zero collisions are an absence of drawing, not an absence of
overlap.
"""
import json
import os
import re
import sys
import concurrent.futures

import fitz

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
FLAT = os.path.join(ROOT, "_work", "flat")
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))

import probe81_label_box_face as g  # noqa: E402
import compare_figure  # noqa: E402

# the candidate list is compare_figure's own picture list, in the same order it indexes: a diagram
# is a diagram, whether the author wrote `tikzpicture`, `tikzcd` or the older `CD` environment.
PIC = compare_figure.PIC


def pictures(stem):
    path = os.path.join(FLAT, stem + ".tex")
    if not os.path.exists(path):
        return None, []
    src = open(path, encoding="utf-8", errors="replace").read()
    return path, [p.group(0) for p in PIC.finditer(src)]


def word_score(block, pic):
    """How much of this picture's prose survives on the canvas -- evidence, not a matcher.

    The words are what `probe87b_control_identity` reads to confirm the picture really is the figure
    the canvas came from. They cannot *choose* it: the diagrams whose labels are all maths (`CD`,
    `tikzcd`, nodes like `$B_V B_W(Q)$`) carry almost no 4+ letter prose, so scoring them against a
    prose-heavy neighbour in the same paper picks the wrong drawing 13 times out of 113.
    """
    body = re.sub(r"\s+", "", block)
    return len({w for w in re.findall(r"[A-Za-z]{4,}", pic) if w in body})


def measure(pdf):
    doc = fitz.open(pdf)
    page = doc[0]
    rects, ink = g.boxes_and_ink(page)
    raw = sum(1 for d in page.get_drawings()
              if d.get("color") is not None and 8 <= d["rect"].width <= 220 and d["rect"].height <= 140)
    text = page.get_text()
    found, both = g.decide(pdf, rects, ink)
    doc.close()
    return len(rects), raw, len(ink), found, both, text


def syntax_left(pic, text):
    r"""Did the control actually compile, or did it set the source as text?

    `CD` belongs to amscd. Load no amscd and every `@>{f}>>` falls through to text mode, so the page
    carries the author's own characters -- and a line of text has no collisions to miss, which the
    gauge would read as "the author is clean too".
    """
    return "\\begin{CD}" in pic and "@" in text


def body_size(head):
    """The canvas page's own text size, snapped to a pt value standalone accepts."""
    m = re.search(r"size: ([0-9.]+)pt", head or "")
    if not m:
        return None
    return min((10, 11, 12), key=lambda s: abs(s - float(m.group(1))))


def one(record):
    stem, k, sizes, found, both = record
    canv = CANV.get((stem, k))
    if canv is None:
        return {"stem": stem, "k": k, "why": "canvas not in the products"}
    path, pics = pictures(stem)
    if path is None:
        return {"stem": stem, "k": k, "why": "no flat source"}
    if not pics:
        return {"stem": stem, "k": k, "why": "no diagram in the source"}
    if PER_PAPER[stem] != len(pics):
        # source order is the matcher, and it is only the matcher while nothing was dropped between
        # source and product: a paper whose canvas count differs from its picture count is refused,
        # not guessed at.
        return {"stem": stem, "k": k, "why": "canvases %d != pictures %d"
                % (PER_PAPER[stem], len(pics)), "our": (len(found), len(both))}
    i = k
    size = body_size(canv[0])
    os.makedirs(compare_figure.CMP, exist_ok=True)
    pdf, _ = compare_figure.control(path, i, [], size)
    if pdf is None:
        return {"stem": stem, "k": k, "why": "pdflatex produced nothing", "pic": i,
                "our": (len(found), len(both))}
    boxes, raw, ink, cfound, cboth, text = measure(pdf)
    if syntax_left(pics[i], text):
        return {"stem": stem, "k": k, "pic": i, "our": (len(found), len(both)),
                "why": "control set the source as text (no amscd)"}
    return {"stem": stem, "k": k, "pic": i, "score": word_score(canv[1], pics[i]), "size": size,
            "boxes": boxes, "raw": raw, "ink": ink,
            "our": (len(found), len(both)),
            "our_depth": (round(max([t[0] for t in found] or [0]), 2),
                          round(max([t[0] for t in both] or [0]), 2)),
            "ctl": (len(cfound), len(cboth)),
            "ctl_depth": (round(max([t[0] for t in cfound] or [0]), 2),
                          round(max([t[0] for t in cboth] or [0]), 2))}


def main():
    if len(sys.argv) < 3:
        sys.exit("usage: probe84_control_face.py <limit|-> <rows.json>  "
                 "(the rows file names the generation: a re-run with a corrected gauge must not "
                 "silently overwrite the reading it is being compared against)")
    limit = None if sys.argv[1] == "-" else int(sys.argv[1])
    rows_name = sys.argv[2]
    records = json.load(open(os.path.join(HERE, "label81_pairs.json"), encoding="utf-8"))
    if limit:
        records = records[:limit]
    print("flagged canvases to control: %d" % len(records), flush=True)
    rows = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=6) as pool:
        for row in pool.map(one, records):
            if row is None:
                continue
            rows.append(row)
            print("  %-46s#%-2d %s" % (row["stem"][:46], row["k"],
                                       json.dumps(row, ensure_ascii=False, sort_keys=True)[1:-1]),
                  flush=True)
    with open(os.path.join(HERE, rows_name), "w", encoding="utf-8") as fh:
        json.dump(rows, fh, ensure_ascii=False, indent=1)

    good = [r for r in rows if "ctl" in r]
    reasons = {}
    for r in rows:
        if "why" in r:
            reasons[r["why"]] = reasons.get(r["why"], 0) + 1
    print("\nrows: %d of %d   controlled: %d   unusable: %d  %s"
          % (len(rows), len(records), len(good), len(rows) - len(good), sorted(reasons.items())))
    print("no row at all: %d" % (len(records) - len(rows)))
    for kind, idx in (("foreign-ink", 0), ("ink-on-ink", 1)):
        # a foreign pair needs a frame the gauge recognises on BOTH sides; ink-on-ink needs only ink
        sub = [r for r in good if idx == 1 or r["boxes"]]
        ours = sum(r["our"][idx] for r in sub)
        ctl = sum(r["ctl"][idx] for r in sub)
        canv_ours = sum(1 for r in sub if r["our"][idx])
        canv_ctl = sum(1 for r in sub if r["ctl"][idx])
        both_sides = sum(1 for r in sub if r["our"][idx] and r["ctl"][idx])
        only_ours = sum(1 for r in sub if r["our"][idx] and not r["ctl"][idx])
        print("%-12s comparable on %d canvases (frames seen by the gauge: %d of %d controlled)   "
              "pairs ours=%d control=%d   canvases ours=%d control=%d  faithful=%d  ours-only=%d"
              % (kind, len(sub), sum(1 for r in good if r["boxes"]), len(good),
                 ours, ctl, canv_ours, canv_ctl, both_sides, only_ours))
    faithful = [r for r in good if r["ctl"][0] or r["ctl"][1]]
    print("\ncanvases where the author's own TikZ collides too: %d  (these are not our defect)"
          % len(faithful))
    for r in faithful[:8]:
        print("  %-46s#%-2d our %s (depth %s)  control %s (depth %s)"
              % (r["stem"][:46], r["k"], r["our"], r["our_depth"], r["ctl"], r["ctl_depth"]))

    print("\nworst of ours that the control does not show:")

    def excess(r):
        """How many pairs are ours alone: the foreign family only counts when the control has a frame."""
        return (r["our"][0] - r["ctl"][0] if r["boxes"] else 0) + (r["our"][1] - r["ctl"][1])

    bad = [r for r in good if excess(r) > 0]
    bad.sort(key=lambda r: -excess(r))
    for r in bad[:12]:
        print("  %-46s#%-2d our %s (depth %s)  control %s (depth %s)  boxes=%d raw=%d"
              % (r["stem"][:46], r["k"], r["our"], r["our_depth"], r["ctl"], r["ctl_depth"],
                 r["boxes"], r["raw"]))


CANV = g.canvases()
PER_PAPER = {}
for _stem, _k in CANV:
    PER_PAPER[_stem] = PER_PAPER.get(_stem, 0) + 1

if __name__ == "__main__":
    main()
