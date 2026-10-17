"""The statement list one picture is cut into, before any translation.

A canvas that draws a single box from an eight-node picture means the body was cut wrong, not
that a statement was refused. Print what each stage hands to the next: the raw pieces, the
scoped pairs, and the lines each pair emits. Run: python _work/pic_statements.py <prefix> [index]
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
prefix = sys.argv[1]
want = int(sys.argv[2]) if len(sys.argv) > 2 else 0

path = next(p for p in sorted((ROOT / "_work" / "flat").glob(prefix + "*.tex"))
            if PIC.search(p.read_text(encoding="utf-8", errors="replace")))
pics = PIC.findall(path.read_text(encoding="utf-8", errors="replace"))
pic = pics[want]
print("%s: picture %d of %d" % (path.stem, want, len(pics)))

m = re.match(r"\\begin\{tikzpicture\}", pic)
body = pic[m.end():].lstrip()
head, pos = cetz._opts_at(body, 0)
base = cetz._transform(head)
body = cetz.expand_foreach(body[pos:])
end = body.rfind("\\end{tikzpicture}")
body = body[:end]
pal, body = cetz._colors(body)
styles = cetz.picture_styles(head)

print("---- pieces (%s) ----" % getattr(cetz, "PIECES", None))
for name in ("pieces", "statements", "split_statements"):
    fn = getattr(cetz, name, None)
    if fn:
        got = fn(body)
        print("%s -> %d" % (name, len(got)))
        for i, item in enumerate(got):
            print("  [%d] %s" % (i, " ".join(str(item).split())[:200]))

placed = cetz.scoped(body, base)
print("---- scoped: %d pairs ----" % len(placed))
names = {}
for stmt, xf in placed:
    cetz.register(stmt, names, xf, styles)
for i, (stmt, xf) in enumerate(placed):
    got = cetz.translate_statement(stmt, names, xf, pal, styles)
    print("  [%d] %s => %s" % (i, " ".join(stmt.split())[:120],
                              "None" if got is None else
                              " ".join(got[0].split())[:120] if got else "empty"))
