r"""The real emitter input for the last refused display, and what in it texmath rejects.

The quoted text in main.typ is '$ ' + clean(latex) + ' $' with the equation number baked in
front of it, so feeding that quote back was feeding pandoc a mangled string. The report's
math_unconverted sample is the original formula, space-normalised; bisect that instead.
"""
import io
import json
import pathlib
import re
import sys

sys.path.insert(0, str(pathlib.Path("tools").resolve()))
from t2t import mathconv  # noqa: E402

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]

VARIANTS = [
    ("drop label", lambda s: re.sub(r"\\label\s*\{[^{}]*\}", "", s)),
    ("drop tag", lambda s: re.sub(r"\\tag\s*\*?\{[^{}]*\}", "", s)),
    ("drop nonumber", lambda s: re.sub(r"\\non(umber|tag)\b", "", s)),
    ("equation->displaymath", lambda s: re.sub(r"\\(begin|end)\{equation\*?\}",
                                               r"\\\1{gathered}", s)),
    ("strip env", lambda s: re.sub(r"\\(?:begin|end)\{[a-z*]+\}(?:\[[^\]]*\])?", "", s)),
    ("rm trailing row break", lambda s: re.sub(r"\\\\\s*(?=\\end)", "", s)),
    ("text{rm}->mathrm", lambda s: re.sub(r"\\text\s*\{\s*\\(?:rm|mathrm)\s*\{?([^{}]*?)\}?\s*\}",
                                          r"\\mathrm{\1}", s)),
]

for path in sorted((ROOT / "typst").glob("Exact-Birch*/*.typ")):
    rep = json.loads((path.parent / "report.json").read_text(encoding="utf-8", errors="replace"))
    sample = rep.get("stats", {}).get("samples", {}).get("math_unconverted")
    if not sample:
        print("no sample in %s" % path.parent.name)
        continue
    print("original (%d chars): %s" % (len(sample), sample))
    for label, fix in VARIANTS:
        got = mathconv.convert_formulas([fix(sample)], None)[0].get(0)
        print("    %-22s converts: %s" % (label, bool(got)))
    acc = sample
    for _l, fix in VARIANTS:
        acc = fix(acc)
    got = mathconv.convert_formulas([acc], None)[0].get(0)
    print("    ALL TOGETHER           converts: %s -> %s"
          % (bool(got), " ".join((got or "").split())[:170]))
