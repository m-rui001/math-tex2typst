import io, glob
p = [x for x in glob.glob('研究笔记/D131-*') if x.endswith('.md')][0]
t = io.open(p, encoding='utf-8').read()
R = [(r'切片盘 $|v|\le5\lambda_j/4\subset D_{x_j}$', r'切片盘 $\lvert v\rvert\le5\lambda_j/4\subset D_{x_j}$'),
     (r'| $|i-j|$ 递增与指标和递增 |', r'| $\lvert i-j\rvert$ 递增与指标和递增 |')]
for old, new in R:
    assert t.count(old) == 1, t.count(old)
    t = t.replace(old, new)
bare = [l for l in t.split('\n') if l.startswith('| ') and l.count('|') != 6]
print('badLedger', len(bare), 'size', len(t.encode()))
io.open(p, 'w', encoding='utf-8', newline='').write(t)
