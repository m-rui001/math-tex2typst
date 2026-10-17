"""The statements a node refusal dies on, in full.

The census truncates the statement to its verb, which hides whether the 13 remaining node
refusals are one shape or thirteen. Each picture is replayed through build()'s own stages and
the statement `translate_statement` gives up on is printed whole.
"""
import io
import re
import sys
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
VERB = re.compile(r"\\(draw|fill|filldraw|path|node|coordinate|shade|scope)\b")

for f in sorted(Path("_work/flat").glob("*.tex")):
    for pic in PIC.findall(f.read_text(encoding="utf-8", errors="replace")):
        if cetz.build(pic) is not None:
            continue
        m = re.match(r"\\begin\{tikzpicture\}", pic)
        body = pic[m.end():].lstrip()
        head, pos = cetz._opts_at(body, 0)
        base = head and cetz._transform(head)
        body = body[pos:]
        for fn in (cetz.expand_def, cetz.expand_foreach, cetz.expand_pgfmath,
                   cetz.expand_ifnum):
            body = fn(body) or body
        end = body.rfind("\\end{tikzpicture}")
        cols = base and cetz._colors(cetz.drop_clips(body[:end]))
        if not cols:
            continue
        pal, body2 = cols
        placed = cetz.scoped(body2, base)
        if placed is None:
            continue
        styles = cetz.picture_styles(head)
        names = {}
        for stmt, xf in placed:
            cetz.register(stmt, names, xf, styles)
        for stmt, xf in placed:
            if cetz.translate_statement(stmt, names, xf, pal, styles) is None:
                v = VERB.search(stmt)
                print("%-6s %-38s %s" % (v.group(1) if v else "?", f.stem[:38],
                                         " ".join(stmt.split())[:130]))
                break
