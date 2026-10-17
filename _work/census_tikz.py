"""Census: which TikZ constructs appear in the corpus, and which ones cetz.py rejects."""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'tools'))
from t2t import cetz  # noqa: E402

PICTURE = re.compile(r'\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}', re.S)
CONSTRUCT = re.compile(r'\\(?:draw|fill|filldraw|path|node|coordinate|clip|shade|foreach|'
                       r'scope|begin\{axis\}|begin\{scope\})|'
                       r'\b(?:controls|cycle|rectangle|circle|ellipse|arc|grid|plot|parabola|'
                       r'sin|cos|to|edge|let|node|pic)\b|'
                       r'\.\.|-{2,}|>{2,}')

totals = collections.Counter()
pictures = 0
converted = 0
rejected_reasons = collections.Counter()
first_samples = {}

for tex in sorted((ROOT / '_work' / 'flat').glob('*.tex')):
    text = tex.read_text(encoding='utf-8', errors='replace')
    for pic in PICTURE.findall(text):
        pictures += 1
        for m in CONSTRUCT.finditer(pic):
            totals[m.group(0).strip()] += 1
        if cetz.convert(pic):
            converted += 1
        else:
            for pat, label in [(r'\\begin\{axis\}', 'pgfplots axis'),
                               (r'\bcontrols\b', 'bezier controls'),
                               (r'\bplot\b', 'plot coordinates'),
                               (r'\\clip\b', 'clip'),
                               (r'\\shadedraw|\\shade\b|shading', 'shade'),
                               (r'\barc\b', 'arc'),
                               (r'\bellipse\b', 'ellipse'),
                               (r'\bgrid\b', 'grid'),
                               (r'\\foreach\b', 'foreach leftover'),
                               (r'\bto\b|\bedge\b', 'to/edge path'),
                               (r'\blet\b', 'let'),
                               (r'\bparabola\b', 'parabola'),
                               (r'\bsin\b|\bcos\b', 'sin/cos'),
                               (r'decorate|decoration', 'decoration'),
                               (r'\\begin\{scope\}', 'scope'),
                               (r'node\s*distance|\\path\s*\[', 'other')]:
                if re.search(pat, pic):
                    rejected_reasons[label] += 1
                    first_samples.setdefault(label, pic[:400])
                    break
            else:
                rejected_reasons['unclassified'] += 1
                first_samples.setdefault('unclassified', pic[:400])

print('pictures %d  converted %d  (%.1f%%)' % (pictures, converted, 100.0 * converted / max(pictures, 1)))
print('\n-- rejection causes --')
for k, v in rejected_reasons.most_common():
    print('%4d  %s' % (v, k))
print('\n-- construct frequency --')
for k, v in totals.most_common(30):
    print('%6d  %r' % (v, k))
pathlib.Path(ROOT / '_work' / 'cetz_samples.txt').write_text(
    '\n\n===================\n\n'.join('### %s\n%s' % (k, v) for k, v in first_samples.items()),
    encoding='utf-8')
print('\nsamples -> _work/cetz_samples.txt (%d classes)' % len(first_samples))
