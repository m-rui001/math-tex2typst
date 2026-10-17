"""Drawn pictures that lost a node the reader should see.

A `\node` with no text and no fill is a point, and drawing nothing for it is right. A node with
readable text that produces no line is a hole in the figure. Look at every picture that builds,
and count only the second kind, by the shape of its options.
"""
import pathlib
import re
import sys
from collections import Counter

sys.path.insert(0, str(pathlib.Path("tools").resolve()))
from t2t import cetz  # noqa: E402

ENV = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
OPTS = re.compile(r"^\s*\\node\s*\[([^\]]*)\]")


def visible(stmt, xf):
    """Whether a node statement carries text a reader would look for."""
    if not stmt.strip().startswith("\\node"):
        return False
    o, pos = cetz._opts_at(stmt, 5)
    if o is None:
        return False
    head = cetz._node_at(stmt[pos:], {}, xf, cetz.resolve_opts(o, {}))
    if head is None:
        return False
    inner, _end = cetz.bracketed(head[2], head[2].find("{"))
    return inner is not None and bool(cetz.node_text(inner))


lost = Counter()
papers = Counter()
pictures = 0
drawn = 0
checked = 0
for path in sorted(pathlib.Path("_work", "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    for pic in ENV.findall(src):
        pictures += 1
        core = cetz.MATH_ENVELOPE.sub("", pic)
        canvas = cetz.build(core)
        if not canvas:
            continue
        drawn += 1
        m = re.match(r"\\begin\{tikzpicture\}", core)
        body = core[m.end():].lstrip()
        head, pos = cetz._opts_at(body, 0)
        base = head is not None and cetz._transform(head)
        if not base:
            continue
        body = cetz.expand_foreach(body[pos:])
        if body is None:
            continue
        body = body[:body.rfind("\\end{tikzpicture}")]
        cols = cetz._colors(body)
        if cols is None or cetz.UNSUPPORTED.search(cols[1]):
            continue
        pal, cleaned = cols
        placed = cetz.scoped(cleaned, base)
        if placed is None:
            continue
        styles = cetz.picture_styles(head)
        names = {}
        for stmt, xf in placed:
            cetz.register(stmt, names, xf, styles)
        hit = 0
        for stmt, xf in placed:
            vis = visible(stmt, xf)
            checked += vis
            if cetz.translate_statement(stmt, names, xf, pal, styles) or not vis:
                continue
            hit += 1
            m = OPTS.match(stmt.strip())
            lost["node[" + (m.group(1)[:30] if m else "") + "]"] += 1
        if hit:
            papers[path.stem] = hit

# `checked` is the positive control: a visible node statement has to be seen for a
# zero loss count to mean anything
print({"pictures": pictures, "drawn": drawn, "visible node statements": checked,
       "drawn with a lost label": len(papers), "labels lost": sum(lost.values())})
for key, n in lost.most_common(12):
    print("  %4d  %s" % (n, key))
