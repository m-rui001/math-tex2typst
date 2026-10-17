# -*- coding: utf-8 -*-
"""落盘后复核（只读）：
 1) 16 篇中所有以 | 开头的行里，反引号码跨度外的 \| 是否已清零（全表扫描，不限台账清单）；
 2) D68 篇内既有 \Vert 的用法抽样（定形凭据）；
 3) D50:438 登记行的整行与所属表头，以及 D50 的 \mid / \lvert 用法；
 4) 16 篇每篇当前宏计数。
输出 UTF-8 到 _work/_verify_out.txt。
"""
import io, os, re, sys
sys.path.insert(0, r'E:\math\_work')
import pipe_fix as PF

CS = re.compile(r'`[^`]*`')
IDS = ['D25', 'D32', 'D65', 'D47', 'D36', 'D26', 'D28', 'D29', 'D41', 'D68',
       'D30', 'D34', 'D24', 'D364', 'D44', 'D50']
out = []

out.append('== 1) 全表扫描：以 | 开头且码跨度外仍有 \\| 的行 ==')
tot = 0
for pid in IDS:
    p = PF.note_path(pid)
    lines = io.open(p, encoding='utf-8').read().split('\n')
    hits = []
    for i, l in enumerate(lines):
        if not l.startswith('|'):
            continue
        bare = CS.sub('', l)
        if '\\|' in bare:
            hits.append((i + 1, bare.count('\\|'), l[:160]))
    tot += len(hits)
    out.append('  %s: %d 行' % (pid, len(hits)))
    for h in hits:
        out.append('     L%-5d nbare=%d  %s' % h)
out.append('  合计 %d 行（台账内允许保留的应只有码跨度内的，见 3/4 节）' % tot)
out.append('')

out.append('== 2) D68 篇内 \\Vert 用法抽样（含本次插入的 3 处，标 NEW） ==')
p = PF.note_path('D68')
text = io.open(p, encoding='utf-8').read()
lines = text.split('\n')
for i, l in enumerate(lines):
    if '\\Vert' in l:
        out.append('  L%-5d %s' % (i + 1, l[:230]))
out.append('')

out.append('== 3) D50 登记行 438 与所属表（表头 414） ==')
p = PF.note_path('D50')
lines = io.open(p, encoding='utf-8').read().split('\n')
out.append('  HDR414| ' + lines[413])
out.append('  SEP415| ' + lines[414])
for ln in (437, 438, 439):
    out.append('  L%-4d| %s' % (ln, lines[ln - 1]))
out.append('  该行码跨度外 \\| 上下文片段:')
l = lines[437]
for m in re.finditer(r'.{0,40}\\\|.{0,40}', CS.sub('\x00' * 8, l)):
    pass
for m in re.finditer(r'.{0,45}\\\|.{0,45}', CS.sub('', l) if False else l):
    out.append('     ...' + m.group(0).replace('\n', ' ') + '...')
out.append('  D50 全篇宏计数: ' + ' '.join('%s=%d' % (k, io.open(PF.note_path("D50"), encoding="utf-8").read().count(k))
                                          for k in ['\\lVert', '\\rVert', '\\lvert', '\\rvert', '\\Vert', '\\mid', '\\upharpoonright']))
out.append('  D50 \\mid 出现行:')
for i, x in enumerate(lines):
    if '\\mid' in x:
        out.append('     L%-5d %s' % (i + 1, x[:200]))
out.append('')

out.append('== 4) 16 篇当前字节/行数/宏计数 ==')
for pid in IDS:
    p = PF.note_path(pid)
    raw = io.open(p, 'rb').read()
    t = raw.decode('utf-8')
    out.append('  %s bytes=%d lines=%d CR=%d  ' % (pid, len(raw), len(t.split('\n')), raw.count(b'\r')) +
               ' '.join('%s=%d' % (k, t.count(k)) for k in
                        ['\\lVert', '\\rVert', '\\lvert', '\\rvert', '\\Vert', '\\mid', '\\upharpoonright', '\\|']))
io.open(r'E:\math\_work\_verify_out.txt', 'wb').write(('\n'.join(out) + '\n').encode('utf-8'))
print('written')
