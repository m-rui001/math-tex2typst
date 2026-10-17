r"""Products-side closure for #78: do the nine papers that write a page share in `text width=`
carry a `width:` on their boxes, is that width the author's share of the column, and does any
`\\linewidth` name leak onto the page?

The converter-side spy (`_work/probe78_relwidth_face.py`) can only say the emitter was handed a
number; this reads the shipped `main.typ` and asks whether the number reached it, and whether it is
`share x line_cm` -- the value `cetz.expand_linewidth` folds the share into.  A `width:` that is
present but not this number would be a different bug wearing this row's clothes.
"""
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")
from t2t import cetz, convert, prep  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")

KEY = re.compile(r"text width\s*=\s*([-+]?\d*\.?\d*)\s*"
                 r"\\(?:linewidth|textwidth|columnwidth)")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
BOX = re.compile(r"#box\(([^)]*)")
WCM = re.compile(r"width:\s*([0-9.]+)cm")
SHARE = re.compile(r"\\(?:linewidth|textwidth|columnwidth)")

bad = 0
missed = 0
for path in sorted(os.listdir(FLAT)):
    if not path.endswith(".tex"):
        continue
    stem = path[:-4]
    text = open(os.path.join(FLAT, path), encoding="utf-8", errors="replace").read()
    pics = PIC.findall(text)
    shares = [m.group(1) for pic in pics for m in KEY.finditer(pic)]
    if not shares:
        continue
    main = os.path.join(ROOT, "typst", stem, "main.typ")
    if not os.path.exists(main):
        print("%-46s %2d sites  NO PRODUCT" % (stem[:46], len(shares)))
        bad += 1
        continue
    prod = open(main, encoding="utf-8", errors="replace").read()
    boxes = BOX.findall(prod)
    withw = sum(1 for b in boxes if "width:" in b)
    leak = len(SHARE.findall(prod))
    canvas = prod.count("#cetz.canvas(")
    # What the fold actually produced, per picture, on the batch's own basis: inside a minipage the
    # author's `\linewidth` is the minipage, not the column (`prep.scale_linewidth_in_minipages`), so
    # a document-level `share x line_cm` expectation is the wrong number for those sites.
    pre_text, body = prep.split_document(text)
    p = prep.parse_preamble(pre_text)
    body = prep.scale_linewidth_in_minipages(body)
    body = prep.unwrap_boxes(body)
    pics = convert.lifted_pictures(body)
    scopes = convert.picture_scopes(body, p.macros)
    axis = convert.line_cm(p)
    folded = []
    for k, m in enumerate(pics):
        table, decls = scopes[k]
        pic = convert.with_declarations(m.group(0), decls) if decls else m.group(0)
        core = cetz.expand_linewidth(cetz.strip_envelope(
            prep.expand_macros(pic, table)), axis)
        folded += [float(v) for v in re.findall(
            r"text width\s*=\s*([0-9]+\.[0-9]+)cm", core)]
    # Typst's `box(width:)` is the border box (measured: declared 6cm with inset x 1cm draws 6.0000cm),
    # so the paragraph inside is `width - 2 * inset` and that is the number to compare with.
    pairs = []
    for w, ins in re.findall(r"#box\(width: ([0-9.]+)cm, inset: "
                             r"(?:\(x: )?([0-9.]+)cm", prod):
        pairs.append(float(w) - 2 * float(ins))
    want = [any(abs(c - f) < 0.006 for c in pairs) for f in folded]
    missed += want.count(False)
    print("%-46s %2d sites  folded=%3d  canvas=%3d  #box(=%3d with width:=%3d  leak=%d  "
          "content widths matched %d/%d (axis %.3fcm)"
          % (stem[:46], len(shares), len(folded), canvas, len(boxes), withw, leak,
             sum(want), len(want), axis))
    bad += bool(leak)
print("papers whose product still carries a page-share macro: %d" % bad)
print("sites whose share x column width is NOT on the page: %d" % missed)

