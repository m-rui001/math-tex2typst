r"""#100i: for each on-ink face row, put our page's two boxes next to the control page's two boxes.

The census says two labels overlap on our canvas and the author's own TikZ shows zero pairs of that
family.  That leaves exactly two possible causes, and the face row alone cannot tell them apart:
(A) we put one of the two spans somewhere TikZ does not, or (B) both sit where they should and our
letters are simply fatter (Typst's own metrics for the same size, 轴 62).  So read the same two spans
on both pages and report the pair in a frame that does not depend on where the page starts --
**box 2 measured from box 1**, plus each box's own width/height/font size.

`dx,dy` differing by more than the row's depth is a placement law; matching offsets with larger widths
is a metrics difference, and no placement fix will clear it.

Both sides are one-canvas-per-page: ours is `probe81.render` of the canvas read out of the current
`typst/<stem>/main.typ`, the control is the pdflatex `standalone` page probe84 built for the same
picture index.  The gauge functions are probe81's, not a second copy (轴 68).

  python _work/probe100i_page_pair.py control152_rows.json     # all face rows
  python _work/probe100i_page_pair.py control152_rows.json 3    # only the first three

The rows file names the generation, exactly as `probe85b_emitter_face.py` and
`probe87_onink_mechanism.py` do: the face sheet is the one that join probe wrote for it
(`labelNN_face.txt`) and the pins come from that generation's mechanism sheet
(`labelNN_mechanism.txt`, probe87's stdout redirected), so a re-run can never read against the
previous generation's numbers.
"""
import io
import os
import re
import sys
import unicodedata

import fitz

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))

import probe81_label_box_face as g  # noqa: E402

PAIR = os.path.join(HERE, "label81_pairs.json")
CMP = os.path.join(HERE, "cmp")
ROW = re.compile(r"^\s+(\d+\.\d+)\s+(\S+)#(\d+)\s+'(.*?)' vs '(.*?)'\s*$")
MECH_ROW = re.compile(r"^\s+\d+\.\d+\s+dx\s*-?[\d.]+\s+dy\s*-?[\d.]+\s+'(.*?)'\s+x\s+'(.*?)'")


def paths(rows_name):
    """The generation's own three sheets, derived from the rows file like probe85b names the face."""
    tag = rows_name.replace("control", "label").replace("_rows.json", "")
    return (os.path.join(HERE, tag + "_face.txt"),
            os.path.join(HERE, tag + "_mechanism.txt"),
            os.path.join(HERE, tag + "_page_pair.txt"))


def face_rows(face_path, limit=None):
    """The on-ink block of the join receipt, with full stems read back off the census file."""
    import json
    pairs = json.load(io.open(PAIR, encoding="utf-8"))
    stems = {rec[0] for rec in pairs}
    rows = []
    block = False
    for line in io.open(face_path, encoding="utf-8"):
        if line.startswith("-- onink --"):
            block = True
            continue
        if block and line.strip().startswith("--"):
            break
        if not block:
            continue
        m = ROW.match(line.rstrip("\n"))
        if not m:
            continue
        depth, short, k, t1, t2 = m.group(1), m.group(2), int(m.group(3)), m.group(4), m.group(5)
        hit = [s for s in stems if s.startswith(short)]
        if len(hit) != 1:
            rows.append((depth, short, k, t1, t2, "NOSTEM %s" % hit))
            continue
        rows.append((depth, hit[0], k, t1, t2, None))
    return rows[:limit] if limit else rows


def flat(text):
    r"""What a page's characters say, stripped of everything the two engines insert differently.

    Combining marks go too: Typst sets `\bar u` as one `ū` and TeX draws the bar as a glyph of its
    own, so the census's `',iū)'` has no chance of matching the control page's character run.
    """
    out = ""
    for char in unicodedata.normalize("NFKD", text):
        if not unicodedata.combining(char):
            out += char
    return re.sub(r"\s", "", out).lower()


def find(page, needle):
    r"""The box one label occupies on this page, as (rect, text, size) -- or every candidate.

    Typst ships a node's label as one span and pdflatex ships the same maths as a fistful of
    per-glyph spans (`'Y'@10.91 | '×' | 'Y'`), so neither side's *span* is the object the census
    priced.  Both sides do have characters, so the label is found as a run of consecutive characters
    in one line whose de-spaced text equals the needle, and its box is the union of those characters.
    This is the census's own unit -- `confirmed_pairs` already prices a pair at the character.
    """
    want = flat(needle)
    whole, part = [], []
    for block in page.get_text("rawdict")["blocks"]:
        for line in block.get("lines", []):
            # a rawdict char carries no size of its own -- it belongs to the span that shipped it
            chars = [(ch, span["size"]) for span in line["spans"] for ch in span["chars"]
                     if ch["c"].strip()]
            # flattened per character: a combining mark alone on a page is one char and zero letters,
            # so the line's flattened text is shorter than its character list and the two cannot be
            # indexed against each other
            pieces = [flat(ch["c"]) for ch, _s in chars]
            text = "".join(ch["c"] for ch, _s in chars)
            if not any(pieces):
                continue
            if "".join(pieces) == want:
                whole.append((union([c for c, _s in chars]), text,
                             round(max(s for _c, s in chars), 2)))
                continue
            # the needle is only a fragment of this line: grow a run of characters from every start
            # that still spells a prefix of it (spaces in the line make the character count a guess)
            for i in range(len(chars)):
                if not pieces[i] or not want.startswith(pieces[i]):
                    continue
                j, acc = i, ""
                while j < len(chars) and want.startswith(acc + pieces[j]):
                    acc += pieces[j]
                    j += 1
                if acc == want and i < j:
                    part.append((union([c for c, _s in chars[i:j]]), text,
                                round(max(s for _c, s in chars[i:j]), 2)))
    return whole or part


def union(rects):
    box = fitz.Rect(rects[0]["bbox"])
    for ch in rects[1:]:
        box |= fitz.Rect(ch["bbox"])
    return box


def ink_box(page):
    box = fitz.Rect()
    for dr in page.get_drawings():
        if dr.get("color") is not None or dr.get("fill") is not None:
            box |= dr["rect"]
    for blk in page.get_text("dict")["blocks"]:
        for ln in blk.get("lines", []):
            for sp in ln.get("spans", []):
                if sp["text"].strip():
                    box |= fitz.Rect(sp["bbox"])
    return box


def read(pdf, t1, t2, anchor=None):
    """(b1, b2) boxes on this page, resolved against the census's own rects when given."""
    doc = fitz.open(pdf)
    page = doc[0]
    out = {"ink": ink_box(page), "amb": ""}
    for tag, needle, pin in (("b1", t1, anchor[0] if anchor else None),
                             ("b2", t2, anchor[1] if anchor else None)):
        got = find(page, needle)
        if pin and len(got) > 1:
            hit = [c for c in got if abs(c[0].x0 - pin[0]) < 1.0 and abs(c[0].y0 - pin[1]) < 1.0
                    and abs(c[0].x1 - pin[2]) < 1.0 and abs(c[0].y1 - pin[3]) < 1.0]
            got = hit or got
        if len(got) == 1:
            out[tag] = got[0]
        else:
            out[tag] = got
            out["amb"] += " %s=%d" % (tag, len(got))
    doc.close()
    return out


def rel(side):
    """Box 2 measured from box 1, in each page's own frame -- one line per candidate pairing."""
    lines = []
    c1 = side.get("b1") if isinstance(side.get("b1"), list) else [side.get("b1")]
    c2 = side.get("b2") if isinstance(side.get("b2"), list) else [side.get("b2")]
    for b1, s1, x1 in [(c[0], c[2], c[1]) for c in c1 if c]:
        for b2, s2, x2 in [(c[0], c[2], c[1]) for c in c2 if c]:
            depth = min(max(0.0, min(b1.x1, b2.x1) - max(b1.x0, b2.x0)),
                        max(0.0, min(b1.y1, b2.y1) - max(b1.y0, b2.y0)))
            lines.append("  dx %7.2f dy %7.2f  depth %5.2f  |  b1 w %6.2f h %5.2f @%s %-22s |"
                         "  b2 w %6.2f h %5.2f @%s %-14s |  pair at ink (%.1f, %.1f)"
                         % (b2.x0 - b1.x0, b2.y0 - b1.y0, depth,
                            b1.width, b1.height, s1, x1[:22],
                            b2.width, b2.height, s2, x2[:14],
                            min(b1.x0, b2.x0) - side["ink"].x0,
                            min(b1.y0, b2.y0) - side["ink"].y0))
    if not lines:
        lines.append("  (a label is missing on this page: %s)" % (side.get("amb") or "b1/b2"))
    return lines


def census_boxes(mech_path):
    """The two span rects the attribution sheet priced, keyed by its own truncated stem plus the texts.

    They are the pins this page resolves a repeated label with: `block $A$` is drawn twice in the
    Disk-transfer canvas, and only the census knows which of the two it measured.
    """
    lines = io.open(mech_path, encoding="utf-8").read().splitlines()
    out, stem, k = [], None, None
    for i, line in enumerate(lines):
        if line.startswith("=== "):
            head = line[4:].rstrip("\n").split("  worst")[0]
            stem, _, idx = head.rpartition("#")
            k = int(idx)
            continue
        m = MECH_ROW.match(line)
        if not m or not stem:
            continue
        box = [re.search(r"box%d=\(([-\d., ]+)\)" % n, lines[j])
               for n, j in ((1, i + 1), (2, i + 2))]
        if not (box[0] and box[1]):
            continue
        out.append((stem, k, m.group(1), m.group(2),
                    [float(v) for v in box[0].group(1).split(",")],
                    [float(v) for v in box[1].group(1).split(",")]))
    return out


def pin_for(pins, stem, k, t1, t2):
    for short, kk, a, b, r1, r2 in pins:
        if kk == k and a == t1 and b == t2 and stem.startswith(short):
            return (r1, r2)
    return None


def main():
    sys.stdout.reconfigure(errors="replace")
    if len(sys.argv) < 2 or not sys.argv[1].endswith("_rows.json"):
        print(__doc__)
        return 2
    face_path, mech_path, out_path = paths(sys.argv[1])
    rows = face_rows(face_path, int(sys.argv[2]) if len(sys.argv) > 2 else None)
    pins = census_boxes(mech_path)
    canv = g.canvases()
    pages = {}
    lines = ["#100i on %s: the two labels of every on-ink face row, our page vs the pdflatex control"
             % sys.argv[1],
             "dx/dy is box 2 from box 1 on that page; equal offsets with bigger widths = metrics, "
             "different offsets = placement"]
    for n, (depth, stem, k, t1, t2, bad) in enumerate(rows):
        if bad:
            lines.append("\n### %s#%s  %s" % (stem[:44], k, bad))
            continue
        lines.append("\n### %s#%s  row %s  %r vs %r" % (stem[:44], k, depth, t1, t2))
        key = (stem, k)
        if key not in pages:
            if key not in canv:
                pages[key] = (None, None)
            else:
                head, canvas = canv[key]
                # one canvas per page: the page carries no body prose and no neighbour figure to
                # borrow labels from -- the census's own page, rebuilt by the census's own `render`
                got = g.render(canvas, "m100i_%02d" % n, head)
                san = re.sub(r"[^A-Za-z0-9]", "_", stem)[:40]
                pages[key] = (got[2] if got else None, os.path.join(CMP, "%s-%d.pdf" % (san, k)))
        ours_pdf, ctl_pdf = pages[key]
        for label, pdf, pin in (("ours ", ours_pdf, pin_for(pins, stem, k, t1, t2)),
                                ("ctl   ", ctl_pdf, None)):
            if not pdf or not os.path.isfile(pdf):
                lines.append("%s  NO PAGE" % label)
                continue
            for line in rel(read(pdf, t1, t2, pin)):
                lines.append("%s  %s" % (label, line))
    text = "\n".join(lines) + "\n"
    io.open(out_path, "w", encoding="utf-8").write(text)
    print(text)
    for name in os.listdir(g.TMP):
        if name.startswith("m100i_"):
            os.remove(os.path.join(g.TMP, name))
    return 0


if __name__ == "__main__":
    sys.exit(main())
