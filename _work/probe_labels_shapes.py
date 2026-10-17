r"""What does pandoc's LaTeX reader do with each shape of a second \label?

Runs pandoc -t json over _work/probe_labels_pandoc.tex and reports, for every test label name,
whether the AST carries it and in what node. Then runs pdflatex over the same source and prints the
\newlabel lines of the aux, which is the number each name has to be given.
"""
import io
import json
import os
import re
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TEX = os.path.join(ROOT, "_work", "probe_labels_pandoc.tex")
NAMES = ["sec:one", "fig:inbody", "fig:a", "fig:b", "tab:a", "tab:b", "tab:c", "tab:d",
         "span:inpara", "bare:between", "fig:d", "fig:e"]

OUT = os.path.join(ROOT, "_work", "_probe_labels", "pandoc.json")
os.makedirs(os.path.dirname(OUT), exist_ok=True)
proc = subprocess.run([os.environ.get("PANDOC", "pandoc"), TEX, "-f", "latex", "-t", "json",
                       "-o", OUT], capture_output=True, text=True, encoding="utf-8")
print("pandoc rc=%s err=%s" % (proc.returncode, proc.stderr.strip()[:200]))
ast = json.load(open(OUT, encoding="utf-8"))["blocks"]


def scan(node, path, hits):
    if isinstance(node, dict):
        t = node.get("t")
        if t in ("Figure", "Table", "Div", "Span", "Header", "Para", "Plain"):
            c = node.get("c")
            head = ""
            if isinstance(c, list) and c and isinstance(c[0], list):
                head = json.dumps(c[0], ensure_ascii=False)
            if head and head != '["", [], []]':
                hits.append("%s%s at %s" % (t, head, path))
        for k, v in node.items():
            scan(v, path + "/" + str(k), hits)
    elif isinstance(node, list):
        for i, v in enumerate(node):
            scan(v, path + "[%d]" % i, hits)


print("\n== nodes carrying an attr ==")
for i, block in enumerate(ast):
    hits = []
    scan(block, "block%d" % i, hits)
    print("block %d %-10s %s" % (i, block["t"], " ;; ".join(hits[:6])))

print("\n== which names are in the JSON at all ==")
text = json.dumps(ast, ensure_ascii=False)
for name in NAMES:
    print("   %-12s %s" % (name, "present" if name in text else "DROPPED"))

aux_dir = os.path.join(ROOT, "_work", "_probe_labels")
run = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
                      "-output-directory", aux_dir, TEX],
                     capture_output=True, text=True, encoding="utf-8", errors="replace")
print("\n== pdflatex rc=%s ==" % run.returncode)
aux = os.path.join(aux_dir, "probe_labels_pandoc.aux")
if os.path.isfile(aux):
    for m in re.finditer(r"\\newlabel\{([^}]*)\}\{\{([^}]*)\}\{([^}]*)\}",
                         open(aux, encoding="utf-8", errors="replace").read()):
        print("   %-12s number=%s page=%s" % (m.group(1), m.group(2), m.group(3)))
