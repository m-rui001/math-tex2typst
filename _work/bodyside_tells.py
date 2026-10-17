# -*- coding: utf-8 -*-
# Targeted scan: lines carrying restoration tells inside D001-D399, plus a
# check of whether the quoted/restated text already occurs in the file.
import io, os, re, glob

BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
TELLS = [
    u'\u5b8c\u6574\u91cd\u8ff0',      # 完整重述
    u'\u539f\u53e5\u5728\u6b64',      # 原句在此
    u'\u6b63\u786e\u5199\u6cd5\u662f', # 正确写法是
    u'\u5e94\u8bfb\u4f5c',            # 应读作
    u'\u5e94\u6539\u56de',            # 应改回
    u'\u539f\u6587\u5982\u4e0b',      # 原文如下
    u'\u88ab\u541e\u7684\u540e\u534a\u539f\u6587', # 被吞的后半原文
    u'\u9010\u5b57\u4ea4\u51fa',      # 逐字交出
    u'\u9010\u5b57\u7167\u6284',      # 逐字照抄
    u'\u7167\u6284\u8865\u5f55',      # 照抄补录
    u'\u5e94\u6062\u590d',            # 应恢复
    u'\u539f\u53e5\u662f',            # 原句是
    u'\u539f\u53e5\u4e3a',            # 原句为
    u'\u6b63\u786e\u539f\u53e5',      # 正确原句
    u'\u6062\u590d\u4e3a',            # 恢复为
    u'\u6539\u56de\u4e3a',            # 改回为
    u'\u5199\u6cd5\u5e94\u4e3a',      # 写法应为
    u'\u5f53\u4f5c\u539f\u53e5',      # 当作原句
]
LIN = re.compile(u'\u7b2d\\s*([0-9\u3007]+)')  # placeholder, unused
NUM = {u'0': 0, u'1': 1, u'2': 2, u'3': 3, u'4': 4, u'5': 5, u'6': 6, u'7': 7,
       u'8': 8, u'9': 9, u'\u3007': 0}
CN = {u'\u96f6': 0, u'\u4e00': 1, u'\u4e8c': 2, u'\u4e09': 3, u'\u56db': 4,
      u'\u4e94': 5, u'\u516d': 6, u'\u4e03': 7, u'\u516b': 8, u'\u4e5d': 9,
      u'\u5341': 10}

def idnum(name):
    m = re.match(u'^D([0-9]+)', name)
    return int(m.group(1)) if m else None

out = []
tot = 0
for p in sorted(glob.glob(os.path.join(BASE, 'D*.md'))):
    n = idnum(os.path.basename(p))
    if n is None or n < 1 or n > 399:
        continue
    lines = io.open(p, 'rb').read().decode('utf-8').split(u'\n')
    hits = []
    for i, l in enumerate(lines):
        for t in TELLS:
            if t in l:
                hits.append((i + 1, t, l))
                break
    if not hits:
        continue
    tot += len(hits)
    out.append(u'###### D%03d %s  tell_lines=%d' % (n, os.path.basename(p), len(hits)))
    for ln, t, l in hits:
        out.append(u'  [T:%s] L%d| %s' % (t, ln, l[:400]))
    out.append(u'')
io.open(u'E:/math/_work/bodyside_tells.txt', 'wb').write(u'\n'.join(out).encode('utf-8'))
print('tell_lines=%d' % tot)
