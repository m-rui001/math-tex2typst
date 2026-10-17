import io, glob, re
EM = chr(8212)
p = [x for x in glob.glob('研究笔记/D132-*') if x.endswith('.md')][0]
t = io.open(p, encoding='utf-8').read()
t = re.sub(EM + r'+\s*', '，', t)
t = t.replace('，，', '，').replace('， ', '，') if False else t.replace('，，', '，')
print('em', t.count(EM), 'size', len(t.encode()), 'dollar', t.count('$'))
io.open(p, 'w', encoding='utf-8', newline='').write(t)

q = [x for x in glob.glob('研究笔记/D141-*') if x.endswith('.md')][0]
s = io.open(q, encoding='utf-8').read()
old = '落盘后有两处我做了最小修补并在这是非处记账：'
assert s.count(old) == 1, s.count(old)
s = s.replace(old, '落盘后有两处我做了最小修补，记账放在紧接的补记段：')
print('d141 size', len(s.encode()))
io.open(q, 'w', encoding='utf-8', newline='').write(s)
