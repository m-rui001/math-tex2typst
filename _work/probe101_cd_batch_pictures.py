r"""The base a rebuild has to be fed: the picture as the converter actually draws it.

`probe95` read 124 exchange-diagram canvases twice -- the page's own canvas and a rebuild -- and
called five of them worse.  The rebuild was fed `_work/flat/<paper>.tex` straight from
`cetz.PICTURE_ENV`, and that is not what the converter draws: a picture reaches `cetz` after
`prep.expand_macros`, so the author's own `\newcommand`s are already in their expanded shape.  For
`The-height-three-chromatic-overlap…#1` the flat source still holds `R\Gamma_{\hthreects}(H,M_{B,C})`
with `\newcommand{\hthreects}{\mathrm{cts}}` in the preamble, while the drawn cell reads
`R\Gamma_{\mathrm{cts}}(...)`.  Rebuilt from the raw source, texmath set the unknown control word as
its own name -- nine letters where the author drew three -- the cell grew from 65pt of ink to 97pt,
and it touched its neighbour.  The collision was the probe's, not the page's.

This is the #78 lesson in a new costume: the string fed to a gauge must be the one the emitter sees.
(`probe100`, which counted macro names printed by name, was measured on the same wrong base; its
`cts`-and-`Z` rows are the expansion, not a leak.)

`batch(stem)` replays that one step -- the whole file's definition table, because these preprints
declare their macros before `split_document` cuts, and a per-figure `\begingroup` scope would need
`picture_scopes` to matter for a `tikzcd`, which none of the 124 carries.  The check is the face
itself: rebuild every cd canvas from the expanded string and compare the `content()` bodies with the
product's.  Bodies equal means the two versions differ only by this round's geometry, which is what a
before/after gauge asks for.

  python _work/probe101_cd_batch_pictures.py
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, WORK)
sys.path.insert(0, os.path.join(ROOT, "tools"))
import probe81_label_box_face as g  # noqa: E402
from t2t import cetz, convert, macros, prep  # noqa: E402

FLAT = os.path.join(WORK, "flat")
CD = re.compile(r"\\begin\{(tikzcd|CD)\}")
COORD = re.compile(r"content\(\((-?[\d.]+), (-?[\d.]+)\), \[(.*)\]\)")
# #88's label shell: a product written before it carries the bare maths, so the two versions of one
# canvas are the same drawing only once the wrapper is off
SHELL = re.compile(r"^\#text\(size: [0-9.]+em\)\[(.*)\]$", re.S)
CACHE = {}


def batch(stem):
    """The picture strings the converter draws, in canvas order, plus its style table."""
    if stem not in CACHE:
        CACHE[stem] = lift(stem)
    return CACHE[stem]


def lift(stem):
    paths = glob.glob(os.path.join(FLAT, stem + "*.tex"))
    if not paths:
        return [], None
    src = open(paths[0], encoding="utf-8", errors="replace").read()
    table = macros.parse_definitions(src)[0]
    pre, _body = prep.split_document(src)
    p = prep.parse_preamble(pre)
    pics = [prep.expand_macros(m.group(0), table) for m in cetz.PICTURE_ENV.finditer(src)]
    return pics, p


def bodies(canvas):
    """The `content()` bodies as drawn -- the part of a canvas that is not geometry."""
    return [SHELL.sub(r"\1", text) if text.startswith("#text(size:") else text
            for _, _, text in COORD.findall(canvas or "")]


def main():
    canv = g.canvases()
    stem = "The-height-three-chromatic-overlap-an-explicit-filtration-and-its-attachments-September-27-2026"
    pics, p = batch(stem)
    print("self-test on the canvas probe95 called worse:")
    print("  pictures in the flat source: %d (the product carries %d canvases)"
          % (len(pics), sum(1 for k in canv if k[0] == stem)))
    rebuilt = cetz.convert(pics[1], p.colors, convert.line_cm(p), refs=None)
    prod = canv[(stem, 1)][1]
    print("  product bodies : %s" % " | ".join(dict.fromkeys(bodies(prod))))
    print("  rebuilt bodies: %s" % " | ".join(dict.fromkeys(bodies(rebuilt))))
    print("  bodies identical: %s" % (bodies(prod) == bodies(rebuilt)))
    for name, canvas in (("product", prod), ("rebuilt", rebuilt)):
        anchors = [(x, y) for x, y, _ in COORD.findall(canvas)]
        print("  %-7s anchors: %s" % (name, " ".join("(%s, %s)" % t for t in anchors)))

    face = built = 0
    diff = []
    for (s, k), (_head, block) in sorted(canv.items()):
        pics, p = batch(s)
        if k >= len(pics) or not CD.match(pics[k]):
            continue
        face += 1
        got = cetz.convert(pics[k], p.colors, convert.line_cm(p), refs=None)
        if not got:
            diff.append((s, k, "refused"))
        elif bodies(got) != bodies(block):
            a, b = bodies(block), bodies(got)
            j = next(i for i, (x, y) in enumerate(zip(a, b)) if x != y) \
                if len(a) == len(b) else -1
            diff.append((s, k, "bodies differ: %d vs %d drawn, first at %s%s"
                         % (len(a), len(b), j,
                            "" if j < 0 else "\n      page    %s\n      rebuild %s"
                            % (a[j][:150], b[j][:150]))))
        else:
            built += 1
    print("\ncd canvases on the pages: %d" % face)
    print("  rebuilt to the same maths: %d   differing: %d" % (built, len(diff)))
    for s, k, why in diff[:10]:
        print("    %-50s#%d %s" % (s[:50], k, why))
    return 0


if __name__ == "__main__":
    sys.exit(main())
