# -*- coding: utf-8 -*-
# D452 L398 手滑上标残片清理（作者 §申报行 414 给出的处置通道＝本体侧机械清理；申报行本身不动）
import io, os, sys
sys.stdout.reconfigure(encoding='utf-8')

P = u'研究笔记/D452-每个无理旋转的不变投影反例.md'
B = chr(92)
raw = io.open(P, 'rb').read()
assert raw.count(b'\r') == 0
text = raw.decode('utf-8')
lines = text.split(u'\n')
b0 = len(raw)
d0 = text.count(u'$')
t0 = text.count(u'`')
n0 = len(lines)

FRAG = u'$^{]}$'
OLD = u'm$' + u'"' + FRAG + u'，这与'
NEW = u'm$' + u'"' + u'，这与'

IDX = 398
line = lines[IDX - 1]
assert line.count(FRAG) == 1, ('line frag hits', line.count(FRAG))
assert line.count(OLD) == 1, ('line OLD hits', line.count(OLD))
assert text.count(OLD) == 1, ('file OLD hits', text.count(OLD))
assert text.count(FRAG) == 2, ('file FRAG hits (398 + 申报行414)', text.count(FRAG))

lines[IDX - 1] = line.replace(OLD, NEW)
new_text = u'\n'.join(lines)
data = new_text.encode('utf-8')
delta = len(data) - b0
assert new_text.count(u'$') == d0 - 2, (new_text.count(u'$'), d0)
assert new_text.count(u'`') == t0
assert len(lines) == n0
assert delta == -6, delta
assert new_text.count(FRAG) == 1

io.open('_work/D452.pre-fragfix.md', 'wb').write(raw)
io.open(P, 'wb').write(data)
print('bytes %d -> %d delta=%d' % (b0, os.path.getsize(P), delta))
print('FRAG left=%d (申报行 414)' % new_text.count(FRAG))
odd = [(i + 1, l.count(u'$')) for i, l in enumerate(lines) if l.count(u'$') % 2]
print('odd-$ lines:', odd)
