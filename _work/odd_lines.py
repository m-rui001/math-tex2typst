# -*- coding: utf-8 -*-
import io, glob

want = {
    'D34': [614, 642, 643, 644, 645, 646, 647],
    'D62': [367, 368, 399, 400, 478, 479],
    'D123': [179, 197, 198, 218, 219],
    'D407': [303, 305, 307, 309],
    'D113': [31, 32],
    'D101': [189],
}
out = io.open('_work/odd_lines.txt', 'w', encoding='utf-8')
for key, lns in sorted(want.items()):
    p = glob.glob(u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0' + '/' + key + '-*.md')[0]
    L = io.open(p, encoding='utf-8').read().split('\n')
    out.write(u'==== %s\n' % key)
    for n in lns:
        out.write(u'%d|%s\n' % (n, L[n - 1][:230]))
out.close()
print('ok')
