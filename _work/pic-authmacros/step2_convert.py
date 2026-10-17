r"""Before/after count of `#raw(block: true, lang: "latex")` quotes per paper.

The live tree is the honest 'before'; the sandbox copy is 'after'. Both run against a copy of the
flat source inside the sandbox because convert_paper writes its pandoc sidecar next to
`dirname(flat_path)/_work_tex`, and `_work/_work_tex` belongs to the running batch.

`typst compile` is stubbed out: the batch owns that queue, and the raw-block count is read from
main.typ, which is written before the compile step.
"""
import json
import os
import re
import shutil
import subprocess
import sys
from pathlib import Path

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
SB = os.path.join(ROOT, "_work", "pic-authmacros")
PAPERS = {
    "cylinder": "Cylinder-amplitudes-and-logarithmic-bridge-length-windows-on-the-honeycomb-lattice-September-26-2026",
    "gff": "Gaussian-free-field-limits-of-weighted-integer-Lipschitz-heights-September-25-2026",
    "peps": "Polynomial-PEPS-approximation-of-gapped-square-grid-ground-states-September-24-2026",
}
RAW = re.compile(r'#raw\(block: true, lang: "latex"')
CANVAS = re.compile(r"#cetz\.canvas\(")
STUB = r'"\[typst compile stubbed\]"'


def run(tag, tree, which):
    sys.path.insert(0, tree)
    for mod in ("t2t", "t2t.convert", "t2t.cetz", "t2t.prep", "t2t.macros", "t2t.emit",
                "t2t.mathconv", "t2t.texutil"):
        sys.modules.pop(mod, None)
    from t2t import convert

    # ROOT is derived from the module's own depth, so a sandbox copy one level deeper than
    # tools/ resolves '_work/flat' and 'preprints' against the wrong directory.
    convert.ROOT = ROOT
    convert.MANIFEST = json.loads(Path(ROOT, "_work", "manifest.json").read_text(encoding="utf-8"))
    convert.MANIFEST = {e["paper"]: e for e in convert.MANIFEST}

    real_run = subprocess.run

    def guarded(cmd, *a, **kw):
        if isinstance(cmd, list) and "typst" in str(cmd[0]):
            return subprocess.CompletedProcess(cmd, 0, STUB, "")
        return real_run(cmd, *a, **kw)

    convert.subprocess.run = guarded
    flat_src = os.path.join(ROOT, "_work", "flat")
    local = os.path.join(SB, "_flat_" + tag)
    os.makedirs(local, exist_ok=True)
    for key, name in PAPERS.items():
        dst = os.path.join(local, name + ".tex")
        if not os.path.exists(dst):
            shutil.copyfile(os.path.join(flat_src, name + ".tex"), dst)
        out = os.path.join(SB, "_out", tag, key)
        rep = convert.convert_paper(dst, out, name)
        text = open(os.path.join(out, "main.typ"), encoding="utf-8").read()
        print("%-6s %-9s raw-latex=%2d canvases=%2d ok=%s %s" % (
            key, which, len(RAW.findall(text)), len(CANVAS.findall(text)),
            rep.get("ok"), (rep.get("stats") or {}).get("cetz_refused", 0)))


mode = sys.argv[1] if len(sys.argv) > 1 else "both"
if mode in ("both", "before"):
    run("live", os.path.join(ROOT, "tools"), "before")
if mode in ("both", "after"):
    run("sandbox", os.path.join(ROOT, "_work", "pic-authmacros"), "after")
