"""Re-run every paper whose last report failed to compile, then summarise."""
import collections
import concurrent.futures
import json
import pathlib
import re
import sys
import time

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'tools'))
from t2t.convert import convert_paper  # noqa: E402

names = sorted(p.parent.name for p in (ROOT / 'typst').glob('*/report.json')
               if not json.loads(p.read_text(encoding='utf-8')).get('compile_ok'))


def run(name):
    src = ROOT / '_work' / 'flat' / (name + '.tex')
    out = ROOT / 'typst' / name
    if not src.exists():
        return {'paper': name, 'ok': False, 'compile_ok': False, 'error': 'no flat source'}
    try:
        report = convert_paper(str(src), str(out), name)
    except Exception as exc:
        report = {'paper': name, 'ok': False, 'compile_ok': False, 'error': repr(exc)}
    (out / 'report.json').write_text(json.dumps(report, ensure_ascii=False, indent=2),
                                     encoding='utf-8')
    return report


start = time.time()
reports = []
with concurrent.futures.ThreadPoolExecutor(max_workers=8) as pool:
    for report in pool.map(run, names):
        reports.append(report)
        print('%d/%d %s %s' % (len(reports), len(names),
                               'OK ' if report.get('compile_ok') else 'BAD',
                               report['paper'][:60]), flush=True)

good = sum(r.get('compile_ok') for r in reports)
print('\ncompiled %d/%d in %.0fs' % (good, len(reports), time.time() - start))
kinds = collections.Counter()
for r in reports:
    if r.get('compile_ok'):
        continue
    kinds.update(r.get('error_kinds') or {})
    if r.get('error'):
        kinds['exception:' + r['error'][:40]] += 1
for k, v in kinds.most_common(20):
    print(v, '|', k[:100])
stats = collections.Counter()
for r in reports:
    stats.update({k: v for k, v in (r.get('stats') or {}).items()
                  if isinstance(v, int)})
print('math_unconverted', stats['math_unconverted'], 'cetz_converted', stats['cetz_converted'])
still = [r['paper'] for r in reports if not r.get('compile_ok')]
pathlib.Path(ROOT / '_work' / 'still_failing.txt').write_text('\n'.join(still), encoding='utf-8')
