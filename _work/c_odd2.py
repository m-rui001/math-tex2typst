# -*- coding: utf-8 -*-
"""只读：按普查口径（剥行内代码）列奇数 `$` 行，并打出掩码后剩下的那些 `$` 的上下文。

用法：python -X utf8 _work/c_odd2.py C41
"""
import io
import re
import sys
import glob

sys.path.insert(0, '_work')
from c_code_mask import BT_RUN, dollars

for cid in sys.argv[1:]:
    fs = glob.glob(u'被引笔记/%s-*.md' % cid)
    if not fs:
        print(cid, 'NOFILE')
        continue
    lines = io.open(fs[0], encoding='utf-8').read().split(u'\n')
    print('====', cid)
    for i, l in enumerate(lines):
        if dollars(l) % 2 == 0:
            continue
        m = BT_RUN.sub(lambda x: u'\x01' * len(x.group(0)), l)
        # 掩码后仍算定界符的 `$` 位置
        pos = [k for k in range(len(l)) if l[k] == u'$' and m[k] == u'$']
        print(u'L%d raw$=%d masked$=%d 未掩' % (l.count(u'$'), dollars(l), len(pos)))
        for k in pos:
            print(u'      ...%s|§|%s...' % (l[max(0, k - 28):k].replace(u'\x01', u'~'),
                                            l[k + 1:k + 29].replace(u'\x01', u'~')))
        print(u'      掩码: ' + BT_RUN.sub(u'\x01', l)[:120].replace(u'\x01', u'~'))
