# -*- coding: utf-8 -*-
import io, glob

REPL = {
    'D67': [(u'$h_L+t_L\\le|L|\\eta$ | | 04:137-144',
             u'$h_L+t_L\\le\\lvert L\\rvert\\eta$ | 04:137-144'),
            (u'$k=|\\delta|$ \u9608\u503c $s^{1-a/2}$ | | 06:428',
             u'$k=\\lvert\\delta\\rvert$ \u9608\u503c $s^{1-a/2}$ | 06:428')],
    'D70': [(u'$\\E[Z_i|\\mathcal F_i]=e^{\\sigma^2/2}$',
             u'$\\E[Z_i\\vert\\mathcal F_i]=e^{\\sigma^2/2}$')],
    'D94': [(u'\u975e $|+\\rangle', u'\u975e $\\lvert+\\rvert $')] ,
}

for b, pairs in REPL.items():
    p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/%s-*.md' % b)[0]
    t = io.open(p, encoding='utf-8').read()
    for old, new in pairs:
        if old not in t:
            print(b, 'MISS', repr(old[:40]))
            continue
        t = t.replace(old, new, 1)
        print(b, 'ok', len(old) - len(new))
    io.open(p, 'w', encoding='utf-8', newline='\n').write(t)
