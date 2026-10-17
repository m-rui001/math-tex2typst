r"""The tikzcd diagrams that still do not become a CeTz canvas, and why.

Run: python _work/probe_cd_left.py
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

ENV = re.compile(r"\\begin\{tikzcd\}.*?\\end\{tikzcd\}", re.S)
bodies = []
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    bodies += ENV.findall(path.read_text(encoding="utf-8", errors="replace"))

print("== refused by build_cd ==")
for src in bodies:
    if cetz.build_cd(src) is None:
        opts = set()
        for spec in cetz.CD_ARROW.findall(src):
            opts.update(p.strip() for p in spec.split(",") if p.strip())
        print("-", " ".join(src.split())[:96])
        print("   opts:", sorted(opts)[:8])

print("\n== built but failing the compile gate ==")
for src in bodies:
    canvas = cetz.build_cd(src)
    if canvas and not (cetz.sane(canvas) and cetz.compiles(canvas)):
        print("-", " ".join(src.split())[:96])
        print(canvas[:400])
