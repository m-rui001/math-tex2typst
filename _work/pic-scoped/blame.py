import sys, re, io
sys.path.insert(0, r"E:\math\_work\pic-scoped")
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
from t2t import cetz, convert, prep

FLAT = r"E:\math\_work\flat"

def expanded_body(paper, idx):
    src = open(FLAT + "\\" + paper, encoding="utf-8").read()
    pre_text, _ = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    cm = convert.line_cm(p)
    pics, pos = [], 0
    while True:
        i = src.find(r"\begin{tikzpicture}", pos)
        if i < 0:
            break
        j = src.find(r"\end{tikzpicture}", i)
        pics.append(src[i:j + len(r"\end{tikzpicture}")])
        pos = j + 1
    pic = pics[idx]
    m = re.match(r"\\begin\{tikzpicture\}", pic)
    body = pic[m.end():].lstrip()
    head, bpos = cetz._opts_at(body, 0)
    body = body[bpos:]
    end = body.rfind(r"\end{tikzpicture}")
    body = body[:end]
    body = cetz.expand_def(body)
    body = cetz.expand_foreach(body)
    body = cetz.expand_def(body)
    body = cetz.expand_pgfmath(body)
    body = cetz.expand_ifnum(body)
    return cetz.expand_tikzset(body)[1] if False else body

for paper, idx in [
    ("No-percolation-at-criticality-on-quasi-transitive-graphs-September-24-2026.tex", 1),
    ("The-Deligne-Drinfeld-conjecture-September-23-2026.tex", 1),
]:
    body = expanded_body(paper, idx)
    print("===", paper[:35])
    pos = 0
    while True:
        m = cetz.SCOPE.search(body, pos)
        if not m:
            break
        o, start = cetz._opts_at(body, m.end())
        if o:
            t = cetz._transform(o)
            if t is None:
                print("UNREADABLE scope opts:", o)
                for k, v in o.items():
                    one = cetz._transform({k: v})
                    if one is None:
                        print("   blames:", repr(k), repr(v))
        pos = m.end()
