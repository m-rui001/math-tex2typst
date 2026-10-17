"""Coverage + compile-validation of generated CeTz canvases."""
import pathlib
import re
import subprocess
import sys

sys.path.insert(0, 'E:/math/tools')
from t2t import cetz

TIKZ = re.compile(r'\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}', re.S)
outs = []
tot = 0
for f in sorted(pathlib.Path('E:/math/_work/flat').glob('*.tex')):
    t = f.read_text(encoding='utf-8', errors='replace')
    for m in TIKZ.finditer(t):
        tot += 1
        c = cetz.convert(m.group(0))
        if c:
            outs.append(c)
print('tikz %d converted %d (%.1f%%)' % (tot, len(outs), 100 * len(outs) / max(tot, 1)))

canvases = [c.replace(cetz.HEADER, '') for c in outs]
bad = []
for i, cv in enumerate(canvases):
    doc = cetz.HEADER + '#set page(width: 400pt, height: 400pt)\n' + cv
    p = pathlib.Path('E:/math/_work/cetzchunk.typ')
    p.write_text(doc, encoding='utf-8')
    r = subprocess.run(['typst', 'compile', str(p), 'E:/math/_work/cetzchunk.pdf'],
                       capture_output=True, text=True, encoding='utf-8', errors='replace')
    if r.returncode != 0:
        bad.append((i, r.stderr.strip().splitlines()[:2]))
print('canvases %d, failing %d' % (len(canvases), len(bad)))
for i, err in bad[:6]:
    print('---', i, err)
    print(canvases[i][:400])
