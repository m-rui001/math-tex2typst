"""Face: how often does a size-specified delimiter wrap a matrix pandoc cannot see?

pandoc builds a real `mat(...)` only when the delimiters are `\left…\right` (or the environment's
own, as in `pmatrix`). With `\bigl( \begin{smallmatrix}…\end{smallmatrix} \bigr)` it emits a scaled
paren plus loose `&`/`\\` text, which is inert inside a `cases` branch -- the Quasi-Riemann page
prints `(10u01)` and Typst warns "linebreaks are ignored in branches". Counted here in the sources,
with and without a `cases` around it.
"""
import glob
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

BIG = r"\\[bB]igg?[lrm]?\s*[(\[{|.]"
ENV = r"\\begin\{(matrix|smallmatrix|array)\}"
WRAP = re.compile(BIG + r"\s*" + ENV)
CASES = re.compile(r"\\begin\{(cases|rcases|dcases)\}(.*?)\\end\{\1\}", re.S)

wrapped = papers = in_cases = 0
samples = []
counts = {}
for f in sorted(glob.glob("_work/flat/*.tex")):
    text = open(f, encoding="utf-8", errors="replace").read()
    for env in ("pmatrix", "bmatrix", "Bmatrix", "vmatrix", "Vmatrix",
                "smallmatrix", "matrix", "array"):
        counts[env] = counts.get(env, 0) + text.count("\\begin{%s}" % env)
    hits = list(WRAP.finditer(text))
    if not hits:
        continue
    wrapped += len(hits)
    papers += 1
    spans = [m.span(2) for m in CASES.finditer(text)]
    for m in hits:
        inside = any(a <= m.start() < b for a, b in spans)
        in_cases += inside
        if inside and len(samples) < 4:
            samples.append((f.split("\\")[-1][:44], " ".join(text[m.start():m.start() + 90].split())))
print("big-delimiter + delimiter-less matrix: %d in %d papers; of those inside cases: %d"
      % (wrapped, papers, in_cases))
for name, s in samples:
    print("  %s\n      %s" % (name, s))

# and the environments that DO reach pandoc as a mat, for scale
for env, n in counts.items():
    print("  \\begin{%s}: %d" % (env, n))
