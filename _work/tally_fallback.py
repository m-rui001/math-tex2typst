import collections
import os
import re

SIG = '$ "' + chr(92)
tokens = collections.Counter()
papers = 0
total = 0
for root, dirs, files in os.walk('preprints'):
    if 'main.typ' not in files:
        continue
    s = open(os.path.join(root, 'main.typ'), encoding='utf-8', errors='replace').read()
    hits = [l for l in s.split('\n') if SIG in l]
    if not hits:
        continue
    papers += 1
    total += len(hits)
    blob = '\n'.join(hits)
    for tok in ('begin{align', 'begin{gather', 'begin{equation', 'substack', 'tikzcd',
                'BeginAccSupp', 'varprojlim', 'varinjlim', 'hbox', 'xymatrix', 'begin{split',
                'begin{cases', 'displaystyle', 'begin{array', 'mathclap', 'raisebox', 'includegraphics'):
        if re.search(re.escape(tok), blob):
            tokens[tok] += 1
print('papers', papers, 'fallback lines', total)
for tok, n in tokens.most_common():
    print('%-20s %d' % (tok, n))
