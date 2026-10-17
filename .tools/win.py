# -*- coding: utf-8 -*-
import io, re, glob

pats = [u'\u800c\u4e0d\u662f', u'\u800c\u662f', u'\u503c\u5f97\u6ce8\u610f', u'\u6362\u53e5\u8bdd']
out = []
for pat in ['D139', 'D140', 'D114', 'D127', 'D131', 'D141']:
    p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/' + pat + '-*.md')
    if not p:
        continue
    t = io.open(p[0], encoding='utf-8').read()
    lines = t.split('\n')
    for i, l in enumerate(lines, 1):
        for q in pats:
            for m in re.finditer(re.escape(q), l):
                a = max(0, m.start() - 45)
                b = min(len(l), m.end() + 45)
                out.append('%s|L%d|%s|%s' % (pat, i, q, l[a:b].replace('\n', ' ')))
io.open('.tools/win.txt', 'w', encoding='utf-8').write('\n'.join(out))
print(len(out))
