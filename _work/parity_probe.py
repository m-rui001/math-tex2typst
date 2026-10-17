# -*- coding: utf-8 -*-
# Explain file-level odd $ parity: escaped \$ and code fences are not span delimiters.
import io, re, os, glob

BS = chr(92)
D = chr(36)
BT = chr(96)
for nid in ('D125', 'D389', 'D145', 'D96', 'D25'):
    p = sorted(glob.glob(os.path.join(r'E:\math', u'研究笔记', nid + '-*.md')))[0]
    txt = io.open(p, encoding='utf-8').read()
    esc = txt.count(BS + D)
    nofence = re.sub(BT * 3 + '.*?' + BT * 3, '', txt, flags=re.S)
    nocode = re.sub(BT + '[^' + BT + BS + D + '\n]*' + BT, '', nofence)
    print('%-6s raw$=%-6d escaped$=%-4d outside-code=%-6d parity_outside=%d'
          % (nid, txt.count(D), esc, nocode.count(D), nocode.count(D) % 2))
    # the specific line I edited
for nid, ln in (('D125', 448), ('D389', 91)):
    p = sorted(glob.glob(os.path.join(r'E:\math', u'研究笔记', nid + '-*.md')))[0]
    l = io.open(p, encoding='utf-8').read().split('\n')[ln - 1]
    print('%s:%d  $=%d even=%s  backtick=%d even=%s' % (nid, ln, l.count(D), l.count(D) % 2 == 0,
                                                        l.count(BT), l.count(BT) % 2 == 0))
