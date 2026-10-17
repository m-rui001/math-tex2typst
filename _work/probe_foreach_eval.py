"""Check what the new foreach `evaluate=` unrolling actually writes out.

expanding a loop with a computed name is only right if the names it produces match the ones the
picture later draws with, so this prints the first unrolled statements of every loop that uses
evaluate=, from the sources the refusal probe says were stopping there.

Usage: python _work/probe_foreach_eval.py
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
head = re.compile(r"\\foreach\s+\\[\w]+(?:\s*/\s*\\[\w]+)*\s*(\[[^\]]*\])?\s+in\s+")

shown = 0
for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    if shown >= 6:
        break
    text = tex.read_text(encoding="utf-8", errors="replace")
    for pic in PICTURE.finditer(text):
        core = pic.group(0)
        if "evaluate" not in core:
            continue
        body = core[len("\\begin{tikzpicture}"):core.rfind("\\end{tikzpicture}")]
        first = None
        for m in head.finditer(body):
            if cetz._evaluate_option(m.group(1)):
                first = m
                break
        if first is None:
            continue
        m = first
        got = cetz.expand_foreach(body)
        print("== %s  option=%s" % (tex.stem[:44], m.group(1)))
        if got is None:
            print("   refuses: _evaluate_option -> %r" % (cetz._evaluate_option(m.group(1)),))
        else:
            lines = [ln.strip()[:120] for ln in got.splitlines()
                     if "reference" in ln or "coordinate" in ln]
            print("   %d unrolled statements, first 6:" % len(lines))
            print("   " + "\n   ".join(lines[:6]))
        shown += 1
        break
