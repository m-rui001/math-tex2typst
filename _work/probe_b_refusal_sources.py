r"""For every in-figure formula the live `math_safe` refuses, print the RAW source math
(the string `_math_body` received) next to the quoted string it fell back to.

Detection is exact: wrap `math_safe` to raise a flag when it returns False, and wrap
`_math_body` to check that flag right after it runs -- the fallback at the end of
`_math_body` is the only consumer.  Read-only, no typst, no `cetz.py` edit.
"""
import pathlib
import re
import sys
from collections import Counter

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "_work"))
sys.path.insert(0, str(ROOT / "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz, prep  # noqa: E402
from t2t.convert import line_cm  # noqa: E402

PIC = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
hits = []
current = None
flag = {"refused": False}

_orig_body = cetz._math_body
_orig_safe = cetz.math_safe


def safe_wrap(tex):
    ok = _orig_safe(tex)
    if not ok:
        flag["refused"] = True
    return ok


def body_wrap(tex):
    flag["refused"] = False
    out = _orig_body(tex)
    if flag["refused"]:
        hits.append((current, tex, out))
    return out


cetz.math_safe = safe_wrap
cetz._math_body = body_wrap
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    current = path.stem
    source = path.read_text(encoding="utf-8", errors="replace")
    try:
        wide = line_cm(prep.parse_preamble(source))
    except Exception:
        wide = None
    for m in PIC.finditer(source):
        core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), wide)
        cetz.build(core) or cetz.build_cd(core)
cetz.math_safe = _orig_safe
cetz._math_body = _orig_body

for paper, raw, out in hits:
    print("%-44s RAW %-38s -> %s" % (paper[:44], raw[:38], out[:38]))
print("total refused:", len(hits))
