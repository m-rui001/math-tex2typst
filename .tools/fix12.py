# -*- coding: utf-8 -*-
import io, glob

p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D67-*.md')[0]
t = io.open(p, encoding='utf-8').read()

PAIRS = [
    (r'| $\eta=s^{-\xi}$，light 判据 $h_L+t_L\le\lvert L\rvert\eta$ | 04:137-144',
     r'| $\eta=s^{-\xi}$ | light 判据 $h_L+t_L\le\lvert L\rvert\eta$ | 04:137-144'),
    (r'| $k=\lvert\delta\rvert$ 阈值 $s^{1-a/2}$ | 06:428',
     r'| $k=\lvert\delta\rvert$ | 阈值 $s^{1-a/2}$ | 06:428'),
    (r'| $B_0=\lceil8/\theta\rceil=128$ | | 04:27',
     r'| $B_0=\lceil8/\theta\rceil=128$ | 均匀化常数 | 04:27'),
    (r'| $[\tfrac15,\tfrac45]$，$\sqrt5/2-1$ | 分裂比与利率 | 06:107,291-295',
     r'| $[\tfrac15,\tfrac45]$ | 分裂比 $\sqrt5/2-1$ | 06:107,291-295'),
]

for old, new in PAIRS:
    if old in t:
        t = t.replace(old, new, 1)
        print('ok', old[:28])
    else:
        print('MISS', old[:28])

io.open(p, 'w', encoding='utf-8', newline='\n').write(t)
