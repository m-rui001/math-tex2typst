# -*- coding: utf-8 -*-
# Census of ledger data blocks and how they are headed.
# A block is a maximal run of >=3 consecutive lines starting with "| " and carrying exactly
# 6 pipes. Three verdicts:
#   headed     —— the run starts at a header row whose next line is the separator, or the
#                 separator sits directly above the run (the no-space "|---|---|" spelling
#                 breaks a run, so both shapes have to be recognised);
#   split      —— neither, but walking upward over pipe-bearing lines reaches a separator, so
#                 the block belongs to a headed table and its real defect is some row whose
#                 pipe count is not 6 (a cell spelled with \| \| inflates it);
#   headerless —— data rows published with no header anywhere above them, which is what makes
#                 a ledger block fail to render (the D107 section 32 shape).
# Blocks inside ``` fences are skipped: there the writer quotes a table verbatim.
import io, os, re, sys, glob, io as _io
from pipe_lib import bare, SEP  # 竖线口径与分隔行判据都取自共用尺，别在这里另写一把


def fence_mask(lines):
    m, inf = [], False
    for l in lines:
        if l.strip().startswith('```'):
            inf = not inf
        m.append(inf)
    return m


EXCL = set(x for x in sys.argv[1:] if re.match(r'^D\d+$', x))
tot = {'headed': 0, 'split': 0, 'headerless': 0}
files = {'split': set(), 'headerless': set()}
for p in sorted(glob.glob(u'研究笔记/D*.md')):
    base = os.path.basename(p)
    if not base.endswith(u'.md'):
        continue
    k = base[:base.find(u'-')] if u'-' in base else base
    if k in EXCL:
        continue
    lines = io.open(p, encoding='utf-8', errors='replace').read().split(u'\n')
    fm = fence_mask(lines)
    rows = {'split': [], 'headerless': []}
    i = 0
    while i < len(lines):
        l = lines[i]
        if fm[i] or not (l.startswith(u'| ') and len(bare(l)) == 6):
            i += 1
            continue
        j = i
        while j + 1 < len(lines) and not fm[j + 1] and lines[j + 1].startswith(u'| ') \
                and len(bare(lines[j + 1])) == 6:
            j += 1
        n = j - i + 1
        if n >= 3:
            verdict = None
            if (i + 1 <= j and SEP.match(lines[i + 1].strip())) or \
               (i >= 1 and SEP.match(lines[i - 1].strip()) and not fm[i - 1]):
                verdict = 'headed'
            else:
                t2 = i - 1
                while t2 >= 0 and lines[t2].startswith(u'|') and not fm[t2] \
                        and not SEP.match(lines[t2].strip()):
                    t2 -= 1
                verdict = 'split' if (t2 >= 0 and SEP.match(lines[t2].strip())) else 'headerless'
            tot[verdict] = tot.get(verdict, 0) + 1 if verdict != 'headed' else tot['headed'] + 1
            if verdict != 'headed':
                rows[verdict].append((i + 1, n))
                files[verdict].add(k)
        i = j + 1
    for v in ('headerless', 'split'):
        if rows[v]:
            print(u'%s %s=%d lines=%s' % (k, v, len(rows[v]),
                                          [u'%d:%d' % (a, b) for a, b in rows[v]]))
print(u'headed=%d headerless=%d headerless_files=%d split=%d split_files=%d' % (
    tot['headed'], tot['headerless'], len(files['headerless']),
    tot['split'], len(files['split'])))
