r"""Walk one picture through `cetz.build` stage by stage and print the stage that stops it.

`build` returns a bare None, so the stage is recovered by replaying its steps here; the compile gate
is never reached, which keeps typst out of the probe.
"""
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from t2t import cetz, convert, prep

PAPERS = [
    "Mass-and-covering-exponents-for-fixed-length-honeycomb-walks",
    "The-joint-scaling-limit-of-critical-Ashkin-Teller-currents",
    "Nonuniqueness-with-local-conservation-for-the-hard-sphere",
]
FLAT = Path("E:/math/_work/flat")
WANT = {"plot[smooth]": "smooth", "samples": "samples"}


def stages(pic, cm, colors=None):
    """-> (stage label or 'canvas', detail)"""
    tikz = cetz.expand_linewidth(pic, cm)
    m = re.match(r"\\begin\{tikzpicture\}", tikz)
    body = tikz[m.end():].lstrip()
    head, pos = cetz._opts_at(body, 0)
    if head is None:
        return "head-options", ""
    base = cetz._transform(head)
    if base is None:
        return "head-transform", str(head)
    body = cetz.MATH_ENVELOPE.sub("", body[pos:])
    end = body.rfind("\\end{tikzpicture}")
    body = body[:end]
    for name, fn in (("def", cetz.expand_def), ("foreach", cetz.expand_foreach)):
        out = fn(body)
        if out is None:
            return name, ""
        body = out
    body = cetz.expand_def(body)
    out = cetz.expand_pgfmath(body)
    if out is None:
        return "pgfmath", ""
    body = out
    out = cetz.expand_ifnum(body)
    if out is None:
        return "ifnum", ""
    body = out
    body = cetz.drop_clips(body)
    extra, body = cetz.expand_tikzset(body)
    cols = cetz._colors(body, colors)
    if cols is None:
        return "colors", ""
    if cetz.UNSUPPORTED.search(cols[1]):
        return "unsupported", cetz.UNSUPPORTED.search(cols[1]).group(0)
    pal, body = cols
    placed = cetz.scoped(body, base)
    if placed is None:
        return "scoped", ""
    styles = cetz.picture_styles(head)
    styles.update(extra)
    names = {}
    for stmt, xf in placed:
        cetz.register(stmt, names, xf, styles)
    for stmt, xf in placed:
        got = cetz.translate_statement(stmt, names, xf, pal, styles)
        if got is None:
            return "statement", stmt.strip()[:200]
    return "canvas", "%d statements" % len(placed)


for prefix in PAPERS:
    src_path = next(p for p in sorted(FLAT.glob(prefix + "*.tex")))
    src = src_path.read_text(encoding="utf-8")
    pre_text, _ = prep.split_document(src)
    cm = convert.line_cm(prep.parse_preamble(pre_text))
    for i, pic in enumerate(m.group(0) for m in cetz.PICTURE_ENV.finditer(src)):
        stage, detail = stages(pic, cm)
        hit = next((k for k in WANT if k in pic), None)
        if stage != "canvas" or hit:
            print("%-52s #%d %-10s %s" % (prefix[:52], i, stage,
                                          detail.replace("\n", " ")[:150]))
