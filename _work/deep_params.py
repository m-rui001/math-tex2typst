# -*- coding: utf-8 -*-
"""Dispatch-parameter sheet for 主线2 续写加深单.

Usage: python _work/deep_params.py D265 D86 ...
       python _work/deep_params.py --rest          # every queue entry not yet dispatched
Writes _work/deep_params.txt (one block per note). Read-only over 研究笔记/.
"""
from __future__ import print_function
import io, os, re, sys, glob

SEP = u'| --- | --- | --- | --- | --- |'
HDR0 = u'\u7b26\u53f7'
MEMO0 = u'\u8bb0\u53f7'
CIT = re.compile(r'([A-Za-z0-9._/\-]+\.tex):([0-9]{1,4})')
def inflight():
    p = os.path.join('.tools', 'inflight.txt')
    return set(l.strip() for l in io.open(p, encoding='utf-8') if l.strip())


def queue_ids():
    ids = []
    for line in io.open('_work/deep_queue.txt', encoding='utf-8'):
        m = re.match(r'(D\d+)', line.strip())
        if m:
            ids.append(m.group(1))
    return ids


def build_dir(note_text):
    for m in re.finditer(r'preprints[/\\]([A-Za-z0-9._-]+)', note_text.replace(chr(92), '/')):
        cand = os.path.join('preprints', m.group(1), 'build')
        if os.path.isdir(cand):
            return cand
    return None


def sheet(nid):
    hits = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/%s-*.md' % nid)
    if len(hits) != 1:
        return [u'%s AMBIGUOUS %s' % (nid, len(hits))]
    note = hits[0]
    raw = io.open(note, 'rb').read()
    t = raw.decode('utf-8')
    lines = t.split('\n')
    heads = [(i + 1, l) for i, l in enumerate(lines) if l.startswith('## ')]
    hdrs = [i + 1 for i, l in enumerate(lines)
            if l.startswith('| ') and HDR0 == l.split('|')[1].strip()]
    seps = [i + 1 for i, l in enumerate(lines) if l == SEP]
    d = build_dir(t)
    out = [u'==== %s ====' % nid, u'note=%s' % note.encode('utf-8')]
    out.append(u'bytes=%d lines=%d cr=%d heads=%d' % (len(raw), len(lines), raw.count(b'\r'), len(heads)))
    out.append(u'first_head=%s' % heads[0][1].encode('utf-8'))
    out.append(u'last_head=(%d)%s' % (heads[-1][0], heads[-1][1].encode('utf-8')))
    num = re.match(r'## (\u00a7?)([0-9]+|[一二三四五六七八九十]+)([.、]?)', heads[-1][1])
    shape = u'NO-NUMERAL-HEADING'
    if num:
        mark, tok, tail = num.group(1), num.group(2), num.group(3)
        if tok.isdigit():
            shape = u'%s%s%s -> next %s%d%s' % (mark, u'', tail, mark, int(tok) + 1, tail)
        else:
            shape = u'CN-NUMERAL %s%s (last=%s), 新节号按中文字形续，别写成阿拉伯数字' % (tok, tail, tok)
    out.append(u'head_shape=%s' % shape.encode('utf-8'))
    out.append(u'std_hdr=%s sep=%s' % (hdrs, seps))
    tail = [l for l in lines if l.startswith('| ')][-1]
    out.append(u'last_row_cols=%d' % (tail.count('|') - 1))
    if d is None:
        out.append(u'BUILD-DIR-NOT-FOUND')
        return out
    tex = []
    for root, sub, files in os.walk(d):
        for f in files:
            if f.endswith('.tex'):
                p = os.path.join(root, f)
                rel = os.path.relpath(p, d).replace('\\', '/')
                nl = len(io.open(p, encoding='utf-8', errors='replace').read().split('\n'))
                tex.append((rel, os.path.getsize(p), nl))
    cited = {}
    for m in CIT.finditer(t):
        b = m.group(1).split('/')[-1]
        cited[b] = cited.get(b, 0) + 1
    out.append(u'build=%s tex=%d bytes=%d cite_sites=%d' % (d.encode('utf-8'), len(tex),
                                                        sum(x[1] for x in tex), sum(cited.values())))
    for rel, size, nl in sorted(tex, key=lambda x: -x[1]):
        n = cited.get(rel.split('/')[-1], 0)
        tag = u'' if n else (u'   ZERO-CITED' if rel.startswith('sections/') or '/' not in rel else u'   aux')
        out.append(u'  %-38s %7d B %5d lines cited=%d%s' % (rel, size, nl, n, tag))
    return out


ids = sys.argv[1:]
if ids == ['--rest']:
    ids = [i for i in queue_ids() if i not in inflight()]
blocks = []
for nid in ids:
    blocks.append(u'\n'.join(sheet(nid)))
io.open('_work/deep_params.txt', 'wb').write(u'\n\n'.join(blocks).encode('utf-8'))
print('ids=%d blocks, file _work/deep_params.txt' % len(blocks))
