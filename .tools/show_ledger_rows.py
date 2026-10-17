import io, glob, sys
HDR = '| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |'
p = [x for x in glob.glob('研究笔记/' + sys.argv[1] + '*') if x.endswith('.md')][0]
L = io.open(p, encoding='utf-8').read().split('\n')
h = [i for i, l in enumerate(L) if l == HDR][0]
rows = []
j = h + 2
while j < len(L) and L[j].startswith('| '):
    rows.append((j + 1, L[j])); j += 1
print('ledger rows', len(rows))
for n, r in rows:
    if r.count('|') != 6:
        print(n, r.count('|'), r)
