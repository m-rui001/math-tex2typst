# -*- coding: utf-8 -*-
# 配对扫描：申报行（含常量「本体侧」）里逐字引出的坏形，若在正文另有且仅有一处命中，
# 且申报行同时给出等义重述（另一个引号片段），则记为 REPAIR 候选。只读。
import io, re, glob, os

NS = u'\u7814\u7a76\u7b14\u8bb0'
BS = u'\u672c\u4f53\u4fa7'
VERB = [u'\u5e94\u4f5c', u'\u5e94\u4e3a', u'\u5e94\u5199\u4f5c', u'\u5e94\u8bfb\u4f5c', u'\u8bfb\u6cd5',
        u'\u56de\u586b', u'\u7167\u6284', u'\u9010\u5b57', u'\u6b63\u786e', u'\u671f\u671b', u'\u5b9e\u4e3a',
        u'\u6539\u4e3a', u'\u66ff\u6362', u'\u6062\u590d', u'\u91cd\u8ff0', u'\u539f\u6587', u'\u539f\u53e5']

def spans(l):
    out = []
    for a, b in [(u'\u201c', u'\u201d'), (u'\u300c', u'\u300d')]:
        for m in re.finditer(re.escape(a) + u'(.*?)' + re.escape(b), l):
            if m.group(1):
                out.append(m.group(1))
    parts = l.split(u'"')
    for k in range(0, len(parts) - 1, 2):
        if parts[k + 1]:
            out.append(parts[k + 1])
    return out

rows = []
for p in sorted(glob.glob(NS + '/D*.md')):
    m = re.match(r'D(\d+)', os.path.basename(p))
    if not m:
        continue
    n = int(m.group(1))
    if not (400 <= n <= 734):
        continue
    t = io.open(p, encoding='utf-8', errors='replace').read()
    lines = t.split(u'\n')
    for i, l in enumerate(lines):
        if BS not in l:
            continue
        if not any(v in l for v in VERB):
            continue
        sp = spans(l)
        for s in sp:
            c = t.count(s)
            occ = [j + 1 for j, x in enumerate(lines) if s in x]
            if c == 2 and len(occ) == 2 and i + 1 in occ:
                other = [x for x in occ if x != i + 1][0]
                rows.append(u'%s DECL_L%d OTHER_L%d CNT2 BAD=%s' % (('D%03d' % n), i + 1, other, s))

io.open('_work/probe_pairs.txt', 'wb').write((u'\n'.join(rows)).encode('utf-8'))
print('pairs=%d' % len(rows))
