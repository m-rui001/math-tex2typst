r"""#96 corroboration: does the corpus's `\\frac` population line up with the product's bare slashes?

`_work/probe96_attrib.py` settled the spelling law on the pipeline's own pandoc: a **simple** `\\frac{a}{b}`
(including `\\frac12`, `\\dfrac`, `\\tfrac`) is written **bare** as `a / b`, a **complex** one is written as the
Typst call `frac(a, b)`, and a slash the author typed is escaped (`G \\/ P`).  So the product's bare slashes
should be exactly the linearized fracs -- count both sides over the corpus and compare:

  A  `\\frac` / `\\dfrac` / `\\tfrac` / `\\cfrac` in the flat sources, and how many of them have a braced
     numerator+denominator pair that is "simple" by pandoc's own behaviour (one token each, no nested brace);
  B  bare `/` in the product's body maths (the same walker as #93, `$` delimiters excluded from the run);
  C  the `1 \\over 2` construct, which pandoc answers with `$1 \\\\over 2\\$` -- an unconverted control word
     plus an escaped dollar -- counted in the sources so the size of that side-find is known.

  python _work/probe96_counts.py > _work/m96_counts.txt
"""
import glob
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from probe93_product_scan import canvases  # one canvas walker, #93's
from probe96_face import read_off          # one denominator-scope reader, #96's

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MATH = re.compile(r"\$[^$\n]+\$")
FRAC = re.compile(r"\\([dtc]?frac)\s*\{")
OVER = re.compile(r"\\over\b")
# pandoc keeps a frac stacked only when a group is more than one token; "simple" here = one atom each side
SIMPLE = re.compile(r"\\[dtc]?frac\s*\{\s*([^{}]{1,3}?)\s*\}\s*\{\s*([^{}]{1,3}?)\s*\}")


def main():
    src_frac = src_simple = src_over = 0
    src_papers = set()
    over_papers = set()
    for f in glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex")):
        t = open(f, encoding="utf-8", errors="replace").read()
        n = len(FRAC.findall(t))
        src_frac += n
        src_simple += len(SIMPLE.findall(t))
        if n:
            src_papers.add(os.path.basename(f)[:-4])
        o = len(OVER.findall(t))
        src_over += o
        if o:
            over_papers.add(os.path.basename(f)[:-4])
    print("A  sources: `\\frac`-family %d sites over %d papers ; of those, one-atom-on-each-side %d"
          % (src_frac, len(src_papers), src_simple))
    print("C  sources: `1 \\over 2` construct %d sites over %d papers" % (src_over, len(over_papers)))

    sites = 0
    papers = set()
    faithful = runaway = 0
    rel_runaway = 0
    for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        paper = os.path.basename(os.path.dirname(path))
        text = open(path, encoding="utf-8", errors="replace").read()
        body_text = text
        for c in canvases(text):
            body_text = body_text.replace(c, " ", 1)
        for span in MATH.findall(body_text):
            inner = span.strip("$")
            masked = re.sub(r'"[^"\n]*"', lambda m: " " * len(m.group(0)), inner)
            for m in re.finditer(r"(?<!\\)/", masked):
                sites += 1
                papers.add(paper)
                _num, _den, rest, _spaced = read_off(masked, m.start())
                if not rest:
                    faithful += 1
                else:
                    runaway += 1
                    if re.match(r"(lt\.eq|gt\.eq|eq\.|neq|<|>|=|,|\.)", rest):
                        rel_runaway += 1
    print("B  products: bare `/` in body maths %d sites over %d papers ; "
          "denominator is the last thing in the span %d ; run continues %d (of which the run starts with a "
          "relation/comma/period %d)" % (sites, len(papers), faithful, runaway, rel_runaway))
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
