# -*- coding: utf-8 -*-
r"""21 站逐族的凭据：
1) 同族光杆控制字在全库还有谁（`\Set`／`\red`／`\eqref`），代码跨度形 `` `\eqref` `` 用了多少；
2) 每一站所在文件的**合法形**用量，用来判定修法不是发明；
3) 7 处 F3 的 `\text{…$…$…}` 片段在该篇出现几次（c_note_fix 的命中上限是 4）。
"""
import glob
import io
import os
import re

B = chr(92)
NOTE = u'研究笔记'


def load(cid):
    p = sorted(glob.glob(os.path.join(NOTE, cid + u'-*.md')))
    return p[0], io.open(p[0], encoding='utf-8').read()


def count_all(pat):
    rx = re.compile(pat)
    tot = {}
    for path in sorted(glob.glob(os.path.join(NOTE, u'D*.md'))):
        txt = io.open(path, encoding='utf-8').read()
        for li, line in enumerate(txt.split(u'\n'), 1):
            for m in rx.finditer(line):
                tot.setdefault(os.path.basename(path)[:6], []).append((li, m.group(0)))
    return tot


print(u'### 全库 \\Set（含上下文）')
for f, hits in sorted(count_all(re.escape(B + u'Set')).items()):
    print(u'  %s  %d 处  行%s' % (f, len(hits), [h[0] for h in hits][:6]))

print(u'### 全库 $\\eqref$ 光杆 vs 代码跨度形')
bare = count_all(u'\\$\\s*' + re.escape(B + u'eqref') + u'\\s*\\$')
code = count_all(u'`' + re.escape(B + u'eqref') + u'`')
ok = count_all(re.escape(B + u'eqref') + u'\\{')
print(u'  光杆枚数=%d 篇=%s' % (sum(len(v) for v in bare.values()), sorted(bare)))
print(u'  代码跨度枚数=%d 篇=%d' % (sum(len(v) for v in code.values()), len(code)))
print(u'  带花括号 \\eqref{ 枚数=%d 篇=%d' % (sum(len(v) for v in ok.values()), len(ok)))

print(u'### 全库 \\red 与 \\mathrm{red}')
for pat, lab in [(re.escape(B + u'red'), u'\\red'), (re.escape(B + u'mathrm{red}'), u'\\mathrm{red}')]:
    t = count_all(pat)
    print(u'  %s 枚数=%d 篇=%s' % (lab, sum(len(v) for v in t.values()), len(t)))

for cid, pats in [
    (u'D157', [u'\\\\Set', u'\\\\mathrm\\{Set\\}', u'Set 范畴', u'\\\\mathbf\\{Set\\}']),
    (u'D233', [u'\\\\eqref', u'`\\\\eqref`']),
    (u'D446', [u'\\\\eqref', u'`\\\\eqref`']),
    (u'D480', [u'\\\\eqref', u'`\\\\eqref`']),
    (u'D575', [u'\\\\eqref', u'`\\\\eqref`']),
    (u'D463', [u'\\\\red', u'`\\\\red`', u'\\\\mathrm\\{red\\}']),
    (u'D351', [u'\\\\mathrm\\\\operatorname', u'\\\\operatorname\\{?Id', u'\\\\mathrm\\{Id\\}', u'\\\\Id']),
    (u'D521', [u'\\\\mathfrak ?S', u'\\\\mathfrak\\}', u'\\\\rm ?bal']),
    (u'D326', [u'arccos', u'\\\\frac\\{4\\\\pi\\}']),
    (u'D576', [u'33k\\+28', u'笔误']),
]:
    path, txt = load(cid)
    print(u'### %s  %s  行数=%d' % (cid, os.path.basename(path)[:26], len(txt.split(u'\n'))))
    for pat in pats:
        rx = re.compile(pat)
        hits = [(li, m.group(0)) for li, line in enumerate(txt.split(u'\n'), 1) for m in rx.finditer(line)]
        print(u'   %-22s 枚=%d  行=%s' % (pat, len(hits), sorted(set(h[0] for h in hits))[:12]))
