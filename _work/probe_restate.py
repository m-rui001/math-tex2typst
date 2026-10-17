# -*- coding: utf-8 -*-
# 候选展开：申报行含「本体侧」+重述动词，列出该行所有引号片段及其全篇计数。
# 目的：找出"重述串在申报行唯一出现(=1)"的条目，正文里对应的坏形需要人工定位。
import io, re, glob, os

NS = u'\u7814\u7a76\u7b14\u8bb0'
BS = u'\u672c\u4f53\u4fa7'
DAM = [u'\u6b8b\u7f3a', u'\u6b8b\u7247', u'\u7c98\u8fde', u'\u4e22', u'\u8bef\u5199', u'\u8bef\u6253', u'\u6df7\u6392',
       u'\u5939\u6742', u'\u91cf\u8bcd', u'\u9519', u'\u6b8b\u53e5', u'\u622a', u'\u541e', u'\u6f0f\u6284', u'\u6539\u53d8',
       u'\u4e0d\u7b26', u'\u586b', u'\u91cd\u8ff0', u'\u5e94\u8bfb', u'\u5e94\u4f5c', u'\u5e94\u4e3a', u'\u6b63\u786e',
       u'\u671f\u671b', u'\u5b9e\u4e3a', u'\u6b63\u5b57', u'\u6539\u6cd5', u'\u8bfb\u6cd5']

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
        if BS not in l or len(l) < 20:
            continue
        if not any(d in l for d in DAM):
            continue
        sp = spans(l)
        if not sp:
            continue
        info = []
        for s in sp:
            occ = [j + 1 for j, x in enumerate(lines) if s in x]
            info.append(u'[%dL%s]%s' % (t.count(s), occ[:3], s[:60]))
        rows.append(u'%s L%d :: %s' % (('D%03d' % n), i + 1, u' ;; '.join(info)))

io.open('_work/probe_restate.txt', 'wb').write((u'\n'.join(rows)).encode('utf-8'))
print('rows=%d' % len(rows))
