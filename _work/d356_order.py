# -*- coding: utf-8 -*-
"""Execute D356's own errata work order (the seven items it calls 机械可修).

Every fix is prescribed verbatim by the note: the table cell's stray closer, the
"同样地" for likewise, the §0 lead-in phrase, the §6 tail to be put back before
the §7 heading, and the self-referential banned glyph.  Nothing here invents text.

Usage: python d356_order.py [--apply]
"""
from __future__ import unicode_literals
import io, os, sys, glob, shutil
import join_wraps2 as J

B = chr(92)
D = chr(36)
T = chr(96)
NOTE = glob.glob(u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0/D356-*.md')[0]

t = io.open(NOTE, encoding='utf-8').read()
L = t.split(u'\n')

# The paragraph the note copied into its errata, quotes stripped.
para = u'\n'.join(x.strip().strip(u'\u201c\u201d"') for x in L[844:847])
assert para.startswith(u'\u6211\u5bf9\u8fd9\u4e00\u8282'), para[:20]

OPS = [
    # (a) 台账第 12 数据行首格：多一个反引号、缺一个闭合美元符
    (u'A_m(c)^3' + T + u' |', u'A_m(c)^3$ |'),
    # (b) §10 坑七：likewise -> 同样地
    (u'\u5c3e\u4f30\u8ba1 likewise \u4e0d\u78b0', u'\u5c3e\u4f30\u8ba1 \u540c\u6837\u5730 \u4e0d\u78b0'),
    # (c) §0 第二条登记行引导语（登记串本身逐字不动）
    (u'\u672c\u5355\u4f4d\u7f6e\uff1a\u5176\u4ed6\u961f\u5217\u7b2c 180 \u884c\u53f7',
     u'\u672c\u5355\u4f4d\u4e8e\u5176\u4ed6\u961f\u5217\u7684\u884c\u53f7\uff1a\u5176\u4ed6\u961f\u5217\u7b2c 180 \u884c\u53f7'),
    # (e) 自指写入的禁令字形，连同其反引号一起换成类目名
    (T + u'\u2713' + T, u'\u8868\u4e2d\u6807\u8bb0\u7b26\u53f7'),
]

plan = []
for old, new in OPS:
    if t.count(old) != 1:
        print('MISS count=%d old=%r' % (t.count(old), old))
        continue
    t = t.replace(old, new, 1)
    plan.append((old, new))

# (d) §6 末段归位：插回 §7 标题之前
head = u'\n\n## \u00a77 '
sec6 = t.split(u'## \u00a76')[1].split(head)[0]
if t.count(head) != 1:
    print('MISS anchor for §6 归位 count=%d' % t.count(head))
elif para.split(u'\n')[0] in sec6:
    print('ALREADY in §6')
else:
    t = t.replace(head, u'\n\n' + para + head, 1)
    plan.append((u'<insert §6 tail>', para[:24]))

orig = io.open(NOTE, encoding='utf-8').read()
L2, fl2 = J.fence_flags(t)
L1, fl1 = J.fence_flags(orig)
print('ops=%d dollar %+d tick %+d wrap1 %d->%d'
      % (len(plan), t.count(D) - orig.count(D), t.count(T) - orig.count(T),
         len(J.wrap1_spans(L1, fl1)), len(J.wrap1_spans(L2, fl2))))
# The strict grammar meter too: inserting a paragraph shifts which $ pairs with
# which, so wrapN/UNCLOSED must be re-measured, not assumed.
sys.path.insert(0, u'E:/math/_work')
_saved = sys.argv
sys.argv = [u'd356_order.py']          # wrap_strict runs its census on import
from wrap_strict import scan
sys.argv = _saved
def cls(s):
    h = scan(s)
    return (sum(1 for x in h if x[1] == 'WRAP1'),
            sum(1 for x in h if x[1].startswith('WRAP') and x[1] != 'WRAP1'),
            sum(1 for x in h if x[1] == 'UNCLOSED'))
c1, c2 = cls(orig), cls(t)
print('strict wrap1/wrapN/unclosed %r -> %r' % (c1, c2))
assert c2[0] <= c1[0] and c2[1] <= c1[1] and c2[2] <= c1[2]
assert t.count(chr(13)) == 0
assert len(J.wrap1_spans(L2, fl2)) <= len(J.wrap1_spans(L1, fl1))
assert u'\u2713' not in t
assert u'likewise' in t  # the two errata lines still quote the word
if '--apply' in sys.argv:
    shutil.copyfile(NOTE, u'E:/math/_work/D356.pre-order.md')
    with io.open(u'E:/math/_work/d356_order_log.txt', 'a', encoding='utf-8') as g:
        for old, new in plan:
            g.write(u'%r\t%r\n' % (old, new))
    io.open(NOTE, 'w', encoding='utf-8', newline='').write(t)
print('APPLIED' if '--apply' in sys.argv else 'dry')
