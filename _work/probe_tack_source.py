"""Which LaTeX command stands behind each `tack.r.double` in the products?"""
import re
import sys
from pathlib import Path

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

STEM = "The-Partition-Principle-does-not-imply-Choice-September-24-2026"
src = Path("_work/flat/%s.tex" % STEM).read_text(encoding="utf-8", errors="replace")
for pat in (r"\Vdash", r"\vDash", r"\models", r"\forces"):
    hits = [m.start() for m in re.finditer(re.escape(pat) + r"(?![A-Za-z])", src)]
    print("%-10s %3d  first: %r" % (pat, len(hits), src[hits[0] - 40:hits[0] + 40] if hits else ""))

prod = Path("typst/%s/main.typ" % STEM).read_text(encoding="utf-8", errors="replace")
for m in re.finditer(r"tack\.r\.double", prod):
    print("PROD:", repr(prod[max(0, m.start() - 60):m.start() + 30]))
