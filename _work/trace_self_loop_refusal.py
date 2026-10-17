"""Which line of translate_path refuses a node self-loop?

A line tracer over tools/t2t/cetz.py, recording the lines reached before build() gives up.
"""
import sys

sys.path.insert(0, "tools")
from t2t import cetz  # noqa: E402

TARGET = "tools/t2t/cetz.py"
LINES = open(TARGET, encoding="utf-8").readlines()
seen = []


def trace(frame, event, arg):
    if frame.f_code.co_filename.replace("\\", "/").endswith("t2t/cetz.py"):
        if event == "line":
            seen.append(frame.f_lineno)
            if len(seen) > 6000:
                del seen[:3000]
    return trace


PIC = (r"\begin{tikzpicture}[x=1cm,y=1cm]"
       r"\node[circle,draw,minimum size=8mm] (six) at (0,0) {$6$};"
       r"\draw (six) to[out=135,in=45,looseness=5] (six);\end{tikzpicture}")

sys.settrace(trace)
got = cetz.build(PIC)
sys.settrace(None)

print("build ->", "emitted" if got else "None")
tail = [ln for ln in seen if 1700 <= ln <= 1960][-22:]
for ln in tail:
    print("   %4d  %s" % (ln, LINES[ln - 1].rstrip()[:88]))
