# -*- coding: utf-8 -*-
import io, glob

SEP = u'| --- | --- | --- | --- | --- |'
p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D60-*.md')[0]
L = io.open(p, encoding='utf-8').read().split('\n')
n = 0
for i in range(1, len(L)):
    if L[i - 1].startswith(u'| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 |') and L[i] != SEP:
        print('line', i + 1, repr(L[i]))
        L[i] = SEP
        n += 1
io.open(p, 'w', encoding='utf-8', newline='\n').write('\n'.join(L))
print('fixed', n)
