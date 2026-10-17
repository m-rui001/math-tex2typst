r"""Does the BSD diagram draw when the maths beside it is taken away?

The display reads `\[\begin{tikzpicture} ... \end{tikzpicture} \qquad U_+/U_- \simeq ...\]`.
`cetz.build` matches the picture at the head of that string and never looks at what stands after
`\end{tikzpicture}`, so the canvas it returns is built from a string that still carries the
`\qquad ...` tail.  Two readings: the whole display, and the picture alone.  If the tail is what
collapses the four nodes onto (0, 0), the fix is `build` refusing a string that is more than a
picture, which sends the display down `cetz.split` instead.
"""
import io
import re
import sys

sys.path.insert(0, r"E:\math\tools")
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
from t2t import cetz  # noqa: E402

PAPER = ("The-two-primary-Birch-Swinnerton-Dyer-formula-in-Selmer-corank-at-most-one"
         "-September-24-2026")
text = open(r"E:\math\_work\flat\%s.tex" % PAPER, encoding="utf-8").read()
pic = re.search(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", text, re.S).group(0)
# the display that holds it, found from the picture's own offset: `\[0,1\]` interval notation
# elsewhere in the paper is the same token, and a plain search would grab that one
open_ = text.rindex("\\[", 0, text.index(pic))
display = text[open_:text.index("\\]", text.index(pic)) + 2]

for label, src in (("picture alone", pic), ("whole display", display)):
    print("========== %s" % label)
    canvas = cetz.convert(src)
    print("convert ->", "None" if canvas is None else "%d lines" % canvas.count("\n"))
    if canvas:
        for line in canvas.splitlines():
            if "content(" in line or "line(" in line:
                print("   ", line.strip()[:110])
    sp = cetz.split(src)
    print("split ->", "None" if sp is None else ("canvas %d lines, rest=%r"
                                                 % (sp[0].count("\n"), sp[1][:90])))
