import io, glob, sys
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
NL = chr(10)
B = chr(92)
p = glob.glob(u'研究笔记/D84-*.md')[0]
t = io.open(p, 'r', encoding='utf-8').read()
ls = t.split(NL)
print(u'count bsR         =', t.count(B + u'R'))
print(u'count bsmathbb R  =', t.count(B + u'mathbb R'))
print(u'count bsmathbb{R} =', t.count(B + u'mathbb{R}'))
pat = B + u'R'
i = 0
while True:
    i = t.find(pat, i)
    if i < 0:
        break
    ln = t.count(NL, 0, i) + 1
    start = t.rfind(NL, 0, i) + 1
    end = t.find(NL, i)
    line = t[start:] if end < 0 else t[start:end]
    col = i - start
    print(u'site line=%d col=%d' % (ln, col))
    print(u'  ' + line[:220])
    i += 1
