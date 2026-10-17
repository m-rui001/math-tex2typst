"""How many converted pictures draw a path whose arrow head lives inside an invoked style.

`\draw[flow] (a) -- (b)` with `flow/.style={->,draw=black!65}` gets its head from the style, and
translate_statement only merges styles for `\node`, so the head and the ink both stay in the name.
Static: cetz.build only, no typst, so this may run beside a batch.
"""
import glob
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "tools"))
from t2t import cetz

STYLE_DEF = re.compile(r"([A-Za-z0-9_ @.\-]+?)\s*/\s*\.style\s*=\s*\{([^{}]*)\}")
ARROW = re.compile(r"(^|[,{]\s*)(<->|->|<-\s*|\.->|<\.\s*|<[|])")
PATH_STMT = re.compile(r"\\(draw|path|filldraw)\s*\[([^\]]*)\]")


def pictures(tex):
    for m in re.finditer(r"\\begin\{tikzpicture\}(.*?)\\end\{tikzpicture\}", tex, re.S):
        yield m.group(1)


def main():
    hit_papers = hit_pics = 0
    samples = []
    for path in sorted(glob.glob(os.path.join(os.path.dirname(__file__),
                                              "flat", "*.tex"))):
        tex = open(path, encoding="utf-8", errors="replace").read()
        counted = False
        for body in pictures(tex):
            styles = {m.group(1).strip(): m.group(2) for m in STYLE_DEF.finditer(body)}
            arrowed = {name for name, spec in styles.items()
                       if re.search(r"(^|[,{])\s*(<->|->|<-\b|\.->|<\.|<[|])", spec)}
            if not arrowed:
                continue
            lost = []
            for m in PATH_STMT.finditer(body):
                opts = [o.strip() for o in m.group(2).split(",")]
                lost += [o for o in opts if o in arrowed and o not in ("->", "<-")]
            if not lost:
                continue
            if cetz.build("\\begin{tikzpicture}" + body + "\\end{tikzpicture}"):
                if not counted:
                    hit_papers += 1
                    counted = True
                hit_pics += 1
                if len(samples) < 8:
                    samples.append((os.path.basename(path)[:44], lost))
    print("papers with a style-carried arrow: %d ; pictures: %d" % (hit_papers, hit_pics))
    for name, lost in samples:
        print("   %-46s %s" % (name, sorted(set(lost))))


main()
