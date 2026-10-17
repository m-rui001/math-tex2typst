# -*- coding: utf-8 -*-
"""把 16 篇的 chain_*.txt 关键判据抽成一份摘要（只读，不改笔记）。"""
import io, os, re, sys

IDS = ['D25', 'D32', 'D65', 'D47', 'D36', 'D26', 'D28', 'D29', 'D41', 'D68',
       'D30', 'D34', 'D24', 'D364', 'D44', 'D50']
BASE = r'E:\math\_work'
out = []
for pid in IDS:
    p = os.path.join(BASE, 'chain_%s.txt' % pid)
    if not os.path.exists(p):
        out.append('#### %s  MISSING chain file' % pid)
        continue
    t = io.open(p, encoding='utf-8').read()
    lines = t.split('\n')
    out.append('#### %s  (chain lines=%d, bytes=%d)' % (pid, len(lines), os.path.getsize(p)))
    sweep = [l for l in lines if re.search(r'size=', l)]
    out.append('  sweep size= 行数=%d ; 其中含非 size= 内容的行数=%d' %
               (len(sweep), sum(1 for l in sweep if l.strip() != 'size=%s' % re.search(r'size=\S+', l).group(0).split('=', 1)[1] if re.search(r'size=\S+', l))))
    out.append('  所有 size= 行:')
    for l in sweep:
        out.append('    ' + l.strip()[:200])
    probs = [l for l in lines if 'problems' in l]
    out.append('  problems 行:')
    for l in probs:
        out.append('    ' + l.strip()[:300])
    rc = [l for l in lines if l.strip().startswith('TABLE ')]
    out.append('  region/table 行:')
    for l in rc:
        out.append('    ' + l.strip()[:260])
    bad = [l for l in lines if 'badpipe=[' in l and not l.strip().startswith('TABLE ')]
    out.append('  非 TABLE 的 badpipe 提示行 数=%d' % len(bad))
    other = [l for l in lines if re.search(r'(Traceback|AssertionError|assert|FAIL|ERROR|error)', l)]
    out.append('  异常/报错行 数=%d' % len(other))
    for l in other[:6]:
        out.append('    ' + l.strip()[:260])
    out.append('')
io.open(os.path.join(BASE, '_chain_summary.txt'), 'wb').write(('\n'.join(out) + '\n').encode('utf-8'))
print('written', len(out))
