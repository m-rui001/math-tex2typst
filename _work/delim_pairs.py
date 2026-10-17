# -*- coding: utf-8 -*-
import glob, io, re, sys

B = chr(92)
PAIRS = [(u'langle', u'rangle'), (u'lvert', u'rvert'), (u'lVert', u'rVert'),
         (u'lfloor', u'rfloor'), (u'ulcorner', u'urcorner')]
f = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D%s-*.md' % sys.argv[1])[0]
L = io.open(f, encoding='utf-8', errors='ignore').read().split(u'\n')
sec = None
for i, l in enumerate(L):
    if l.startswith(u'## '):
        sec = l[3:12]
    for a, b in PAIRS:
        ca = len(re.findall(re.escape(B + a) + u'(?![a-zA-Z])', l))
        cb = len(re.findall(re.escape(B + b) + u'(?![a-zA-Z])', l))
        if ca != cb:
            print('sec', sec, 'line', i + 1, a, ca, b, cb, repr(l[:90]))
