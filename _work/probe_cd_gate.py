r"""What really blocks tikzcd diagrams, measured on the sources pandoc sees.

_work_tex/*.tex is the expanded document (user macros already substituted), which is
what the pipeline converts; measuring on _work/flat/*.tex blames macros that are gone.

Run: python _work/probe_cd_gate.py
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
total = refused = failed = ok = 0
refused_ex, failed_ex = [], []
for path in sorted((ROOT / "_work" / "flat" / "_work_tex").glob("*.tex")):
    src_text = path.read_text(encoding="utf-8", errors="replace")
    for m in ENV.finditer(src_text):
        total += 1
        canvas = cetz.build_cd(m.group(0))
        if canvas is None:
            refused += 1
            refused_ex.append((path.name[:34], " ".join(m.group(0).split())[:110]))
            continue
        if not cetz.sane(canvas):
            failed += 1
            failed_ex.append((path.name[:34], "structurally broken: " + canvas[:160]))
            continue
        with tempfile.TemporaryDirectory() as tmp:
            f = pathlib.Path(tmp) / "t.typ"
            f.write_text(cetz.HEADER + canvas, encoding="utf-8")
            r = subprocess.run(["typst", "compile", str(f), str(pathlib.Path(tmp) / "t.pdf")],
                               capture_output=True, text=True, encoding="utf-8",
                               errors="replace")
        if r.returncode:
            failed += 1
            err = " | ".join(l.strip() for l in (r.stderr or "").splitlines() if l.strip())[:150]
            failed_ex.append((path.name[:34], err))
        else:
            ok += 1

print("diagrams=%d  canvas-ok=%d  refused=%d  gate-fail=%d" % (total, ok, refused, failed))
print("\n-- refused by build_cd --")
for name, ex in refused_ex[:8]:
    print("  %-34s %s" % (name, ex))
print("\n-- built but failing the gate --")
for name, ex in failed_ex[:10]:
    print("  %-34s %s" % (name, ex))
