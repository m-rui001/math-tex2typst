import sys, re, io
sys.path.insert(0, "_work/pic-authmacros")
out = io.open("_work/pic-authmacros/_probe_out.txt", "w", encoding="utf-8")
def P(*a):
    out.write(" ".join(str(x) for x in a) + "\n")

from t2t import cetz, convert, prep, macros

FLAT = "_work/flat/"
papers = {
 "cyl": "Cylinder-amplitudes-and-logarithmic-bridge-length-windows-on-the-honeycomb-lattice-September-26-2026",
 "gff": "Gaussian-free-field-limits-of-weighted-integer-Lipschitz-heights-September-25-2026",
 "peps": "Polynomial-PEPS-approximation-of-gapped-square-grid-ground-states-September-24-2026",
}
for tag, name in papers.items():
    src = open(FLAT + name + ".tex", encoding="utf-8").read()
    pre_text, body = prep.split_document(src)
    P("=====", tag)
    tab, skipped = macros.parse_definitions(body)
    P("  parsed:", sorted(tab))
    for s in skipped:
        P("  SKIPPED:", s)
    # the same for just the figure block around the picture
    i = src.find("\\begin{tikzpicture}")
    block = src[max(0, i - 1400):i]
    tab2, sk2 = macros.parse_definitions(block)
    P("  block parsed:", sorted(tab2), "block skipped:", sk2)
    for k, v in tab2.items():
        P("     ", k, "nargs", v.nargs, "opt", v.opt, "kind", v.kind, "body:", repr(v.body[:120]))
out.close()
print(open("_work/pic-authmacros/_probe_out.txt", encoding="utf-8").read())
