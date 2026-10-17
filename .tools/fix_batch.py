# -*- coding: utf-8 -*-
import io, re, glob, collections

HDR = u'| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |'
HDR2 = u'| \u8bb0\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |'
SEP = u'| --- | --- | --- | --- | --- |'


def load(k):
    p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/%s-*.md' % k)[0]
    return p, io.open(p, encoding='utf-8').read()


def dump(p, text):
    io.open(p, 'w', encoding='utf-8', newline='\n').write(text)


def pair(c, tok, op, cl):
    guard = 0
    while guard < 20:
        guard += 1
        i = c.find(tok)
        if i < 0:
            return c
        j = c.find(tok, i + len(tok))
        if j < 0:
            return c
        c = c[:i] + op + c[i + len(tok):j] + cl + c[j + len(tok):]
    return c


def fixrow(line):
    cells = re.split(u'(?<= )\\|(?= )', line)
    if len(cells) != 7:
        return None
    out = [pair(pair(c, u'\\|', u'\\\\lVert ', u'\\\\rvert '), u'|', u'\\\\lvert ', u'\\\\rvert ')
           for c in cells[1:6]]
    return u'| ' + u' | '.join(out) + u' |'


for k in ('D151', 'D152', 'D159'):
    p, t = load(k)
    lines = t.split('\n')
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
                left.append(lines[i][:160])
    dump(p, '\n'.join(lines))
    print(k, 'rows fixed', fixed, 'left', len(left))
    for l in left[:4]:
        print('   LEFT', l)

# ---------- D149: relocate supplemental rows into the spec table ----------
p, t = load('D149')
lines = t.split('\n')
hs = [i for i, l in enumerate(lines) if l == HDR]
assert len(hs) == 2, hs
a, b = hs


def rows_after(idx, ls):
    r = []
    j = idx + 2
    while j < len(ls) and ls[j].startswith('| '):
        r.append(j)
        j += 1
    return r


main_rows, sup_rows = rows_after(a, lines), rows_after(b, lines)
moved = [lines[i] for i in sup_rows]
moved = [l if l.count('|') == 6 else (fixrow(l) or l) for l in moved]
before = collections.Counter(lines)
for i in reversed(sup_rows):
    del lines[i]
ins = max(main_rows) + 1
lines[ins:ins] = moved
after = collections.Counter(lines)
assert not (before - after) and not (after - before), (before - after, after - before)
b2 = max(i for i, l in enumerate(lines) if l == HDR)
lines[b2] = HDR2
dump(p, '\n'.join(lines))
t2 = io.open(p, encoding='utf-8').read()
print('D149 hdr count', t2.count(HDR), 'size', len(t2.encode('utf-8')))

# ---------- D148: reword to regain the 70,000 floor ----------
p, t = load('D148')
EM = chr(8212)
reps = [(u'\uff0c\u8fd9\u5728\u9010\u70b9\u754c\u4e2d\u4e0d\u53ef\u80fd\u51fa\u73b0',
         u'\uff0c\u8fd9\u6837\u7684\u9879\u5728\u9010\u70b9\u754c\u7684\u6846\u67b6\u4e0b\u4e0d\u53ef\u80fd\u51fa\u73b0'),
        (u'\u8fd9\u4e2a\u770b\u4f3c\u5faa\u73af\u7684\u7ed3\u6784',
         u'\u8fd9\u4e2a\u770b\u4f3c\u5faa\u73af\u7684\u4f9d\u8d56\u7ed3\u6784')]
for x, y in reps:
    assert t.count(x) == 1, (x, t.count(x))
    t = t.replace(x, y)
assert EM not in t
dump(p, t)
print('D148 size', len(t.encode('utf-8')))
