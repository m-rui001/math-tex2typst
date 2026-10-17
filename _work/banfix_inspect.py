# -*- coding: utf-8 -*-
import io

M = u'C:/Users/hp/.qoder-cn/projects/E--math/memory/style-ban-batch-repair.md'
old = io.open(M, 'rb').read()
t = old.decode('utf8')
MARK = u'\n- **\u8f6c\u4e49\u8868\u7684\u76ee\u6807\u8bcd'
print('bytes', len(old), 'CR', old.count(b'\r'), 'marker count', t.count(MARK))
tail = t[-1200:]
io.open(u'_work/banfix_tail.txt', 'wb').write(tail.encode('utf8'))
print('tail dumped', len(tail))
