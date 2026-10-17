"""Corpus-wide measure of strip_pdf_noise: what it removes, what it must not touch."""
import pathlib
import re
import sys
import time

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'tools'))
from t2t import prep  # noqa: E402

NOISE_MARK = re.compile(r'\\(?:pdfliteral|BeginAccSupp|EndAccSupp|csname|expandafter'
                        r'|ActualText|begingroup)')

flat = sorted((ROOT / '_work' / 'flat').glob('*.tex'))
t0 = time.time()
stats = {'files': 0, 'changed': 0, 'noise_before': 0, 'noise_after': 0,
         'theorems_before': 0, 'theorems_after': 0, 'len_before': 0, 'len_after': 0,
         'crash': 0}
worst = []
for path in flat:
    text = path.read_text(encoding='utf-8', errors='replace')
    pre, _ = prep.split_document(text)
    if not pre.strip():
        continue
    stats['files'] += 1
    try:
        out = prep.strip_pdf_noise(pre)
    except Exception as exc:
        stats['crash'] += 1
        worst.append((path.name[:50], 'CRASH ' + str(exc)[:80]))
        continue
    b, a = len(NOISE_MARK.findall(pre)), len(NOISE_MARK.findall(out))
    stats['noise_before'] += b
    stats['noise_after'] += a
    tb, ta = len(re.findall(r'\\newtheorem', pre)), len(re.findall(r'\\newtheorem', out))
    stats['theorems_before'] += tb
    stats['theorems_after'] += ta
    stats['len_before'] += len(pre)
    stats['len_after'] += len(out)
    if out != pre:
        stats['changed'] += 1
    if a or ta != tb:
        worst.append((path.name[:50], 'residual noise %d, newtheorem %d->%d' % (a, tb, ta)))
print('scanned %d preambles in %.1fs' % (stats['files'], time.time() - t0))
for k, v in stats.items():
    print('  %-16s %s' % (k, v))
print('\n-- files needing attention (%d) --' % len(worst))
for name, why in worst[:25]:
    print('  %-52s %s' % (name, why))
