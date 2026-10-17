r"""Is a prime a legal script base in Typst math? `math_safe` says no, and the page pays for it.

`_math_body`'s last resort (cetz.py:1351) quotes a whole formula when `math_safe` trips, and Typst
then prints every `_`, `^` and command name inside it as the characters the author typed. One of the
two KL flowchart boxes reaches the page as `$"P_(y,b)=P'_( iota (y),b')"$` for that reason, and the
trip is `math_safe`'s "a script with no base" test, whose lookbehind class lists letters, digits,
`"`, `}` and `)` -- but not `'`. The body channel of the same paper emits `$P_(u \, b) = P'_(u' \, b')$`
as real math and it compiles, which is the counter-evidence; this asks Typst directly, one case per
document so a failure cannot hide the others, and reads the rendered glyphs back so "compiles" is not
mistaken for "sets a subscript".
"""
import pathlib
import subprocess
import sys

import pymupdf

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "tools"))
from t2t import cetz  # noqa: E402

ROOT = pathlib.Path(__file__).resolve().parents[1] / "_work"
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

CASES = [
    r"$P'_{u,b}$",        # the shape that trips the guard: prime, then a grouped subscript
    r"$P'_u$",            # same, unbraced
    r"$P'^{2}$",          # prime with a superscript
    r"$a'_1'_2$",         # prime inside a script
    r"$'_u$",             # a prime with no atom at all -- must still fail
    r"$P_(u,b)$",         # the shape _group_scripts actually hands the guard
    r"$a_b$",             # control: the ordinary case
    '$"P\'_(u,b)"$',      # what the fallback prints instead: the whole formula as one string
]

typ = ROOT / "prime_probe.typ"
out = ROOT / "prime_probe.pdf"
for case in CASES:
    typ.write_text("#set page(width: 200pt, height: 40pt, margin: 4pt)\n" + case,
                   encoding="utf-8")
    if out.exists():
        out.unlink()
    r = subprocess.run(["typst", "compile", str(typ), str(out)], capture_output=True,
                       text=True, encoding="utf-8", errors="replace")
    if r.returncode:
        first = next((l for l in (r.stderr or "").splitlines() if l.startswith("error")), "")
        print("  %-14s rc=1  %s" % (case, first[:110]))
        continue
    doc = pymupdf.open(str(out))
    page = doc[0]
    glyphs = page.get_text().replace("\n", " ").strip()
    literal = " ".join(w for w in ("_", "^") if page.search_for(w))
    doc.close()
    print("  %-14s ok  glyphs=%-14r literal=%s" % (case, glyphs, literal or "-"))

print("== what math_safe says today")
for case in CASES[:-1]:
    body = case[1:-1]
    print("  %-14s safe=%-5s  _math_body -> %s"
          % (case, cetz.math_safe(body), cetz._math_body(body)))
