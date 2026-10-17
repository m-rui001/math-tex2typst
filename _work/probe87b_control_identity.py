r"""Does each on-ink face row's control really show the author's own drawing?

The census prices a collision as ours only when the pdflatex control of the source diagram shows ZERO
on-ink pairs, so the whole face rests on that control being the SAME figure. Two ways it can lie, both
found on this round's 27-row face: `probe84` used to pick the picture by prose words, which is blind for
the diagrams whose labels are all maths (`CD`, `tikzcd`, `$B_V B_W(Q)$` nodes) and put 13 of 113 canvases
against a neighbour's drawing; and a standalone page where pdflatex choked on a missing style draws
almost nothing, so its zeros read as "the author is clean too".

Two numbers per face canvas, from the generation whose control is the diagram at the canvas's own index
and whose PIC sees `tikzpicture`, `tikzcd` and `CD`:
  ink    the control page's ink elements against our canvas page's: half the ink is not a clean page,
         it is a page that stopped early -- the gate
  words  printed as evidence: how many of the words the canvas PRINTS sit in the picture at that index

  python _work/probe87b_control_identity.py

Verdict per canvas: verified, or `control drew little` -- a control that drew less than half our ink
is no evidence either way, so its canvas leaves the face rather than staying in it on a guess.
"""
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, WORK)
import probe81_label_box_face as g  # noqa: E402
import probe84_control_face as C  # noqa: E402
import probe85b_emitter_face as F  # noqa: E402

DEPTH = 3.0
ROWS = "control88_rows.json"
PRINTED = re.compile(r"content\(\s*\([^)]*\),\s*(.*?)\](?:,|\))", re.S)


def printed_words(block):
    """The words the canvas puts on the page: text inside content() calls, code and maths stripped."""
    texts = " ".join(m.group(1) for m in PRINTED.finditer(block))
    texts = re.sub(r"\\\( Q \\\)|\( Q \)", " ", texts)
    return {w for w in re.findall(r"[A-Za-z]{2,}", texts) if w not in ("content", "anchor", "text")}


def env_of(pic):
    m = re.search(r"\\begin\{(\w+)\}", pic)
    return m.group(1) if m else "?"


def main():
    rows = {(r["stem"], r["k"]): r for r in F.load(ROWS)}
    # rec[2] is the census's own [frames, ink] measured on OUR canvas page
    ours = {(r[0], r[1]): r[2] for r in F.load("label81_pairs.json")}
    canvases = g.canvases()
    onink = F.face(ctl_name=ROWS, depth=DEPTH)["onink"]
    keys = sorted({(r[0], r[1]) for r in onink})
    out = ["on-ink face at depth >%g pt on %s: %d rows / %d canvases / %d papers"
           % (DEPTH, ROWS, len(onink), len(keys), len({k[0] for k in keys}))]
    out.append("identity is source order (probe84 refuses a paper whose canvas count differs from its")
    out.append("picture count), so the only gate here is whether the control page drew the figure:")
    out.append("  ink     the control page's ink elements vs our canvas page's   >= 50%")
    out.append("  words   printed as evidence only -- on a maths-only diagram the canvas prints what")
    out.append("          Typst made of `$\\mathcal P Y$` or a `@>{c_V(Q)}>>` CD arrow, so the overlap")
    out.append("          against the source text is low (4 of 16 face canvases under 50%) while the")
    out.append("          picture at that index is plainly the same figure")
    tally = {}
    tally_of = {}
    for stem, k in keys:
        r = rows.get((stem, k)) or {}
        head, block = canvases[(stem, k)]
        path, pics = C.pictures(stem)
        pic = pics[r["pic"]] if r.get("pic") is not None and r["pic"] < len(pics) else ""
        pw = {w for w in re.findall(r"[A-Za-z]{2,}", pic)} - {"begin", "end", "node", "draw", "path",
                                                              "coordinate", "tikzpicture", "tikzcd",
                                                              "style", "above", "below", "left", "right",
                                                              "anchor", "text", "content"}
        mine = printed_words(block)
        shared = len(mine & pw)
        frac = shared / len(mine) if mine else 0.0
        our_ink = ours.get((stem, k), [0, 0])[1]
        drawn = (r.get("ink") or 0) >= 0.5 * our_ink if our_ink else False
        verdict = "verified" if drawn else "control drew little"
        tally[verdict] = tally.get(verdict, 0) + 1
        tally_of[(stem, k)] = verdict
        n = sum(1 for x in onink if x[0] == stem and x[1] == k)
        out.append("\n%-52s#%d  rows %d  %s" % (stem[:52], k, n, verdict))
        out.append("   control pic %s env %-12s score %-3s  our %s ctl %s"
                   % (r.get("pic"), env_of(pic), r.get("score"), r.get("our"), r.get("ctl")))
        # frames/strokes/ink in the rows file are all measured on the CONTROL page (probe84.measure).
        # A control that drew half the ink of our canvas is not a clean page, it is a page that
        # stopped early or lost the picture to a missing style, so its zeros are not evidence.
        out.append("   control: frames %-3s strokes %-3s ink %-4s (ours %-4s)   printed words %d, "
                   "in picture %d (%.0f%%)"
                   % (r.get("boxes"), r.get("raw"), r.get("ink"), our_ink,
                      len(mine), shared, 100 * frac))
        for x in sorted([y for y in onink if y[0] == stem and y[1] == k], key=lambda y: -y[2]):
            out.append("      %5.2f  %r x %r" % (x[2], x[3], x[4]))
    out.append("\ntally: %s" % sorted(tally.items()))
    good = [(s, k) for (s, k) in keys if tally_of[(s, k)] == "verified"]
    out.append("verified face: %d rows / %d canvases / %d papers"
               % (sum(1 for x in onink if (x[0], x[1]) in set(good)), len(good),
                  len({s for s, _ in good})))
    text = "\n".join(out)
    print(text)
    io.open(os.path.join(WORK, "label87b_identity.txt"), "w", encoding="utf-8").write(text + "\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
