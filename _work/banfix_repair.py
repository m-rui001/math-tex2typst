# -*- coding: utf-8 -*-
import io

M = u'C:/Users/hp/.qoder-cn/projects/E--math/memory/style-ban-batch-repair.md'
old = io.open(M, 'rb').read()
t = old.decode('utf8')
MARK = u'\n- **\u8f6c\u4e49\u8868\u7684\u76ee\u6807\u8bcd'
assert t.count(MARK) == 1, t.count(MARK)
kept = t[:t.index(MARK)].rstrip(u'\n') + u'\n'
blk = io.open(u'_work/mem_banfix_block.md', 'rb').read().decode('utf8')
assert blk.startswith(u'\n\n- '), repr(blk[:6])
new = (kept + blk.rstrip(u'\n') + u'\n').encode('utf8')
assert new.count(b'\r') == 0
assert b'command not found' not in new
io.open(M, 'wb').write(new)
back = io.open(M, 'rb').read()
assert back == new
print('size %d -> %d CR %d lines %d' % (len(old), len(back), back.count(b'\r'),
                                        len(back.decode('utf8').split(u'\n'))))
print('holes repaired:', u'u53cd' in back.decode('utf8'))
