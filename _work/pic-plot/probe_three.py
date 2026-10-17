r"""Replay the three refused pictures through the sandbox converter, naming the statement that
returns None and the point list the plot reader produced for it.

The compile gate is skipped on purpose: `cetz.build` returns the canvas without paying typst.
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

failed = []
original = cetz.translate_statement


def spy(stmt, names, xf=cetz.IDENT, pal=None, styles=None):
    got = original(stmt, names, xf, pal, styles)
    if got is None:
        failed.append(stmt[:160])
    return got


cetz.translate_statement = spy

for prefix in PAPERS:
    src_path = next(p for p in sorted(FLAT.glob(prefix + "*.tex")))
    src = src_path.read_text(encoding="utf-8")
    pre_text, _ = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    cm = convert.line_cm(p)
    palette = None
    for i, pic in enumerate(cetz.PICTURE_ENV.findall(src)):
        core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", pic), cm)
        del failed[:]
        got = cetz.build(core, palette)
        print("=== %s #%d -> %s" % (prefix, i, "canvas %d lines" % len(got.splitlines())
                                    if got else "REFUSED"))
        for stmt in failed:
            print("    fail:", stmt.replace("\n", " "))
