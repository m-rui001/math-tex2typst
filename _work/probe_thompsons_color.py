r"""Why does the probe refuse the Thompsons picture the page actually draws?

Hypothesis: production hands cetz the preamble's colour palette (convert.py:333 passes p.colors),
the probe calls cetz._colors(body) with no preamble, so a \textcolor{parentblue} node is opaque.
Test both ways on that one picture. Read-only over tools/.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz, convert, prep  # noqa: E402

PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
tex = ROOT / "_work" / "flat" / "Thompsons-group-F-is-nonamenable-September-23-2026.tex"
src = tex.read_text(encoding="utf-8", errors="replace")
pre_text, body = prep.split_document(src)
p = prep.parse_preamble(pre_text)
pic = [mm.group(0) for mm in PICTURE.finditer(body)
       if mm.group(0).startswith("\\begin{tikzpicture}")][0]
core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", pic), convert.line_cm(p))
core = prep.expand_macros(core, p.macros)
m = re.match(r"\\begin\{tikzpicture\}", core)
head, pos = cetz._opts_at(core[m.end():].lstrip(), 0)
bodytext = core[m.end():].lstrip()[pos:]
bodytext = bodytext[:bodytext.rfind("\\end{tikzpicture}")]
bodytext = cetz.expand_foreach(cetz.expand_def(bodytext))
print("preamble colors defined:", sorted(p.colors)[:8], "count", len(p.colors))
print("_colors without preamble:", (cetz._colors(bodytext) or [None, bodytext[:0]])[0])
got = cetz._colors(bodytext, p.colors)
print("_colors with preamble palette:", got[0] if got else None)
print("production line_cm: %.3f" % convert.line_cm(p))
# the production call itself, colours in: cetz.convert(src, p.colors, line_cm(p), refs=...)
canvas = cetz.convert(pic, p.colors, convert.line_cm(p))
print("cetz.convert WITH colours:", "canvas" if canvas else None)
canvas_noc = cetz.convert(pic, None, convert.line_cm(p))
print("cetz.convert WITHOUT colours (what the probe does):", "canvas" if canvas_noc else None)
