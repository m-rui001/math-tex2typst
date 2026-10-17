# -*- coding: utf-8 -*-
# 表头全角/半角归一 + 表内裸竖线修复。只在归一后逐字等于规格表头时才动，防止把 legacy 表洗成合规表。
import io, sys, glob

HDR = (u'| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e'
       u'(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |')
FW = {u'\uff08': u'(', u'\uff09': u')', u'\uff1a': u':', u'\u3000': u' ',
      u'\uff5c': u'|', u'\u2014': u'--'}


def norm(s):
    for a, b in FW.items():
        s = s.replace(a, b)
    return s.rstrip()


def pair(c, tok, op, cl):
    for _ in range(20):
        i = c.find(tok)
        if i < 0:
            return c
        j = c.find(tok, i + len(tok))
        if j < 0:
            return c
        c = c[:i] + op + c[i + len(tok):j] + cl + c[j + len(tok):]
    return c


def fixrow(line):
    if not (line.startswith('| ') and line.endswith('|')):
        return None
    cells = line[2:-1].split(' | ')
    if len(cells) < 5:
        return None
    out = [pair(pair(c, u'\\|', u'\\lVert ', u'\\rvert '), u'|', u'\\lvert ', u'\\rvert ')
           for c in cells]
    if len(cells) > 5:
        return None
    return u'| ' + u' | '.join(out) + u' |'


for k in sys.argv[1:]:
    hs = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/%s-*.md' % k)
    if not hs:
        print(k, 'NOFILE')
        continue
    p = hs[0]
    lines = io.open(p, encoding='utf-8').read().split('\n')
    hn = []
    for i, l in enumerate(lines):
        if l.startswith(u'| \u7b26\u53f7 |') and l.count('|') == 6:
            if norm(l) == HDR and l != HDR:
                lines[i] = HDR
                hn.append(i + 1)
    hp = [i for i, l in enumerate(lines) if l == HDR]
    fx = 0
    if hp:
        h = hp[-1]
        i = h + 2
        while i < len(lines) and lines[i].startswith('| '):
            if lines[i].count('|') != 6:
                new = fixrow(lines[i])
                if new is not None and new.count('|') == 6 and norm(new) == new:
                    lines[i] = new
                    fx += 1
            i += 1
        rows = i - h - 2
    else:
        rows = 0
    io.open(p, 'w', encoding='utf-8', newline='\n').write('\n'.join(lines))
    print(k, 'hdr@', hn, 'pipe_fixed', fx, 'rows', rows,
          'hdr_total', '\n'.join(lines).count(HDR))
