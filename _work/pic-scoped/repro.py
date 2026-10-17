import sys, re, io
sys.path.insert(0, r"E:\math\_work\pic-scoped")
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
from t2t import cetz, convert, prep

FLAT = r"E:\math\_work\flat"
PAPERS = [
    "No-percolation-at-criticality-on-quasi-transitive-graphs-September-24-2026.tex",
    "The-Deligne-Drinfeld-conjecture-September-23-2026.tex",
]

def blocks(src):
    out, pos = [], 0
    while True:
        i = src.find(r"\begin{tikzpicture}", pos)
        if i < 0:
            return out
        j = src.find(r"\end{tikzpicture}", i)
        out.append(src[i:j + len(r"\end{tikzpicture}")])
        pos = j + 1

for paper in PAPERS:
    src = open(FLAT + "\\" + paper, encoding="utf-8").read()
    pre_text, _ = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    cm = convert.line_cm(p)
    pics = blocks(src)
    for idx, pic in enumerate(pics):
        core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", pic), cm)
        got = cetz.build(pic, line_cm=cm)
        stage = "converted" if got else "refused"
        print(paper[:40], idx, stage, len(pic))
        if got:
            open(r"E:\math\_work\pic-scoped\out_%s_%d.typ" % (paper[:12], idx), "w",
                 encoding="utf-8").write(got)
