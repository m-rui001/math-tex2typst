r"""How many bent edges carry a label, and where that label lands today.

TikZ puts a node written on `to[bend left]` at the middle of the CURVE; a chord midpoint is a
different point, so the first thing to measure is the size of the family before any rule is written:
which pictures bend an edge, which of those edges have a node on them, and whether the converter
emits a placement at all.
"""
import glob
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))

from t2t import convert, prep, cetz as cetzmod  # noqa: E402

BEND = re.compile(r"\b(?:to|edge)\s*\[[^\]]*\bbend\b[^\]]*\]")
EDGE_NODE = re.compile(r"\b(?:to|edge)\s*\[[^\]]*\bbend\b[^\]]*\]\s*node\s*(\[[^\]]*\])?\s*\{")


def main():
    pics_bend, pics_labelled, papers, examples = 0, 0, set(), []
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(path)[:-4]
        src = open(path, encoding="utf-8", errors="replace").read()
        pre_text, body = prep.split_document(src)
        p = prep.parse_preamble(pre_text)
        body = prep.scale_linewidth_in_minipages(body)
        body = prep.unwrap_boxes(body)
        for i, pic in enumerate(convert.TIKZ_SPAN.findall(body)):
            if not BEND.search(pic):
                continue
            pics_bend += 1
            hit = EDGE_NODE.search(pic)
            if not hit:
                continue
            pics_labelled += 1
            papers.add(stem)
            if len(examples) < 10:
                examples.append((stem, i + 1, pic[max(0, hit.start() - 60):hit.end() + 40]))
    print("pictures that bend: %d   of which a node sits on the bent edge: %d   papers: %d"
          % (pics_bend, pics_labelled, len(papers)))
    for stem, idx, snip in examples:
        print("\n%s pic %d\n  %s" % (stem[:44], idx, " ".join(snip.split())[:180]))


if __name__ == "__main__":
    main()
