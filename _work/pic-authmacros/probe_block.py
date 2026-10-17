import sys, re, io, difflib
sys.path.insert(0, "_work/pic-authmacros")
out = io.open("_work/pic-authmacros/_probe_out.txt", "w", encoding="utf-8")
def P(*a):
    out.write(" ".join(str(x) for x in a) + "\n")

from t2t import cetz, convert, prep, macros

FLAT = "_work/flat/"
name = "Gaussian-free-field-limits-of-weighted-integer-Lipschitz-heights-September-25-2026"
src = open(FLAT + name + ".tex", encoding="utf-8").read()
pre_text, body = prep.split_document(src)
p = prep.parse_preamble(pre_text)
cm = convert.line_cm(p)
tab, sk = macros.parse_definitions(body)
merged = dict(p.macros); merged.update(tab)
pic = re.findall(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", body, re.S)[1]

canvA = cetz.build(prep.expand_macros(pic, merged), p.colors, cm)
start = src.find("\\colorlet{pinsplus}")
block = src[start:src.find("\\begin{tikzpicture}", start)]
keep = block[:block.find("\\newcommand")]
folded = pic.replace("\\end{tikzpicture}", keep + "\n\\end{tikzpicture}")
canvB = cetz.build(prep.expand_macros(folded, merged), p.colors, cm)
io.open("_work/pic-authmacros/gff_A.typ", "w", encoding="utf-8").write(canvA or "None")
io.open("_work/pic-authmacros/gff_B.typ", "w", encoding="utf-8").write(canvB or "None")
P("A lines:", 0 if not canvA else len(canvA.splitlines()),
  " B lines:", 0 if not canvB else len(canvB.splitlines()))
for line in difflib.unified_diff((canvA or "").splitlines(), (canvB or "").splitlines(),
                                 "A", "B", lineterm="", n=0):
    P(line)
P("dashed in A:", "dash" in (canvA or ""), "in B:", "dash" in (canvB or ""))
P("arrow/marker in A:", "marker" in (canvA or ""), "in B:", "marker" in (canvB or ""))
out.close()
print(open("_work/pic-authmacros/_probe_out.txt", encoding="utf-8").read()[:5000])
