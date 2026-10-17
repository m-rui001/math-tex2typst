"""Run every pgfmath TikZ picture in the corpus through the converter and report the gate.

Reads only _work/flat/*.tex, so it is safe while a batch is running. Prints one line per picture
and a short canvas sample for the ones that now convert.
"""
import glob
import re
import sys

sys.path.insert(0, "tools")
from t2t import cetz

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

total = converted = 0
for path in sorted(glob.glob("_work/flat/*.tex")):
    text = open(path, encoding="utf-8", errors="replace").read()
    for n, src in enumerate(PIC.findall(text)):
        if "pgfmath" not in src:
            continue
        total += 1
        canvas = cetz.convert(src)
        state = "ok" if canvas else "refused"
        converted += bool(canvas)
        why = ""
        if not canvas:
            core = src[len("\\begin{tikzpicture}"):]
            head, pos = cetz._opts_at(core, 0)
            inner = core[pos:] if head is not None else core
            un = sorted(set(x.group(1) for x in cetz.UNSUPPORTED.finditer(inner)))
            math = re.findall(r"\\pgfmath\w+\s*\{[^{}]*\}\s*\{[^{}]*\}", inner)
            bad = [d for d in math if cetz.expr(re.sub(r"\\[a-zA-Z]+", "1", d)) is None]
            why = " unsupported=%s pgfmath=%d unevaluable=%d" % (un, len(math), len(bad))
        print("%-5s %-58s #%d  %d lines%s" % (state, path.split("/")[-1][:58], n,
                                              len(canvas.splitlines()) if canvas else 0, why))
        if canvas and converted <= 3:
            print("      " + "\n      ".join(canvas.splitlines()[:6]))
print("pictures with pgfmath: %d ; converted: %d" % (total, converted))
