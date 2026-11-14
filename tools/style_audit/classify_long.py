"""Classify the long lines to decide what can be reflowed safely."""
import glob
import re
import collections
import sys

root = sys.argv[1] if len(sys.argv) > 1 else '.'
files = sorted(glob.glob(root + '/typst/**/*.typ', recursive=True))
cat = collections.Counter()
lens = collections.Counter()
samples = collections.defaultdict(list)
for f in files:
    t = open(f, encoding='utf-8', errors='replace').read()
    for i, l in enumerate(t.split('\n')):
        n = len(l)
        if n <= 120:
            continue
        s = l.strip()
        lens[min(n // 100, 30)] += 1
        if s.startswith('$') and s.endswith('$'):
            k = 'displaymath'
        elif s.startswith('$') and s.endswith('$ <'):
            k = 'displaymath_labelled'
        elif s.startswith('$'):
            k = 'math_then_text'
        elif s.startswith('#'):
            k = 'code_line'
        elif s.startswith('////') or s.startswith('//'):
            k = 'comment'
        elif '$' in s:
            k = 'prose_inline_math'
        elif '#' in s or '@' in s:
            k = 'prose_with_code'
        else:
            k = 'pure_prose'
        cat[k] += 1
        if len(samples[k]) < 4:
            samples[k].append((f, i + 1, s[:200]))
print('total long', sum(cat.values()))
for k, v in cat.most_common():
    print(' ', k, v)
print('length buckets (100s)', sorted(lens.items()))
for k in cat:
    print('=== ', k)
    for f, i, s in samples[k]:
        print('   ', f.replace('\\', '/').split('/')[-2][:40], i, s)
