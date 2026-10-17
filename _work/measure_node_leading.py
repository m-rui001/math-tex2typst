"""Row distance inside one node: our page against the author's own TikZ.

A multi-line node reaches Typst as one `content(...)` whose rows are split by `#linebreak()`, so the
gap between two rows is Typst's, not TeX's. This prints, for the two runs that the census says
collide, what each engine actually leaves between them:

  span   the layout box fitz reports for the run
  ink    that run's own paint box (`probe81.tight_rect`, 300 dpi)
  gap    ink(row below).y0 - ink(row above).y1   -- negative is glyphs touching

Usage: python _work/measure_node_leading.py <stem-fragment> <canvas-index> [depth]
"""
import io
import json
import os
import re
import sys
import unicodedata

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, WORK)
import fitz  # noqa: E402
import probe81_label_box_face as g  # noqa: E402

CMP = os.path.join(WORK, "cmp")


def norm(text):
    return unicodedata.normalize("NFKD", text).replace(" ", "")


def rows(doc, needle):
    """[(span box, ink box)] for every run on the page whose text matches this printed run"""
    out = []
    page = doc[0]
    for block in page.get_text("dict")["blocks"]:
        for line in block.get("lines", []):
            for span in line.get("spans", []):
                if norm(span["text"]) != needle:
                    continue
                band = fitz.Rect(span["bbox"])
                out.append((band, g.tight_rect(doc, band)))
    return out


def report(tag, doc, needle):
    got = rows(doc, needle)
    if not got:
        print("    %-8s no run %r on this page" % (tag, needle[:18]))
        return None
    span, ink = got[0]
    print("    %-8s %-18r span y %6.2f..%6.2f (h %.2f)  ink y %6.2f..%6.2f (h %.2f)"
          % (tag, needle[:18], span.y0, span.y1, span.height,
             ink.y0 if ink else -1, ink.y1 if ink else -1,
             (ink.y1 - ink.y0) if ink else -1))
    return ink or span


def lines(doc, x0, x1, y0, y1):
    """fitz's own line boxes in a window -- the engine's row segmentation, no needles needed.

    The census pairs are stripped/NFKD'd run texts, and pdflatex spells `$n=-s$` with an ASCII
    hyphen where our page has U+2212, so the needle that finds a row on our page can miss the
    same row on the control. The line boxes do not care how the text is spelled.
    """
    out = []
    for block in doc[0].get_text("dict")["blocks"]:
        for line in block.get("lines", []):
            bx = fitz.Rect(line["bbox"])
            if bx.x1 < x0 or bx.x0 > x1 or bx.y1 < y0 or bx.y0 > y1:
                continue
            out.append((bx, "".join(s["text"] for s in line["spans"])))
    return sorted(out, key=lambda t: (t[0].y0, t[0].x0))


def dump_rows(tag, doc, win, limit=40):
    got = lines(doc, *(win if win else (-1e5, 1e6, -1e5, 1e6)))
    for bx, text in got[:limit]:
        print("    %-8s line y %6.2f..%6.2f (h %5.2f) x %6.2f..%6.2f  %r"
              % (tag, bx.y0, bx.y1, bx.height, bx.x0, bx.x1, text[:52]))
    if len(got) >= 2 and win:
        pitch = got[1][0].y0 - got[0][0].y0
        print("    %-8s first two lines: pitch %.2f pt, gap %+.2f pt"
              % (tag, pitch, got[1][0].y0 - got[0][0].y1))
    elif not got:
        print("    %-8s no line in window" % tag)


def window_of(spans):
    """A window around the pair's own span boxes, widened so the whole node's rows fall in."""
    if not spans:
        return None
    x0 = min(s.x0 for s in spans) - 6
    x1 = max(s.x1 for s in spans) + 6
    y0 = min(s.y0 for s in spans) - 10
    y1 = max(s.y1 for s in spans) + 26
    return x0, x1, y0, y1


def main(frag, k, depth=3.0, show_rows=False):
    stem = [s for s in os.listdir(os.path.join(ROOT, "typst")) if s.startswith(frag)]
    if not stem:
        print("no paper starts with %r" % frag)
        return 1
    stem = stem[0]
    rec = [r for r in json.load(io.open(os.path.join(WORK, "label81_pairs.json"), encoding="utf-8"))
           if r[0] == stem and r[1] == k]
    if not rec:
        print("no census record for %s#%d" % (stem, k))
        return 1
    ctl = {(r["stem"], r["k"]): r for r in json.load(io.open(os.path.join(WORK, "control85b_rows.json"), encoding="utf-8"))}
    c = ctl.get((stem, k)) or {}
    head, block = g.canvases()[(stem, k)]
    got = g.render(block, "86l", head)
    if not got:
        print("our canvas does not compile")
        return 1
    ours = got[2]
    name = "%s-%d.pdf" % (re.sub(r"[^A-Za-z0-9]", "_", stem)[:40], c.get("pic", -1))
    theirs = os.path.join(CMP, name)
    print("%s#%d   our page %s\n              control %s" % (stem[:60], k, os.path.relpath(ours, ROOT), theirs))
    pairs = [t for t in rec[0][4] if t[0] > depth]
    dumped_ctl = False
    for t in sorted(pairs, reverse=True):
        print("  pair %.2f  %r x %r" % (t[0], t[3][:22], t[4][:22]))
        doc = fitz.open(ours)
        a = report("ours", doc, t[3])
        b = report("ours", doc, t[4])
        if show_rows:
            spans = [rows(doc, x)[0][0] for x in (t[3], t[4]) if rows(doc, x)]
            dump_rows("ours", doc, window_of(spans))
        doc.close()
        ca = cb = None
        if os.path.exists(theirs):
            doc = fitz.open(theirs)
            ca = report("tikz", doc, t[3])
            cb = report("tikz", doc, t[4])
            if show_rows and not dumped_ctl:
                dumped_ctl = True
                dump_rows("tikz", doc, None, limit=90)
            doc.close()
        for tag, p, q in (("ours", a, b), ("tikz", ca, cb)):
            if p and q:
                above, below = (p, q) if p.y0 <= q.y0 else (q, p)
                print("    %-5s row gap %+.2f pt   baseline-ish centre distance %.2f"
                      % (tag, below.y0 - above.y1, abs((p.y0 + p.y1) / 2 - (q.y0 + q.y1) / 2)))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1], int(sys.argv[2]),
                  float(sys.argv[3]) if len(sys.argv) > 3 else 3.0,
                  show_rows=len(sys.argv) > 4))
