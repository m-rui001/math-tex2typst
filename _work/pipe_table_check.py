# -*- coding: utf-8 -*-
"""按表窗口的结构复核（region_check 的 FROM→EOF 会把后续所有合法表一起数，
这里只量「该篇该表」这一块：表头竖线数 = 该表所有续行的应有竖线数。
用法： python _work/pipe_table_check.py <ID> <表头行号> [<表头行号> ...]
"""
import io, os, re, sys

BASE = r'E:\math\研究笔记'
HDRMAP = {
    'D25': [252, 300, 587, 698, 1041, 1342, 1603, 1856, 2545],
    'D32': [644], 'D65': [334], 'D47': [581], 'D36': [591],
    'D26': [1078, 1102], 'D28': [1151], 'D29': [819], 'D41': [529],
    'D68': [1336], 'D30': [797], 'D34': [562, 722], 'D24': [685],
    'D364': [432], 'D44': [442], 'D50': [414],
}
SEP = re.compile(r'^\|[\s:|-]+\|$')


def note_path(pid):
    for f in sorted(os.listdir(BASE)):
        if f.startswith(pid + '-'):
            return os.path.join(BASE, f)
    raise SystemExit('no note ' + pid)


pid = sys.argv[1].upper()
lines = io.open(note_path(pid), 'rb').read().decode('utf-8').split('\n')
args = [int(a) for a in sys.argv[2:]] or HDRMAP[pid]
for h in args:
    assert lines[h - 1].startswith('|'), '%s: line %d is not a table header' % (pid, h)
    i = h - 1
    block = []
    while i < len(lines) and lines[i].startswith('|'):
        block.append((i + 1, lines[i]))
        i += 1
    hp = lines[h - 1].count('|')
    hist = {}
    bad = []
    for (ln, l) in block:
        n = l.count('|')
        hist[n] = hist.get(n, 0) + 1
        if n != hp and not SEP.match(l.strip()):
            bad.append((ln, n, l[:60]))
    nsep = sum(1 for (_, l) in block if SEP.match(l.strip()))
    sys.stdout.buffer.write(
        ('TABLE %s hdr=%d pipes=%d block=%d sep=%d rows=%d hist=%s badpipe=%s\n' %
         (pid, h, hp, len(block), nsep, len(block) - nsep, hist, bad)).encode('utf-8'))
