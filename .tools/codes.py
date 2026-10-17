# -*- coding: utf-8 -*-
import io, glob

t = io.open(glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D139-*.md')[0], encoding='utf-8').read()
i = t.find(u'\u6362\u53e5')
seg = t[i:i + 8]
print('note seg codes:', [hex(ord(c)) for c in seg])
g = io.open('.tools/accept_note.py', encoding='utf-8').read()
j = g.find(u'\u6362\u53e5')
print('gate seg codes:', [hex(ord(c)) for c in g[j:j + 8]])
std = [hex(ord(c)) for c in u'\u6362\u53e5\u8bf4\u8bdd']
print('std:', std)
