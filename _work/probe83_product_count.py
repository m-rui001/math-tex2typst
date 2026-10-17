r"""Count pandoc's Typst-writer spacing tokens over the whole product population.

The product root is `E:\math\typst\<paper>\`, the same one `_work/residue.py`,
`_work/probe_canvas_population.py` and `tools/summarize_typst.py` read -- 724 of them, the 719 in
`_work/manifest.json` plus the five `batch_typst.py` adds on its own (`-alternate-N`, `standalone-*`).
`preprints/<paper>/typst/` is a second copy that the gauges never look at, so a "this string should be
gone from the products" closing that reads it is measuring the wrong tree.

  python _work/probe83_product_count.py [token ...]
"""
import glob
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

TOKENS = ["#h(-1em)", "#h(-0.16667em)", "#h(0em)", "thin", "med"]


def population():
    return sorted(glob.glob(os.path.join(ROOT, "typst", "*", "*.typ")))


def main():
    tokens = sys.argv[1:] or TOKENS
    files = population()
    print("population = %d .typ over %d papers"
          % (len(files), len({os.path.basename(os.path.dirname(p)) for p in files})))
    for token in tokens:
        hits = 0
        stems = set()
        for path in files:
            text = open(path, encoding="utf-8").read()
            n = text.count(token)
            if n:
                hits += n
                stems.add(os.path.basename(os.path.dirname(path)))
        print("%-18s %7d occurrences  %4d papers" % (token, hits, len(stems)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
