# -*- coding: utf-8 -*-
"""落盘后审计（精确计数，不估算）：
 A) 本次插入的每种定界宏数（按决策表逐片段统计）；
 B) 每篇现状：字节/行数、六种宏的文件总数、目标行的表外码跨度残留；
 C) 每个目标行：剥掉反引号码跨度后的竖线数 == 该表表头竖线数（真正的不变量），
    以及该行码跨度内还剩几枚 \\|（合法逐字引用，不许动）。
用法： python _work/pipe_audit.py
"""
import io, os, re, sys
sys.path.insert(0, r'E:\math\_work')
import pipe_fix as PF

CS = re.compile(r'`[^`]*`')
MACROS = ['\\lVert', '\\rVert', '\\lvert', '\\rvert', '\\Vert', '\\mid', '\\upharpoonright']
IDS = ['D25', 'D32', 'D65', 'D47', 'D36', 'D26', 'D28', 'D29', 'D41', 'D68', 'D30', 'D34', 'D24', 'D364', 'D44', 'D50']
ROWHDR = {}
for a, b in [(255, 252), (259, 252), (315, 300), (596, 587), (700, 698), (702, 698), (703, 698),
             (705, 698), (708, 698), (709, 698), (1043, 1041), (1044, 1041), (1046, 1041),
             (1344, 1342), (1345, 1342), (1360, 1358), (1609, 1603), (1611, 1603),
             (1871, 1856), (1872, 1856), (1876, 1856),
             (1882, 1856), (1884, 1856), (1885, 1856), (1886, 1856), (2550, 2545)]:
    ROWHDR[('D25', a)] = b
for a in [646, 647, 649, 652, 654, 660, 662, 676, 680, 681, 683]:
    ROWHDR[('D32', a)] = 644
for a in [341, 342, 348]:
    ROWHDR[('D65', a)] = 334
for a in [594, 595, 597]:
    ROWHDR[('D47', a)] = 581
for a in [600, 601, 602, 603]:
    ROWHDR[('D36', a)] = 591
ROWHDR[('D26', 1090)] = 1078; ROWHDR[('D26', 1096)] = 1078; ROWHDR[('D26', 1116)] = 1102
for a in [1166, 1176, 1184]:
    ROWHDR[('D28', a)] = 1151
for a in [826, 834, 847]:
    ROWHDR[('D29', a)] = 819
for a in [536, 541, 542]:
    ROWHDR[('D41', a)] = 529
for a in [1346, 1347, 1370]:
    ROWHDR[('D68', a)] = 1336
ROWHDR[('D30', 804)] = 797
ROWHDR[('D34', 570)] = 562; ROWHDR[('D34', 739)] = 722
ROWHDR[('D24', 706)] = 685
ROWHDR[('D364', 453)] = 432
ROWHDR[('D44', 450)] = 442
ROWHDR[('D50', 438)] = 414

out = []
tot_ins = dict((m, 0) for m in MACROS)
tot_rows = tot_sites = tot_reg = 0
for pid in IDS:
    p = PF.note_path(pid)
    raw = io.open(p, 'rb').read()
    text = raw.decode('utf-8')
    lines = text.split('\n')
    ins = dict((m, 0) for m in MACROS)
    sites = 0
    fails = []
    resid = 0
    for (ln, nbar, exp, frags) in PF.PLAN[pid]:
        for (o, n) in frags:
            for m in MACROS:
                ins[m] += n.count(m) - o.count(m)
        sites += nbar
        l = lines[ln - 1]
        st = CS.sub('', l)
        hp = lines[ROWHDR[(pid, ln)] - 1].count('|')
        resid += l.count('\\|') - st.count('\\|')
        if st.count('|') != hp or st.count('\\|') != 0 or l.count('|') != exp:
            fails.append((ln, st.count('|'), hp, st.count('\\|'), l.count('|'), exp))
    reglines = []
    for (ln, nb, w) in PF.REGISTER.get(pid, []):
        l = lines[ln - 1]
        st = CS.sub('', l)
        hp = lines[ROWHDR[(pid, ln)] - 1].count('|')
        reglines.append((ln, st.count('|'), hp, st.count('\\|')))
        tot_reg += nb
    for m in MACROS:
        tot_ins[m] += ins[m]
    tot_rows += len(PF.PLAN[pid])
    tot_sites += sites
    out.append('==== %s bytes=%d lines=%d rows_fixed=%d sites_fixed=%d' % (pid, len(raw), len(lines), len(PF.PLAN[pid]), sites))
    out.append('  本次插入: ' + (' '.join('%s +%d' % (m, ins[m]) for m in MACROS if ins[m]) or '(none)'))
    out.append('  现值全篇: ' + ' '.join('%s=%d' % (m, text.count(m)) for m in MACROS))
    out.append('  目标行核对失败=%s ；目标行码跨度内 \\| 保留=%d 枚' % (fails, resid))
    if reglines:
        out.append('  登记未改行(行,表外竖线,表头竖线,残留\\|)=%s' % reglines)
out.append('')
out.append('TOTAL rows_fixed=%d sites_fixed=%d sites_registered=%d (sites_fixed+registered=%d)' %
           (tot_rows, tot_sites, tot_reg, tot_sites + tot_reg))
out.append('TOTAL 插入宏: ' + ' '.join('%s +%d' % (m, tot_ins[m]) for m in MACROS if tot_ins[m]) +
           ' ；宏插入合计 %d 枚' % sum(tot_ins.values()))
io.open(r'E:\math\_work\pipe_audit_out.txt', 'wb').write(('\n'.join(out) + '\n').encode('utf-8'))
sys.stdout.buffer.write(('\n'.join(out) + '\n').encode('utf-8'))
