r"""Narrow the pgfmath refusal to one definition."""
import sys
sys.path.insert(0, r"E:\math\_work\pic-pgfmath")
from t2t import cetz

print("expr:", cetz.expr("-4+.35*-4"), cetz.expr("1+1<=10"), cetz.expr("-4+.35*4"))
print("tokens:", cetz._tokenize("-4+.35*-4"))

one = r"\pgfmathsetmacro{\cx}{-4+.35*-4}\draw (\cx,0) -- (1,1);"
print("single:", repr(cetz.expand_pgfmath(one)))

two = (r"\pgfmathsetmacro{\cx}{-4+.35*-4}\draw (\cx,0)--(1,1);"
       r"\pgfmathsetmacro{\cx}{-4+.35*-3}\draw (\cx,0)--(1,1);")
print("twice:", repr(cetz.expand_pgfmath(two)))

pic = open(r"E:\math\_work\refused_pic_detail.txt", encoding="utf-8").read()
b = pic[pic.index("### Finite-cylinder"):]
src = b[b.index("\\begin{tikzpicture}"):]
src = src[:src.index("\\end{tikzpicture}") + len("\\end{tikzpicture}")]
m = cetz.re.match(r"\\begin\{tikzpicture\}", src)
head, pos = cetz._opts_at(src[m.end():].lstrip(), 0)
body = src[m.end():].lstrip()[pos:]
body = body[:body.rfind("\\end{tikzpicture}")]
body = cetz.expand_def(body)
body = cetz.expand_foreach(body)
body = cetz.expand_def(body)
print("defs:", body.count("pgfmathsetmacro"))
out = cetz.expand_pgfmath(body)
print("expand_pgfmath ->", "None" if out is None else "ok")
cells = body.split(r"\pgfmathsetmacro")
print("cells:", len(cells))
for k in (1, 2, 3):
    frag = r"\pgfmathsetmacro" + cells[k]
    cut = frag[:240]
    print(k, repr(cetz.expand_pgfmath(cut)))
