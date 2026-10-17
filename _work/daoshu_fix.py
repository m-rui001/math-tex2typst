# -*- coding: utf-8 -*-
# 用户明示授权：把本工具 sweep 连读族造成的 29 枚不成词「反道是」改回「反倒是」。
# 全字符级、唯一修法、等字节等行数。
import io, glob, os, sys

BAD = u'\u53cd\u9053\u662f'    # 反 + 道(U+9053) + 是, 工具产物
GOOD = u'\u53cd\u5012\u662f'   # 反 + 倒(U+5012) + 是, 正确词
assert len(BAD) == len(GOOD) == 3
assert BAD.encode('utf8') != GOOD.encode('utf8')
assert len(BAD.encode('utf8')) == len(GOOD.encode('utf8')) == 9

inflight = io.open(u'.tools/inflight.txt', 'rb').read().decode('utf8').split()
skip = set(x for x in inflight if x.startswith('D'))
print('inflight skip set:', sorted(skip))

rows = []
tot = 0
for p in sorted(glob.glob(u'研究笔记/D*.md')):
    b0 = io.open(p, 'rb').read()
    if b0.count(BAD.encode('utf8')) == 0:
        continue
    ID = p.split(u'\\')[-1].split(u'/')[-1].split(u'-')[0]
    if ID in skip:
        rows.append((ID, 0, 'SKIPPED inflight'))
        continue
    t = b0.decode('utf8')
    n = t.count(BAD)
    assert len(BAD.encode('utf8')) == len(GOOD.encode('utf8'))
    t2 = t.replace(BAD, GOOD)
    assert t2.count(BAD) == 0
    b1 = t2.encode('utf8')
    assert len(b1) == len(b0), (len(b0), len(b1))
    L0, L1 = b0.split(b'\n'), b1.split(b'\n')
    assert len(L0) == len(L1)
    assert b0.count(b'\r') == 0 and b1.count(b'\r') == 0
    assert sum(l.count(b'$') for l in L0) == sum(l.count(b'$') for l in L1)
    assert sum(l.count(b'`') for l in L0) == sum(l.count(b'`') for l in L1)
    # 只允许动包含 BAD 的那几行
    diff = [i + 1 for i in range(len(L0)) if L0[i] != L1[i]]
    hitl = [i + 1 for i, l in enumerate(t.split(u'\n')) if BAD in l]
    assert diff == hitl, (diff, hitl)
    io.open(p, 'wb').write(b1)
    back = io.open(p, 'rb').read()
    assert back == b1
    rows.append((ID, n, 'lines=%s size=%d' % (hitl, len(back))))
    tot += n

out = [u'fixed total=%d files=%d' % (tot, len(rows))]
out += [u'%s n=%d %s' % r for r in rows]
out.append(u'remaining BAD corpus-wide=%d' % sum(
    io.open(p, 'rb').read().decode('utf8').count(BAD) for p in glob.glob(u'研究笔记/D*.md')))
out.append(u'legit GOOD corpus-wide=%d' % sum(
    io.open(p, 'rb').read().decode('utf8').count(GOOD) for p in glob.glob(u'研究笔记/D*.md')))
out.append(u'banned SRC corpus-wide=%d' % sum(
    io.open(p, 'rb').read().decode('utf8').count(u'\u53cd\u800c\u662f') for p in glob.glob(u'研究笔记/D*.md')))
io.open(u'_work/daoshu_fix.txt', 'wb').write(u'\n'.join(out).encode('utf8'))
print(out[0], out[-3:])
