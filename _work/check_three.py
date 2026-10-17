"""Three small claims: a page-break block disappears, an accessibility macro expands,
a borrowed \\tag{\\ref{}} resolves to text.

Run: python _work/check_three.py
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import macros, mathconv, prep  # noqa: E402

BS = chr(92)
PAGE1 = r"\par\ifdim\dimexpr\pagegoal-\pagetotal\relax<6\baselineskip\newpage\fi}"
PAGE2 = (r"\par" + "\n" + r"\begingroup" + "\n  " + r"\dimen0=\pagegoal" + "\n  "
         + r"\advance\dimen0 by -\pagetotal" + "\n  "
         + r"\ifdim\dimen0<7\baselineskip" + "\n    " + r"\newpage" + "\n  "
         + r"\fi" + "\n" + r"\endgroup")

for name, src in (("par ifdim", PAGE1), ("begingroup dimen", PAGE2)):
    out = prep.fix_dialect_prose(src)
    print("%-18s -> %r" % (name, out))
    assert not re.search(r"\\ifdim|\\pagegoal|\\baselineskip", out), name

DEF = r"\newcommand{\boldone}{\mathord{\MathActualText{D835DFCF}{\mathbf1}}}" + "\n" \
    + r"\renewcommand{\MathActualText}[2]{\accsupp{#1}{#2}}" + "\n" \
    + r"\newcommand{\longhookrightarrowactual}{\HookArrowActualText{\lhook\joinrel\longrightarrow}}" + "\n" \
    + r"\let\HookArrowActualText\relax"
table, skipped = macros.parse_definitions(DEF)
print("table:", sorted(table), "skipped:", len(skipped))
for mac in ("\\boldone", "\\longhookrightarrowactual"):
    got = macros.expand(mac + "{}", table)
    print("  %-26s -> %s" % (mac, got))
    assert got != mac + "{}", mac
    print("      clean: %s" % mathconv.clean(got, {}))

print("tag:", repr(mathconv.refs_as_text(r"\ref{ord:support}.1", {"ord:support": ("3.7", "")})))
print("tag unknown:", repr(mathconv.refs_as_text(r"\ref{nope}.1", {"ord:support": ("3.7", "")})))
print("ok")
