# -*- coding: utf-8 -*-
# 只读：全 C 库里「裸 \operatorname 坐在下标位任一侧」的枚数（这条式子不需要素材凭据，纯语法）。
import io, glob, re, sys, os
sys.stdout.reconfigure(encoding='utf-8')
PAT = re.compile(u'[_^]\\\\operatorname\\{')
CODE = re.compile(r'`[^`\n]*`')
tot = 0
for p in sorted(glob.glob(u'被引笔记/C*-*.md')):
    s = io.open(p, encoding='utf-8').read()
    n = len(PAT.findall(CODE.sub('', s)))
    if n:
        print(os.path.basename(p)[:34], n)
        tot += n
print('TOTAL=%d' % tot)
