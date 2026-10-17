"""Product scan: where does a bare `&` / row-break matrix body sit in the Typst we ship?

pandoc turns a delimiter-less `matrix`/`smallmatrix` into literal `1 & 0\\` + newline + `u_0 & 1`,
which Typst silently prints as one run-on string ('10 u01') instead of a 2x2 matrix, and inside a
`cases` branch it also warns "linebreaks are ignored in branches". `&` and a row break are legal
inside `mat(`/`cases(`/`array(`, so those are not counted.
"""
import glob
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

OPENERS = ("mat(", "cases(", "array(", "mat (", "cases (")
files = sorted(glob.glob("typst/*/main.typ"))
tot_spans = tot_amp = 0
papers = set()
samples = []
for f in files:
    text = open(f, encoding="utf-8", errors="replace").read()
    # walk `$` toggles: a math span runs from one unescaped `$` to the next
    i, start, spans = 0, None, []
    while i < len(text):
        c = text[i]
        if c == "\\" and i + 1 < len(text):
            i += 2
            continue
        if c == "$":
            if start is None:
                start = i
            else:
                spans.append(text[start + 1:i])
                start = None
        i += 1
    for s in spans:
        tot_spans += 1
        if " & " not in s and "&" not in s:
            continue
        if any(o in s for o in OPENERS):
            continue
        tot_amp += 1
        papers.add(f)
        if len(samples) < 8:
            samples.append((f, " ".join(s.split())[:160]))

print("math spans %d ; spans holding a bare `&` (no mat/cases/array) %d ; papers %d of %d"
      % (tot_spans, tot_amp, len(papers), len(files)))
for f, s in samples:
    print("  %s\n      %s" % (f.split("\\")[1][:48], s))

# row breaks too: a backslash ending a line inside math
brk = 0
brkp = set()
for f in files:
    text = open(f, encoding="utf-8", errors="replace").read()
    for m in re.finditer(r"\\\n", text):
        brk += 1
        brkp.add(f)
print("backslash-newline in products: %d in %d papers" % (brk, len(brkp)))
