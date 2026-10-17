# -*- coding: utf-8 -*-
# KaTeX 长尾族 5 处可机械替换（报告 _work/katex_tail_triage.md §5）。
# 逐处断言：该行 OLD 命中 1、全文 OLD 命中 1、全文 NEW 命中 0；落盘后行数/$数/反引号数不变、
# 字节增量 == len(NEW)-len(OLD)、CR==0。D26 与 D30 在格内竖线修腿的文件集里，本轮不碰。
import io, glob, sys, os
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
NL = chr(10)
B = chr(92)

OPS = [
    (u'D238', 298, B + u'lvert' + B + u'mathcal Z_{' + B + u'math P}((g_v))' + B + u'rvert',
     B + u'lvert' + B + u'mathcal Z_{' + B + u'mathcal P}((g_v))' + B + u'rvert'),
    (u'D106', 1750, u'$(' + B + u'root h)^3$',
     u'$(' + B + u'mathtt{root}' + B + u' h)^3$'),
    (u'D106', 1873, u'$' + B + u'root h$',
     u'$' + B + u'mathtt{root}' + B + u' h$'),
    (u'D106', 1913, u'(-a_1)/(' + B + u'root T)^3' + B + u'le',
     u'(-a_1)/(' + B + u'mathtt{root}' + B + u' T)^3' + B + u'le'),
    (u'D106', 1914, u'$(-a_1)/(' + B + u'root T)^3>0$',
     u'$(-a_1)/(' + B + u'mathtt{root}' + B + u' T)^3>0$'),
]

state = {}
for nid, ln, old, new in OPS:
    if nid not in state:
        p = glob.glob(u'研究笔记/' + nid + u'-*.md')[0]
        raw = io.open(p, 'rb').read()
        assert raw.count(chr(13).encode()) == 0, nid
        io.open(u'_work/' + nid + u'.pre-tail5.md', 'wb').write(raw)
        state[nid] = [p, raw.decode('utf-8')]
    p, t = state[nid]
    ls = t.split(NL)
    line = ls[ln - 1]
    print(u'%s L%d old=%r' % (nid, ln, old))
    assert line.count(old) == 1, (u'line hits', line.count(old))
    assert t.count(old) == 1, (u'file hits', t.count(old))
    assert t.count(new) == 0, (u'new present', t.count(new))
    exp = len(new) - len(old)
    t2 = NL.join([line.replace(old, new) if i == ln - 1 else l for i, l in enumerate(ls)])
    b2 = t2.encode('utf-8')
    assert len(b2) - len(t.encode('utf-8')) == exp, (len(b2) - len(t.encode('utf-8')), exp)
    assert t2.count(u'$') == t.count(u'$') and t2.count(chr(96)) == t.count(chr(96))
    assert len(t2.split(NL)) == len(ls)
    assert b2.count(chr(13).encode()) == 0
    state[nid][1] = t2
    print(u'   ok delta=%+d' % exp)

for nid, (p, t) in state.items():
    io.open(p, 'wb').write(t.encode('utf-8'))
    print(u'%s written getsize=%d  bsmathtt=%d  bsroot=%d  bsmathP=%d' % (
        nid, os.path.getsize(p), t.count(B + u'mathtt'), t.count(B + u'root'),
        t.count(B + u'math P')))
