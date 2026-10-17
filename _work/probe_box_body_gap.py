r"""#63's two populations disagree by 6 papers -- read the difference off the source statements.

`_work/probe_box_body_churn.py` rebuilds every picture of `_work/flat/*.tex` with a static
`cetz.build`; the rebuild list came from the products (`typst/*/main.typ`), which the batch writes
after it has expanded macros, picture scopes and `\linewidth`.  A paper can therefore be untouched by
the static diff and still carry a body the fix rewrites.  This prints, per paper, the static verdict
plus the product's own `#box` lines and the tikz source line they came from, so the 6-paper gap is a
set of sentences and not a paragraph of accounting.
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
TYPST = os.path.join(ROOT, "typst")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
BOX_LINE = re.compile(r"^\s*content\(.*#box\(.*top-edge: \"cap-height\"")


def old_box_body(text, align, horizon=False):
    if horizon:
        return "[#set text(hyphenate: false); #align(%s + horizon)[%s]]" % (align or "left", text)
    inner = "#align(%s)[%s]" % (align, text) if align else text
    return "[#set text(hyphenate: false); %s]" % inner


def main():
    churned = set(open(os.path.join(ROOT, "_work", "box_body_churn_list.txt"),
                       encoding="utf-8").read().split())
    wanted = sorted(set(open(os.path.join(ROOT, "_work", "regen_needed.txt"),
                             encoding="utf-8").read().split()) - churned)
    new = cetz._box_body
    for stem in wanted:
        src = glob.glob(os.path.join(FLAT, stem + "*.tex"))
        typ = glob.glob(os.path.join(TYPST, stem + "*", "main.typ"))
        print("== %s" % stem[:60])
        if not src or not typ:
            print("   flat %d / typst %d" % (len(src), len(typ)))
            continue
        text = open(src[0], encoding="utf-8", errors="replace").read()
        pics = PIC.findall(text)
        static, refused = 0, []
        for k, pic in enumerate(pics, 1):
            cetz._box_body = new
            now = cetz.build(pic)
            cetz._box_body = old_box_body
            was = cetz.build(pic)
            if now is None or was is None:
                refused.append(k)
            static += was != now
        cetz._box_body = new
        body = open(typ[0], encoding="utf-8", errors="replace").read().splitlines()
        lines = [l for l in body if BOX_LINE.match(l)]
        print("   pictures %d / static-differring %d / static build refused %s / product box lines with the set %d"
              % (len(pics), static, refused or "none", len(lines)))
        for l in lines[:2]:
            print("     typst: %s" % l.strip()[:150])
        for pic in pics:
            for ln in pic.splitlines():
                if re.search(r"\\(linewidth|textwidth|columnwidth|paperwidth)", ln):
                    print("     flat : %s" % ln.strip()[:150])
            if any(re.search(r"\\(linewidth|textwidth|columnwidth|paperwidth)", l) for l in pic.splitlines()):
                break


if __name__ == "__main__":
    main()
