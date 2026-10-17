# -*- coding: utf-8 -*-
import io, re, glob

HDR = '| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |'
EM = chr(8212)
BC = u'\u800c\u4e0d\u662f'
ES = u'\u800c\u662f'
BAN = [u'\u503c\u5f97\u6ce8\u610f\u7684\u662f', u'\u9700\u8981\u6307\u51fa\u7684\u662f', u'\u6362\u53e5\u8bf4',
       u'\u7efc\u4e0a', u'\u603b\u4f53\u800c\u8a00']


def load(pat):
    p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/' + pat + u'-*.md')[0]
    return p, io.open(p, encoding='utf-8').read()


def save(p, t):
    io.open(p, 'w', encoding='utf-8', newline='').write(t)


# --- D139 leftovers ---
p, t = load('D139')
i = t.find(u'\u6362\u53e5')
t = t[:i] + t[i + len(u'\u6362\u53e5\u8bf4\u8bdd\uff0c'):] if i >= 0 and u'\u6362\u53e5\u8bf4\u8bdd\uff0c' in t[i:i + 8] else t
print('D139 huan left=%d' % t.count(u'\u6362\u53e5'))
t = t.replace('`' + HDR + '`', u'\u4e94\u5217\u680f\u540d\u884c')
print('D139 hdr=%d' % t.count(HDR))
save(p, t)

RES = []
for pat in ['D136', 'D137', 'D142', 'D144']:
    p, t = load(pat)
    t = t.replace(u'\uff0c' + BC, u'\uff0c\u4e0d\u662f').replace(BC, u'\u3001\u4e0d\u662f')
    t = t.replace(EM + EM, u'\uff0c').replace(EM, '--')
    lines = t.split('\n')
    h = None
    for i, l in enumerate(lines):
        if l == HDR:
            h = i
    if h is None:
        RES.append('%s NO-HDR-LINE; header-ish lines:' % pat)
        for i, l in enumerate(lines, 1):
            if l.startswith('|') and u'\u7b26\u53f7' in l:
                RES.append('   %d: %r' % (i, l[:130]))
    else:
        j = h + 2
        while j < len(lines) and lines[j].startswith('| '):
            if lines[j].count('|') != 6:
                new = re.sub(r'\\\|([^|]{1,60}?)\\\|', r'\\lVert\1\\rVert', lines[j])
                if new.count('|') == 6:
                    lines[j] = new
                    RES.append('%s ledger row %d fixed' % (pat, j + 1))
                else:
                    RES.append('%s ledger STILL %d pipes=%d %s' % (pat, j + 1, new.count('|'), new[:200]))
            j += 1
        t = '\n'.join(lines)
    save(p, t)
    hits = {'hdr': t.count(HDR), 'bc': t.count(BC), 'es': t.count(ES), 'em': t.count(EM)}
    for b in BAN:
        if t.count(b):
            hits['ban' + b] = t.count(b)
    RES.append('%s after-sweep %s' % (pat, hits))
    for i, l in enumerate(t.split('\n'), 1):
        if ES in l or any(b in l for b in BAN):
            m = None
            for key in [ES] + BAN:
                if key in l:
                    m = l[max(0, l.find(key) - 70):l.find(key) + 70]
                    break
            RES.append('   %s L%d: %s' % (pat, i, m))
    for i, l in enumerate(t.split('\n'), 1):
        for m in re.finditer(u'\u4e0d\u662f[^\u3002\\n]{0,40}\u800c\u662f', l):
            RES.append('   CONTRAST %s L%d: %s' % (pat, i, l[max(0, m.start() - 60):m.end() + 60]))
io.open('.tools/res4.txt', 'w', encoding='utf-8').write('\n'.join(RES))
print('res=%d' % len(RES))
