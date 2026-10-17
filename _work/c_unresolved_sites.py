# -*- coding: utf-8 -*-
# 未决宏在稿侧的站点数（按篇按宏），配合 c_unresolved_probe2 的素材凭据读数排优先级。
# 只数代码跨度之外的控制字出现。
import io, re, sys, glob, collections

sys.stdout.reconfigure(encoding='utf-8')
CODE = re.compile(r'`[^`\n]*`')
names = collections.OrderedDict()
for line in io.open(u'_work/c_macro_unresolved.txt', encoding='utf-8'):
    if line.strip():
        f = line.rstrip('\n').split('\t')
        names.setdefault(f[0], set()).add(f[1].strip())

tot = 0
for cid in sorted(names):
    g = glob.glob(u'被引笔记/%s-*.md' % cid)
    if not g:
        continue
    body = CODE.sub(u'', io.open(g[0], encoding='utf-8').read())
    per = []
    for n in sorted(names[cid]):
        c = len(re.findall(re.escape(n) + u'(?![a-zA-Z])', body))
        if c:
            per.append(u'%s=%d' % (n, c))
            tot += c
    if per:
        print(u'%s  %s' % (cid, u' '.join(per)))
print(u'合计站点=%d' % tot)
