# -*- coding: utf-8 -*-
# 上下文核对：D542 / D486 / D543 / D452 的申报行与正文缺陷位原文。只读。
import io, os

NS = u'\u7814\u7a76\u7b14\u8bb0'
WANT = {
    u'D542': [(298, 312), (300, 305)],
    u'D486': [(140, 146), (172, 176), (250, 256)],
    u'D543': [(248, 252), (264, 270)],
    u'D452': [(226, 232), (41, 45), (69, 73), (203, 207), (221, 225)],
}

out = []
for fn in sorted(os.listdir(NS)):
    d = fn[:4]
    if d not in WANT:
        continue
    t = io.open(os.path.join(NS, fn), encoding='utf-8', errors='replace').read()
    lines = t.split(u'\n')
    out.append(u'#### %s %s lines=%d' % (d, fn, len(lines)))
    for a, b in WANT[d]:
        for i in range(a, min(b, len(lines)) + 1):
            out.append(u'%s L%d: %s' % (d, i, lines[i - 1]))
        out.append(u'---')
    out.append(u'')

io.open('_work/bodyside_upper_ctx.txt', 'wb').write(u'\n'.join(out).encode('utf-8') + b'\n')
print('files=%d rows=%d' % (len(WANT), len(out)))
