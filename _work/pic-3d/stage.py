r"""Which statement of each 3D-axis picture stops the sandbox CeTz, and at which build stage.

`build` answers one None for a whole picture, so the reason is read by replaying its stages: the
head transform, the colours, the scope walk, then every statement through `translate_statement`.
A picture that still refuses has a named blocker; a statement list that comes back empty means the
canvas was lost after the statements, in the emit or a gate.

Usage: python _work/pic-3d/stage.py
"""
import io
import os
import re
import sys

ROOT = r"E:\math\_work\pic-3d"
sys.path.insert(0, ROOT)
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")

from t2t import cetz, convert, prep  # noqa: E402

FLAT = os.path.join(ROOT, "flat")
OUT = os.path.join(ROOT, "_probe_3d")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)


def replay(tikz, colors, cm):
    """(canvas or None, statements that fail, stage notes) for one picture."""
    steps = []
    tikz = cetz.expand_linewidth(tikz, cm)
    m = re.match(r"\\begin\{tikzpicture\}", tikz)
    body = tikz[m.end():].lstrip()
    head, pos = cetz._opts_at(body, 0)
    base = cetz._transform(head) if head is not None else None
    steps.append("head transform: %s %s" % ("ok" if base else "REFUSES", base))
    if base is None:
        return None, [], steps
    body = body[pos:]
    body = body[:body.rfind("\\end{tikzpicture}")]
    body = cetz.expand_def(body)
    body = cetz.expand_foreach(body)
    body = cetz.expand_def(body)
    body = cetz.expand_pgfmath(body)
    body = cetz.expand_ifnum(body)
    body = cetz.drop_clips(body)
    extra, body = cetz.expand_tikzset(body)
    cols = cetz._colors(body, colors)
    steps.append("colours: %s" % ("ok" if cols else "REFUSES"))
    if cols is None:
        return None, [], steps
    pal, body = cols
    placed = cetz.scoped(body, base)
    steps.append("scope walk: %s (%d statements)" %
                 ("ok" if placed is not None else "REFUSES", len(placed or [])))
    if placed is None:
        return None, [], steps
    styles = cetz.picture_styles(head)
    styles.update(extra)
    names = {}
    for stmt, xf in placed:
        cetz.register(stmt, names, xf, styles)
    fails = []
    for i, (stmt, xf) in enumerate(placed):
        if cetz.translate_statement(stmt, names, xf, pal, styles) is None:
            fails.append((i, str(xf), stmt.replace("\n", " ")[:110]))
    canvas = cetz.build(tikz[:tikz.index("\\end{tikzpicture}") + 18], colors)
    return canvas, fails, steps


os.makedirs(OUT, exist_ok=True)
for fn in sorted(os.listdir(FLAT)):
    if not fn.endswith(".tex"):
        continue
    src = open(os.path.join(FLAT, fn), encoding="utf-8").read()
    pre_text, _ = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    cm = convert.line_cm(p)
    for idx, pic in enumerate(PIC.findall(src)):
        pic = prep.expand_macros(pic, p.macros)
        canvas, fails, steps = replay(pic, p.colors, cm)
        name = fn[:-4][:34]
        open(os.path.join(OUT, "%s_%d.tex" % (name, idx)), "w", encoding="utf-8").write(pic)
        print("%s#%d %s len=%d" % (name, idx, "CANVAS" if canvas else "REFUSED", len(pic)))
        for s in steps:
            print("   ", s)
        for i, xf, stmt in fails:
            print("    fail %d xf=%s\n         %s" % (i, xf, stmt))
