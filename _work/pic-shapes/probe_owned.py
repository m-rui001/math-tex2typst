r"""Which statement of each owned picture makes the builder give up?

Rebuilds the production call (`convert.py:333` feeds the picture through `cetz.convert` with the
preamble's own colour table and `\linewidth`) and then replays `build()` statement by statement
against the same scope transforms, with the same palette, so a refusal named here is the one the
batch actually hits and not an artefact of a colour table the probe forgot.
"""
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "_work" / "pic-shapes"))
from t2t import cetz, convert, prep  # noqa: E402

OWNED = {
    "ellipse": ("Elliptic-capacity-propagation-and-Fourier-restriction", 0),
    "loop": ("Translative-covering-densities-of-order-n-log-n", 1),
    "node": ("Thompsons-group-F-is-nonamenable", 0),
}


def pictures(key):
    name, idx = OWNED[key]
    path = next((ROOT / "_work" / "flat").glob(name + "*.tex"))
    src = path.read_text(encoding="utf-8", errors="replace")
    pre_text, _ = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    cm = convert.line_cm(p)
    core = cetz.MATH_ENVELOPE.sub("", src)
    pic = re.findall(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", core, re.S)[idx]
    return path.name, p, cm, cetz.expand_linewidth(pic, cm)


def statements(core):
    """The (statement, transform) pairs build() walks, straight out of the same code."""
    m = re.match(r"\\begin\{tikzpicture\}", core)
    body = core[m.end():].lstrip()
    head, pos = cetz._opts_at(body, 0)
    base = cetz._transform(head)
    body = body[pos:]
    body = body[:body.rfind("\\end{tikzpicture}")]
    body = cetz.expand_def(body)
    body = cetz.expand_foreach(body)
    body = cetz.expand_def(body)
    body = cetz.expand_pgfmath(body)
    body = cetz.expand_ifnum(body)
    body = cetz.drop_clips(body)
    extra, body = cetz.expand_tikzset(body)
    pal, body = cetz._colors(body, None)
    return cetz.scoped(body, base), head, extra, pal


for key in ("ellipse", "loop", "node"):
    fname, p, cm, core = pictures(key)
    print("=== %s  (%s, linewidth %.2f cm)" % (key, fname[:60], cm))
    print("    build(preamble colours) ->", "canvas" if cetz.build(core, p.colors) else "None")
    placed, head, extra, pal = statements(core)
    styles = cetz.picture_styles(head)
    styles.update(extra)
    names = {}
    for stmt, xf in placed:
        cetz.register(stmt, names, xf, styles)
    print("    rings remembered:", {k: v[4] for k, v in names.items() if len(v) > 4 and v[4]})
    for stmt, xf in placed:
        got = cetz.translate_statement(stmt, dict(names), xf, pal, styles)
        if got is None:
            print("  REFUSES  %s" % " ".join(stmt.split())[:118])
