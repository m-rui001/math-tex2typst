# Static, typst-free: run each tikzpicture in a figure file through the same expander sequence
# production uses (probe_static_families.py) and report the first stage that refuses.
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "tools"))
from t2t import cetz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)


def stage_of(pic):
    body = pic[len("\\begin{tikzpicture}"):].lstrip()
    head, pos = cetz._opts_at(body, 0)
    if head is None:
        return "opts", None
    if cetz._transform(head) is None:
        return "transform", head
    body = body[pos:]
    end = body.rfind("\\end{tikzpicture}")
    body = cetz.expand_def(body[:end] if end >= 0 else body)
    body = cetz.expand_foreach(body)
    if body is None:
        return "foreach", None
    body = cetz.expand_def(body)
    body = cetz.expand_pgfmath(body)
    if body is None:
        return "pgfmath", None
    body = cetz.expand_ifnum(body)
    if body is None:
        return "ifnum", None
    got = cetz.expand_tikzset(cetz.drop_clips(body))
    if got is None:
        return "tikzset", None
    cols = cetz._colors(got[1])
    if cols is None:
        return "colors", None
    bad = cetz.UNSUPPORTED.search(cols[1])
    if bad:
        return "unsupported:" + bad.group(0).lstrip("\\"), None
    scoped = cetz.scoped(cols[1], cetz._transform(head))
    if scoped is None:
        return "scoped", None
    built = cetz.build(pic, cols[0])
    if built is None:
        return "statement", None
    return "BUILT", built


for arg in sys.argv[1:]:
    path = arg if os.path.isabs(arg) else os.path.join(ROOT, arg)
    text = open(path, encoding="utf-8", errors="replace").read()
    for n, pic in enumerate(PICTURE.findall(text)):
        verdict, built = stage_of(pic)
        print("%-44s pic%d: %s" % (os.path.basename(path)[:44], n, verdict))
        if built:
            print("\n".join("   " + l for l in built.splitlines()[:4]))
