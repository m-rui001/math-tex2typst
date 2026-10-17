"""Measure CeTz translator coverage across the flattened corpus."""
import collections
import pathlib
import re
import sys

sys.path.insert(0, 'E:/math/tools')
from t2t import cetz

TIKZ = re.compile(r'\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}', re.S)
pats = collections.Counter()
ok = tot = 0
samples = []
for f in sorted(pathlib.Path('E:/math/_work/flat').glob('*.tex')):
    t = f.read_text(encoding='utf-8', errors='replace')
    for m in TIKZ.finditer(t):
        tot += 1
        src = m.group(0)
        if cetz.convert(src):
            ok += 1
        else:
            for kw in ['axis', 'foreach', 'addplot', 'node', 'draw', 'fill',
                       'grid', 'scope', 'matrix', 'pgfmath', 'plot', 'arc',
                       'ellipse', 'controls', 'clip', 'shade', 'pattern']:
                if re.search(r'\\' + kw + r'\b', src):
                    pats[kw] += 1
            if len(samples) < 4:
                samples.append((f.name[:40], src[:260]))
print('tikzpictures', tot, 'converted', ok, '%.1f%%' % (100 * ok / max(tot, 1)))
print(pats.most_common(15))
for n, s in samples:
    print('---', n)
    print(re.sub(r'\s+', ' ', s)[:260])
