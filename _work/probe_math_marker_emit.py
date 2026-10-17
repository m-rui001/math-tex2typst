r"""What does the emitter do with a picture marker that pandoc parked inside a Math node?

`convert_paper` lifts every `tikzpicture` out of the body as ` ZQT2TTIKZ<n> ` before pandoc runs and
puts the drawing back by a string replace on the emitted Typst.  For three of the Grothendieck
pictures the marker reaches pandoc inside a display equation, and the product has neither the marker
nor a canvas - so somewhere between the AST and the emitted lines the marker is dropped, and the
later replace has nothing to replace.  This runs the same steps up to `emit_document` and prints the
lines that carry the markers, plus what the maths converter answered for them.
"""
import json
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import prep, emit, mathconv, convert  # noqa: E402

STEM = sys.argv[1] if len(sys.argv) > 1 else \
    "The-Grothendieck-homotopy-hypothesis-via-elementary-expansions-September-24-2026"
JSON = os.path.join(ROOT, "_work", "flat", "_work_tex", STEM + ".json")
FLAT = os.path.join(ROOT, "_work", "flat", STEM + ".tex")


def main():
    ast = json.load(open(JSON, encoding="utf-8"))
    pre_text = open(FLAT, encoding="utf-8", errors="replace").read().split("\\begin{document}")[0]
    p = prep.parse_preamble(pre_text)
    p.aux_labels = {}
    p.label_aliases = {}
    p.bib_keys = set()
    p.baked_bib = True
    stats = emit.Stats()
    book = emit.Book(p, stats)
    latex_map = {}
    em = emit.Emitter(book, latex_map)
    formulas = convert.formula_list(ast)
    print("formulas collected: %d" % len(formulas))
    for tex in formulas:
        if "ZQT2TTIKZ" in tex:
            print("  formula carrying a marker: %r" % tex[:150])
    converted, refused, math_err = mathconv.convert_formulas(formulas, book.math_refs())
    for idx, tex in enumerate(formulas):
        latex_map[tex] = converted.get(idx)
        if "ZQT2TTIKZ" in tex:
            print("marker formula %d: mathconv answer=%r" % (idx, converted.get(idx)))
    em.dry = True
    em.emit_document(ast["blocks"])
    em.out = []
    em.dry = False
    lines = em.emit_document(ast["blocks"])
    print("emitted lines: %d ; lines carrying a marker: %d"
          % (len(lines), sum("ZQT2TTIKZ" in l for l in lines)))
    for n, l in enumerate(lines):
        if "ZQT2TTIKZ" in l:
            print("  line %d: %s" % (n, l.strip()[:180]))
    for n, l in enumerate(lines):
        if "pushout square" in l or "cylinder-skeletal" in l:
            print("--- window at line %d" % n)
            for w in lines[max(0, n - 1):n + 5]:
                print("    %s" % w.strip()[:170])
    print("stats: %s" % (stats.counters if hasattr(stats, "counters") else stats,))


if __name__ == "__main__":
    main()
