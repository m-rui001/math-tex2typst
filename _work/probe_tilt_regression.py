"""Tilted pictures that refuse today, and what the refusal is: the statement that gives up.

The comparison matters because before the matrix `_transform` did not know 'rotate' at all, so a
tilted scope drew UNTURNED: a picture refusing today may have 'converted' in run62 by lying.
Stripping the tilt and rebuilding tells which pictures are of that kind.
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
TILT = re.compile(r"rotate\s*=|rotate around\s*=|(?:^|[,{\s])[xy]\s*=\s*\{?\(")
STRIP = re.compile(r"(?:rotate around\s*=\s*\{[^{}]*\}|rotate\s*=\s*-?[\d.]+(?:\s*deg)?|"
                   r"[xy]\s*=\s*\{?\([^()]*\)\}?)[,]?\s*")
SHAPE = re.compile(r"\\(?:draw|fill|filldraw|path|node)\b[^;]*?\b(ellipse|arc|grid|circle|"
                   r"rectangle|node|plot|to|parabola|controls)")

causes = Counter()
kinds = Counter()
for f in sorted(Path("_work/flat").glob("*.tex")):
    for pic in PIC.findall(f.read_text(encoding="utf-8", errors="replace")):
        if not TILT.search(pic):
            continue
        if cetz.build(pic) is not None:
            kinds["draws turned today"] += 1
            continue
        drew_unturned = cetz.build(STRIP.sub("", pic)) is not None
        kinds["refused: drew unturned before" if drew_unturned
              else "refused either way"] += 1
        if not drew_unturned:
            continue
        # name the statement that gives up
        m = re.match(r"\\begin\{tikzpicture\}", pic)
        head, pos = cetz._opts_at(pic[m.end():].lstrip(), 0)
        base = cetz._transform(head)
        body = pic[m.end():].lstrip()[pos:]
        body = body[:body.rfind("\\end{tikzpicture}")]
        pairs = cetz.scoped(body, base)
        if not pairs:
            causes["the scope's own options"] += 1
            continue
        names, styles = {}, {}
        for stmt, xf in pairs:
            if cetz.translate_statement(stmt, names, xf, None, styles) is None:
                hit = SHAPE.search(stmt)
                causes[hit.group(1) if hit else stmt.strip()[:26]] += 1
                break

print(dict(kinds))
print("failing shape of a picture that drew UNTURNED before:")
for k, n in causes.most_common():
    print("  %2d  %s" % (n, k))
