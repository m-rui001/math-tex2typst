# -*- coding: utf-8 -*-
"""Normalise every file that still carries CR.

The落盘 rule is LF-only, for 研究笔记/D*.md and for 队列台账.md alike; a CRLF file is
skipped by every repair pass that reads text, so it also keeps its own defects unfixed.
Positional args are paths or globs (so the ledger is fixed with the same ruler as the
notes); with none the target is 研究笔记/D*.md. The byte count is re-measured from disk
and the line count must not move.
Usage: python crlf_fix.py [--apply] [path-or-glob ...]
"""
from __future__ import unicode_literals
import io, os, re, sys, glob

ROOT = u'E:/math/' + u'研究笔记'
WORK = u'E:/math/_work'
APPLY = u'--apply' in sys.argv
PATTERNS = [a for a in sys.argv[1:] if not a.startswith(u'--')] or [
    os.path.join(ROOT, u'D*.md')]


def targets():
    seen = []
    for pat in PATTERNS:
        for p in sorted(glob.glob(pat)) if any(c in pat for c in u'*?[') else [pat]:
            if os.path.isfile(p) and p not in seen:
                seen.append(p)
    return seen


rows = []
for p in targets():
    raw = io.open(p, 'rb').read()
    if b'\r' not in raw:
        continue
    crlf = raw.count(b'\r\n')
    lone = raw.count(b'\r') - crlf
    fixed = raw.replace(b'\r\n', b'\n').replace(b'\r', b'\n')
    same_lines = fixed.count(b'\n') == raw.count(b'\n')
    rows.append((p, len(raw), len(fixed), crlf, lone, same_lines))
    if APPLY and same_lines:
        bk = os.path.join(WORK, os.path.basename(p)[:12] + u'.pre-crlf.md')
        io.open(bk, 'wb').write(raw)
        io.open(p, 'wb').write(fixed)
for p, a, b, crlf, lone, stable in rows:
    print(u'%-28s bytes %7d->%7d crlf=%d lone_cr=%d lines_stable=%s'
          % (os.path.basename(p)[:28], a, b, crlf, lone, stable))
print(u'files_with_cr=%d %s' % (len(rows), u'APPLIED' if APPLY else u'dry'))
left = [os.path.basename(p) for p in targets() if b'\r' in io.open(p, 'rb').read()]
print(u'targets=%d after_check_files_with_cr=%d' % (len(targets()), len(left)))
