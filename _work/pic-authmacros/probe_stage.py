import sys, re, io
sys.path.insert(0, "_work/pic-authmacros")
out = io.open("_work/pic-authmacros/_probe_out.txt", "w", encoding="utf-8")
def P(*a):
    out.write(" ".join(str(x) for x in a) + "\n")

from t2t import cetz, convert, prep, macros

FLAT = "_work/flat/"
papers = [
    "Cylinder-amplitudes-and-logarithmic-bridge-length-windows-on-the-honeycomb-lattice-September-26-2026",
    "Gaussian-free-field-limits-of-weighted-integer-Lipschitz-heights-September-25-2026",
    "Polynomial-PEPS-approximation-of-gapped-square-grid-ground-states-September-24-2026",
]
TARGET = ("FiniteSquare", "pinsgroup", "geometryrow")

for name in papers:
    src = open(FLAT + name + ".tex", encoding="utf-8").read()
    pre_text, body = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    P("=====", name)
    for tok in TARGET:
        i = src.find("\\newcommand{\\%s}" % tok)
        b = src.find("\\begin{document}")
        P("  \\%s: newcommand at %d vs \\begin{document} at %d -> %s" %
          (tok, i, b, "PREAMBLE" if 0 <= i < b else "BODY"))
    P("  preamble macros:", len(p.macros), sorted(p.macros)[:6])
    P("  preamble colors:", p.colors)

    # the picture that carries our target macro
    pics = re.findall(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", body, re.S)
    cm = convert.line_cm(p)
    P("  pictures:", len(pics), "line_cm:", cm)
    for k, pic in enumerate(pics):
        if not any(t in pic for t in TARGET):
            continue
        P("  --- picture %d, raw len %d" % (k, len(pic)))
        core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", pic), cm)
        P("     preamble-table build ->", "OK" if cetz.build(core, p.colors, cm) else "None")
        # with the whole body parsed for definitions
        btab, bskip = macros.parse_definitions(body)
        merged = dict(p.macros); merged.update(btab)
        P("     body defs parsed:", len(btab), "skipped:", len(bskip))
        exp = prep.expand_macros(pic, merged)
        for t in TARGET:
            P("       still has \\%s? %s" % (t, ("\\" + t) in exp))
        core2 = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", exp), cm)
        canvas = cetz.build(core2, p.colors, cm)
        P("     merged-table build ->", "OK len %d" % len(canvas) if canvas else "None")
        if canvas:
            P(canvas[:1500])
        P("     unsupported left in core2:",
          set(re.findall(cetz.UNSUPPORTED, core2)),
          "| statements still unknown:",
          re.findall(r"\\[a-zA-Z]+", core2)[:40])
out.close()
print(open("_work/pic-authmacros/_probe_out.txt", encoding="utf-8").read())
