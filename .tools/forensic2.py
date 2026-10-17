# -*- coding: utf-8 -*-
import io, os, re, glob

ROOT = r'E:\math'
y = io.open(os.path.join(ROOT, 'lean', 'formalization.yaml'), encoding='utf-8', errors='replace').read().split('\n')


def show(a, b, tag):
    print('--- %s ---' % tag)
    for i in range(a, b + 1):
        print('Y%d %s' % (i, y[i - 1][:170]))


for kw in ['Fourier', 'Tensor', 'VlasovMaxwell']:
    idx = [i for i, l in enumerate(y, 1) if kw in l and i > 1280]
    print('%s main_result lines: %s' % (kw, idx[:12]))

show(1636, 1650, 'around Vlasov record')
idx = [i for i, l in enumerate(y, 1) if 'ComparatorChallenges/Fourier' in l or 'Fourier' in l and i > 1280]
print('fourier-ish', idx[:8])

for d in ['OAI/Analysis/VlasovMaxwell', 'OAI/Analysis/RelativisticVlasovMaxwell']:
    p = os.path.join(ROOT, 'lean', d)
    if os.path.isdir(p):
        fs = [(os.path.getsize(f), os.path.relpath(f, p).replace('\\', '/')) for f in glob.glob(p + '/**/*.lean', recursive=True)]
        print(d, 'files=%d total=%d' % (len(fs), sum(s for s, _ in fs)))
        for s, r in sorted(fs, reverse=True)[:8]:
            print('   %7d %s' % (s, r))
