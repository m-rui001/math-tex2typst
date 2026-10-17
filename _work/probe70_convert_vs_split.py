r"""For each picture of a paper, what do `cetz.convert` and `cetz.split` answer for the picture
alone and for the display string that holds it?

`emit.math_text` hands the maths path the WHOLE display string, and a canvas built from a string
that still carries the author's other maths around the picture is how the BSD diagram came out with
all four nodes on (0, 0): the tail `\qquad U_+/U_- \simeq ...` is left in the picture's own
`\end{tikzpicture}`-anchored window, so `build` reads statements that are not statements.
The two columns say which of the two routes a given display should take.
"""
import io
import re
import sys

sys.path.insert(0, r"E:\math\tools")
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
from t2t import cetz  # noqa: E402

PAPER = sys.argv[1]
text = open(r"E:\math\_work\flat\%s.tex" % PAPER, encoding="utf-8").read()
for i, m in enumerate(re.finditer(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", text, re.S)):
    open_ = text.rindex("\\[", 0, m.start())
    close = text.index("\\]", m.end())
    display = text[open_:close + 2]
    print("========== picture %d, display of %d chars" % (i, len(display)))
    for label, src in (("picture", m.group(0)), ("display", display)):
        canvas = cetz.convert(src)
        sp = cetz.split(src)
        pos = []
        if canvas:
            pos = re.findall(r"content\(\(([-\d., ]+)\)|line\(\(([-\d., ]+)\), \(([-\d., ]+)\)",
                             canvas)
            print("  %-8s convert=%s split=%s coords=%s"
                  % (label, "canvas" if canvas else "None",
                     "yes" if sp else "None",
                     sorted({c[0] or c[1] for c in pos})[:8]))
        else:
            print("  %-8s convert=None split=%s rest=%r"
                  % (label, "yes" if sp else "None", (sp[1][:70] if sp else "")))
