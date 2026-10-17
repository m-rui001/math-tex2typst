"""How does pandoc hand us \\hypertarget, \\label and \\pageref in prose?

Prints the full AST for three small documents so the emitter's options are visible: an anchor
written as \\hypertarget{}{}, one written as \\label{}, and the references back to them.
"""
import json
import os
import subprocess

DOCS = {
    "hypertarget": "\\hypertarget{subject3}{}Algebra\n\n\\hyperlink{subject3}{go}\n",
    "label": "\\label{subject3}Algebra\n\nSee \\ref{subject3} and \\pageref*{subject3}.\n",
    "both": "\\section{Algebra}\\label{subject3}\\hypertarget{s9}{}\n\n"
            "\\ref{subject3} \\pageref{subject3} \\hyperlink{s9}{x}\n",
}

os.makedirs("_work/tabprobe", exist_ok=True)
for name, tex in DOCS.items():
    path = "_work/tabprobe/ht-%s.tex" % name
    with open(path, "w", encoding="utf-8") as fh:
        fh.write(tex)
    out = path[:-4] + ".json"
    subprocess.run([os.environ.get("PANDOC", "pandoc"), path, "-f", "latex", "-t", "json",
                    "-o", out], capture_output=True, text=True, encoding="utf-8", timeout=120)
    print("=== %s" % name)
    print(json.dumps(json.load(open(out, encoding="utf-8"))["blocks"], ensure_ascii=False)[:900])
    print()
