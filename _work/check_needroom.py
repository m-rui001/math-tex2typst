r"""Does the page-metric block survive fix_dialect_prose once it comes from a macro?

\\needroom{11\\baselineskip} expands to a two-line \\par\\ifdim...\\fi, and the corpus still
shows that text in markup, so either the expansion keeps something the rule will not
match or the drop runs before the expansion.
"""
import io
import pathlib
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import prep  # noqa: E402

src = next((ROOT / "_work" / "flat").glob("A-positive-solution-to*.tex"))
text = src.read_text(encoding="utf-8", errors="replace")
pre, body = prep.split_document(text)
p = prep.parse_preamble(pre)
print("needroom in table:", "\\needroom" in p.macros)
mac = p.macros.get("\\needroom")
print("body of macro: %r" % (mac.body if mac else "",))
exp = prep.expand_macros("\\needroom{11\\baselineskip}", p.macros)
print("expands to: %r" % exp)
print("after prose fixes: %r" % prep.fix_dialect_prose(exp))
got = body.count("\\needroom")
print("uses in body: %d" % got)
after = prep.fix_dialect_prose(prep.expand_macros(body, p.macros))
print("pagegoal left in whole body: %d ; ifdim: %d"
      % (after.count("pagegoal"), after.count("ifdim")))
i = after.find("pagegoal")
print("context: %r" % (after[max(0, i - 120):i + 90],))
