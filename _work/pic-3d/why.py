r"""Why exactly do the three remaining Critical-bond statements refuse?

`point` answers None for a token it cannot read, and the path walker then drops the whole
statement, so the token is caught by spying on the reader instead of guessing from the source.

Usage: python _work/pic-3d/why.py
"""
import io
import os
import re
import sys

ROOT = r"E:\math\_work\pic-3d"
sys.path.insert(0, ROOT)
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")

from t2t import cetz, convert, prep  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
src = open(os.path.join(ROOT, "flat",
             "Critical-bond-and-site-percolation-on-the-cubic-lattice-September-24-2026.tex"),
             encoding="utf-8").read()
pre_text, _ = prep.split_document(src)
p = prep.parse_preamble(pre_text)
cm = convert.line_cm(p)
pic = prep.expand_macros(PIC.findall(src)[0], p.macros)

core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", pic), cm)
m = re.match(r"\\begin\{tikzpicture\}", core)
body = core[m.end():].lstrip()
head, pos = cetz._opts_at(body, 0)
base = cetz._transform(head)
body = body[pos:]
body = body[:body.rfind("\\end{tikzpicture}")]
for step in (cetz.expand_def, cetz.expand_foreach, cetz.expand_def, cetz.expand_pgfmath,
             cetz.expand_ifnum, cetz.drop_clips):
    body = step(body)
extra, body = cetz.expand_tikzset(body)
pal, body = cetz._colors(body, p.colors)
placed = cetz.scoped(body, base)
styles = cetz.picture_styles(head)
styles.update(extra)
names = {}
for stmt, xf in placed:
    cetz.register(stmt, names, xf, styles)
print("NAMES:", {k: tuple(round(c, 3) for c in v) for k, v in names.items()})

real_point = cetz.point


def spy(token, cursor, names=None, xf=cetz.IDENT):
    got = real_point(token, cursor, names, xf)
    if got is None:
        print("  point refuses: %r" % token)
    return got


for i, (stmt, xf) in enumerate(placed):
    if i not in (16, 18, 19, 20):
        continue
    print("=== statement %d: %s" % (i, stmt.replace("\n", " ")[:120]))
    cetz.point = spy
    got = cetz.translate_statement(stmt, names, xf, pal, styles)
    cetz.point = real_point
    print("   ->", "ok" if got is not None else "REFUSES")
