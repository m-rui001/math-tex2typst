r"""Ask the palette machinery for the colours one picture actually names."""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")
from t2t import cetz  # noqa: E402

stem = sys.argv[1]
text = open(os.path.join(ROOT, "_work", "flat", stem + ".tex"),
            encoding="utf-8", errors="replace").read()
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
for i, p in enumerate(PIC.findall(text)):
    if "gatecore" not in p:
        continue
    pal = cetz.palette(p) if hasattr(cetz, "palette") else None
    print("picture", i, "palette fn?", hasattr(cetz, "palette"))
    for spec in ("gatecore", "gatecore!12", "gatepath!70", "gatehigh", "black!4"):
        print("   %-14s -> %s" % (spec, cetz.color(spec, pal)))
    break
