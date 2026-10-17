"""Which TikZ statement a refused picture dies on.

Replays build()'s expansion chain, then asks translate_statement for each placed
statement and prints the first one it cannot draw -- the refusal is reported at the
picture level, so without this the family list says 'statement' and nothing more.
"""
import os
import re
import sys
import glob

sys.path.insert(0, os.path.join("tools"))
from t2t import cetz

FLAT = os.path.join("_work", "flat")


def first_refusal(tikz, line_cm=None):
    m = re.match(r"\\begin\{tikzpicture\}", tikz)
    if not m:
        return None, "not a picture"
    body = tikz[m.end():].lstrip()
    head, pos = cetz._opts_at(body, 0)
    if head is None:
        return None, "opts"
    base = cetz._transform(head)
    if base is None:
        return None, "transform"
    body = body[pos:]
    end = body.rfind("\\end{tikzpicture}")
    if end < 0:
        return None, "fragment"
    body = body[:end]
    body = cetz.expand_def(body)
    body = cetz.expand_foreach(body)
    if body is None:
        return None, "foreach"
    body = cetz.expand_def(body)
    body = cetz.expand_pgfmath(body)
    if body is None:
        return None, "pgfmath"
    body = cetz.expand_ifnum(body)
    if body is None:
        return None, "ifnum"
    body = cetz.drop_clips(body)
    extra, body = cetz.expand_tikzset(body)
    cols = cetz._colors(body, None)
    if cols is None:
        return None, "colors"
    if cetz.UNSUPPORTED.search(cols[1]):
        return None, "unsupported:%s" % cetz.UNSUPPORTED.search(cols[1]).group(0)
    pal, body = cols
    placed = cetz.scoped(body, base)
    if placed is None:
        return None, "scoped"
    styles = cetz.picture_styles(head)
    styles.update(extra)
    names = {}
    for stmt, xf in placed:
        cetz.register(stmt, names, xf, styles)
    for stmt, xf in placed:
        if cetz.translate_statement(stmt, names, xf, pal, styles) is None:
            return stmt, None
    return None, "empty"


def main():
    pats = sys.argv[1:] or ["*"]
    n = 0
    for pat in pats:
        for path in sorted(glob.glob(os.path.join(FLAT, pat + ".tex"))):
            tex = open(path, encoding="utf-8", errors="replace").read()
            for m in cetz.PICTURE.finditer(tex):
                end = tex.find("\\end{tikzpicture}", m.start())
                if end < 0:
                    continue
                tikz = cetz.expand_linewidth(tex[m.start():end + len("\\end{tikzpicture}")], None)
                stmt, why = first_refusal(cetz.expand_linewidth(tex[m.start():end + len("\\end{tikzpicture}")], None))
                if why is not None or stmt is not None:
                    n += 1
                    print("---- %s | %s" % (os.path.basename(path)[:44], why or "statement"))
                    if stmt:
                        print("     %s" % stmt.strip()[:300])
    print("refusals shown: %d" % n)


if __name__ == "__main__":
    main()
