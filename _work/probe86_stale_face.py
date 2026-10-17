"""Is a flagged canvas an emitter bug, or a page that predates a fix already in the tree?

The census reads `typst/<paper>/main.typ`. A round that regens only its own face leaves the rest of
the corpus on the emitter it was built with, so a collision on a page is not yet a collision in the
code. For every canvas on probe85b's on-ink face: rebuild the SAME picture through the shipped
driver (`probe81m_churn_read.live`, the one path that walks prep/convert/cetz the way the batch does)
with the emitter as it stands, lay it out at the paper's own prelude, and hand the page to the same
gauge (`probe81.decide`).

  rebuild clean   -> the page is STALE: a regen, not a code change
  rebuild collides -> an emitter face, and the pairs it still shows are the ones to chase

Usage: python _work/probe86_stale_face.py [depth]
"""
import json
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, WORK)
# plain imports, not importlib: probe81m loads probe81 itself, and exec'ing probe81 twice re-wraps
# sys.stdout over a handle the first copy already closed
import probe81m_churn_read as m81  # noqa: E402
import probe85b_emitter_face as f  # noqa: E402

g = m81.g81


def norm(canvas):
    return [l.strip() for l in canvas.splitlines() if l.strip()]


def match(built, block):
    """Which of the paper's rebuilt canvases IS this page's block? The picture index in the product
    counts `#cetz.canvas(` blocks, `live()` counts source pictures, and the two drift apart when a
    picture is quoted or a tikzcd float joins them -- so pair on shared lines, not on an index."""
    want = set(norm(block))
    best, score = None, -1.0
    for cand in built:
        if not cand:
            continue
        got = norm(cand)
        if not got:
            continue
        share = len(want & set(got)) / float(len(set(got) | want))
        if share > score:
            best, score = cand, share
    return best, score


def main(depth=3.0):
    by = {}
    for stem, k, d, t1, t2 in f.face(depth=depth)["onink"]:
        by.setdefault((stem, k), []).append((d, t1, t2))
    canv = g.canvases()
    tally = {}
    for (stem, k), pairs in sorted(by.items()):
        head, block = canv[(stem, k)]
        path = os.path.join(WORK, "flat", stem + ".tex")
        built = m81.live(path) if os.path.exists(path) else []
        new, score = match(built, block)
        if not new or score < 0.3:
            print("%s#%-2d  no rebuilt canvas matches this block (best share %.2f of %d built)"
                  % (stem[:50], k, score, len(built)))
            tally["no-build"] = tally.get("no-build", 0) + 1
            continue
        same = norm(new) == norm(block)
        got = g.render(new, "86s", head)
        if not got:
            print("%s#%-2d  rebuild refused to compile (text %s)" % (stem[:50], k, "same" if same else "differs"))
            tally["unbuilt"] = tally.get("unbuilt", 0) + 1
            continue
        rects, ink, pdf = got
        keep = [t for t in g.decide(pdf, rects, ink)[1] if t[0] > depth]
        tag = "page stale, rebuild CLEAN" if not keep else "emitter face (%d pairs left)" % len(keep)
        print("%s#%-2d  shipped %d pairs (worst %.2f)  share %.2f  text %s  ->  %s"
              % (stem[:50], k, len(pairs), max(p[0] for p in pairs), score,
                 "identical" if same else "DIFFERS", tag))
        for t in sorted(keep, reverse=True)[:3]:
            print("        still %.2f  %r x %r" % (t[0], t[3][:22], t[4][:22]))
        tally["stale-clean" if not keep else "live"] = tally.get("stale-clean" if not keep else "live", 0) + 1
    print("\ntally over %d canvases: %s" % (len(by), json.dumps(tally, sort_keys=True)))


if __name__ == "__main__":
    main(float(sys.argv[1]) if len(sys.argv) > 1 else 3.0)
