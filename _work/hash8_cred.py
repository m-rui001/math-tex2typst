# -*- coding: utf-8 -*-
r"""`Expected 'EOF', got '#'` 8 站的取证面：逐站打 repr（把反斜杠、反引号、`$` 原形露出来），
再打这一行与前后各若干行的 `$`／反引号计数，用来定位「哪一行的定界符是奇数」——
被旗标的站往往只是受害者，真元凶在上游（同 `unclosed` 那一族的经验）。
"""
import glob
import io
import os

SITES = [('D211', 233), ('D244', 14), ('D244', 167), ('D28', 715),
         ('D293', 57), ('D356', 929), ('D80', 2228), ('D93', 158)]

for cid, ln in SITES:
    f = glob.glob(os.path.join(u'研究笔记', cid + u'-*.md'))[0]
    lines = io.open(f, encoding='utf-8').read().split(u'\n')
    print(u'\n===== %s:%d （本篇 %d 行）=====' % (cid, ln, len(lines)))
    for i in range(max(0, ln - 4), min(len(lines), ln + 1)):
        t = lines[i]
        print(u'%5d| $=%d `=%d | %s' % (i + 1, t.count(u'$'), t.count(u'`'),
                                        repr(t[:240])[1:-1]))
    if cid == u'D211':
        print(u'  --- 本篇 $ 奇数行 ---')
        for i, t in enumerate(lines, 1):
            if t.count(u'$') % 2:
                print(u'  %5d| $=%d  %s' % (i, t.count(u'$'), repr(t[:120])[1:-1]))
