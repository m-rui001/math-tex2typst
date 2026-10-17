r"""One-feature-at-a-time control pictures: which single feature makes each statement refuse?

Every case differs from its sibling by exactly one TikZ feature, and the answer is the builder's
own verdict on the whole picture, so a variant that builds proves the feature it drops was the
blocker.
"""
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "_work" / "pic-shapes"))
from t2t import cetz  # noqa: E402


def verdict(src):
    got = cetz.build(src)
    return "builds" if got else "refuses"


def show(label, src, want=None):
    got = cetz.build(src)
    print("%-34s %s" % (label, "builds" if got else "REFUSES"))
    if got and want:
        for line in got.splitlines():
            if want in line:
                print("      ", line.strip()[:150])


HEAD = "\\begin{tikzpicture}[x=1cm,y=1cm]\n%s\n\\end{tikzpicture}"

print("--- ellipse inside a turned scope")
show("plain ellipse", HEAD % r"\draw (0,0) ellipse (1.00 and .37);", "circle")
show("same, in rotate=25 scope",
     HEAD % "\\begin{scope}[shift={(0.12,0.20)},rotate=25]\n\\draw (0,0) ellipse (1.00 and .37);\n\\end{scope}")
show("circle in rotate=25 scope",
     HEAD % "\\begin{scope}[rotate=25]\n\\draw (0,0) circle (0.37);\n\\end{scope}")
show("ellipse in shift-only scope",
     HEAD % "\\begin{scope}[shift={(0.12,0.20)}]\n\\draw (0,0) ellipse (1.00 and .37);\n\\end{scope}", "circle")
show("ellipse, style w/ fill, no scope",
     ("\\begin{tikzpicture}[x=1cm,y=1cm,draw=blue,capacityellipse/.style={draw=red,fill=red!8,thick}]\n"
      "\\draw[capacityellipse] (0,0) ellipse (1.00 and .37);\n\\end{tikzpicture}"), "circle")
show("x radius/y radius bracket form", HEAD % r"\draw (0,0) ellipse [x radius=1, y radius=.37];", "circle")
show("turned circle via [rotate=25] on draw",
     HEAD % r"\draw (0,0) ellipse (1.00 and .37);", "circle")

print("\n--- the node self-loop")
NODE = r"\node[circle,draw,minimum size=8mm,inner sep=2pt,font=\small] (six) at (0,0) {$6$};"
show("loop out/in looseness=5 (L=0)",
     HEAD % (NODE + "\n\\draw (six) to[out=135,in=45,looseness=5] (six);"))
show("loop, default looseness",
     HEAD % (NODE + "\n\\draw (six) to[out=135,in=45] (six);"))
show("loop with no angles at all",
     HEAD % (NODE + "\n\\draw (six) to (six);"))
show("loop between two named nodes",
     HEAD % (NODE + "\n\\node[circle,draw] (other) at (2,0) {$7$};\n"
             "\\draw (six) to[out=135,in=45,looseness=5] (other);"), "bezier")
show("bend-left loop on itself",
     HEAD % (NODE + "\n\\draw (six) to[bend left=27] (six);"))

print("\n--- the multi-line text width node")
show("text width only",
     HEAD % r"\node[text width=5.2cm] at (5.45,3.15) {Separated pairs $D(D-1)$ terms};", "content")
show("text width + align=left",
     HEAD % r"\node[align=left,text width=5.2cm] at (5.45,3.15) {Separated pairs};")
show("text width + anchor=west",
     HEAD % r"\node[anchor=west,text width=5.2cm] at (5.45,3.15) {Separated pairs};")
show("align=left + anchor=west, no text width",
     HEAD % r"\node[anchor=west,align=left] at (5.45,3.15) {Separated pairs};")
show("text width + \\\\ break",
     HEAD % r"\node[text width=5.2cm] at (5.45,3.15) {Separated pairs\\ \(D(D-1)\) terms};")
show("all three (the picture's node)",
     HEAD % r"\node[anchor=west,align=left,text width=5.2cm] at (5.45,3.15) "
            r"{Separated pairs\\ \(D(D-1)\) terms, each with\\ mean in \([\alpha-\eta,\alpha+\eta]\)};")
show("same but \textcolor wrapped",
     HEAD % r"\node[anchor=west,align=left,text width=5.2cm] at (5.45,3.15) "
            r"{\textcolor{parentblue}{Separated pairs}\\ \(D(D-1)\) terms};")
