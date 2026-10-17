# -*- coding: utf-8 -*-
"""Pick the one ledger header that keeps the spec 符号 column name.

A header whose four remaining cells are verbatim the spec cells outranks every
legacy table, however many rows the legacy table has. Only when a note has no
spec-shaped header at all does the richest table win.
"""
import io, re, sys, glob

PAT = re.compile(u'^\\| (\u7b26\u53f7|\u8bb0\u53f7) \\|(.*)$')
SPEC_TAIL = (u' \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e'
             u'(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | '
             u'\u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |')
ERSHI = u'\u800c\u662f'

for pid in sys.argv[1:]:
    for p in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/%s-*.md' % pid):
        lines = io.open(p, encoding='utf-8').read().split('\n')
        heads = []
        for i, l in enumerate(lines):
            m = PAT.match(l)
            if m:
                j = i + 2
                n = 0
                while j < len(lines) and lines[j].startswith('| '):
                    n += 1
                    j += 1
                heads.append((i, m.group(1), n, m.group(2) == SPEC_TAIL))
        if not heads:
            print(pid, 'no header')
            continue
        spec = [h for h in heads if h[3]]
        pool = spec or heads
        best = max(pool, key=lambda h: h[2])
        changed = 0
        for i, kind, n, isp in heads:
            want = u'\u7b26\u53f7' if (i, kind, n, isp) == best else u'\u8bb0\u53f7'
            if kind != want:
                new = PAT.sub(u'| %s |\\2' % want, lines[i], count=1)
                if new.count('|') == lines[i].count('|'):
                    lines[i] = new
                    changed += 1
        t = u'\n'.join(lines)
        io.open(p, 'w', encoding='utf-8', newline='').write(t)
        print('%s heads=%s best=%d changed=%d spec_hdr=%d' % (
            pid, [(h[0] + 1, h[1], h[2], 'SPEC' if h[3] else 'legacy') for h in heads],
            best[2], changed,
            sum(1 for l in lines if l.startswith(u'| \u7b26\u53f7 |'))))
        for i, l in enumerate(lines, 1):
            k = l.find(ERSHI)
            if k >= 0:
                print('  ershi@%d %s' % (i, repr(l[max(0, k - 48):k + 30])))
