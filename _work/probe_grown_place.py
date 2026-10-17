r"""Where the Turn-Based flowchart's neighbours land, once a grown label carries its height.

`below=6mm of up` has to start from `up`'s south edge; while the height of a node sized by its own
text went unmeasured it started from the centre and `persist` was drawn across the box above it.
Replays the opening of `cetz.build` -- head, styles, scopes -- and prints each named node's centre,
half-width and half-height as the canvas reads them, so a gap between one box's south and the next
box's north can be compared with the millimetres the author wrote.
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402

SRC = os.path.join(ROOT, "_work", "flat",
                   "Turn-Based-Stochastic-Mean-Payoff-Games-in-Deterministic-"
                   "Quasipolynomial-Time-October-5-2026.tex")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

text = open(SRC, encoding="utf-8", errors="replace").read()
pic = [p for p in PIC.findall(text) if "Downward pass" in p][0]

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
placed = cetz.scoped(body, base, names, styles)
print("picture draws: %s" % (placed is not None))
for stmt, xf in placed:
    cetz.register(stmt, names, xf, styles)

for name in ("down", "up", "persist", "wide", "last"):
    ref = names.get(name)
    if ref is None:
        print("%-8s not registered" % name)
        continue
    num = lambda v: "  None" if v is None else "%6.3f" % v  # noqa: E731
    print("%-8s centre=(%7.3f, %7.3f) hw=%s hh=%s  -> south %7.3f north %7.3f"
          % (name, ref[0], ref[1], num(ref[2]), num(ref[3]),
             ref[1] - (ref[3] or 0.0), ref[1] + (ref[3] or 0.0)))

gap = (names["up"][1] - (names["up"][3] or 0.0)) - (names["persist"][1] + (names["persist"][3] or 0.0))
print("up.south to persist.north: %.3f cm (author wrote 6mm)" % gap)
gap2 = (names["wide"][1] + (names["wide"][3] or 0.0)) - (names["last"][1] - (names["last"][3] or 0.0))
print("last.south to wide.north: %.3f cm (author wrote 6mm)" % (-gap2 if gap2 < 0 else gap2))

canvas = cetz.build(pic)
print("canvas lines: %s" % (0 if canvas is None else len(canvas.splitlines())))
open(os.path.join(ROOT, "_work", "grown_canvas.typ"), "w", encoding="utf-8").write(canvas or "")
