"""Full text of the statement each of the 14 refusing pictures chokes on first.

`probe_statement_shapes.py` prints a coordinate-stripped skeleton; here the statement is printed
verbatim so the failing construct -- the `cycle`, the `ellipse`, the second sub-path -- can be read
off the page rather than guessed at from the skeleton.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

LC = 15.79
PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
DEFINECOLOR = re.compile(r"\\definecolor\{([-\w]+)\}\{(\w+)\}\{([^{}]*)\}")
ONLY = sys.argv[1] if len(sys.argv) > 1 else None

for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    paper = path.name[:-4]
    src = path.read_text(encoding="utf-8", errors="replace")
    pal = {}
    for m in DEFINECOLOR.finditer(src):
        pal[m.group(1)] = (m.group(2), m.group(3))
    for m in PICTURE.finditer(src):
        core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), LC)
        if cetz.build(core, pal) is not None or cetz.build_cd(core) is not None:
            continue
        if not core.startswith("\\begin{tikzpicture}"):
            continue
        if ONLY and not paper.startswith(ONLY):
            continue
        body = core[len("\\begin{tikzpicture}"):].lstrip()
        head, pos = cetz._opts_at(body, 0)
        base = cetz._transform(head or {})
        body = body[pos:]
        end = body.rfind("\\end{tikzpicture}")
        if base is None or end < 0:
            continue
        body = cetz.expand_def(body[:end])
        body = cetz.expand_foreach(body)
        if body is None:
            continue
        body = cetz.expand_pgfmath(cetz.expand_def(body))
        body = cetz.expand_ifnum(body)
        got = cetz.expand_tikzset(cetz.drop_clips(body))
        cols = cetz._colors(got[1])
        placed = cetz.scoped(cols[1], base)
        if placed is None:
            continue
        styles = cetz.picture_styles(head)
        styles.update(got[0])
        names = {}
        for stmt, xf in placed:
            cetz.register(stmt, names, xf, styles)
        for i, (stmt, xf) in enumerate(placed):
            if cetz.translate_statement(stmt, names, xf, cols[0], styles) is not None:
                continue
            print("== %s" % paper)
            print("   head: %s" % " ".join((head or {}).items().__str__().split())[:150])
            print("   stmt[%d/%d]: %s" % (i, len(placed), " ".join(stmt.split())[:400]))
            print("   xf: %s" % (xf,))
            break
