r"""Does the border a node reports to an arrow actually move with its pen -- new vs pre-round.

`_outer_sep` is the one consumer of a pen outside `stroke_args`: it puts an anchor `outer sep=auto`
half a rule off the box, so a `[thick]` node should hand its arrows a border 0.2pt further out
(pdflatex: `_work/measure91_node_pen_box.py` reads `center->east` moving by exactly half the pen).
The corpus churn (`_work/probe131_pen_churn.py`) reports 550 canvases re-weighed and NO coordinate
moved, which is either a fact about these pictures or a bug in this reading -- so the same two
emitters are run on three toy pictures whose arrows do clip at a node border.
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz

sandbox = None
for fn in sorted(os.listdir(os.path.join(ROOT, "_work"))):
    if fn.startswith("m131_"):
        sandbox = os.path.join(ROOT, "_work", fn)
if sandbox is None:
    raise SystemExit("no pre-round copy: run _work/probe131_pen_churn.py first")
sys.path.insert(0, sandbox)
from t2old import cetz as legacy

TOYS = [
    ("circle node, arrow clipped at the border",
     r"\begin{tikzpicture}\node[draw%s, circle] (a) at (0,0) {X}; "
     r"\node[draw%s, circle] (b) at (2,0) {Y}; \draw[->] (a) -- (b);\end{tikzpicture}"),
    ("head fixes a 12pt pen, arrow clipped at a circle",
     r"\begin{tikzpicture}[line width=12pt]\node[draw, circle] (a) at (0,0) {X}; "
     r"\node[draw, circle] (b) at (3,0) {Y}; \draw[->] (a) -- (b);\end{tikzpicture}"),
    ("rect node, arrow clipped at the border",
     r"\begin{tikzpicture}\node[draw%s] (a) at (0,0) {X}; "
     r"\node[draw%s] (b) at (2,0) {Y}; \draw[->] (a) -- (b);\end{tikzpicture}"),
    # a straight `--` between two names is NOT clipped by this converter; a tangent `to` is, and its
    # endpoints leave through `_anchor_ring`, which is where a pen can move a coordinate
    ("circle nodes joined by a tangent to",
     r"\begin{tikzpicture}\node[draw%s, circle] (a) at (0,0) {X}; "
     r"\node[draw%s, circle] (b) at (2,0) {Y}; \draw[->] (a) to[bend left] (b);\end{tikzpicture}"),
    ("head 12pt, circle nodes joined by a tangent to",
     r"\begin{tikzpicture}[line width=12pt]\node[draw, circle] (a) at (0,0) {X}; "
     r"\node[draw, circle] (b) at (2,0) {Y}; \draw[->] (a) to[bend left] (b);\end{tikzpicture}"),
    ("rect nodes joined by a tangent to",
     r"\begin{tikzpicture}\node[draw%s] (a) at (0,0) {X}; "
     r"\node[draw%s] (b) at (2,0) {Y}; \draw[->] (a) to[bend left] (b);\end{tikzpicture}"),
    # the placement law of #73 prices `right=6mm of a` edge to edge, so a neighbour's outer sep --
    # half its rule -- moves the next node.  This is the second way a pen can reach a coordinate, and
    # the way to prove the churn's "no coordinate moved" is a fact and not a blind ruler.
    ("placed next to a sized node that carries the pen",
     r"\begin{tikzpicture}\node[draw%s, minimum size=1cm] (a) at (0,0) {X}; "
     r"\node[draw%s, minimum size=1cm, right=6mm of a] (b) {Y};\end{tikzpicture}"),
    ("arrow leaving a sized circle that carries the pen",
     r"\begin{tikzpicture}\node[draw%s, circle, minimum size=1cm] (a) at (0,0) {X}; "
     r"\node[draw%s, circle, minimum size=1cm] (b) at (3,0) {Y}; "
     r"\draw[->] (a) to[bend left] (b);\end{tikzpicture}"),
]
COORD = re.compile(r"\(\s*[-+0-9.]+\s*,\s*[-+0-9.]+\s*\)")
for name, tpl in TOYS:
    for pen in ("", ", thick", ", very thick"):
        pic = (tpl % (pen, pen)) if "%s" in tpl else tpl
        new, old = cetz.build(pic), legacy.build(pic)
        if new is None or old is None:
            print("%-42s %-14s refused new=%s old=%s" % (name, pen or "(default)",
                                                         new is not None, old is not None))
            continue
        same = COORD.findall(new) == COORD.findall(old)
        print("%-42s %-14s coords %s   %s -> %s" % (
            name, pen or "(default)", "IDENTICAL" if same else "MOVED",
            COORD.findall(old)[:2], COORD.findall(new)[:2]))
