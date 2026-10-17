r"""How many objects does TeX draw for each picture, and how many does the canvas carry?

A macro that expanded to nothing, or a statement the emitter dropped on the floor, shows up here as
a count that does not line up with the picture's own path verbs and nodes.
"""
import sys, re
sys.path.insert(0, "_work/pic-authmacros")
from t2t import cetz, convert, prep

FLAT = "_work/flat/"
PAPERS = {
    "cylinder": ("Cylinder-amplitudes-and-logarithmic-bridge-length-windows-on-the-honeycomb-lattice-September-26-2026",
                 "FiniteSquare"),
    "gff": ("Gaussian-free-field-limits-of-weighted-integer-Lipschitz-heights-September-25-2026",
            "pinsgroup"),
    "peps": ("Polynomial-PEPS-approximation-of-gapped-square-grid-ground-states-September-24-2026",
             "geometryrow"),
}
PATH_VERB = re.compile(r"\\(?:draw|fill|path|shade)(?![A-Za-z])")
NODE = re.compile(r"\\node(?![A-Za-z])")
END = "\\end{tikzpicture}"

for tag, (name, marker) in PAPERS.items():
    src = open(FLAT + name + ".tex", encoding="utf-8").read()
    pre, body = prep.split_document(src)
    p = prep.parse_preamble(pre)
    body = prep.unwrap_boxes(body)
    scopes = convert.picture_scopes(body, p.macros)
    pics = [m.group(0) for m in convert.TIKZ_SPAN.finditer(body)]
    for i, pic in enumerate(pics):
        if marker not in pic:
            continue
        table, decls = scopes[i]
        text = convert.with_declarations(pic, decls) if decls else pic
        core = prep.expand_macros(text, table)
        b = core[core.index("]") + 1:core.rfind(END)]
        b = cetz.expand_def(b)
        b = cetz.expand_foreach(b)
        b = cetz.expand_pgfmath(b) if b is not None else None
        if b is None:
            print(tag, "unrolling refused")
            continue
        canvas = open("_work/pic-authmacros/canvas_%s.typ" % tag, encoding="utf-8").read()
        drawn = len(PATH_VERB.findall(b))
        nodes = len(NODE.findall(b))
        items = len(re.findall(r"^  (?:line|rect|circle|bezier|content|path|polyline|arc)\(",
                               canvas, re.M))
        content = len(re.findall(r"^  content\(", canvas, re.M))
        others = items - content
        print("%-9s TeX draws %3d path verbs + %3d nodes | canvas %3d items = %3d content + %3d shapes"
              % (tag, drawn, nodes, items, content, others))
        # a node on a path is one statement that draws and labels at once
        both = len(re.findall(r"\\(?:draw|fill|path)(?:[^;]*?)\\node", b, re.S))
        print("           statements that draw and place a node: %d -> %d objects expected"
              % (both, drawn + nodes - both))
