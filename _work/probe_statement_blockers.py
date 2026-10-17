r"""Which statement kills each of the the 16 "statement"-stage refusals?

`build` gets all the way through the expander chain, through `drop_clips`, `expand_tikzset`,
`_colors`, `UNSUPPORTED` and `scoped`, and then gives up on a single drawing statement whose shape
we do not translate.  The family name in `probe_static_families.py` says only "statement", which is
not a cause.  This mirrors that census' picture iteration -- same `MATH_ENVELOPE` strip, same
`\linewidth` column, same `\definecolor` palette, and the same "only if `build` refused" gate --
then runs `translate_statement` over the placed statements one by one and prints the first None.
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
shapes = collections.Counter()
shown = 0

for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    paper = path.name[:-4]
    src = path.read_text(encoding="utf-8", errors="replace")
    pal = {}
    for m in DEFINECOLOR.finditer(src):
        pal[m.group(1)] = (m.group(2), m.group(3))
    for m in PICTURE.finditer(src):
        core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), LC)
        if not core.startswith("\\begin{tikzpicture}") or cetz.build(core, pal) is not None:
            continue
        body = core[len("\\begin{tikzpicture}"):].lstrip()
        head, pos = cetz._opts_at(body, 0)
        if head is None or cetz._transform(head) is None:
            continue
        base = cetz._transform(head)
        body = body[pos:]
        end = body.rfind("\\end{tikzpicture}")
        if end < 0:
            continue
        body = cetz.expand_foreach(cetz.expand_def(body[:end]))
        if body is None:
            continue
        body = cetz.expand_pgfmath(cetz.expand_def(body))
        if body is None:
            continue
        body = cetz.expand_ifnum(body)
        if body is None:
            continue
        extra, body = cetz.expand_tikzset(cetz.drop_clips(body))
        cols = cetz._colors(body, pal)
        if cols is None or cetz.UNSUPPORTED.search(cols[1]):
            continue
        palette, body = cols
        placed = cetz.scoped(body, base)
        if placed is None:
            continue
        styles = cetz.picture_styles(head)
        styles.update(extra)
        names = {}
        for stmt, xf in placed:
            cetz.register(stmt, names, xf, styles)
        for stmt, xf in placed:
            if cetz.translate_statement(stmt, names, xf, palette, styles) is not None:
                continue
            verb = (re.match(r"\\([a-zA-Z]+)", stmt) or [None, "?"])[1]
            opts = re.search(r"\[([^\]]*)\]", stmt)
            shapes[verb + " [" + (opts.group(1)[:30] if opts else "") + "]"] += 1
            if shown < 18:
                shown += 1
                print("%-44s %s" % (paper[:44], " ".join(stmt.split())[:150]))
            break

print("---- first untranslated statement, by verb and its own options ----")
for key, n in shapes.most_common():
    print("%4d  %s" % (n, key))
