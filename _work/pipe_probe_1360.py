# -*- coding: utf-8 -*-
"""细查 D25 L1360 / L1611：反引号位置、码跨度掩蔽结果、竖线逐枚定位、所属表头。"""
import io, os, re, sys
sys.path.insert(0, r'E:\math\_work')
import pipe_fix as PF

CS = re.compile(r'`[^`]*`')
p = PF.note_path('D25')
lines = io.open(p, encoding='utf-8').read().split('\n')
out = []
for ln in (1360, 1611):
    l = lines[ln - 1]
    out.append('======== D25 L%d  len=%d' % (ln, len(l)))
    out.append('RAW| ' + l)
    bt = [i for i, c in enumerate(l) if c == '`']
    out.append('  backtick 位置=%s 奇偶=%s' % (bt, 'EVEN' if len(bt) % 2 == 0 else 'ODD'))
    spans = [(m.start(), m.end()) for m in CS.finditer(l)]
    out.append('  掩蔽到的码跨度=%s' % spans)
    pipepos = [i for i, c in enumerate(l) if c == '|']
    out.append('  竖线位置=%s 共 %d 枚' % (pipepos, len(pipepos)))
    incode = []
    for i, pos in enumerate(pipepos):
        inc = any(a <= pos < b for a, b in spans)
        prev = l[pos - 1] if pos else ''
        incode.append((i + 1, pos, 'CODE' if inc else 'BARE', 'after=\\' if prev == '\\' else 'after=' + repr(prev)))
    out.append('  逐枚竖线=%s' % incode)
    b = CS.sub(lambda m: '\x00' * len(m.group(0)), l)
    out.append('  掩蔽后 \\| 数=%d  掩蔽后 | 数=%d' % (b.count('\\|'), b.count('|')))
    out.append('MASK| ' + b)
    # 所属表：向上找最近的 | 开头且下一行是分隔行的表头
    for k in range(ln - 1, 0, -1):
        if lines[k].startswith('|') and k + 1 < len(lines) and re.match(r'^\|[\s:|-]+\|$', lines[k + 1].strip()):
            out.append('  表头行=%d  HDR| %s' % (k + 1, lines[k]))
            out.append('  SEP | %s' % lines[k + 1])
            break
    out.append('')
io.open(r'E:\math\_work\_probe1360_out.txt', 'wb').write(('\n'.join(out) + '\n').encode('utf-8'))
print('ok')
