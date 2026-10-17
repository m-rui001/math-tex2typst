r"""Regression scan: does this change move any OTHER paper's pictures?

Every flat paper holding a `plot` is replayed through one t2t tree and each picture is recorded as
drawn or refused by `cetz.build` (the drawing decision, without the typst compile gate this task must
never call). Two runs, live and sandbox, then their difference: only the three pictures of this
family may move, and any other gain or loss has to be explained.

Run: python _work/pic-plot/scan_all.py tools > _work/pic-plot/scan_live.txt
     python _work/pic-plot/scan_all.py _work/pic-plot > _work/pic-plot/scan_sandbox.txt
"""
import sys
from pathlib import Path

root = Path(sys.argv[1]).resolve()
sys.path.insert(0, str(root))
from t2t import cetz, convert, prep  # noqa: E402

FLAT = Path("E:/math/_work/flat")
for path in sorted(FLAT.glob("*.tex")):
    src = path.read_text(encoding="utf-8")
    if "plot" not in src:
        continue
    try:
        pre_text, _ = prep.split_document(src)
        cm = convert.line_cm(prep.parse_preamble(pre_text))
    except Exception:  # a preamble this converter cannot read is not this scan's business
        cm = 0.5
    drawn = refused = 0
    refused_at = []
    for i, m in enumerate(cetz.PICTURE_ENV.finditer(src)):
        canvas = cetz.build(cetz.MATH_ENVELOPE.sub("", m.group(0)), None, cm)
        if canvas is not None and cetz.sane(canvas):
            drawn += 1
        else:
            refused += 1
            refused_at.append(i)
    if refused or drawn:
        print("%s drawn=%d refused=%d %s" % (path.name[:60], drawn, refused, refused_at))
