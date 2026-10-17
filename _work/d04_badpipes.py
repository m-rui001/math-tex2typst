# -*- coding: utf-8 -*-
# Print every line in D04's appended tail whose pipe count is not 6, with neighbours.
import io

P = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0' + u'/D04-乘性函数二点关联.md'
lines = io.open(P, encoding='utf-8').read().split('\n')
bad = [i for i, l in enumerate(lines) if l.count('|') >= 2 and l.count('|') != 6]
for i in bad:
    print('LINE', i + 1, 'pipes', lines[i].count('|'))
    print('  TEXT', lines[i][:160].encode('unicode_escape').decode())
    for j in (i - 1, i + 1):
        if 0 <= j < len(lines):
            print('  n', j + 1, lines[j][:80].encode('unicode_escape').decode())
