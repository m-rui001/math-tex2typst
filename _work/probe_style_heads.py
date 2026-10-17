"""Do the pictures whose arrow head sits in an invoked style now draw it?

The same 38 pictures as probe_style_arrows, built statically, counted for the CeTz `mark:` argument
that puts a head on a line, and for a white fill leaking out of an 'every node' blend.
"""
import glob
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "tools"))
from t2t import cetz

STYLE_DEF = re.compile(r"([A-Za-z0-9_ @.\-]+?)\s*/\s*\.style\s*=\s*\{([^{}]*)\}")
PATH_STMT = re.compile(r"\\(draw|path|filldraw)\s*\[([^\]]*)\]")


def main():
    pics = with_mark = with_fill = 0
    shown = 0
    for path in sorted(glob.glob(os.path.join(os.path.dirname(__file__),
                                              "flat", "*.tex"))):
        tex = open(path, encoding="utf-8", errors="replace").read()
        for m in re.finditer(r"\\begin\{tikzpicture\}(.*?)\\end\{tikzpicture\}", tex, re.S):
            body = m.group(1)
            styles = {s.group(1).strip(): s.group(2) for s in STYLE_DEF.finditer(body)}
            arrowed = {n for n, spec in styles.items()
                       if re.search(r"(^|[,{])\s*(<->|->|<-\b|\.->|<\.|<[|])", spec)}
            if not arrowed:
                continue
            named = [o.strip() for s in PATH_STMT.finditer(body)
                     for o in s.group(2).split(",")
                     if o.strip() in arrowed and o.strip() not in ("->", "<-")]
            if not named:
                continue
            built = cetz.build("\\begin{tikzpicture}" + body + "\\end{tikzpicture}")
            if not built:
                continue
            pics += 1
            head = re.search(r"mark: \((?:start|end): \"[<>\"]", built)
            if head:
                with_mark += 1
            elif shown < 6:
                shown += 1
                print("no head: %s %s" % (os.path.basename(path)[:40], sorted(set(named))))
            if re.search(r"fill: rgb\(\"#ffffff\"\)", built):
                with_fill += 1
    print("style-carried-arrow pictures: %d ; drawing a head: %d ; white-filled: %d"
          % (pics, with_mark, with_fill))


main()
