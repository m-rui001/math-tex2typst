r"""Why does a long CD/tikzcd arrow label land on a cell in our render but not on the author's page?

The verified on-ink face (`probe85b` over `control87c_rows.json`) has 11 rows living in exchange
diagrams. Each row is two pieces of ink that touch on our canvas page; the pdflatex control of the
same source diagram draws them apart. Axis 62 already settled one candidate before this round:
tikz-cd does NOT push a column out for a long label (four label lengths, one 1.833cm cell-centre
distance), so `cd_columns` is not the law we are breaking. What is left is where the label's ink
sits and how big it is:

  size      does the real page set arrow labels smaller than cells? amscd's own arrow labels are
            `\scriptstyle`, and our emitter has no such rule -- every `content()` gets the body size
  clearance the signed gap between the two boxes, on both pages, for the very pair that collides
  reach     how far the label's ink extends past the lane it lives in (x) and past its shaft (y)

Both sides are read the same way: our canvas re-rendered standalone by typst, the source diagram at
the canvas's own index re-rendered standalone by pdflatex, every text span with its font size and
page box. Coordinates are fitz's, y from the top of the page, so a positive `clearance` means the
boxes are apart and a negative one is the overlap depth.

  python _work/probe88_cd_label_law.py
"""
import os
import re
import sys
import unicodedata

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, WORK)
import probe81_label_box_face as g  # noqa: E402
import probe84_control_face as C  # noqa: E402
import probe87_onink_mechanism as M  # noqa: E402
import probe87b_control_identity as I  # noqa: E402
import compare_figure  # noqa: E402

CD_ENVS = ("tikzcd", "CD")


def plain(text):
    """A span's letters as the census spells them: NFKD folds the math alphanumerics to ASCII."""
    return re.sub(r"\s+", "", unicodedata.normalize("NFKD", text))


def spans(pdf):
    """Every text span the page puts down: (normalised text, size in pt, box)."""
    doc = fitz.open(pdf)
    out = []
    for b in doc[0].get_text("dict")["blocks"]:
        for line in b.get("lines", []):
            for s in line["spans"]:
                text = plain(s["text"])
                if text:
                    out.append((text, round(s["size"], 2), fitz.Rect(s["bbox"])))
    doc.close()
    return out


def find(page, text):
    """The span for a census text: ours merges and splits spans, so fall back to containment."""
    for got, size, box in page:
        if got == text:
            return size, box
    for got, size, box in page:
        if text and (text in got or got in text):
            return size, box
    return None, None


def clearance(a, b):
    """Signed gap between two boxes: negative on the axis where they overlap."""
    dx = max(a.x0 - b.x1, b.x0 - a.x1)
    dy = max(a.y0 - b.y1, b.y0 - a.y1)
    return dx, dy


def label_texts(pic):
    r"""The strings the source hangs on an arrow: `@>{...}>>`, `@V{...}VV`, `\arrow[...,"..."]`."""
    out = set()
    for m in re.finditer(r"@[<>=VA|.]*\{((?:[^{}]|\{[^{}]*\})*)\}", pic):
        out.add(plain(m.group(1)))
    for m in re.finditer(r"\\arrow\[[^\]]*\"([^\"]*)\"", pic):
        out.add(plain(m.group(1)))
    return {t for t in out if t}


def one(key, rows):
    stem, k = key
    head, block = g.canvases()[key]
    path, pics = C.pictures(stem)
    pic = pics[k]
    size = C.body_size(head)
    ctl_pdf, _ = compare_figure.control(path, k, [], size)
    ours = g.render(block, "88", head)
    if not ours or ctl_pdf is None:
        print("\n=== %s#%d  refused (ours=%s control=%s)"
              % (stem[:46], k, bool(ours), ctl_pdf is not None))
        return []
    our_page, ctl_page = spans(ours[2]), spans(ctl_pdf)
    labels = label_texts(pic)
    print("\n=== %s#%d  env=%s  size=%s  %d rows" % (stem[:46], k, I.env_of(pic), size, len(rows)))
    print("  source: %s" % re.sub(r"\s+", " ", pic)[:220])
    print("  ours   : %s" % "  ".join("%r/%.1f" % (t[:14], s) for t, s, _ in our_page))
    print("  control: %s" % "  ".join("%r/%.1f" % (t[:14], s) for t, s, _ in ctl_page))
    out = []
    for depth, _dx, _dy, t1, t2, _window in rows:
        s1, r1 = find(our_page, plain(t1))
        s2, r2 = find(our_page, plain(t2))
        if not (r1 and r2):
            print("   %5.2f  %-18r x %-18r  our spans not re-found" % (depth, t1[:18], t2[:18]))
            continue
        c1, c2 = find(ctl_page, plain(t1)), find(ctl_page, plain(t2))
        ox, oy = clearance(r1, r2)
        line = ("   %5.2f  %-18r x %-18r  ours: x%+.2f y%+.2f  sizes %.1f/%.1f"
                % (depth, t1[:18], t2[:18], ox, oy, s1, s2))
        cx = cy = None
        if c1[1] and c2[1]:
            cx, cy = clearance(c1[1], c2[1])
            line += "   control: x%+.2f y%+.2f  sizes %.1f/%.1f" % (cx, cy, c1[0], c2[0])
        print(line)
        out.append((stem, k, depth,
                    any(plain(t) in lab for t in (t1, t2) for lab in labels),
                    (ox, oy), (cx, cy) if c1[1] and c2[1] else None,
                    (s1, s2), (c1[0], c2[0])))
    return out


def main():
    face = {(s, k): v for (s, k), v in M.face_canvases().items()}
    rows = []
    for key in sorted(face, key=lambda x: -max(t[0] for t in face[x])):
        path, pics = C.pictures(key[0])
        if pics and key[1] < len(pics) and I.env_of(pics[key[1]]) in CD_ENVS:
            rows += one(key, face[key])
    apart = [r for r in rows if r[4] and r[5]]
    print("\ntally: %d rows read on both pages" % len(apart))
    for r in apart:
        print("  %-46s#%-2d %5.2f ours y%+.2f control y%+.2f  label=%s  sizes ours %s ctl %s"
              % (r[0][:46], r[1], r[2], r[4][1], r[5][1], r[3], r[6], r[7]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
