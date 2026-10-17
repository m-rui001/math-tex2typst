# -*- coding: utf-8 -*-
# 全库配对缺陷普查：\langle/\rangle 与 \lVert/\rVert 跨符错配、
# 数学跨度内括堆栈失衡、台账行内裸竖线。
import glob, io, os, re, sys

M = chr(36)
B = chr(92)
PAIRS = [(u'langle', u'rangle'), (u'lVert', u'rVert'), (u'lvert', u'rvert')]
SKIP = sys.argv[1:] if len(sys.argv) > 1 else []
files = sorted(glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md'))
tot = {u'delim': 0, u'paren': 0, u'pipe': 0}
hits = []
for f in files:
    kid = os.path.basename(f)[:4]
    if kid in SKIP:
        continue
    L = io.open(f, encoding='utf-8', errors='ignore').read().split(u'\n')
    d = p = q = 0
    for l in L:
        for a, b in PAIRS:
            ca = len(re.findall(re.escape(B + a) + u'(?![a-zA-Z])', l))
            cb = len(re.findall(re.escape(B + b) + u'(?![a-zA-Z])', l))
            if ca != cb:
                segs = l.replace(B + M, u'\x01').split(M)
                bad = True
                for j in range(1, len(segs), 2):
                    s = segs[j]
                    if len(re.findall(re.escape(B + a) + u'(?![a-zA-Z])', s)) != \
                       len(re.findall(re.escape(B + b) + u'(?![a-zA-Z])', s)):
                        bad = False
                        break
                if bad:
                    continue
                d += 1
        segs = l.replace(B + M, u'\x01').split(M)
        for j in range(1, len(segs), 2):
            s = segs[j].replace(B + u'{', u'').replace(B + u'}', u'')
            st = []
            bad = None
            for c in s:
                if c in u'([':
                    st.append(c)
                elif c in u')]':
                    if not st:
                        bad = 1
                        break
                    st.pop()
            if bad is None and st:
                bad = 1
            if bad or sum(s.count(c) for c in u'([') != sum(s.count(c) for c in u')]'):
                p += 1
                break
        if l.startswith(B + u'|' * 0 + u'|'):
            ss = l.split(M)
            for j in range(1, len(ss), 2):
                if M and u'|' in ss[j]:
                    q += 1
                    break
    if d or p or q:
        hits.append((kid, d, p, q))
        tot[u'delim'] += d
        tot[u'paren'] += p
        tot[u'pipe'] += q
print('scanned=%d' % (len(files) - len(SKIP)), tot)
for h in sorted(hits, key=lambda x: (-x[1], -x[2], -x[3]))[:25]:
    print('  D%s delim=%d paren=%d pipe=%d' % h)
