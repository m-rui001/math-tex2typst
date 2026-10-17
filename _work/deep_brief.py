# -*- coding: utf-8 -*-
# Collect verbatim dispatch parameters for the next deepening wave (D233, D452).
import glob
import io
import os

BS = chr(92)
NOTES = os.path.join('E:', BS, BS, 'math', u'\u7814\u7a76\u7b14\u8bb0')
WAVE = os.path.join('E:', BS, BS, 'math', '.tools', 'wave.txt')
OUT = os.path.join('E:', BS, BS, 'math', '_work', 'deep_brief.txt')

wave = {}
for line in io.open(WAVE, encoding='utf-8').read().split('\n'):
    if line.startswith('D') and '\t' in line:
        wave[line.split('\t')[0]] = line

res = []
for nid in ['D233', 'D452']:
    p = glob.glob(os.path.join(NOTES, nid + '-*.md'))[0]
    t = io.open(p, encoding='utf-8').read()
    lines = t.split('\n')
    heads = [l for l in lines if l.startswith('## ')]
    res.append('==== %s file=%s' % (nid, os.path.basename(p)))
    res.append('wave: ' + wave.get(nid, 'ABSENT'))
    res.append('bytes=%d lines=%d heads=%d' % (len(t.encode('utf-8')), len(lines), len(heads)))
    res.append('last_head=%s' % heads[-1])
    res.append('head_tail=%s' % ' | '.join(heads[-4:]))
    reg = [l for l in lines[:6] if 'preprints' in l]
    res.append('reg_line=%s' % (reg[0][:400] if reg else 'NONE-IN-FIRST-6'))
    res.append('nonempty_tail=%s' % [l for l in lines if l.strip()][-1][:200])
    res.append('spec_count=%d' % t.count(u'[' + u'\u63a8\u6d4b' + u']'))
    res.append('')
io.open(OUT, 'wb').write((u'\n'.join(res) + u'\n').encode('utf-8'))
print('wrote', OUT, len(res))
