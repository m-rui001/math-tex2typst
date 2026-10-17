"""One line per picture of the owned papers: which tree converted it and which refused.

Pass the t2t tree to test (live `E:\\math\\tools` for the before, the sandbox for the after). The
typst binary is the batch's, so its compile step is stubbed and everything up to and including the
CeTz build runs for real.
"""
import io
import os
import subprocess
import sys

SANDBOX = r"E:\math\_work\pic-3d"
LIVE = r"E:\math"
T2T = sys.argv[1]
sys.path.insert(0, T2T)
sys.path.insert(0, os.path.dirname(T2T))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")

real_run = subprocess.run


def stub(cmd, *a, **k):
    if isinstance(cmd, (list, tuple)) and cmd and str(cmd[0]) == "typst":
        return subprocess.CompletedProcess(cmd, 0, "", "")
    return real_run(cmd, *a, **k)


subprocess.run = stub

from t2t import cetz, convert, prep  # noqa: E402

PAPERS = [
    "A-sharp-entropy-bound-and-the-simplex-inequality-for-isotropic-constants-October-5-2026",
    "Critical-bond-and-site-percolation-on-the-cubic-lattice-September-24-2026",
    "Strong-diffeomorphic-approximation-in-three-dimensions-for-p-gt-2-September-24-2026",
    "Strong-diffeomorphic-approximation-in-three-dimensions-for-1-le-p-le-2-September-24-2026",
]

END = r"\end{tikzpicture}"

for name in PAPERS:
    src = open(os.path.join(SANDBOX, "flat", name + ".tex"), encoding="utf-8").read()
    pre_text, body = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    cm = convert.line_cm(p)
    print("=== " + name)
    pos, idx = 0, 0
    while True:
        i = src.find(r"\begin{tikzpicture}", pos)
        if i < 0:
            break
        j = src.find(END, i)
        pic = prep.expand_macros(src[i:j + len(END)], p.macros)
        got = cetz.convert(pic, p.colors, cm)
        first = " ".join(pic.split())[:60]
        print("  #%d %-10s %s" % (idx, "converted" if got else "REFUSED", first))
        pos, idx = j + 1, idx + 1
