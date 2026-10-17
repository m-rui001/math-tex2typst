# -*- coding: utf-8 -*-
# Validation harness: run the v3 shortlist logic against a synthetic pre-repair
# copy of D374 (line 209 reverted to the damaged form). Detector must flag it.
import io, os, re, glob, difflib, sys
from collections import Counter
sys.path.insert(0, u'E:/math/_work')

BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
GOOD = u'\u8fd9\u4e2a\u987a\u5e8f\u672c\u8eab\u5c31\u662f\u8bba\u6587\u6700\u6df1\u7684\u8bbe\u8ba1\u58f0\u660e\u3002'
BAD = u'\u8fd9\u672c\u8eab\u662f\u8bba\u6587\u6700\u6df1\u7684\u7684\u8bbe\u8ba1\u58f0\u660e\u3002'
src = glob.glob(os.path.join(BASE, 'D374-*.md'))[0]
txt = io.open(src, 'rb').read().decode('utf-8')
lines = txt.split(u'\n')
idx = [k for k, l in enumerate(lines) if GOOD in l]
io.open(u'E:/math/_work/bodyside_selftest.txt', 'wb').write((
    u'good_occurrences=%s lines=%s  cnt_good=%d cnt_bad=%d\n' % (
        idx, [i + 1 for i in idx], txt.count(GOOD), txt.count(BAD))
    + u'DECL270: ' + lines[269] + u'\n').encode('utf-8'))
print('cnt_good=%d cnt_bad=%d occ_lines=%s' % (txt.count(GOOD), txt.count(BAD), [i + 1 for i in idx]))
