r"""Why does the static build refuse the pictures the batch still converts?

`_work/probe_box_body_gap.py` found 6 papers whose products carry #63's body set while a static
`cetz.build` of their `_work/flat` picture returns None.  `cetz.build(pic)` is called without
`line_cm`, so any picture whose axes or node boxes are sized as a fraction of the column
(`x=.98\linewidth`, `text width=.37\textwidth`) is unreadable there and refuses -- the batch passes
the page's own column width and converts it.  This reads that off each picture's source.
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
STEMS = sorted(set(open(os.path.join(ROOT, "_work", "regen_needed.txt"),
                        encoding="utf-8").read().split())
               - set(open(os.path.join(ROOT, "_work", "box_body_churn_list.txt"),
                          encoding="utf-8").read().split()))


def main():
    for stem in STEMS:
        src = glob.glob(os.path.join(FLAT, stem + "*.tex"))
        print("== %s" % stem[:55])
        if not src:
            print("   no flat source")
            continue
        text = open(src[0], encoding="utf-8", errors="replace").read()
        for k, pic in enumerate(PIC.findall(text), 1):
            bare = cetz.build(pic)
            widened = cetz.build(pic, line_cm=17.0)
            macro = re.findall(r"[\d.]*\\(?:linewidth|textwidth|columnwidth)", pic)
            print("   pic %d  no line_cm=%s  line_cm=17cm=%s  page macros: %s"
                  % (k, "built" if bare else "None", "built" if widened else "None",
                     ", ".join(sorted(set(macro)))[:90] or "none"))
            if bare is None and widened is None:
                print("        " + pic.replace("\n", "\n        ")[:1200])


if __name__ == "__main__":
    main()
