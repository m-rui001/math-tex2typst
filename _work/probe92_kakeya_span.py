r"""Where does the Kakeya `$/b$` span come from, and what does the author's label say whole?

The guard's refuse path left `depth$"/b"$` in the product (`_work/m92_sites.txt`, slash-edge 2
sites / 1 paper), which reads like a *split* label: the emitter saw prose `depth` and a math span
whose content was only `/b`.  This prints the `\name` definition and the picture statement verbatim
so the slash family can be judged on the author's spelling rather than on a fragment.

  python _work/probe92_kakeya_span.py
"""
import io
import re

PATH = ("E:/math/_work/flat/The-Kakeya-maximal-conjecture-in-three-dimensions"
        "-September-23-2026.tex")
src = io.open(PATH, encoding="utf-8", errors="replace").read()

for m in re.finditer(r"\\(?:re)?newcommand\s*\{?\\name\}?\s*(?:\[[0-9]\])?\s*(\{)", src):
    i = m.start()
    print("DEF at %d: %s" % (i, src[i:i + 200].replace("\n", " ")))
for m in re.finditer(r"\\def\s*\\name", src):
    i = m.start()
    print("DEF2 at %d: %s" % (i, src[i:i + 200].replace("\n", " ")))

print("\n== every statement that carries `\\name`:")
for m in re.finditer(r"\\node[^;]{0,120}\\name[^;]{0,40};", src):
    print("   %s" % m.group(0).replace("\n", " ")[:180])

print("\n== the picture the label lives in (from its \\begin{tikzpicture}):")
i = src.find(r"\begin{tikzpicture}")
for m in re.finditer(r"\\begin\{tikzpicture\}", src):
    j = src.find(r"\node[left] at (-.03,\y) {$\name$}", m.start())
    if j >= 0:
        print(src[m.start():j + 120].replace("\n", " ")[:900])
        break
