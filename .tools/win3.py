# -*- coding: utf-8 -*-
import io, glob

KEYS = [u'\u800c\u662f', u'\u6362\u53e5\u8bf4', u'\u503c\u5f97', u'\u9700\u8981\u6307\u51fa',
        u'\u8868\u5934\uff1a', u'\u4e00\u5904\u5f15\u7528\u7f3a\u9677', u'\u53f0\u8d26\u8868\uff1a', u'\u53d9\u4e8b\u5c42']
out = []
for pat in ['D139', 'D140', 'D142']:
    p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/' + pat + u'-*.md')[0]
    lines = io.open(p, encoding='utf-8').read().split('\n')
    out.append('=== %s (%d lines) ===' % (pat, len(lines)))
    for i, l in enumerate(lines, 1):
        for k in KEYS:
            if k in l:
                out.append('%s L%d [%s] %s' % (pat, i, k, l[:400]))
                break
io.open('.tools/win3.txt', 'w', encoding='utf-8').write('\n'.join(out))
print(len(out))
