r"""Ask Typst, formula by formula, whether the 81 figure formulas the guard refuses would actually set.

`math_safe`'s "script with no base" test (cetz.py:1264) is an allow-list of what may stand before a
`_`/`^`: alphanumerics and `"`, `}`, `)`, `]`. Everything else -- a prime, a closing `|` of a norm, a
`+`, a tensor glyph -- loses its maths on the page: `_math_body` quotes the formula and Typst prints
the author's own `_`, `^` and command names as letters. Before widening a guard whose failure mode is
"a picture that no longer compiles" (the gate then drops the WHOLE figure, cetz.py:1304), this takes
the refused formulas out of the real corpus, deduplicates them, and compiles each one as the math it
was meant to be. A formula that now compiles is a wrong refusal; one that still errors is the guard
earning its keep, and its error is printed so the rule can be read off the data.
"""
import pathlib
import re
import subprocess
import sys
from collections import Counter

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "_work"))
sys.path.insert(0, str(ROOT / "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz, prep  # noqa: E402
from t2t.convert import line_cm  # noqa: E402  the batch's own \linewidth -> cm

PIC = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
NOBASE = re.compile(r"(?:^|[^A-Za-z0-9\"}\)\]])[\^_]")

REFUSED = {}
_orig = cetz.math_safe


def wrap(tex):
    ok = _orig(tex)
    if not ok and NOBASE.search(tex):
        REFUSED.setdefault(tex, 0)
        REFUSED[tex] += 1
    return ok


def collect():
    cetz.math_safe = wrap
    for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
        source = path.read_text(encoding="utf-8", errors="replace")
        try:
            wide = line_cm(prep.parse_preamble(source))
        except Exception:
            wide = None
        for m in PIC.finditer(source):
            core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), wide)
            cetz.build(core) or cetz.build_cd(core)
    cetz.math_safe = _orig


collect()
print("distinct formulas refused for a script with no base: %d (%d occurrences)"
      % (len(REFUSED), sum(REFUSED.values())))

typ = ROOT / "_work" / "refused_formula.typ"
out = ROOT / "_work" / "refused_formula.pdf"
tally = Counter()
shown = Counter()
for tex in sorted(REFUSED):
    typ.write_text(cetz.HEADER + "#set page(width: 200pt, height: 40pt, margin: 4pt)\n"
                   "$" + tex + "$\n", encoding="utf-8")
    r = subprocess.run(["typst", "compile", str(typ), str(out)], capture_output=True,
                       text=True, encoding="utf-8", errors="replace")
    base = NOBASE.search(tex).group(0)[-2:-1] or "start"
    if r.returncode:
        first = next((l for l in (r.stderr or "").splitlines() if l.startswith("error")), "?")
        tally["refused before " + repr(base)] += 1
        if shown["refused"] < 6:
            shown["refused"] += 1
            print("  STILL-BAD> %r\n      %s" % (tex[:80], first[:120]))
    else:
        tally["WRONGLY refused before " + repr(base)] += 1
        if shown["wrong"] < 6:
            shown["wrong"] += 1
            print("  WRONG> %r" % (tex[:90],))
for key, n in sorted(tally.items(), key=lambda kv: -kv[1]):
    print("  %-32s %3d formulas" % (key, n))
