# -*- coding: utf-8 -*-
"""v13: for every v12 block whose top relative is unique, print the declaration
line that carries the quoted restatement plus the full site line, so a human can
adjudicate whether the declaration is the anchor-accident-plus-restatement shape.
"""
import io, os, re, sys
sys.path.insert(0, u'E:\\math\\_work')
import bodyside_detect as B

BASE = u'E:\\math\\\u7814\u7a76\u7b14\u8bb0'
SRC = u'E:\\math\\_work\\bodyside_v12.txt'
txt = io.open(SRC, 'r', encoding='utf-8').read().split(u'\n')

blocks = []
cur = None
for l in txt:
    if l.startswith(u'## '):
        cur = [l]
        blocks.append(cur)
    elif cur is not None and l.strip() and not l.startswith(u'-- '):
        cur.append(l)

TELL = [u'\u4e8b\u6545', u'\u88ab\u66ff\u6362', u'\u8131\u843d', u'\u591a\u51fa', u'\u88ab\u541e',
        u'\u5199\u8131', u'\u5b8c\u6574\u91cd\u8ff0', u'\u4fee\u590d\u5bf9\u7167', u'\u5e94\u6539\u56de',
        u'\u6b63\u786e\u5199\u6cd5', u'\u5e94\u8bfb\u4f5c', u'\u6f0f\u5b57', u'\u884d\u5b57',
        u'\u951a\u70b9', u'\u672c\u4f53\u4fa7', u'\u673a\u68b0\u6e05\u7406', u'\u6e05\u7406\u901a\u9053']

out = []
kept = 0
for b in blocks:
    head = b[0]
    m = re.match(u'^## (\\S+) zoneL(\\S+) Q\\(LEN(\\d+)\\)=(.*)$', head)
    if not m:
        continue
    fn, zonen, _, q = m.group(1), m.group(2), m.group(3), m.group(4)
    rel = [x for x in b if x.strip().startswith(u'REL')]
    if not rel:
        continue
    r0 = rel[0].strip()
    mr = re.match(u'^REL L(\\d+) sec=(\\S+) filecnt=(\\d+) ratio=([0-9.]+) d=(.*)$', r0)
    ln, cnt, ratio = int(mr.group(1)), int(mr.group(3)), float(mr.group(4))
    d = mr.group(5)
    if cnt != 1 or ratio < 0.85:
        continue
    lines = B.load(os.path.join(BASE, fn))
    decls = [(i + 1, lines[i]) for i in range(len(lines)) if q in lines[i]]
    tz = [x for x in zonen.split(u',')]
    out.append(u'##### %s  zone=%s' % (fn, zonen))
    out.append(u'  Q = %s' % q)
    for (n, t) in decls:
        tl = [w for w in TELL if w in t]
        out.append(u'  DECL L%d tells=%s :: %s' % (n, u'|'.join(tl), t[:700]))
    site = lines[ln - 1]
    tl = [w for w in TELL if w in site]
    out.append(u'  SITE L%d sec=%s cnt=1 d=%s' % (ln, mr.group(2), d))
    out.append(u'  SITE LINE: %s' % site[:700])
    out.append(u'')
    kept += 1

with io.open(u'E:\\math\\_work\\bodyside_v13.txt', 'wb') as f:
    f.write(u'\n'.join(out).encode('utf-8'))
sys.stdout.write('kept=%d lines=%d\n' % (kept, len(out)))
