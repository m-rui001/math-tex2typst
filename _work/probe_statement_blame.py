"""Replay `cetz.build` statement by statement and print the first statement each picture dies on.

The census calls 18 refusals 'statement-level', which only says every expansion stage passed. Here
the same pipeline runs to `scoped`, then `translate_statement` is called in build's own order, so the
blamed statement prints itself. Static: no typst, safe while a batch is in flight.
"""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

LC = 15.79
PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
DEFINECOLOR = re.compile(r"\\definecolor\{([-\w]+)\}\{(\w+)\}\{([^{}]*)\}")
blames = collections.Counter()
papers = collections.defaultdict(list)

for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    paper = path.name[:-4]
    src = path.read_text(encoding="utf-8", errors="replace")
    pal = {m.group(1): (m.group(2), m.group(3)) for m in DEFINECOLOR.finditer(src)}
    for m in PICTURE.finditer(src):
        core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), LC)
        if not core.startswith("\\begin{tikzpicture}"):
            continue
        if cetz.build(core, pal) is not None or cetz.build_cd(core) is not None:
            continue
        body = core[len("\\begin{tikzpicture}"):].lstrip()
        head, pos = cetz._opts_at(body, 0)
        base = None if head is None else cetz._transform(head)
        if base is None:
            continue
        body = cetz.expand_def(body[pos:])
        for fold in (cetz.expand_foreach, cetz.expand_pgfmath, cetz.expand_ifnum):
            body = None if body is None else fold(body)
        if body is None:
            continue
        extra, body = cetz.expand_tikzset(cetz.drop_clips(body))
        cols = cetz._colors(body, pal)
        if cols is None or cetz.UNSUPPORTED.search(cols[1]):
            continue
        pal2, body = cols
        placed = cetz.scoped(body, base)
        if placed is None:
            continue
        styles = cetz.picture_styles(head)
        styles.update(extra)
        names = {}
        for stmt, xf in placed:
            cetz.register(stmt, names, xf, styles)
        hit = False
        for stmt, xf in placed:
            if cetz.translate_statement(stmt, names, xf, pal2, styles) is None:
                key = " ".join(stmt.split())[:64]
                blames[key] += 1
                papers[key].append(paper[:44])
                hit = True
                break
        if not hit:
            blames["(no statement blamed)"] += 1
            papers["(no statement blamed)"].append(paper[:44])

print("---- blamed statements ----")
for k, n in blames.most_common():
    print("%2d  %-66s %s" % (n, k, papers[k][0]))
