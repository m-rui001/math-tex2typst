"""Does the macro expander hand \\label{subjectN} to pandoc, and what does pandoc make of it?

Runs the same body preprocessing convert_paper does on one flat file, then reports how many
\\label{subjectN} survive into the tex that pandoc reads, and the AST node types that carry them.
"""
import json
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import prep

name = sys.argv[1]
src = os.path.join(ROOT, "_work/flat", name + ".tex")
text = open(src, encoding="utf-8", errors="replace").read()
pre_text, body = prep.split_document(text)
p = prep.parse_preamble(pre_text)
LABELS = re.compile(r"\\label\{subject[0-9]+\}")
print("flat source           :", len(LABELS.findall(body)))
body = prep.expand_macros(body, p.macros)
print("after expand_macros   :", len(LABELS.findall(body)))
body = prep.fix_dialect_prose(body)
print("after fix_dialect     :", len(LABELS.findall(body)))
body = prep.strip_dropped(body)
print("after strip_dropped   :", len(LABELS.findall(body)))
body = prep.array_floats(body)
body = prep.fix_multicolumn_specs(body)

got = re.findall(r"\\label\{subject[0-9]+\}", body)
print("labels subjectN after prep:", len(got), got[:5])
print("hypertarget subjectN in body:", len(re.findall(r"\\hypertarget\{subject[0-9]+\}", body)))
print("cataloguesection calls left:", len(re.findall(r"\\cataloguesection", body)))
print("hypertarget left:", len(re.findall(r"\\hypertarget", body)))
i = body.find("Algebraic and complex geometry")
print("expansion around first section:", repr(body[i - 120:i + 120]))
for k in range(4):
    i = body.find("Algebraic and complex geometry", i + 1)
    if i < 0:
        break
    print("occurrence %d:" % (k + 2), repr(body[i - 160:i + 80]))

path = "_work/tabprobe/labels.tex"
os.makedirs(os.path.dirname(path), exist_ok=True)
open(path, "w", encoding="utf-8").write(pre_text + "\\begin{document}\n" + body)
out = path[:-4] + ".json"
subprocess.run([os.environ.get("PANDOC", "pandoc"), path, "-f", "latex", "-t", "json",
                "-o", out], capture_output=True, text=True, encoding="utf-8", timeout=600)
ast = json.load(open(out, encoding="utf-8"))


def find(node, want, hits, depth=0):
    if isinstance(node, dict):
        s = json.dumps(node, ensure_ascii=False)
        if want in s and depth < 12 and len(s) < 600:
            hits.append(s)
            return
        for v in node.values():
            find(v, want, hits, depth + 1)
    elif isinstance(node, list):
        for x in node:
            find(x, want, hits, depth + 1)


for probe in ("subject3", "hypertarget"):
    hits = []
    find(ast, probe, hits)
    print("--- %r nodes: %d" % (probe, len(hits)))
    for h in hits[:3]:
        print("   ", h[:240])
