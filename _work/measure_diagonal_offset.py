r"""`above left=2pt` 这类**对角方向键带距离**：pdflatex 给的是哪两条数？

要定的不是「要不要做」而是「做对」，需要三件事：
1. 距离加在**哪个轴**上——是每轴各 2pt（位移向量 (−2, +2)），还是沿 45° 射线走 2pt（每轴 √2·1pt），
   还是只动一轴；`below left=8mm and -5.1cm` 的两段写法已经说明键能分开给，那么单段必然同时给两轴。
2. 钉住的是节点的哪个点——`SIDE_ANCHOR` 里裸写 `above left` 是 `south-east`，带距离时是否还是它；
3. 距离之外是否还吃了 `node distance`／`outer sep`（#37 量过单边：`above=20pt` 让 south 点正好在 20pt 上）。

语料侧只有单段写法（41 处 / 15 篇，距离 1pt–5pt），`… and …` 只出现在 `of` 放置里，所以这里只量单段
和一个 `and` 对照，别为语料里没有的写法推律。
"""
import os
import re
import subprocess
import sys
import tempfile

CM = 28.3465
CASES = [
    ("ref", "draw"),
    ("above-left-2pt", "draw,above left=2pt"),
    ("above-left-0pt", "draw,above left=0pt"),
    ("above-left-bare", "draw,above left"),
    ("above-right-3pt", "draw,above right=3pt"),
    ("above-right-2mm", "draw,above right=2mm"),
    ("below-left-2pt", "draw,below left=2pt"),
    ("below-right-3pt", "draw,below right=3pt"),
    ("above-2pt", "draw,above=2pt"),
    ("above-left-sep0", "draw,above left=2pt,outer sep=0pt"),
    ("above-left-and", "draw,above left=2pt and 4pt"),
    ("left-above-2pt", "draw,left above=2pt"),
]

DOC = r"""\documentclass[10pt]{article}
\usepackage{tikz}
\usetikzlibrary{positioning}
\begin{document}
\makeatletter
\newdimen\mx \newdimen\my
\newcommand{\report}[2]{%
  \pgfextractx{\mx}{\pgfpointanchor{#2}{center}}\pgfextracty{\my}{\pgfpointanchor{#2}{center}}%
  \edef\tmpA{\the\mx}\edef\tmpB{\the\my}%
  \pgfextractx{\mx}{\pgfpointanchor{#2}{north west}}\pgfextracty{\my}{\pgfpointanchor{#2}{north west}}%
  \edef\tmpC{\the\mx}\edef\tmpD{\the\my}%
  \pgfextractx{\mx}{\pgfpointanchor{#2}{south east}}\pgfextracty{\my}{\pgfpointanchor{#2}{south east}}%
  \typeout{MO #1 \tmpA\space \tmpB\space \tmpC\space \tmpD\space \the\mx\space \the\my}%
}
\newcommand{\measure}[2]{%
  \begin{tikzpicture}
    \node[#1] (a) at (0,0) {ab};
    \report{#2}{a}%
  \end{tikzpicture}%
}
\newcommand{\measureof}[2]{%
  \begin{tikzpicture}
    \node (o) at (0,0) {o};
    \node[#1] (a) {ab};
    \report{#2}{a}%
  \end{tikzpicture}%
}
\makeatother
%(body)s
\end{document}
"""

OFCASES = [
    # the corpus spelling is `…=d and d of x` (8 sites / 3 papers), which is `placed_at`'s territory,
    # not `_side_key`'s: measured so the ledger says which axis takes which number.
    ("of-two-dist", "above left=2mm and 4mm of o"),
    ("of-neg-second", "below left=8mm and -5.1cm of o"),
    ("of-bare", "above left of o"),
    ("of-one-dist", "above left=2mm of o"),
]


def run(cases, macro):
    with tempfile.TemporaryDirectory() as tmp:
        body = "\n".join(r"\%s{%s}{%s}" % (macro, opt, name) for name, opt in cases)
        tex = os.path.join(tmp, "dm.tex")
        open(tex, "w", encoding="utf-8").write(DOC.replace("%(body)s", body))
        r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", tmp,
                            tex], capture_output=True)
        log = open(os.path.join(tmp, "dm.log"), encoding="utf-8", errors="replace").read()
        out = {}
        for line in log.replace("\n", " ").split("MO ")[1:]:
            fields = line.strip().split()
            if len(fields) < 7:
                continue
            try:
                vals = [float(f.replace("pt", "")) / CM for f in fields[1:7]]
            except ValueError:
                continue
            out[fields[0]] = tuple(vals)
        if not out:
            print("(no MO lines parsed; raw log lines:)")
            for line in [l for l in log.splitlines() if l.startswith("MO ")][:6]:
                print("   " + line)
        for name, opt in cases:
            v = out.get(name)
            if v is None:
                # a case that did not come back is a reading we do not have; say what the log holds
                print("%-18s (missing)  [%s]  seen=%s" % (name, opt, sorted(out)))
                continue
            print("%-18s (%+7.4f,%+7.4f)    (%+7.4f,%+7.4f)    (%+7.4f,%+7.4f)  %s"
                  % (name, v[0], v[1], v[2], v[3], v[4], v[5], opt))
        if r.returncode:
            print("(pdflatex rc=%d) errors seen:" % r.returncode)
            for m in re.finditer(r"!\s.{0,70}", log):
                print("   " + m.group(0).strip())


def main():
    print("node `at (0,0) {ab}`; values are anchor POSITIONS in cm (canvas y up):")
    print("%-18s %-22s %-22s %-22s %s" % ("case", "centre", "north-west", "south-east", "options"))
    run(CASES, "measure")


if __name__ == "__main__":
    if (sys.argv[1:] or [""])[0] == "of":
        print(r"`\node[..] (a) {ab}` placed **`of o`**, o's centre = origin, cm, y up:")
        print("%-18s %-22s %-22s %-22s %s" % ("case", "centre", "north-west", "south-east", "options"))
        run(OFCASES, "measureof")
    else:
        main()
