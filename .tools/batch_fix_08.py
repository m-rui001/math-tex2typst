# -*- coding: utf-8 -*-
import io, re, glob

HDR = u'| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |'
EM = chr(8212)
BC = u'\u800c\u4e0d\u662f'
ES = u'\u800c\u662f'
DIAG = []


def load(pat):
    p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/' + pat + u'-*.md')[0]
    return p, io.open(p, encoding='utf-8').read()


def save(p, t):
    io.open(p, 'w', encoding='utf-8', newline='').write(t)


def rep(t, old, new, n=1, tag=''):
    c = t.count(old)
    if c != n:
        DIAG.append('MISS[%s] count=%d want=%d :: %s' % (tag or patcur, c, n, old[:40]))
        return t
    return t.replace(old, new)


def ledger_bars(t):
    lines = t.split('\n')
    h = None
    for i, l in enumerate(lines):
        if l == HDR:
            h = i
    if h is None:
        return t
    j = h + 2
    changed = 0
    while j < len(lines) and lines[j].startswith('| '):
        l = lines[j]
        if l.count('|') != 6:
            new = re.sub(r'\\\|([^|]{1,60}?)\\\|', r'\\lVert\1\\rVert', l)
            if new == l:
                def f(m):
                    s = m.group(1)
                    if s.count('|') == 2:
                        a = s.find('|')
                        b = s.find('|', a + 1)
                        return '$' + s[:a] + r'\lvert' + s[a + 1:b] + r'\rvert' + s[b + 1:] + '$'
                    return m.group(0)
                new = re.sub(r'\$([^|$]{1,80}?)\$', f, l)
            if new.count('|') == 6:
                lines[j] = new
                changed += 1
            else:
                DIAG.append('LEDGER-STILL %d pipes=%d :: %s' % (j + 1, new.count('|'), new[:220]))
        j += 1
    DIAG.append('ledger fixed rows=%d' % changed)
    return '\n'.join(lines)


def sweep(t):
    t = t.replace(u'\uff0c' + BC, u'\uff0c\u4e0d\u662f')
    t = t.replace(BC, u'\u3001\u4e0d\u662f')
    t = t.replace(EM + EM, u'\uff0c').replace(EM, '--')
    return t


TARGETS = ['D114', 'D127', 'D131', 'D132', 'D134', 'D135', 'D138', 'D141', 'D142', 'D139', 'D140']

for patcur in TARGETS:
    p, t = load(patcur)
    before = (t.count(BC), t.count(EM), t.count(HDR))
    t = sweep(t)
    t = ledger_bars(t)
    if patcur == 'D139':
        t = rep(t, u'\u4f53\u79ef\u3002\u6362\u53e5\u8bdd\uff0c\u5bc6\u5ea6\u635f\u5931', u'\u4f53\u79ef\u3002\u5bc6\u5ea6\u635f\u5931', tag='D139-huan')
        t = rep(t, u'\u6821\u6b63\u4e0d\u662f\u4e00\u4e2a\uff0c\u800c\u662f\u4e00\u65cf', u'\u6821\u6b63\u6309\u4e00\u65cf\u6765\u7ec4\u7ec7', tag='D139-duij')
        t = rep(t, u'\u6821\u6b63\u662f\u4e00\u65cf\u3001\u4e0d\u662f\u4e00\u4e2a\uff0c', u'\u6821\u6b63\u6309\u4e00\u65cf\u6765\u7ec4\u7ec7\uff0c', tag='D139-472')
        t = rep(t, u'\u503c\u5f97\u6ce8\u610f\u7684\u662f\u5185\u70b9\u7248\u672c', u'\u8fd9\u91cc\u80fd\u770b\u51fa\u5185\u70b9\u7248\u672c', tag='D139-zhide')
        t = rep(t, u'\u6545 $\\eqref{}$ \u7684\u5224\u636e', u'\u6545\u5224\u636e', tag='D139-eqref')
    if patcur == 'D140':
        t = rep(t, u'\u800c\u4e0d\u662f\u4e00\u4e2a\u53ef\u4efb\u610f\u5927\u7684\u56fe', u'\uff0c\u4e0d\u662f\u4e00\u4e2a\u53ef\u4efb\u610f\u5927\u7684\u56fe', tag='D140-895')
    save(p, t)
    print('%s size=%d hdr=%d bc=%d eshi=%d em=%d' % (patcur, len(t.encode('utf-8')), t.count(HDR),
          t.count(BC), t.count(ES) - t.count(BC), t.count(EM)))

io.open('.tools/fixdiag.txt', 'w', encoding='utf-8').write('\n'.join(DIAG))
print('diag lines=%d' % len(DIAG))
