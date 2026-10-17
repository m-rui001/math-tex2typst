# -*- coding: utf-8 -*-
import io, os, re, sys, unicodedata

BASE = u'E:\\math\\\u7814\u7a76\u7b14\u8bb0'

def load(name):
    p = os.path.join(BASE, name)
    with io.open(p, 'r', encoding='utf-8') as f:
        return f.read().split(u'\n')

def find_file(tag):
    for n in os.listdir(BASE):
        if not n.endswith(u'.md'):
            continue
        m = re.match(u'^D0*(\\d+)-', n)
        if m and int(m.group(1)) == tag:
            return n
    return None

out = []

def show(tag, lineno, pat, radius=40):
    name = find_file(tag)
    lines = load(name)
    ln = lines[lineno - 1]
    for m in re.finditer(pat, ln):
        a = max(0, m.start() - radius)
        b = min(len(ln), m.end() + radius)
        seg = ln[a:b]
        cps = u' '.join(u'U+%04X(%s)' % (ord(c), c) for c in ln[max(0, m.start()-1):m.end()+1])
        out.append(u'%s L%d len=%d' % (name, lineno, len(ln)))
        out.append(u'MATCH: ' + seg)
        out.append(u'CODEPOINTS: ' + cps)
    out.append(u'')

# D196 line 147 site around 认
show(196, 147, u'\u8ba4.{0,12}\u51fa')
# D008 line 1058 site
show(8, 1058, u'\u8bba\u6ca1\u8ba8\u8bba', 60)
out.append(u'=== counts')
for tag, pat in ((8, u'\u8bba\u6ca1\u8ba8\u8bba'), (8, u'\u8bba\u6587\u6ca1\u8ba8\u8bba'),
                 (196, u'\u8ba4 out \u51fa'), (196, u'\u8ba4\u51fa')):
    name = find_file(tag)
    lines = load(name)
    hits = [(i + 1) for i, L in enumerate(lines) if pat in L]
    out.append(u'%s  pat=%s  hits=%s' % (name, pat, hits))

with io.open(u'E:\\math\\_work\\bodyside_probe2.txt', 'wb') as f:
    f.write(u'\n'.join(out).encode('utf-8'))
sys.stdout.write('done lines=%d\n' % len(out))
