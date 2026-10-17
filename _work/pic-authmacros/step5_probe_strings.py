r"""Exact strings the emitter produces for the values tests.py asserts.

Nothing here is a judgement, just the emitter's own output for the three measured cases, so the test
file quotes what `cetz.build` answers rather than what I expect it to answer.
"""
import sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from t2t import cetz, convert, macros

C1 = ("\\begin{tikzpicture}[x=1cm,y=1cm,finite boundary/.style={draw=black!30,line width=.4pt}]\n"
      "\\begin{scope}[shift={(.70,-1.08)}]\n"
      "\\draw[finite boundary] (-.35,-.35) rectangle (.35,.35);\n"
      "\\fill[black!45] (0,0) circle (1pt);\n"
      "\\end{scope}\n\\end{tikzpicture}")
C2 = ("\\begin{tikzpicture}[x=.86cm,y=1cm,bandC/.style={fill=black!12,draw=black!35,line width=.3pt},"
      "bandA/.style={fill=orange!35,draw=black!35,line width=.3pt}]\n"
      "\\draw[black!10,line width=.3pt] (-8,.48) -- (-8,-5.17);\n"
      "\\path[bandC] (-8,{-0.82-.20}) rectangle (-6,{-0.82+.20});\n"
      "\\path[bandA] (0,{-0.82-.20}) rectangle (1,{-0.82+.20});\n"
      "\\node[font=\\scriptsize] at ({(-8+-6)/2},-.82) {$C$};\n"
      "\\end{tikzpicture}")
C3 = ("\\begin{tikzpicture}\\draw[orange!65!black,line width=.8pt] (0,0) -- (1,1);"
      "\\fill[blue!60!black] (2,0) circle (2pt);\\end{tikzpicture}")
for tag, src in (("cylinder", C1), ("peps", C2), ("colour", C3)):
    print("==", tag)
    print(cetz.build(src, {}, 15.0))

BODY = ("\\begingroup\n\\colorlet{ink}{blue!60!black}\n"
        "\\tikzset{gap/.style={draw=black!45}}\n"
        "\\newcommand{\\grouppic}[1]{\\fill (0,#1) circle (2pt);}\n"
        "\\begin{tikzpicture}[x=1cm]\n\\grouppic{1pt}\n\\end{tikzpicture}\n")
scopes = convert.picture_scopes(BODY, {})
print("== scopes", len(scopes))
table, decls = scopes[0]
print("names:", sorted(table))
print("decls:", repr(decls))
pic = "\\begin{tikzpicture}[x=1cm]\n\\grouppic{1pt}\n\\end{tikzpicture}"
print("folded:", repr(convert.with_declarations(pic, decls)))
print("core:", repr(prep_expand := convert.prep.expand_macros(convert.with_declarations(pic, decls), table))
      if hasattr(convert, "prep") else "")
from t2t import prep
print("core:", repr(prep.expand_macros(convert.with_declarations(pic, decls), table)))
t, _s = macros.parse_definitions(
    "\\newcommand{\\FiniteSquare}[3]{\\draw (0,0) rectangle (1,1);#3\\fill (0,0) circle (1pt);}")
print("FiniteSquare in table:", "\\FiniteSquare" in t)
print("expanded:", repr(macros.expand("\\FiniteSquare{.70}{-1.08}{}", t)))
for body in ("\\ifmmode#1\\fi", "\\@ifnextchar x{#1}{}", "\\csname foo\\endcsname", "\\fill#1"):
    tt, _ = macros.parse_definitions("\\newcommand{\\qq}[1]{%s}" % body)
    print("refused" if "\\qq" not in tt else "accepted", body)
