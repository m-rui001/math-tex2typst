"""Which statement makes one picture's build refuse.

Runs the same stages as cetz.build and stops at the first one that says no, printing the
statement itself so the reason is read rather than guessed. Pass a paper prefix.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
prefix = sys.argv[1] if len(sys.argv) > 1 else "A-C1"
path = next(p for p in sorted((ROOT / "_work" / "flat").glob(prefix + "*.tex"))
            if PIC.search(p.read_text(encoding="utf-8", errors="replace")))
print(path.stem)

for pic in PIC.findall(path.read_text(encoding="utf-8", errors="replace")):
    m = re.match(r"\\begin\{tikzpicture\}", pic)
    body = pic[m.end():].lstrip()
    head, pos = cetz._opts_at(body, 0)
    if head is None:
        print("head options unread")
        continue
    base = cetz._transform(head)
    if len(sys.argv) > 2:
        for k, v in head.items():
            print("head %r => %r" % (k, str(v)[:140]))
        for k, v in cetz.picture_styles(head).items():
            print("style %s => %s" % (k, v))
    body = expand = cetz.expand_foreach(body[pos:])
    if expand is None:
        print("foreach")
        continue
    body = expand
    end = body.rfind("\\end{tikzpicture}")
    body = body[:end] if end >= 0 else body
    cols = cetz._colors(body)
    if cols is None or cetz.UNSUPPORTED.search(cols[1]):
        print("colors/unsupported: %s" % str(sorted(cetz.UNSUPPORTED.findall(cols[1]))[:4])
              if cols else "colors")
        continue
    pal, body = cols
    placed = cetz.scoped(body, base)
    if placed is None:
        print("scope")
        continue
    styles = cetz.picture_styles(head)
    names = {}
    for stmt, xf in placed:
        cetz.register(stmt, names, xf, styles)
    for stmt, xf in placed:
        got = cetz.translate_statement(stmt, names, xf, pal, styles)
        if got is None:
            print("REFUSED statement:\n  %s\n  opts=%s\n  size=%s" % (
                " ".join(stmt.split())[:220],
                str(cetz.resolve_opts(cetz._opts_at(stmt, 5)[0] or {}, styles))[:220],
                str(cetz.node_size(
                    cetz.resolve_opts(cetz._opts_at(stmt, 5)[0] or {}, styles), xf))))
            break
    else:
        print("draws: %d statements" % len(placed))
