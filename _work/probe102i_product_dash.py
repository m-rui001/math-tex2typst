r"""#102i: the dash as the PRODUCT spells it -- what run151 put on the pages.

The emitter-face gauge (`probe102c`) counts statements the option dict carried; this counts what the
products actually send, over `typst/*/*.typ` (the same tree `residue.py` and `summarize_typst.py`
read -- `preprints/*/typst/` is an old copy no gauge reads).  Expected: the six names and the length
lists appear, and the count per name reconciles with the 707 tokens the stub diff said the fix adds.

  PYTHONIOENCODING=utf-8 python _work/probe102i_product_dash.py
"""
import collections
import io
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
PROD = os.path.join(ROOT, "typst")
OUT = os.path.join(HERE, "label102i_product_dash.txt")
DASH = re.compile(r"dash: (\"[^\"]*\"|\((?:[^()]|\([^()]*\))*\))")


def main():
    sys.stdout.reconfigure(errors="replace")
    names = collections.Counter()
    papers = collections.defaultdict(set)
    canvases = collections.Counter()
    docs = drawn = 0
    for stem in sorted(os.listdir(PROD)):
        path = os.path.join(PROD, stem, "main.typ")
        if not os.path.isfile(path):
            continue
        docs += 1
        text = io.open(path, encoding="utf-8", errors="replace").read()
        drawn += text.count("#cetz.canvas(")
        tokens = DASH.findall(text)
        canvas_at = []
        for m in DASH.finditer(text):
            # which canvas this token sits in: the last `#cetz.canvas(` before it
            canvas_at.append(text.rfind("#cetz.canvas(", 0, m.start()))
        for value, at in zip(tokens, canvas_at):
            names[value] += 1
            papers[value].add(stem)
            canvases[(stem, at)] += 1
    lines = ["dash tokens as the products of run151 spell them",
             "documents read: %d   canvases on the page: %d" % (docs, drawn),
             ""]
    for value, count in names.most_common():
        lines.append("%-28s %5d tokens  %4d papers" % (value, count, len(papers[value])))
    lines.append("")
    lines.append("TOTAL %d tokens over %d canvases in %d papers"
                 % (sum(names.values()), len(canvases),
                    len({p for v in papers.values() for p in v})))
    text_out = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text_out)
    print(text_out)
    return 0


if __name__ == "__main__":
    sys.exit(main())
