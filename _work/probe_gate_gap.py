"""Which picture did the compile gate refuse, as opposed to the builder?

`cetz.build` refuses on syntax it cannot read; `cetz.convert` additionally drops a canvas that
does not compile. The ledger counts both as one refusal, so a run that reports more refusals than
the static builder can explain has a gate victim. This names the paper, then compiles each of its
statically-built canvases to find the one the gate drops. typst is only reached for candidates.
"""
import json
import os
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

LC = 15.79
PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
DEFINECOLOR = re.compile(r"\\definecolor\{([-\w]+)\}\{(\w+)\}\{([^{}]*)\}")

for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    paper = path.name[:-4]
    report = ROOT / "typst" / paper / "report.json"
    if not report.is_file():
        continue
    stats = json.loads(report.read_text(encoding="utf-8")).get("stats", {})
    run_refused = stats.get("cetz_refused", 0)
    if not run_refused:
        continue
    src = path.read_text(encoding="utf-8", errors="replace")
    pal = {m.group(1): (m.group(2), m.group(3)) for m in DEFINECOLOR.finditer(src)}
    canvases, static_refused = [], 0
    for m in PICTURE.finditer(src):
        core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), LC)
        canvas = cetz.build(core, pal) or ("cd" if cetz.build_cd(core) else None)
        if canvas is None:
            static_refused += 1
        elif canvas != "cd":
            canvases.append(canvas)
    if run_refused <= static_refused:
        continue
    print("%-52s run refused %d, builder refused %d -> gate victim"
          % (paper[:52], run_refused, static_refused))
    for canvas in canvases:
        if not cetz.sane(canvas):
            print("    sane(): False")
        elif not cetz.compiles(canvas):
            print("    GATE FAILS:", " ".join(canvas.split())[:260])
