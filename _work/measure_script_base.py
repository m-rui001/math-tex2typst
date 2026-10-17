r"""Exactly which characters may stand before a `_` in Typst math -- the set `math_safe` guesses at.

`math_safe`'s "a script with no base" test (cetz.py:1264) refuses a `_` unless the character before it
is alphanumeric or one of `"`, `}`, `)`, `]`. Every refusal costs a formula its maths: `_math_body`
falls back to `'"..."'`, and a quoted string in math prints `_`, `^` and command names as the letters
the author typed (measured: `$"P'_(u,b)"$` sets a literal underscore, 159 such figure formulas over 87
papers). A prime is a legal base and the guard does not know it. Rather than patch one character
because one picture complained, this asks Typst what it accepts, one document per prefix, and records
both the compile result and whether a literal `_` still reaches the page -- a shape that compiles by
setting the underscore as text is no better than a refusal.
"""
import pathlib
import subprocess
import sys

import pymupdf

ROOT = pathlib.Path(__file__).resolve().parents[1] / "_work"
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

PREFIXES = ("a", "0", "'", '"', "}", ")", "]", "+", "-", "=", ",", ";", ":", "/", "<", ">",
            "|", "(", "[", "{", "&", "#", "~", ".", "*", "?", "!", " ")
SUFFIX = "_(u,b)"

typ = ROOT / "script_base.typ"
out = ROOT / "script_base.pdf"
accepted, printed, failed = [], [], []
for prefix in PREFIXES:
    case = "$P%s%s$" % (prefix, SUFFIX)
    typ.write_text("#set page(width: 200pt, height: 40pt, margin: 4pt)\n" + case,
                   encoding="utf-8")
    r = subprocess.run(["typst", "compile", str(typ), str(out)], capture_output=True,
                       text=True, encoding="utf-8", errors="replace")
    if r.returncode:
        first = next((l for l in (r.stderr or "").splitlines() if l.startswith("error")), "?")
        failed.append((prefix, first.split(":")[-1].strip()[:40]))
        continue
    doc = pymupdf.open(str(out))
    page = doc[0]
    glyphs = page.get_text().replace("\n", " ").strip()
    literal = bool(page.search_for("_"))
    doc.close()
    (printed if literal else accepted).append(prefix)
    print("  %-4r ok literal-underscore=%-5s glyphs=%r" % (prefix, literal, glyphs[:24]))

print("\naccepted as a real script : %s" % " ".join(repr(c) for c in accepted))
print("compiles but prints '_'    : %s" % " ".join(repr(c) for c in printed))
print("refused                    : %s" % " ".join("%s(%s)" % (repr(c), m) for c, m in failed))
