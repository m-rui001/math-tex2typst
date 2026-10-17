# -*- coding: utf-8 -*-
import io, glob

BAN = [u'\u503c\u5f97\u6ce8\u610f\u7684\u662f', u'\u9700\u8981\u6307\u51fa\u7684\u662f', u'\u6362\u53e5\u8bf4',
       u'\u7efc\u4e0a', u'\u603b\u4f53\u800c\u8a00']
BAD = u'\u6362\u53e5\u8bdd'  # 换句话(错序)

# 1) 修门禁词表：用转义写法重写 BAN 行
gp = '.tools/accept_note.py'
g = io.open(gp, encoding='utf-8').read()
old_line = None
for l in g.split('\n'):
    if l.startswith('BAN = ['):
        old_line = l
NEW = "BAN = [" + ', '.join(repr(b) for b in BAN) + ']'
g = g.replace(old_line, NEW)
io.open(gp, 'w', encoding='utf-8', newline='').write(g)
print('gate BAN line replaced:', old_line is not None)
for b in BAN:
    print('  check', repr(b.encode('unicode_escape')), b in NEW)

# 2) 全量扫描：真正的 换句话说 与错序的 换句话
print('--- scan notes ---')
for p in sorted(glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md')):
    t = io.open(p, encoding='utf-8').read()
    a = t.count(BAN[2])
    b = t.count(BAD)
    if a or b:
        print('%s real=%d swapped=%d' % (p[-40:], a, b))
