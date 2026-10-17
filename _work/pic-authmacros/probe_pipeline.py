"""Run the production picture path for the three author-macro papers and dump the canvases.

cetz.build is used instead of cetz.convert because the compile gate calls the typst binary, which
this task must not invoke.
"""
import sys, re, io
sys.path.insert(0, "_work/pic-authmacros")
from t2t import cetz, convert, prep

FLAT = "_work/flat/"
PAPERS = {
    "cylinder": ("Cylinder-amplitudes-and-logarithmic-bridge-length-windows-on-the-honeycomb-lattice-September-26-2026",
                 "FiniteSquare"),
    "gff": ("Gaussian-free-field-limits-of-weighted-integer-Lipschitz-heights-September-25-2026",
            "pinsgroup"),
    "peps": ("Polynomial-PEPS-approximation-of-gapped-square-grid-ground-states-September-24-2026",
             "geometryrow"),
}

for tag, (name, marker) in PAPERS.items():
    src = open(FLAT + name + ".tex", encoding="utf-8").read()
    pre_text, body = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    body = prep.unwrap_boxes(body)
    scopes = convert.picture_scopes(body, p.macros)
    pics = [m.group(0) for m in convert.TIKZ_SPAN.finditer(body)]
    print("=====", tag, "pictures:", len(pics), "scopes:", len(scopes))
    for i, pic in enumerate(pics):
        if marker not in pic:
            continue
        table, decls = scopes[i]
        text = convert.with_declarations(pic, decls) if decls else pic
        print("  decls folded:", repr(decls[:60]), "...")
        print("  scope has \\%s: %s" % (marker, ("\\" + marker) in table))
        core = prep.expand_macros(text, table)
        print("  marker survives expansion:", ("\\" + marker) in core)
        cm = convert.line_cm(p)
        canvas = cetz.build(core, p.colors, cm)
        print("  build:", "None" if canvas is None else "%d lines" % len(canvas.splitlines()))
        if canvas:
            io.open("_work/pic-authmacros/canvas_%s.typ" % tag, "w",
                    encoding="utf-8").write(cetz.HEADER + canvas + "\n")
