# -*- coding: utf-8 -*-
import io, os, re, sys

BASE = u'E:\\math\\\u7814\u7a76\u7b14\u8bb0'

def find_file(tag):
    for n in os.listdir(BASE):
        if not n.endswith(u'.md'):
            continue
        m = re.match(u'^D0*(\\d+)-', n)
        if m and int(m.group(1)) == tag:
            return n
    return None

out = []
name = find_file(196)
lines = io.open(os.path.join(BASE, name), 'r', encoding='utf-8').read().split(u'\n')
out.append(u'FILE ' + name + u' total_lines=%d' % len(lines))
for i in range(140, 182):
    L = lines[i]
    flag = u''
    if u'out' in L:
        flag = u'  <<HAS-OUT'
    out.append(u'L%d len=%d%s :: %s' % (i + 1, len(L), flag, L[:900]))
out.append(u'')
out.append(u'--- codepoints around each out in L149')
L = lines[148]
for m in re.finditer(u'out', L):
    a = max(0, m.start() - 18)
    b = min(len(L), m.end() + 18)
    out.append(u'IDX %d seg=%s' % (m.start(), L[a:b]))
    out.append(u'  cps: ' + u' '.join(u'%04X' % ord(c) for c in L[max(0,m.start()-3):m.end()+3]))
out.append(u'')
out.append(u'--- counts across file')
for pat in (u'\u8ba4 out \u51fa', u'\u8ba4out\u51fa', u'out \u51fa', u'\u8ba4', u'\u51fa'):
    hits = [i + 1 for i, x in enumerate(lines) if pat in x]
    out.append(u'pat=%s count=%d hits=%s' % (pat, len(hits), hits[:20]))

with io.open(u'E:\\math\\_work\\bodyside_probe3.txt', 'wb') as f:
    f.write(u'\n'.join(out).encode('utf-8'))
sys.stdout.write('ok\n')
