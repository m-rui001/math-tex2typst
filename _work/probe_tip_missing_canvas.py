"""Where did the declaring canvases of these five papers go?

``probe_tip_named_split.py`` builds every tikzpicture in isolation and compares the count against the
canvases carrying a named head in the emitted ``main.typ``. Five papers come up short. This prints,
for one named paper, each declaring picture's source, whether ``cetz.build`` returns, whether the
converter's own gate accepts it (``cetz.compiles``), and what the product did with it -- a canvas, a
quoted ``raw`` LaTeX block, or nothing at all.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
sys.path.insert(0, str(ROOT / "_work"))
from t2t import cetz  # noqa: E402
from probe_tip_product import SYMBOL, canvases  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
GE = re.compile(r">=\s*(?:\{\s*[A-Za-z]+\s*\}|[A-Za-z]+)")
RAW = re.compile(r"#raw\(block: true, lang: \"latex\"")


def main():
    stem = sys.argv[1]
    src = (ROOT / "_work" / "flat" / (stem + ".tex")).read_text(encoding="utf-8", errors="replace")
    typ = (ROOT / "typst" / stem / "main.typ").read_text(encoding="utf-8", errors="replace")
    print("product canvases: %d   named: %d   quoted latex blocks: %d"
          % (len(canvases(typ)),
             sum(1 for b in canvases(typ) if any("mark:" in l and SYMBOL.search(l) for l in b)),
             len(RAW.findall(typ))))
    pics = PIC.findall(src)
    print("source pictures: %d" % len(pics))
    for i, pic in enumerate(pics):
        if not GE.search(pic):
            continue
        built = cetz.build(pic)
        head = (pic.splitlines()[0] or "")[:100]
        print("--- declaring picture %d: %s" % (i, head))
        print("    build: %s   compiles: %s" % ("yes" if built else "None",
                                                cetz.compiles(pic) if built else "n/a"))
        for v in GE.findall(pic):
            print("    `>=` value: %s -> arrow_default %r" % (v, cetz.arrow_default(v[0] or v[1])))
    return 0


if __name__ == "__main__":
    sys.exit(main())
