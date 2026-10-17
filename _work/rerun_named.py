"""Re-run named papers and report LaTeX residue before/after."""
import json
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'tools'))
from t2t.convert import convert_paper  # noqa: E402

MACRO = re.compile(r'\\[a-zA-Z]{2,}')
NAMES = [
    'Sharp-integral-fillings-in-CAT(0)-spaces-September-23-2026',
    'Canonical-conformal-limits-of-subcritical-FK-planar-maps-September-24-2026',
    'Uniformization-of-complete-Kahler-manifolds-with-positive-bisectional-curvature-September-23-2026',
    'Generalized-Cartan-Hadamard-isoperimetry-and-Euclidean-equality-rigidity-September-25-2026',
    'Cylinder-loop-weights-and-planar-nesting-September-26-2026',
    'Disk-transfer-representations-and-confined-bridge-mass-September-26-2026',
    'A-rational-obstruction-to-strong-chromatic-splitting-at-height-three-September-25-2026',
    'An-L3-bound-for-the-trilinear-Hilbert-transform-October-5-2026',
    'Thomason-Model-Structures-in-Every-Strict-Higher-Dimension-September-23-2026',
    'The-critical-dimension-for-one-phase-Bernoulli-minimizers-September-24-2026',
    'The-height-three-chromatic-overlap-an-explicit-filtration-and-its-attachment-September-26-2026',
    'Uniform-marked-polygon-estimates-and-sharp-finite-bridge-moments-September-24-2026',
]


def residue(name):
    typ = ROOT / 'typst' / name / 'main.typ'
    if not typ.exists():
        return -1
    return len(MACRO.findall(typ.read_text(encoding='utf-8', errors='replace')))


total_before = total_after = 0
for name in NAMES:
    src = ROOT / '_work' / 'flat' / (name + '.tex')
    if not src.exists():
        matches = sorted((ROOT / '_work' / 'flat').glob(name[:40] + '*.tex'))
        if not matches:
            print('SKIP (no source)', name[:60])
            continue
        src = matches[0]
        name = src.stem
    before = residue(name)
    out = ROOT / 'typst' / name
    try:
        report = convert_paper(str(src), str(out), name)
    except Exception as exc:
        print('EXC', name[:50], repr(exc)[:120])
        continue
    (out / 'report.json').write_text(json.dumps(report, ensure_ascii=False, indent=2),
                                     encoding='utf-8')
    after = residue(name)
    total_before += max(before, 0)
    total_after += after
    print('%s residue %5d -> %5d  unconv %4d  cetz %2d  %s' % (
        'OK ' if report.get('compile_ok') else 'BAD', before, after,
        (report.get('stats') or {}).get('math_unconverted', 0),
        (report.get('stats') or {}).get('cetz_converted', 0), name[:58]))

print('\ntotal residue %d -> %d' % (total_before, total_after))
