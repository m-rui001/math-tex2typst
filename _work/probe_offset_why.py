"""Why the pictures that carry offset coordinates still refuse.

For each such picture the batch leaves as source, the probe resolves every offset token with
cetz.point() on the picture's own registered names and reports which half gives up: the shift
options, the name underneath them, or nothing at all because the statement never reached the
coordinate reader.
"""
import io
import re
import sys
from collections import Counter
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
OFFSET = re.compile(r"\(\s*(\[[^\]]*?\][^()]*?)\)")


def why(pic):
    """(offset tokens, how each one resolves) for a refused picture."""
    m = re.match(r"\\begin\{tikzpicture\}", pic)
    body = pic[m.end():].lstrip()
    head, pos = cetz._opts_at(body, 0)
    base = cetz._transform(head)
    body = body[pos:]
    end = body.rfind("\\end{tikzpicture}")
    body = body[:end]
    for fn in (cetz.expand_def, cetz.expand_foreach, cetz.expand_pgfmath, cetz.expand_ifnum):
        body = fn(body) or body
    body = cetz.drop_clips(body)
    cols = cetz._colors(body)
    if cols is None:
        return [], ["definecolor"]
    pal, body = cols
    placed = cetz.scoped(body, base)
    if placed is None:
        return [], ["scope transform"]
    styles = cetz.picture_styles(head)
    names = {}
    for stmt, xf in placed:
        cetz.register(stmt, names, xf, styles)
    out = []
    for tok in OFFSET.findall(body):
        t = tok.strip()
        at = cetz.point("(" + t + ")", None, names, cetz.IDENT)
        if at is not None:
            out.append("ok")
            continue
        inner, end2 = cetz.bracketed(t, 0)
        if cetz._transform(cetz.opts(inner), cetz.IDENT) is None:
            out.append("shift:" + inner.strip())
        elif cetz.point("(" + t[end2:].strip() + ")", None, names, cetz.IDENT) is None:
            out.append("name:" + t[end2:].strip())
        else:
            out.append("other:" + t)
    return OFFSET.findall(body), out


reasons = Counter()
examples = {}
for f in sorted(Path("_work/flat").glob("*.tex")):
    for pic in PIC.findall(f.read_text(encoding="utf-8", errors="replace")):
        if not OFFSET.search(pic) or cetz.build(pic) is not None:
            continue
        _, resolved = why(pic)
        for r in resolved:
            key = r.split(":")[0]
            reasons[key] += 1
            examples.setdefault(key, (f.stem[:40], r))

print("refused offset pictures, by why each offset token fails:")
for k, n in reasons.most_common():
    print("  %2d  %-12s e.g. %s | %s" % (n, k, examples[k][0], examples[k][1][:70]))
