# -*- coding: utf-8 -*-
import io, glob

HDR = u'| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |'


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
    assert line.startswith('| ') and line.endswith('|')
    body = line[2:-1]
    cells = body.split(' | ')
    if len(cells) != 5:
        return None
    out = [pair(pair(c, u'\\|', u'\\lVert ', u'\\rvert '), u'|', u'\\lvert ', u'\\rvert ')
           for c in cells]
    return u'| ' + u' | '.join(out) + u' |'


for k in ('D151', 'D152'):
    p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/%s-*.md' % k)[0]
    lines = io.open(p, encoding='utf-8').read().split('\n')
    h = max(i for i, l in enumerate(lines) if l == HDR)
    fixed, left = 0, []
    for i in range(h + 2, len(lines)):
        if not lines[i].startswith('| '):
            break
        if lines[i].count('|') != 6:
            new = fixrow(lines[i])
            if new is not None and new.count('|') == 6:
                lines[i] = new
                fixed += 1
            else:
                left.append(lines[i][:200])
    io.open(p, 'w', encoding='utf-8', newline='\n').write('\n'.join(lines))
    print(k, 'fixed', fixed, 'left', len(left))
    for l in left[:5]:
        print('  LEFT', l)
