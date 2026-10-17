# -*- coding: utf-8 -*-
"""Normalise the separator row under a spec-shaped ledger header.

Agents keep writing '|---|---|---|---|---|' where the spec asks for
'| --- | --- | --- | --- | --- |'. Only the separator directly below a header
whose first cell is 符号/记号 and which has five columns is touched.
"""
import io, re, sys, glob, os

HDR = re.compile(u'^\\| (\u7b26\u53f7|\u8bb0\u53f7) \\|(.*)$')
SEP = u'| --- | --- | --- | --- | --- |'
DASH = re.compile(r'^\|(\s*-{2,}\s*\|){5}$')

EXCL = set((sys.argv[1] if len(sys.argv) > 1 else '').split())
skip = EXCL | set(u''.split())

for p in sorted(glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md')):
    b = re.match(r'D\d+', os.path.basename(p)).group(0)
    if b in skip:
        continue
    lines = io.open(p, encoding='utf-8').read().split('\n')
    n = 0
    for i in range(1, len(lines)):
        h = HDR.match(lines[i - 1])
        if h and DASH.match(lines[i]) and len(lines[i - 1].split('|')) == 7:
            lines[i] = SEP
            n += 1
    if n:
        io.open(p, 'w', encoding='utf-8', newline='\n').write('\n'.join(lines))
        print('%s sep=%d' % (b, n))
