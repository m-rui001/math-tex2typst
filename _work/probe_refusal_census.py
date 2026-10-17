"""Census of the pictures a batch leaves as quoted LaTeX, by the stage of cetz.build that gave up.

Mirrors build()'s own order and calls its own functions -- an old probe kept a hand-written stage
list and went on reporting the previous reason after a fix landed. Nothing here compiles: a
picture that builds but fails cetz's typst gate is not counted, so read this beside the ledger's
refused total, not instead of it.
"""
import io
import re
import sys
from collections import Counter
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
SHAPE = re.compile(r"\b(ellipse|arc|grid|circle|rectangle|plot|to|controls|parabola|node|cycle)\b")
VERB = re.compile(r"\\(draw|fill|filldraw|path|node|coordinate|shade|clip|use|foreach|scope)\b")


def stage(pic):
    """The first step of build() this picture does not survive."""
    m = re.match(r"\\begin\{tikzpicture\}", pic)
    if not m:
        return "not a picture"
    body = pic[m.end():].lstrip()
    head, pos = cetz._opts_at(body, 0)
    if head is None:
        return "head options"
    base = cetz._transform(head)
    if base is None:
        return "head transform unreadable"
    body = body[pos:]
    end = body.rfind("\\end{tikzpicture}")
    if end < 0:
        return "no \\end{tikzpicture}"
    body = body[:end]
    for name, fn in (("def/foreach", cetz.expand_def), ("foreach", cetz.expand_foreach),
                     ("pgfmath", cetz.expand_pgfmath), ("ifnum", cetz.expand_ifnum)):
        body2 = fn(body)
        if body2 is None:
            return name if name != "def/foreach" else "foreach"
        body = body2
    body = cetz.drop_clips(body)
    cols = cetz._colors(body)
    if cols is None:
        return "definecolor"
    if cetz.UNSUPPORTED.search(cols[1]):
        return "unsupported:" + ",".join(sorted({g for g in
                                                 cetz.UNSUPPORTED.findall(cols[1])}))
    pal, body = cols
    placed = cetz.scoped(body, base)
    if placed is None:
        return "scope transform unreadable"
    styles = cetz.picture_styles(head)
    names = {}
    for stmt, xf in placed:
        cetz.register(stmt, names, xf, styles)
    for stmt, xf in placed:
        if cetz.translate_statement(stmt, names, xf, pal, styles) is None:
            v = VERB.search(stmt)
            s = SHAPE.search(stmt)
            return "statement:%s%s" % (v.group(1) if v else stmt.strip()[:12],
                                       "/" + s.group(1) if s else "")
    return "empty canvas"


counts = Counter()
papers = {}
for f in sorted(Path("_work/flat").glob("*.tex")):
    for pic in PIC.findall(f.read_text(encoding="utf-8", errors="replace")):
        if cetz.build(pic) is not None:
            continue
        key = stage(pic)
        counts[key] += 1
        papers.setdefault(key, f.stem[:40])

print("pictures a build() pass refuses:", sum(counts.values()))
for k, n in counts.most_common():
    print("  %2d  %-32s e.g. %s" % (n, k, papers[k]))
