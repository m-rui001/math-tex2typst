r"""Does a node's font= now reach the canvas as #text(size:)?
"""
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
from t2t import cetz  # noqa: E402

CASES = {
    "head font": r"\begin{tikzpicture}[font=\small]\node at (0,0){word};\end{tikzpicture}",
    "every node": (r"\begin{tikzpicture}[every node/.style={font=\small}]"
                   r"\node at (0,0){word};\end{tikzpicture}"),
    "node font": r"\begin{tikzpicture}\node[font=\scriptsize] at (0,0){$C$};\end{tikzpicture}",
    "node overrides head": (r"\begin{tikzpicture}[font=\small]\node[font=\bfseries] at (0,0){B};"
                            r"\end{tikzpicture}"),
    "fontsize": r"\begin{tikzpicture}\node[font=\fontsize{9}\selectfont] at (0,0){n};\end{tikzpicture}",
    "shape only": r"\begin{tikzpicture}\node[font=\bfseries] at (0,0){B};\end{tikzpicture}",
    "unsized": r"\begin{tikzpicture}\node at (0,0){plain};\end{tikzpicture}",
    "sized box": (r"\begin{tikzpicture}[font=\small]"
                  r"\node[draw,text width=3cm] at (0,0){Possible delay};\end{tikzpicture}"),
}


def main():
    sys.stdout.reconfigure(errors="replace")
    for name, src in CASES.items():
        got = cetz.build(src)
        print("--- %s" % name)
        if got is None:
            print("   REFUSED")
            continue
        for line in got.splitlines():
            if "content(" in line:
                print("   " + line.strip())


if __name__ == "__main__":
    main()
