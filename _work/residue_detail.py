"""Classify the LaTeX residue that survives, with context, for named papers."""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
MACRO = re.compile(r'\\[a-zA-Z]{2,}')
RAWBLOCK = re.compile(r'#raw\(block: true, "(?:[^"\\]|\\.)*"\)', re.S)

names = sys.argv[1:] or [
    'Sharp-integral-fillings-in-CAT(0)-spaces-September-23-2026',
    'Generalized-Cartan-Hadamard-isoperimetry-and-Euclidean-equality-rigidity-September-25-2026',
    'An-L3-bound-for-the-trilinear-Hilbert-transform-October-5-2026',
    'Thomason-Model-Structures-in-Every-Strict-Higher-Dimension-September-23-2026',
    'The-critical-dimension-for-one-phase-Bernoulli-minimizers-September-24-2026',
    'Disk-transfer-representations-and-confined-bridge-mass-September-26-2026',
]

for name in names:
    typ = ROOT / 'typst' / name / 'main.typ'
    if not typ.exists():
        print('missing', name)
        continue
    text = typ.read_text(encoding='utf-8', errors='replace')
    spans = [m.span() for m in RAWBLOCK.finditer(text)]
    in_raw = sum(len(MACRO.findall(text[a:b])) for a, b in spans)
    masked = list(text)
    for a, b in spans:
        masked[a:b] = [' '] * (b - a)
    rest = ''.join(masked)
    hits = list(MACRO.finditer(rest))
    counts = collections.Counter(m.group(0) for m in hits)
    print('\n##### %s: %d outside raw (%d inside %d raw blocks)' % (
        name[:60], len(hits), in_raw, len(spans)))
    print('   ', ', '.join('%s:%d' % kv for kv in counts.most_common(10)))
    shown = set()
    for m in hits:
        key = m.group(0)
        if key in shown:
            continue
        shown.add(key)
        print('    %-16s ...%s' % (key, rest[max(0, m.start() - 70):m.start() + 90].replace('\n', ' | ')))
        if len(shown) >= 5:
            break
