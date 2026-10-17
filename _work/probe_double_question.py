"""Are the 2830 `??` marks in the generated Typst ours, or the papers' own?

`dangling_report.py` counts `??` in `main.typ` across 336 files, up to 64 in one paper.  Before
treating that as our loss, compare against the flattened LaTeX the run was built from: arXiv sources
ship with their own unresolved `\ref`s, and a faithful conversion has to carry the `??` through.
Prints the counts side by side plus the surrounding text of the first few marks in each, so a mark
can be read rather than counted.
"""
import os
import re

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PAPERS = ['Tangent-flow-uniqueness-2026-09-24',
          'Giglis-distributional-curvature-characteriza',
          'The-canonical-massive-continuum-limit-of-the',
          'Finite-angular-cylinder-covers-below-the-half-area-bound-September-27-2026']
MARK = re.compile(r'\?\?')


def context(text, n=3):
    out = []
    for m in list(MARK.finditer(text))[:n]:
        out.append(re.sub(r'\s+', ' ', text[max(0, m.start() - 60):m.end() + 25]))
    return out


def find(folder, prefix):
    hits = [p for p in os.listdir(folder) if p.startswith(prefix)]
    return os.path.join(folder, hits[0]) if hits else None


for prefix in PAPERS:
    flat = find(os.path.join(ROOT, '_work', 'flat'), prefix)
    typ = find(os.path.join(ROOT, 'typst'), prefix)
    src = open(flat, encoding='utf-8', errors='replace').read() if flat else ''
    out = open(os.path.join(typ, 'main.typ'), encoding='utf-8', errors='replace').read() if typ else ''
    print('%-46s flat=%3d typst=%3d' % (prefix[:46], len(MARK.findall(src)), len(MARK.findall(out))))
    for label, text in (('flat ', src), ('typst', out)):
        for c in context(text):
            print('   %s %s' % (label, c[:105]))
