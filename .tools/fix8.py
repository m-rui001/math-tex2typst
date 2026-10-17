# -*- coding: utf-8 -*-
import io, glob

ERSHI = u'\u800c\u662f'
p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D12-*.md')[0]
t = io.open(p, encoding='utf-8').read()
old = u'\u4e0d\u662f\u7ed9\u5b9a\u7684\u800c\u662f**\u9009\u51fa**\u7684'
new = u'\u8981\u9760**\u9009\u51fa**\u5f97\u5230'
print('hits', t.count(old))
t = t.replace(old, new)
io.open(p, 'w', encoding='utf-8', newline='').write(t)
print('ershi_left', t.count(ERSHI), 'size', len(t.encode('utf-8')))
