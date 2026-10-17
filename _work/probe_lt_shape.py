r"""Print the pandoc AST shape around a longtable, so the dangling name can be seen where it
actually lives: on the Table, inside its caption, or on a wrapper Div.
"""
import json
import subprocess
import sys

sys.stdout.reconfigure(errors="replace")

TEX = r"E:/math/_work/flat/_work_tex/Conditional-information-under-deterministic-coordinate-sweeps-September-26-2026.tex"
start = int(sys.argv[1]) if len(sys.argv) > 1 else 3175
end = int(sys.argv[2]) if len(sys.argv) > 2 else 3215

lines = open(TEX, encoding="utf-8").read().split("\n")[start - 1:end]
doc = ("\\documentclass{article}\n\\usepackage{longtable}\n\\begin{document}\n%s\n"
       "\\end{document}\n" % "\n".join(lines))
path = r"E:/math/_work/_probe/lt_shape.tex"
open(path, "w", encoding="utf-8").write(doc)
out = subprocess.run(
    ["pandoc", path, "-f", "latex", "-t", "json"],
    capture_output=True, text=True, encoding="utf-8", errors="replace").stdout
ast = json.loads(out)

LEAF = {"Str", "Space", "SoftBreak", "Line", "RawInline", "Math", "Quoted", "Note"}


def show(x, d=0):
    if isinstance(x, list):
        for i in x:
            show(i, d)
        return
    t, c = x["t"], x["c"]
    print("%s%s %s" % (" " * d, t, json.dumps(c, ensure_ascii=False)[:110]))
    if t == "Div":
        show(c[-1], d + 2)
        return
    if t == "Div":
        print("%sDiv ident=%r classes=%r attrs=%r" % (" " * d, c[0], c[1], c[2]))
        show(c[3], d + 2)
        return
    if t == "Table":
        print("%sTable caption=%r" % (" " * d, c[1]))
        show(c[2:], d + 2)
        return
    if t in ("Plain", "Para"):
        print("%s%s" % (" " * d, t))
        show(c, d + 2)
        return
    if t in ("TableHead", "TableBody", "HeadCells", "BodyCells", "Row", "Cell"):
        print("%s%s" % (" " * d, t))
        show(c, d + 2)
        return
    if t in LEAF:
        print("%s%s %s" % (" " * d, t, json.dumps(c, ensure_ascii=False)[:90]))
        return
    print("%s%s %s" % (" " * d, t, json.dumps(c, ensure_ascii=False)[:90]))
    if isinstance(c, list):
        show(c, d + 2)


show([ast] if "t" in ast else ast["blocks"] if isinstance(ast, dict) else ast)
