# -*- coding: utf-8 -*-
import glob, io, re

P = glob.glob(u'研究笔记/D71-*.md')[0]
b = io.open(P, 'rb').read()
t = b.decode('utf-8')
assert b.count(b'\r') == 0
L = t.split(u'\n')

HDR = u'## 34 后果节开门：两条计数出口与记号约定'
idx = [i for i, l in enumerate(L) if l.strip() == HDR]
assert len(idx) == 2, idx
i = idx[1]
# 第二枚必须是空头节：其后只有一枚空行，再后面就是下一个 ## 标题
assert L[i + 1] == u'', repr(L[i + 1])
assert L[i + 2].startswith(u'## '), repr(L[i + 2])
assert L[i - 1] == u'', repr(L[i - 1])

dollar = t.count(u'$')
tick = t.count(u'`')
lines = t.count(u'\n')

# 删除第 i 行与紧随其后的空行（i、i+1 两行 → 两枚换行）
out = u'\n'.join(L[:i] + L[i + 2:]).encode('utf-8')

s = out.decode('utf-8')
assert s.count(u'$') == dollar
assert s.count(u'`') == tick
assert s.count(u'\n') == lines - 2
assert out.count(b'\r') == 0
assert s.count(HDR) == 1
assert len(out) == len(b) - (len(L[i].encode('utf-8')) + 2)

nums = [int(m.group(1)) for m in
        (re.match(u'## +(\\d+)', l) for l in s.split(u'\n')) if m]
assert nums == list(range(len(nums))), nums

io.open(P, 'wb').write(out)
print('ok heads=%d size %d -> %d delta=%d' % (
    len(nums), len(b), len(out), len(out) - len(b)))
