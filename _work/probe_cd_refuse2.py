"""Which gate rejects these tikzcd diagrams: build, build_cd, sane() or compiles()?

Run: python _work/probe_cd_refuse2.py
"""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

CASES = [
    "\\" + r'''begin{equation} \label{floor:quotient-diagram} \begin{tikzcd}[column sep=large] W \arrow[r,"g"] \arrow[d,"p"'] & P \arrow[d,"u"]\\ Y \arrow[r,"f"'] & Z \end{tikzcd} \end{equation}''',
    r'''\begin{tikzcd} (Z',\Gamma')\arrow[r,"p"]\arrow[d,"g'"']& (Z,\Gamma)\arrow[d,"g"]\\ S'\arrow[r,"q"]&S, \end{tikzcd}''',
    r'''\begin{tikzcd} M' \arrow[r,"p"] \arrow[d,"f'"'] & M \arrow[d,"f"]\\ S' \arrow[r,"q"'] & S . \end{tikzcd}''',
    r'''\begin{tikzcd} W \arrow[r,"p"] \arrow[d,"h"'] & Y \\ B & \end{tikzcd}''',
    r'''\begin{tikzcd} Y \arrow[r,"\pi"] \arrow[d,"f"'] & X\\ B & \end{tikzcd}''',
    # a plain one that is known to draw, as the control
    r'''\begin{tikzcd} A \arrow[r,"f"] & B \end{tikzcd}''',
]

for src in CASES:
    core = cetz.MATH_ENVELOPE.sub("", src)
    direct = cetz.build(core)
    cd = cetz.build_cd(core)
    if cd is None:
        print("build_cd=None   %s" % " ".join(src.split())[:78])
        continue
    print("sane=%-5s compiles=%-5s  %s" % (cetz.sane(cd), cetz.compiles(cd),
                                           " ".join(src.split())[:70]))
    if not cetz.compiles(cd):
        print(cd)
