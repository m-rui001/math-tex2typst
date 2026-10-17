# -*- coding: utf-8 -*-
# 机械对齐台账表头：全角括号 -> 半角；缺 (文件:行) 的合规表头补上。只动表头行。
import io, sys, glob

FW = u'\uff08\u6587\u4ef6:\u884c\uff09'
HW = u'(\u6587\u4ef6:\u884c)'
HDR = (u'| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | '
       + u'位置' + HW + u' | \u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |')
BARE = (u'| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e | '
        u'\u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |')

for k in sys.argv[1:]:
    h = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/%s-*.md' % k)
    if not h:
        print(k, 'NOFILE')
        continue
    p = h[0]
    t = io.open(p, encoding='utf-8').read()
    lines = t.split('\n')
    ch = []
    for i, l in enumerate(lines):
        if l.startswith(u'| ') and u'\u7b26\u53f7' in l and l.count('|') == 6:
            new = l.replace(FW, HW)
            if new == BARE:
                new = HDR
            if new != l:
                lines[i] = new
                ch.append(i + 1)
    if ch:
        io.open(p, 'w', encoding='utf-8', newline='\n').write('\n'.join(lines))
    print(k, 'fixed@', ch, 'hdrnow=', '\n'.join(lines).count(HDR))
