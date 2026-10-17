"""For one paper, why does the first refusing statement refuse?

The statement loop in `build` answers only yes/no. This walks the failing statement apart: the verb's
options after style resolution, each coordinate the statement names, and the specific helper that
returns None -- so a refusal is either an unresolvable coordinate, an unplaced anchor, or a construct
the path builder genuinely has no rule for. Static only; typst is never spawned.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

LC = 15.79
PREFIX = sys.argv[1]
PICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
DEFINECOLOR = re.compile(r"\\definecolor\{([-\w]+)\}\{(\w+)\}\{([^{}]*)\}")

path = next(p for p in sorted((ROOT / "_work" / "flat").glob("*.tex"))
            if p.name[:-4].startswith(PREFIX))
print("paper: %s" % path.name)
src = path.read_text(encoding="utf-8", errors="replace")
pal = {}
for m in DEFINECOLOR.finditer(src):
    pal[m.group(1)] = (m.group(2), m.group(3))

for pic_i, m in enumerate(PICTURE.finditer(src)):
    core = cetz.expand_linewidth(m.group(0), LC)
    if cetz.build(core, pal) is not None:
        continue
    body = core[len("\\begin{tikzpicture}"):].lstrip()
    head, pos = cetz._opts_at(body, 0)
    base = cetz._transform(head or {})
    if base is None:
        print("pic %d: head transform refused" % pic_i)
        continue
    body = cetz.expand_def(body[pos:body.rfind("\\end{tikzpicture}")])
    body = cetz.expand_foreach(body)
    if body is None:
        print("pic %d: foreach refused" % pic_i)
        continue
    body = cetz.expand_pgfmath(cetz.expand_def(body))
    if body is None:
        print("pic %d: pgfmath refused" % pic_i)
        continue
    body = cetz.expand_ifnum(body)
    if body is None:
        print("pic %d: ifnum refused" % pic_i)
        continue
    extra, body = cetz.expand_tikzset(cetz.drop_clips(body))
    cols = cetz._colors(body)
    placed = cetz.scoped(cols[1], base)
    if placed is None:
        print("pic %d: scopes refused" % pic_i)
        continue
    styles = cetz.picture_styles(head)
    styles.update(extra)
    names = {}
    for stmt, xf in placed:
        cetz.register(stmt, names, xf, styles)
    print("pic %d: %d coords known" % (pic_i, len(names)))
    for i, (stmt, xf) in enumerate(placed):
        got = cetz.translate_statement(stmt, names, xf, cols[0], styles)
        if got is not None:
            continue
        print("  FAIL stmt[%d/%d]: %s" % (i, len(placed), " ".join(stmt.split())[:300]))
        print("     xf=%s" % (xf,))
        v = re.match(r"\\(\w+)(\[[^\]]*\])?", stmt)
        verb = v.group(1)
        o = cetz.opts(v.group(2)[1:-1]) if v.group(2) else {}
        resolved = cetz.resolve_opts(dict(o), styles, as_node=(verb == "node"))
        print("     opts=%s -> resolved=%s" % (o, resolved))
        for tok in re.findall(r"\(([^()]*)\)", stmt)[:8]:
            pt = cetz.point(tok, None, names, xf)
            print("     point(%r) = %s" % (tok, pt))
        if verb in ("node", "fill", "draw"):
            rest = stmt[v.end():]
            print("     node anchor=%s" % cetz._node_anchor(resolved or {}))
            print("     rest=%s" % " ".join(rest.split())[:200])
        break
