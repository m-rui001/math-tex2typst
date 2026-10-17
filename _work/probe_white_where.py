"""Where does a white fill sit: on a node's frame, or on a line the author never filled?

Reuses probe_style_heads' picture selection and prints, for every canvas carrying a white paint, the
Typst call that holds it. A path that picked up 'every node/.style={fill=white}' would show up as an
area/line call, and that would be this cycle's own damage.
"""
import glob
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "tools"))
from t2t import cetz

STYLE_DEF = re.compile(r"([A-Za-z0-9_ @.\-]+?)\s*/\s*\.style\s*=\s*\{([^{}]*)\}")
PATH_STMT = re.compile(r"\\(draw|path|filldraw)\s*\[([^\]]*)\]")
WHITE = re.compile(r'rgb\("#ffffff"\)')


def main():
    kinds = {}
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
            if not [o for s in PATH_STMT.finditer(body) for o in s.group(2).split(",")
                    if o.strip() in arrowed and o.strip() not in ("->", "<-")]:
                continue
            built = cetz.build("\\begin{tikzpicture}" + body + "\\end{tikzpicture}")
            if not built or not WHITE.search(built):
                continue
            for line in built.splitlines():
                if not WHITE.search(line):
                    continue
                word = re.match(r"\s*([a-z_]+)\(", line)
                word = word.group(1) if word else "other"
                kinds[word] = kinds.get(word, 0) + 1
                if word != "content":
                    print("%s: %s" % (os.path.basename(path)[:36], line.strip()[:110]))
    print("white paint by call:", kinds)


main()
