r"""What LaTeX itself numbers for a float carrying several \labels.

Runs pdflatex over _work/probe_labels_tex.tex and reads the aux: two names written under one caption
have to number from that caption, and each caption inside one float steps the counter on its own.
"""
import io
import os
import re
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TEX = os.path.join(ROOT, "_work", "probe_labels_tex.tex")
OUT = os.path.join(ROOT, "_work", "_probe_labels")
os.makedirs(OUT, exist_ok=True)
run = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", OUT, TEX],
                     capture_output=True, text=True, encoding="utf-8", errors="replace")
print("rc=%s" % run.returncode)
aux = os.path.join(OUT, "probe_labels_tex.aux")
for name, number, page in re.findall(r"\\newlabel\{([^}]*)\}\{\{([^}]*)\}\{([^}]*)\}",
                                     open(aux, encoding="utf-8", errors="replace").read()):
    print("   %-12s number=%-4s page=%s" % (name, number, page))
log = open(os.path.join(OUT, "probe_labels_tex.log"), encoding="utf-8", errors="replace").read()
print("LaTeX Warning lines:")
for line in log.splitlines():
    if line.startswith("LaTeX Warning"):
        print("   " + line[:120])
