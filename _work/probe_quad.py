"""Where does \quadu come from? It is not in the sources.

Run: python _work/probe_quad.py
"""
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
FLAT = ROOT / "_work" / "flat"
NEEDLE = re.compile(r"\\quad[a-zA-Z]")

hits = 0
for tex in sorted(FLAT.glob("*.tex")):
    body = tex.read_text(encoding="utf-8", errors="replace")
    for m in NEEDLE.finditer(body):
        hits += 1
        if hits <= 6:
            print("%s\n  %s" % (tex.stem[:52], " ".join(body[max(0, m.start() - 70):m.start() + 90].split())))
print("flat files containing \\quad<letter>: hits=%d" % hits)
