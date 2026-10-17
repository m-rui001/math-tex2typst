r"""In what ORDER does pgf apply a picture head's `scale=` and its `xshift=`?

The emitter now composes the head options left to right, so `[scale=2,xshift=1cm]` and
`[xshift=1cm,scale=2]` differ, and we have not measured which reading pgf gives. Page ink cannot
answer it: a rigid translation of the whole content is absorbed by the box re-anchoring at the
current point. Read the canvas transform itself out of the log instead — `\pgfgetlastxy` on (0,0)
after `\path` returns the *transformed* point in pt, and `\pgf@transformcm` is the matrix itself.

  python _work/probe81i_head_order.py
"""
import os
import re
import subprocess
import sys
import tempfile

CM = 28.452756
HEAD = r"""\documentclass[tikz,border=6pt]{standalone}
\makeatletter
\usepackage{tikz}
\begin{document}
"""
TAIL = r"""
\end{document}
"""

READ = r"""\path (0,0) coordinate (q);
\pgfgetlastxy{\qx}{\qy}\typeout{M81 ORIG {\qx}{\qy}}
\path (1,0) coordinate (r);
\pgfgetlastxy{\rx}{\ry}\typeout{M81 UNIT {\rx}{\ry}}
\path (0,1) coordinate (s);
\pgfgetlastxy{\sx}{\sy}\typeout{M81 UP {\sx}{\sy}}
"""

CASES = {
    "none": r"""\begin{tikzpicture}""",
    "scale2": r"""\begin{tikzpicture}[scale=2]""",
    "scale_shift": r"""\begin{tikzpicture}[scale=2,xshift=1cm]""",
    "shift_scale": r"""\begin{tikzpicture}[xshift=1cm,scale=2]""",
    "rot_shift": r"""\begin{tikzpicture}[rotate=90,xshift=1cm]""",
    "shift_rot": r"""\begin{tikzpicture}[xshift=1cm,rotate=90]""",
}


def run(tex):
    d = tempfile.mkdtemp(prefix="m81i_")
    path = os.path.join(d, "c.tex")
    open(path, "w", encoding="utf-8").write(HEAD + tex + READ + TAIL)
    r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", d, "c.tex"],
                       capture_output=True, cwd=d)
    log = open(os.path.join(d, "c.log"), encoding="utf-8", errors="replace").read()
    return r.returncode, log


def pt(s):
    m = re.match(r"(-?[\d.]+)pt", s)
    return float(m.group(1)) if m else None


def main():
    for name, tex in CASES.items():
        rc, log = run(tex)
        got = {}
        for key in ("ORIG", "UNIT", "UP"):
            m = re.search(r"M81 %s \{([^}]*)\}\{([^}]*)\}" % key, log)
            got[key] = (pt(m.group(1)), pt(m.group(2))) if m else None
        if any(v is None for v in got.values()):
            print("%-12s rc=%d FATAL: %s" % (name, rc, [l for l in log.splitlines() if l.startswith("!")][:2]))
            continue
        ox, oy = got["ORIG"]
        ux, uy = got["UNIT"]
        jx, jy = got["UP"]
        print("%-12s origin (%+0.3fcm, %+0.3fcm)   (1,0)-(0,0) (%+0.3f, %+0.3f)   (0,1)-(0,0) (%+0.3f, %+0.3f)"
              % (name, ox / CM, oy / CM, (ux - ox) / CM, (uy - oy) / CM, (jx - ox) / CM, (jy - oy) / CM))
    print("\nxshift=1cm written. origin x reads +1.000 for an unscaled shift, +2.000 for a stretched one.")


if __name__ == "__main__":
    sys.exit(main())
