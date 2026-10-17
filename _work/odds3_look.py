# -*- coding: utf-8 -*-
r"""三站取证：把 D104:155／D108:424／D142:561 的坏形窗口逐字符打出来，并数整篇命中。

规格里的 old 要**逐字节**对得上，中文引号／ASCII 引号、`\ ` 这类空距都得先看清楚再抄。
"""
import glob
import io

BT = chr(96)
QUOT = {u'ASCII双引号': chr(34), u'中文左引号': u'‘'.replace(u'‘', u'“'),
        u'中文右引号': u'”', u'反引号': BT}

NEEDLE = [(u'D104', 155, u'text{w'), (u'D108', 424, u'^\\per='), (u'D142', 561, u'R_{ab}&')]
for cid, ln, nd in NEEDLE:
    path = glob.glob(u'研究笔记/' + cid + u'-*.md')[0]
    text = io.open(path, encoding=u'utf-8').read()
    cur = text.split(u'\n')[ln - 1]
    i = cur.index(nd.replace(u'\\\\', u'\\'))
    win = cur[max(0, i - 40):i + 70]
    print(u'=== %s:%d  全篇命中=%d' % (cid, ln, text.count(nd.replace(u'\\\\', u'\\'))))
    print(u'    窗口 repr: %r' % win)
    print(u'    引号计数: ' + u'  '.join(
        u'%s=%d' % (k, cur.count(v)) for k, v in QUOT.items()))
