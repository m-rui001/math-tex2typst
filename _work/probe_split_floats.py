import sys, os, re
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'tools'))
from t2t import prep

def show(tag, got):
    print("\n===== %s =====" % tag)
    print(got)

# 1) caption-first trailing no-body float (the previously failing test case)
src1 = ("\\begin{table}[htbp]\n\\caption{First block.}\n\\label{tab:a}\n"
        "\\begin{tabular}{cc} a&b \\end{tabular}\n"
        "\\caption{All fifteen couplings here.}\n\\label{apptr:c}\n\\end{table}")
got1 = prep.lift_captions(src1)
show("1 caption-first, trailing caption has no body", got1)
tr = [f for f in got1.split("\n\n") if "All fifteen" in f]
print("tables:", got1.count("\\begin{table}"),
      "| stand-in present:", "\\begin{tabular}{l}\\mbox{}\\end{tabular}" in tr[0],
      "| stand-in before caption:", tr[0].index("\\mbox{}") < tr[0].index("All fifteen"),
      "| First-block float keeps a&b:", "a&b" in got1.split("\n\n")[0])

# 2) the real material-first Heisenberg table (three tabulars, caption below each)
HEIS = os.path.join(os.path.dirname(__file__), "flat",
                    "A-boundary-field-gap-for-the-spin-one-Heisenberg-chain-September-24-2026.tex")
src2 = open(HEIS, encoding="utf-8", errors="replace").read()
m2 = re.search(r"\\begin\{table\}\[htbp\].*?apptr:coupling-table.*?\\end\{table\}", src2, re.S)
region2 = m2.group(0)
got2 = prep.lift_captions(region2)
print("\n===== 2 real material-first apptr table =====")
for lab in ("apptr:entry-table", "apptr:endpoint-table", "apptr:coupling-table"):
    frag = [f for f in got2.split("\n\n") if lab in f]
    # find which float the caption+label ended up in and whether its tabular is there too
    print("%-24s floats-with-label:%d" % (lab, len(frag)))
print("tables before:", region2.count("\\begin{table}"), "after:", got2.count("\\begin{table}"))
print("captions conserved:", region2.count("\\caption") == got2.count("\\caption"))
# each split float should carry its own tabular body
frs = [f for f in got2.split("\n\n") if "\\caption" in f]
print("split floats with a tabular body:", sum(1 for f in frs if "\\begin{tabular}" in f), "of", len(frs))

# 3) the multi-label Positive-scalar figure (single caption, two labels) must pass through untouched
PS = os.path.join(os.path.dirname(__file__), "flat",
                  "Positive-scalar-curvature-and-uniform-codimension-two-width-September-23-2026.tex")
src3 = open(PS, encoding="utf-8", errors="replace").read()
m3 = re.search(r"\\begin\{figure\}\[!b\].*?packet:collar-figure.*?\\end\{figure\}", src3, re.S)
region3 = m3.group(0)
got3 = prep.lift_captions(region3)
print("\n===== 3 multi-label topology-compression figure =====")
print("returned byte-for-byte unchanged:", got3 == region3)
print("has fig:topology-compression:", "\\label{fig:topology-compression}" in got3)
print("has packet:collar-figure:", "\\label{packet:collar-figure}" in got3)
print("still a single figure float:", got3.count("\\begin{figure}") == 1)

# 4) synthetic multi-caption float where ONE caption carries a label CHAIN (material-first)
src4 = ("\\begin{table}\n\\centering\n"
        "\\begin{tabular}{cc} 1&2 \\end{tabular}\n"
        "\\caption{Upper.}\\label{tab:u1}\\label{tab:u2}\n"
        "\\begin{tabular}{cc} 3&4 \\end{tabular}\n"
        "\\caption{Lower.}\\label{tab:l}\n\\end{table}")
got4 = prep.lift_captions(src4)
show("4 material-first float, one caption with a two-label chain", got4)
u = [f for f in got4.split("\n\n") if "Upper" in f]
print("upper float keeps BOTH labels:", ("\\label{tab:u1}" in u[0]) and ("\\label{tab:u2}" in u[0]),
      "| keeps its tabular 1&2:", "1&2" in u[0], "| does not leak 3&4:", "3&4" not in u[0])

# 3b) isolate EXACTLY the topology figure (nearest enclosing \begin{figure}...\end{figure})
idx = src3.index("packet:collar-figure")
st = src3.rindex(r"\begin{figure}", 0, idx)
en = src3.index(r"\end{figure}", idx) + len(r"\end{figure}")
one = src3[st:en]
g = prep.lift_captions(one)
print("\n===== 3b exact topology figure only =====")
print("figure envs in region:", one.count(r"\begin{figure}"))
print("unchanged:", g == one, "| captions:", one.count(r"\caption"), "->", g.count(r"\caption"))
print("both labels present:",
      r"\label{fig:topology-compression}" in g and r"\label{packet:collar-figure}" in g)
