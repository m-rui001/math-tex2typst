"""Which statements disappear from a picture that still draws.

Only canvases that build are looked at: a refused picture is quoted whole, so a dropped
statement matters exactly when the rest of the figure went through. Normalise each silent drop
to the control sequence plus the shape of its options, and count the shapes.
"""
import pathlib
import re
import sys
from collections import Counter

sys.path.insert(0, str(pathlib.Path("tools").resolve()))
from t2t import cetz  # noqa: E402

ENV = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
COMMAND = re.compile(r"^\\([a-zA-Z]+)")
PAPERS = Counter()
SHAPES = Counter()
examples = {}


def shape(stmt):
    m = COMMAND.match(stmt.strip())
    head = m.group(1) if m else stmt.strip()[:12]
    opts = re.match(r"\\[a-zA-Z]+\[([^\]]*)\]", stmt.strip())
    return "%s[%s]" % (head, (opts.group(1)[:34] if opts else ""))


for path in sorted(pathlib.Path("_work", "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    for pic in ENV.findall(src):
        core = cetz.MATH_ENVELOPE.sub("", pic)
        canvas = cetz.build(core)
        if not canvas:
            continue
        m = re.match(r"\\begin\{tikzpicture\}", core)
        body = core[m.end():].lstrip()
        head, pos = cetz._opts_at(body, 0)
        base = head is not None and cetz._transform(head)
        if not base:
            continue
        body = cetz.expand_foreach(body[pos:])
        if body is None:
            continue
        body = body[:body.rfind("\\end{tikzpicture}")]
        cols = cetz._colors(body)
        if cols is None or cetz.UNSUPPORTED.search(cols[1]):
            continue
        pal, cleaned = cols
        placed = cetz.scoped(cleaned, base)
        if placed is None:
            continue
        styles = cetz.picture_styles(head)
        names = {}
        for stmt, xf in placed:
            cetz.register(stmt, names, xf, styles)
        hit = False
        for stmt, xf in placed:
            if cetz.translate_statement(stmt, names, xf, pal, styles):
                continue
            hit = True
            key = shape(stmt)
            SHAPES[key] += 1
            examples.setdefault(key, " ".join(stmt.split())[:150])
        if hit:
            PAPERS[path.stem] += 1

print({"pictures with a silent drop": sum(PAPERS.values()),
       "papers affected": len(PAPERS), "drops": sum(SHAPES.values())})
for key, n in SHAPES.most_common(20):
    print("%4d  %-42s %s" % (n, key[:42], examples[key]))
