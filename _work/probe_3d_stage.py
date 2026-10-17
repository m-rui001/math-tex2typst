r"""Which statement of each refused 3D picture stops CeTz, and does it still stop it now?

`build` returns one None for a whole picture, so the reason is read by replaying its stages: the
head transform, the scope walk, then every statement through `translate_statement`. Anything that
still refuses after the 3D basis lands is a second blocker and the picture must keep refusing.

Usage: python _work/probe_3d_stage.py
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402

OUT = os.path.join(ROOT, "_work", "_probe_3d")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)


def replay(tikz):
    """(the whole build, the statements that fail, and why) for one picture."""
    canvas = cetz.build(tikz)
    fails = []
    steps = []
    if canvas is not None:
        return canvas, fails, steps
    tikz = cetz.expand_linewidth(tikz, None)
    m = re.match(r"\\begin\{tikzpicture\}", tikz)
    body = tikz[m.end():].lstrip()
    head, pos = cetz._opts_at(body, 0)
    base = cetz._transform(head) if head is not None else None
    steps.append("head transform: %s" % ("ok" if base else "REFUSES"))
    body = body[pos:]
    end = body.rfind("\\end{tikzpicture}")
    body = body[:end]
    body = cetz.expand_def(body)
    body = cetz.expand_foreach(body)
    body = cetz.expand_def(body)
    body = cetz.expand_pgfmath(body)
    body = cetz.expand_ifnum(body)
    body = cetz.drop_clips(body)
    extra, body = cetz.expand_tikzset(body)
    cols = cetz._colors(body, None)
    steps.append("colours: %s" % ("ok" if cols else "REFUSES"))
    if cols is None:
        return None, fails, steps
    pal, body = cols
    placed = cetz.scoped(body, base or cetz.IDENT)
    steps.append("scope walk: %s" % ("ok" if placed is not None else "REFUSES"))
    if placed is None:
        return None, fails, steps
    styles = cetz.picture_styles(head)
    styles.update(extra)
    names = {}
    for stmt, xf in placed:
        cetz.register(stmt, names, xf, styles)
    for i, (stmt, xf) in enumerate(placed):
        if cetz.translate_statement(stmt, names, xf, pal, styles) is None:
            fails.append((i, stmt.replace("\n", " ")[:110]))
    return None, fails, steps


for fn in sorted(os.listdir(OUT)):
    if not fn.endswith(".tex") or not fn.startswith(("A-sharp", "Critic", "Strong")):
        continue
    tikz = PIC.search(open(os.path.join(OUT, fn), encoding="utf-8").read())
    if not tikz:
        continue
    src = tikz.group(0)
    canvas, fails, steps = replay(src)
    print("=" * 24, fn, "picture chars", len(src))
    if canvas is not None:
        print("   BUILDS a canvas of %d lines" % len(canvas.split("\n")))
        continue
    for s in steps:
        print("   " + s)
    print("   refusing statements: %d" % len(fails))
    for i, stmt in fails:
        print("     %2d  %s" % (i, stmt))
