# -*- coding: utf-8 -*-
import io, glob, re

p = glob.glob(u'研究笔记/D623-*.md')[0]
t = io.open(p, encoding='utf-8', newline='').read()
HDR = u'| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |'
SEP = u'| --- | --- | --- | --- | --- |'
NARROW = u'|---|---|---|---|---|'
assert (len(HDR), len(SEP), len(NARROW)) == (44, 31, 21), 'literal width drift'

lines = t.split('\n')
# 1) canonical header's separator must be the spaced form
h = [i for i, l in enumerate(lines) if l == HDR]
assert len(h) == 1, h
assert lines[h[0] + 1] == NARROW, repr(lines[h[0] + 1])
lines[h[0] + 1] = SEP

# 2) closing backtick mistyped as a delimiter: only on the two odd lines
pat = re.compile(r'(\.tex:[0-9]+(?:-[0-9]+)?)\$')
fixed = 0
for i, l in enumerate(lines):
    if l.count('$') % 2 == 1:
        new = pat.sub(lambda m: m.group(1) + u'`', l)
        if new != l:
            lines[i] = new
            fixed += l.count('$') - new.count('$')
assert fixed == 2, fixed

out = '\n'.join(lines)
assert len(out) == len(t) + 10, (len(out), len(t))
io.open(p, 'w', encoding='utf-8', newline='').write(out)
print('sep_fixed_at', h[0] + 2, 'delimiters_to_backtick', fixed, 'bytes', len(out.encode('utf-8')))
