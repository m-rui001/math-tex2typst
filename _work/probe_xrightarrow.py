r"""How to write an arrow with a label over it, and how many pictures want one.

`\xrightarrow{label}` is the one construct whose label text a whole-word lookup now drops, and
the pictures that carry it are the ones run35 lost. Test the Typst forms that could stand for it,
then count the flat pictures that use it.
"""
import pathlib
import re
import subprocess
import sys
import tempfile

sys.path.insert(0, str(pathlib.Path("tools").resolve()))
from t2t import cetz  # noqa: E402

FORMS = [
    r"A arrow.r {Narrow} B",
    r'A arrow.r "Narrow" B',
    r"A ->\ {Narrow}\ B",
    r"A arrow.r(Narrow) B",
    r"A \overset{Narrow}{\rightarrow} B",
]
for form in FORMS:
    canvas = "#cetz.canvas({\n  import cetz.draw: *\n  content((0, 0), [$%s$])\n})" % form
    with tempfile.TemporaryDirectory() as tmp:
        src = pathlib.Path(tmp) / "t.typ"
        src.write_text(cetz.HEADER + "#set page(width: 160pt, height: 40pt)\n" + canvas,
                       encoding="utf-8")
        r = subprocess.run(["typst", "compile", str(src), str(pathlib.Path(tmp) / "t.pdf")],
                           capture_output=True)
    print("%-34s %s" % (form, "ok" if r.returncode == 0 else
                        " ".join(r.stderr.decode("utf-8", "replace").split())[:90]))

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
X = re.compile(r"\\x(?:rightleftarrows?|leftarrow|rightarrow|Rightarrow|Leftarrow|hook(?:left|right)|twohead(?:left|right)arrow)")
papers = set()
pictures = 0
for path in pathlib.Path("_work", "flat").glob("*.tex"):
    for pic in PIC.findall(path.read_text(encoding="utf-8", errors="replace")):
        if X.search(pic):
            pictures += 1
            papers.add(path.stem)
print({"pictures with a labelled arrow": pictures, "papers": len(papers)})
