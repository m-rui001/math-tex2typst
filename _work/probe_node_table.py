r"""Dump every named node of one picture: centre, half-extents and label text.

Standing lesson before diagnosing an overlap: print the node table first, do not guess which
statement drew what. Replays `cetz.build`'s opening (head, styles, scopes) and then prints each
registered node in source order together with its half-width/half-height and the text it carries,
so two boxes that sit on the same coordinates are visible as numbers.

usage: probe_node_table.py <flat-stem> <needle inside the picture> [out.typ]
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

stem, needle = sys.argv[1], sys.argv[2]
src = os.path.join(ROOT, "_work", "flat", stem + ".tex")
text = open(src, encoding="utf-8", errors="replace").read()
pics = [p for p in PIC.findall(text) if needle in p]
print("pictures matching %r: %d" % (needle, len(pics)))
pic = pics[0]

tikz = cetz.expand_linewidth(pic, None)
body = tikz[len("\\begin{tikzpicture}"):].lstrip()
head, pos = cetz._opts_at(body, 0)
base = cetz._transform(head)
body = body[pos:].rsplit("\\end{tikzpicture}", 1)[0]
body = cetz.expand_def(body)
body = cetz.expand_foreach(body)
body = cetz.expand_def(body)
body = cetz.expand_pgfmath(body)
body = cetz.expand_ifnum(body)
body = cetz.drop_clips(body)
extra, body = cetz.expand_tikzset(body)
pal, body = cetz._colors(body, None)
styles = cetz.picture_styles(head)
styles.update(extra)
if isinstance(head.get("font"), str) and "font" not in styles.get("every node", {}):
    styles.setdefault("every node", {})["font"] = head["font"]

names = {}
order = []
stmt_of = {}
placed = cetz.scoped(body, base, names, styles)
print("picture draws: %s" % (placed is not None))
for stmt, xf in placed:
    before = set(names)
    cetz.register(stmt, names, xf, styles)
    for k in names:
        if k not in before:
            order.append(k)
            stmt_of[k] = stmt

num = lambda v: "  None" if v is None else "%7.3f" % v  # noqa: E731
for i, name in enumerate(order):
    ref = names[name]
    s = re.sub(r"\s+", " ", stmt_of[name])
    print("%2d %-14s centre=(%7.3f,%7.3f) hw=%s hh=%s\n     %s"
          % (i, name, ref[0], ref[1], num(ref[2]), num(ref[3]),
             s if len(s) < 220 else s[:217] + "..."))
print("nodes: %d" % len(order))

canvas = cetz.build(pic)
print("canvas lines: %s" % (0 if canvas is None else len(canvas.splitlines())))
if len(sys.argv) > 3:
    open(os.path.join(ROOT, "_work", sys.argv[3]), "w", encoding="utf-8").write(canvas or "")
    print("wrote _work/%s" % sys.argv[3])
