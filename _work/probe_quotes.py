# -*- coding: utf-8 -*-
# 引文配对探针：给定笔记号与行号，抽取该行所有引号内片段，报告每片在全篇的出现次数与行号。
# 只读。用法：python _work/probe_quotes.py D595 252 D543 250 ...
import io, re, sys, glob, os

NS = u'\u7814\u7a76\u7b14\u8bb0'
Q = [(u'\u201c', u'\u201d'), (u'\u300c', u'\u300d'), (u'"', u'"')]

def spans(l):
    out = []
    for a, b in Q:
        if a == b:
            parts = l.split(a)
            for k in range(0, len(parts) - 1, 2):
                s = parts[k + 1]
                if s:
                    out.append(s)
        else:
            for m in re.finditer(re.escape(a) + u'(.*?)' + re.escape(b), l):
                if m.group(1):
                    out.append(m.group(1))
    return out

jobs = sys.argv[1:]
out = []
i = 0
while i < len(jobs):
    did = jobs[i]; ln = int(jobs[i + 1]); i += 2
    p = glob.glob(NS + '/' + did + u'-*.md')
    if not p:
        out.append(u'%s NOFILE' % did); continue
    t = io.open(p[0], encoding='utf-8', errors='replace').read()
    lines = t.split(u'\n')
    out.append(u'== %s L%d bytes=%d lines=%d' % (did, ln, len(t.encode('utf-8')), len(lines)))
    L = lines[ln - 1]
    for s in spans(L):
        occ = [j + 1 for j, x in enumerate(lines) if s in x]
        out.append(u'  SPAN(%dx file, %d lines) %s' % (t.count(s), len(occ), s[:120]))
        out.append(u'    at lines %s' % occ[:12])
io.open('_work/probe_quotes_out.txt', 'wb').write((u'\n'.join(out)).encode('utf-8'))
print('lines=%d' % len(out))
