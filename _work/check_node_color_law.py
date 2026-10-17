r"""What does the converter emit for the node colour spellings pdflatex was measured on?

The same option groups as `_work/measure_bare_color_node.py`, written the way the corpus writes them
(`\node[...] at (...) {...}`) and run through `cetz.build`, so every line can be read against the PDF
oracle's answer for that spelling: ink on the words, a border only where `draw` is written, the field
where `fill` is.
"""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz  # noqa: E402

STATEMENTS = [
    "[blue]", "[blue,draw]", "[draw,blue]", "[blue,draw=red]", "[blue,draw=]",
    "[blue,fill=white]", "[blue,fill]", "[blue,fill=]", "[draw=red]", "[fill=red]",
    "[text=red]", "[text=red,draw]", "[text=red,fill]", "[blue,text=red,draw]",
    "[text=red,draw=blue]", "[color=blue]", "[color=blue,draw]", "[color=blue,fill=white]",
    "[blue,draw=none]", "[blue,fill=red,draw=none]", "[blue,rounded corners]",
    "[circle,fill=red]", "[rectangle,fill=red]", "[circle,draw,blue]",
    "[blue,fill=white,minimum width=1cm]", "[minimum width=1cm]",
    "[blue,minimum size=9mm,circle]", "[red!50,fill=white]",
]

# the palette a `build` call carries is {name: (model, spec)} from the paper's own \definecolor
# lines; every colour below is an xcolor name `cetz.RGB` already knows, so the table is empty.
PAL = {}


def main():
    for options in STATEMENTS:
        stmt = "\\node%s at (1,1) {ab};" % options
        pic = "\\begin{tikzpicture}\n%s\n\\end{tikzpicture}" % stmt
        canvas = cetz.build(pic, PAL)
        if canvas is None:
            print("%-38s  [refused]" % options)
            continue
        lines = [ln.strip() for ln in canvas.splitlines()
                 if ln.strip() and not ln.strip().startswith(("#cetz.canvas", "import", "}"))]
        print("%-38s  %s   [%s]"
              % (options, " | ".join(lines),
                 "compiles" if cetz.compiles(canvas) else "TYPST FAILS"))


if __name__ == "__main__":
    main()
