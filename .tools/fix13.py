# -*- coding: utf-8 -*-
import io, glob

p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D94-*.md')[0]
t = io.open(p, encoding='utf-8').read()
old = r'$\lvert+\rvert $$,'
new = r'$\lvert+\rangle$,'
print('hits', t.count(old))
t = t.replace(old, new)
io.open(p, 'w', encoding='utf-8', newline='\n').write(t)
