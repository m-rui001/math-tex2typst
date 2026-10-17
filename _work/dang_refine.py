# -*- coding: utf-8 -*-
"""Re-check the dangling-reference family with a heading-style-aware meter.

sec_census3 only reads '## N.' and '## SN'; notes also use Chinese numeral
headings, '## 补记' blocks and '### SN.M' subs. A reference is dangling only
when no heading in ANY of those shapes carries the number.
"""
from __future__ import unicode_literals
import io, os, re, glob

U = [u'一', u'二', u'三', u'四', u'五', u'六', u'七', u'八', u'九', u'十',
     u'十一', u'十二', u'十三', u'十四', u'十五', u'十六', u'十七', u'十八', u'十九', u'二十']
ROOT = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
IDS = [u'01', u'05', u'06', u'13', u'14', u'15', u'16', u'17', u'20', u'227',
       u'244', u'351', u'400', u'418', u'46', u'478', u'569', u'643', u'79',
       u'89', u'90']
REF = re.compile(u'\\u00a7\\s?(\\d+)')
H_SHAPES = [re.compile(u'^## \\s?(\\d+)[.)\\u3001]'),
            re.compile(u'^## \\s?\\u00a7(\\d+)'),
            re.compile(u'^## \\s?(' + u'|'.join(U) + u')\\s?\\u3001'),
            re.compile(u'^### \\s?\\u00a7(\\d+)\\.\\d')]


def cn2num(s):
    if s in U:
        return U.index(s) + 1
    return None


for pid in IDS:
    p = glob.glob(os.path.join(ROOT, 'D%s-*.md' % pid))[0]
    t = io.open(p, encoding='utf-8').read()
    have = set()
    for l in t.split(u'\n'):
        for rx in H_SHAPES:
            m = rx.match(l)
            if m:
                k = m.group(1)
                have.add(int(k) if k.isdigit() else cn2num(k))
    have.discard(None)
    refs = set(int(x) for x in REF.findall(t))
    dang = sorted(refs - have)
    print('D%s headings=%d refs=%d still_dangling=%s' %
          (pid, len(have), len(refs), dang))
