import io, glob
p = [x for x in glob.glob('研究笔记/D134-*') if x.endswith('.md')][0]
t = io.open(p, encoding='utf-8').read()
BT = chr(96)
old = '(' + BT + 'Asymptotics.lean:24)'
new = '(' + BT + 'Asymptotics.lean:24' + BT + ')'
assert t.count(old) == 1, t.count(old)
t = t.replace(old, new)
odd = sum(1 for l in t.split('\n') if l.startswith('|') and l.count(BT) % 2)
print('oddRows', odd, 'size', len(t.encode()))
io.open(p, 'w', encoding='utf-8', newline='').write(t)
