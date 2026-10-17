r"""Check `cetz._text_width` against pdflatex's own border for a node sized by nothing but its label.

`_clip_to_border` stops a line at a node's border, and until #73 a node whose box the author never
fixed had no half-width at all, so the arrow tip printed inside the letters (Novikov p14, BSD p16,
Factor-Two p14). The shipped estimator counts characters, so the number it answers with has to be
checked against the engine that sets the type for real.

Two readings come out of pdflatex per label:
  * `east - center` of `\node (a) {label}` -- the border the converter is trying to reach. Measured
    law (`_work/measure_node_label_ink.py`): it is `\wd0/2 + .3333em + half the 0.4pt rule`, the same
    7.699pt of slack on all 24 labels tried there, maths and prose alike.
  * `\wd0` of the bare hbox -- what the ink itself costs, which is the part `INK_EM` prices.

Labels are the corpus's own node labels, set at the class the corpus flattens from (article 10pt),
because that is the font size `NODE_BODY_SIZE_PT` claims for a node with no `font=`.
"""
import io
import os
import re
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
WORK = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.dirname(WORK))
from tools.t2t import cetz  # noqa: E402

FLAT = os.path.join(WORK, "flat")
OUT = os.path.join(WORK, "pic-label-ink")
os.makedirs(OUT, exist_ok=True)

NODE_LABEL = re.compile(r"\\node\s*(?:\[[^\]]*\])?\s*(?:\(([^)]*)\))?\s*"
                        r"(?:at\s*\([^)]*\)|\([^)]*\))?\s*\{([^{}]{1,60})\}")
labels, seen = [], set()
for name in sorted(os.listdir(FLAT)):
    if not name.endswith(".tex"):
        continue
    with open(os.path.join(FLAT, name), encoding="utf-8", errors="replace") as fh:
        text = fh.read()
    for _nm, lab in NODE_LABEL.findall(text):
        lab = lab.strip()
        if not lab or lab.count("{") != lab.count("}") or len(lab) > 45 or lab in seen:
            continue
        seen.add(lab)
        labels.append(lab)
        if len(labels) >= 70:
            break
    if len(labels) >= 70:
        break

pic = ("\\begin{tikzpicture}\n"
       "  \\node (a) at (0,0) {@L@};\n"
       "  \\pgfextractx{\\dimen0}{\\pgfpointdiff{\\pgfpointanchor{a}{center}}{\\pgfpointanchor{a}{east}}}\n"
       "  \\typeout{BORDER @I@ W=\\the\\dimen0}\n"
       "\\end{tikzpicture}\n")
hbox = ("\\setbox0=\\hbox{@L@}\\typeout{INK @I@ W=\\the\\wd0}\n")
body = "".join(hbox.replace("@L@", l).replace("@I@", str(i)) +
               pic.replace("@L@", l).replace("@I@", str(i)) for i, l in enumerate(labels))
tex = ("\\documentclass[10pt]{article}\n\\usepackage{amsmath,amssymb}\n\\usepackage{tikz}\n"
       "\\begin{document}\n" + body + "\\end{document}\n")
with open(os.path.join(OUT, "label_border.tex"), "w", encoding="utf-8") as fh:
    fh.write(tex)
subprocess.run(["pdflatex", "-interaction=nonstopmode", "label_border.tex"], cwd=OUT,
               capture_output=True, text=True)
log = open(os.path.join(OUT, "label_border.log"), encoding="utf-8", errors="replace").read()
border, ink = {}, {}
for kind, store in (("BORDER", border), ("INK", ink)):
    for i, rest in re.findall(kind + r" (\d+) ([^\r\n]*)", log):
        m = re.search(r"W=([-\d.]+)pt", rest)
        if m:
            store[int(i)] = float(m.group(1))

PT = 1.0 / cetz.UNITS["pt"]  # cm -> pt
rows = []
print("%-32s %7s %7s | %7s %7s %6s" % ("label", "ink pt", "border", "est ink", "est bdr", "err"))
for i, lab in enumerate(labels):
    if i not in border or not border[i] or not ink.get(i):
        # a label TeX could not set at all -- the corpus's own lift markers `\(\k\)` and
        # `$\lab$`, whose hbox is empty -- prices no ink, so it calibrates nothing
        continue
    est = cetz._text_width({}, cetz.IDENT, lab)
    rows.append((lab, ink.get(i, 0.0), border[i], est / 2.0 * PT))
    print("%-32s %7.3f %7.3f | %7.3f %7.3f %+6.1f%%"
          % (lab[:32], ink.get(i, 0.0), border[i], est / 2.0 * PT, est / 2.0 * PT,
             100 * (est / 2.0 * PT - border[i]) / border[i]))

errs = sorted((e - b) / b for _l, _i, b, e in rows)
n = len(errs)
print("\nlabels read: %d" % n)
print("border error: min %+.1f%%  median %+.1f%%  mean %+.1f%%  max %+.1f%%"
      % (100 * errs[0], 100 * errs[n // 2], 100 * sum(errs) / n, 100 * errs[-1]))
edge = sorted((e - i / 2.0) / (i / 2.0) for _l, i, _b, e in rows)
print("against the INK edge (the letter, not the border): min %+.1f%%  median %+.1f%%"
      % (100 * edge[0], 100 * edge[n // 2]))
print("tip still inside the letters: %d/%d" % (sum(1 for x in edge if x < 0), n))
for lab, i, _b, e in sorted(rows, key=lambda r: (r[3] - r[1] / 2) / (r[1] / 2))[:3]:
    print("  inside: %-30s ink edge %.3fpt estimated %.3fpt" % (lab[:30], i / 2.0, e))
worst = sorted(rows, key=lambda r: (r[3] - r[2]) / r[2])[:3]
for lab, _i, b, e in sorted(rows, key=lambda r: -(r[3] - r[2]) / r[2])[:3]:
    print("  longest: %-30s border %.3fpt estimated %.3fpt" % (lab[:30], b, e))
for lab, _i, b, e in worst:
    print("  shortest: %-30s border %.3fpt estimated %.3fpt" % (lab[:30], b, e))
