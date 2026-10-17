"""Honest starting numbers: run the 3D-axis papers through the sandbox converter and count the
canvases against the quoted-LaTeX fallbacks.

The typst binary belongs to the live batch, so its compile step is stubbed; everything up to and
including the CeTz build still runs on the real production inputs.
"""
import io
import json
import os
import re
import subprocess
import sys

ROOT = r"E:\math\_work\pic-3d"
sys.path.insert(0, ROOT)
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")

real_run = subprocess.run


def stub(cmd, *a, **k):
    if isinstance(cmd, (list, tuple)) and cmd and str(cmd[0]) == "typst":
        return subprocess.CompletedProcess(cmd, 0, "", "")
    return real_run(cmd, *a, **k)


subprocess.run = stub

from t2t import cetz, convert, prep  # noqa: E402  (import after the sys.path move)

# convert.py derives ROOT from its own depth, so a sandbox copy resolves it to _work/ rather than
# the repository; pin the real root so prepare_assets reads the live flat/ and preprints/ read-only
convert.ROOT = r"E:\math"

PAPERS = [
    "A-sharp-entropy-bound-and-the-simplex-inequality-for-isotropic-constants-October-5-2026",
    "Critical-bond-and-site-percolation-on-the-cubic-lattice-September-24-2026",
    "Strong-diffeomorphic-approximation-in-three-dimensions-for-p-gt-2-September-24-2026",
    "Strong-diffeomorphic-approximation-in-three-dimensions-for-1-le-p-le-2-September-24-2026",
]

RAW = '#raw(block: true, lang: "latex"'

mode = sys.argv[1] if len(sys.argv) > 1 else "paper"

if mode == "paper":
    out = {}
    for name in PAPERS:
        out_dir = os.path.join(ROOT, "typst_out", name[:70])
        rep = convert.convert_paper(os.path.join(ROOT, "flat", name + ".tex"), out_dir, name,
                                    keep_work=True)
        text = open(os.path.join(out_dir, "main.typ"), encoding="utf-8").read()
        quoted = [m.group(1)[:70] for m in re.finditer(
            r'#raw\(block: true, lang: "latex",\s*"([^"]{0,200})', text)]
        out[name[:70]] = {"ok": rep.get("ok"),
                          "canvas": text.count("#cetz.canvas"),
                          "raw_latex": text.count(RAW),
                          "cetz_refused": rep.get("stats", {}).get("cetz_refused"),
                          "quoted": quoted}
    print(json.dumps(out, indent=1))
else:
    # per picture, straight through the CeTz build: the first statement that stops it
    for name in PAPERS:
        src = open(os.path.join(ROOT, "flat", name + ".tex"), encoding="utf-8").read()
        pre_text, body = prep.split_document(src)
        p = prep.parse_preamble(pre_text)
        cm = convert.line_cm(p)
        pos, idx = 0, 0
        while True:
            i = src.find(r"\begin{tikzpicture}", pos)
            if i < 0:
                break
            j = src.find(r"\end{tikzpicture}", i)
            pic = prep.expand_macros(src[i:j + len(r"\end{tikzpicture}")], p.macros)
            got = cetz.convert(pic, p.colors, cm)
            print("%s#%d %s len=%d" % (name[:34], idx,
                                       "converted" if got else "REFUSED", len(pic)))
            pos, idx = j + 1, idx + 1
