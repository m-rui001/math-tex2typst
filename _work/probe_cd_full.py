r"""Dump the full canvas for every tikzcd diagram that builds but fails the gate.

Run: python _work/probe_cd_full.py
"""
import pathlib
import re
import subprocess
import sys
import tempfile

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

ENV = re.compile(r"\\begin\{tikzcd\}.*?\\end\{tikzcd\}", re.S)


def compiles(canvas):
    with tempfile.TemporaryDirectory() as tmp:
        f = pathlib.Path(tmp) / "t.typ"
        f.write_text(cetz.HEADER + canvas, encoding="utf-8")
        r = subprocess.run(["typst", "compile", str(f), str(pathlib.Path(tmp) / "t.pdf")],
                           capture_output=True, text=True, encoding="utf-8", errors="replace")
    return r.returncode, " | ".join(l.strip() for l in r.stderr.splitlines() if l.strip())


for path in sorted((ROOT / "_work" / "flat" / "_work_tex").glob("*.tex")):
    text = path.read_text(encoding="utf-8", errors="replace")
    for m in ENV.finditer(text):
        canvas = cetz.build_cd(m.group(0))
        if canvas is None:
            continue
        why = None
        if not cetz.sane(canvas):
            why = "sane() said no"
        else:
            code, err = compiles(canvas)
            if code:
                why = err[:300]
        if why is None:
            continue
        print("=" * 72)
        print(path.name)
        print("SRC:", " ".join(m.group(0).split()))
        print("WHY:", why)
        print(canvas)
