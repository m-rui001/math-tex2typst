"""For every tilted picture that build() still refuses: is the tilt the cause, and which spelling?

The differential is the honest reading: strip the tilt options and rebuild. A picture that
refuses either way was never a tilt case; one that draws once the tilt is gone shows exactly the
tilt form we still cannot place.
"""
import io
import re
import sys
from collections import Counter
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
SPELL = re.compile(r"rotate around\s*=\s*\{[^{}]*\}|rotate\s*=\s*-?[\d.]+(?:\s*deg)?|"
                   r"\b[xy]\s*=\s*\{?\([^()]*\)\}?")
STRIP = re.compile(r"(?:rotate around\s*=\s*\{[^{}]*\}|rotate\s*=\s*-?[\d.]+(?:\s*deg)?|"
                   r"\b[xy]\s*=\s*\{?\([^()]*\)\}?)[,]?\s*")

kinds = Counter()
cases = []
for f in sorted(Path("_work/flat").glob("*.tex")):
    for pic in PIC.findall(f.read_text(encoding="utf-8", errors="replace")):
        spellings = SPELL.findall(pic)
        if not spellings or cetz.build(pic) is not None:
            continue
        kind = ("tilt is the cause" if cetz.build(STRIP.sub("", pic)) is not None
                else "refuses anyway")
        kinds[kind] += 1
        if kind == "tilt is the cause" and len(cases) < 10:
            cases.append((f.stem[:44], spellings[:4]))

print("tilted pictures still refused:", dict(kinds))
for name, s in cases:
    print("   %-46s %s" % (name, s))
