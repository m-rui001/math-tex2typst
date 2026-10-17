# -*- coding: utf-8 -*-
import io, glob, os

for p in sorted(glob.glob(u'被引笔记/C*-*.md')):
    text = io.open(p, encoding='utf-8').read()
    hits = []
    for ln, line in enumerate(text.split(u'\n'), 1):
        i, in_math = 0, False
        while i < len(line):
            c = line[i]
            if line[i:i + 2] == u'$$':
                i += 2
                continue
            if c == u'$':
                if not in_math and line[i + 1:i + 2] == u' ':
                    hits.append((ln, i, line[i:i + 46]))
                in_math = not in_math
            elif c == u'`':
                j = line.find(u'`', i + 1)
                i = j if j > 0 else i
            elif c == u'\\':
                i += 1
            i += 1
    if hits:
        print('%s 开符后带空格=%d' % (os.path.basename(p)[:3], len(hits)))
        for ln, col, s in hits[:6]:
            print('   L%d:%d  %s' % (ln, col, s))
print('done')
