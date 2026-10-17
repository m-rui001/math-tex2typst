# -*- coding: utf-8 -*-
# 列出被 2 篇语料稿引用的 arXiv id（wave-2 候选），落 _work/cite_top2.txt
import io, sys, json
sys.stdout.reconfigure(encoding='utf-8')
rows = json.load(io.open('_work/cited_by_notes.json', encoding='utf-8'))
two = [r for r in rows if len(r['notes']) == 2]
one = [r for r in rows if len(r['notes']) == 1]
print('n>=3 rows = %d   n==2 rows = %d   n==1 rows = %d' % (
    sum(1 for r in rows if len(r['notes']) >= 3), len(two), len(one)))
io.open('_work/cite_top2.txt', 'w', encoding='utf-8').write('\n'.join(r['arxiv'] for r in two) + '\n')
for r in two[:40]:
    print('%-18s %s' % (r['arxiv'], ','.join(r['notes'])))
