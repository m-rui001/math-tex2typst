r"""Run the sandbox converter over the three refused pictures and report.

build() is the whole converter without the compile gate; when it returns None the same steps are
replayed here so the refusing statement or option is printed instead of guessed.
"""
import sys
sys.path.insert(0, r"E:\math\_work\pic-pgfmath")
from t2t import cetz

OWN = ("Finite-cylinder-approximation-of-ruled-sets", "Universal-Tensor-Squares-for-Symmetric-Groups",
       "Critical-strip-crossing-mass-on-the-honeycomb-lattice")

text = open(r"E:\math\_work\refused_pic_detail.txt", encoding="utf-8").read()
PICS = {}
for b in text.split("### "):
    if not b.strip():
        continue
    name = b.splitlines()[0]
    if name.startswith(OWN):
        src = b[b.index("\\begin{tikzpicture}"):]
        PICS[name] = src[:src.index("\\end{tikzpicture}") + len("\\end{tikzpicture}")]


def replay(pic):
    """build() step by step; (label, value) for the first step that refuses, else the canvas."""
    m = cetz.re.match(r"\\begin\{tikzpicture\}", pic)
    body = pic[m.end():].lstrip()
    head, pos = cetz._opts_at(body, 0)
    base = cetz._transform(head)
    body = body[pos:]
    body = body[:body.rfind("\\end{tikzpicture}")]
    for label, fn in (("def", cetz.expand_def), ("foreach", cetz.expand_foreach),
                      ("def2", cetz.expand_def), ("pgfmath", cetz.expand_pgfmath),
                      ("ifnum", cetz.expand_ifnum), ("clips", cetz.drop_clips)):
        body = fn(body)
        if body is None:
            return label, None
    extra, body = cetz.expand_tikzset(body)
    if body is None:
        return "tikzset", None
    cols = cetz._colors(body, None)
    if cols is None:
        return "colors", None
    pal, body = cols
    hit = cetz.UNSUPPORTED.search(body)
    if hit:
        return "unsupported " + hit.group(0), None
    placed = cetz.scoped(body, base)
    if placed is None:
        return "scoped", None
    styles = cetz.picture_styles(head)
    styles.update(extra)
    names = {}
    for stmt, xf in placed:
        cetz.register(stmt, names, xf, styles)
    for stmt, xf in placed:
        if cetz.translate_statement(stmt, names, xf, pal, styles) is None:
            return "statement", stmt
    return "built", cetz.build(pic)


for name, pic in sorted(PICS.items()):
    print("=" * 72)
    print(name)
    label, value = replay(pic)
    if label != "built" or value is None:
        print("  REFUSED at", label)
        print("  ", repr(value)[:300] if value else "")
    else:
        canvas = value
        print("  BUILDS: %d lines, rect=%d line=%d circle=%d curve=%d write=%d" % (
            canvas.count("\n"), canvas.count("rect("), canvas.count("line("),
            canvas.count("circle("), canvas.count("curve("), canvas.count("write(")))
        out = r"E:\math\_work\pic-pgfmath\canvas_" + name.split("-")[0].lower() + ".txt"
        open(out, "w", encoding="utf-8").write(canvas)
        print("  ->", out)
