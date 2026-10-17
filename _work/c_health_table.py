# -*- coding: utf-8 -*-
# 只读：把已写好的 C 稿全部过一遍 ccheck，按「缺陷族」汇总（跳过在飞那几号）。
# 目的：收稿链是逐单跑的，这一张表看的是「全部写完之后盘上还剩什么族」，为收尾单定靶。
# 用法（cwd=E:\math）：python -X utf8 _work/c_health_table.py [C01 C02 …]
import io, re, subprocess, sys, glob, os, collections

sys.stdout.reconfigure(encoding='utf-8')
# 在飞＝写手正在落盘的号，量具只读也把它们的中间态算进「旗标」，会误判也遮掉真缺陷。
# 名单改成当场申报（`--skip=C30,C32`），默认不跳任何号：留旧名单那一族「静悄悄少扫」的坑就此没有载体。
SKIP = set()
for _a in sys.argv[1:]:
    if _a.startswith(u'--skip='):
        SKIP = set(x.upper() for x in _a.split(u'=', 1)[1].split(u','))
cids = [a.upper() for a in sys.argv[1:] if not a.startswith('--')]
if not cids:
    cids = sorted(os.path.basename(p)[:3] for p in glob.glob(u'被引笔记/C*.md'))
cids = [c for c in cids if c not in SKIP]

fam = collections.Counter()
bad = []
for cid in cids:
    out = subprocess.run([sys.executable, u'-X', u'utf8', u'_work/ccheck.py', cid],
                         capture_output=True, text=True, encoding='utf-8').stdout
    g = lambda k, d=None: (re.search(k + r'=?(\S+)', out).group(1) if re.search(k + r'=?(\S+)', out) else d)
    size = int(g(r'bytes=') or 0)
    odd = int(g(r'odd_lines=') or 0)
    cr = int(g(r'CR=') or 0)
    bans = re.search(r'bans=(\{[^)]*\}|none)', out)
    bans = bans.group(1) if bans else '?'
    badpos = int(re.search(r'poscites=\d+ bad=(\d+)', out).group(1)) if re.search(r'poscites=\d+ bad=(\d+)', out) else -1
    badpipe = int(g(r'badpipe=') or 0)
    nums = g(r'nums=') or ''
    contig = 'False' in out
    head0 = 'head0=N' in out
    seam = 'SEAM_NOT_FINAL' in out
    spec = re.search(r'K=(\d+)\((\d+)-(\d+)\)', out)
    K = int(spec.group(1)) if spec else -1
    # 区间只从 ccheck 那一行拿（它自己读规格），这张表不许藏第二个数。
    assert spec, 'ccheck 没报出 K=a(b-c) 那行，先修尺子'
    lo, hi = int(spec.group(2)), int(spec.group(3))
    share = float((g(r'share=') or '0').rstrip('%'))
    disp = int(g(r'disp=') or 0)
    stmt = int(g(r'stmt_lines=') or 0)
    flags = []
    if size < 22000:
        flags.append('字节低于下限')
    if cr:
        flags.append('带CR')
    if odd:
        flags.append('跨行行内式%d行' % odd)
    if bans not in ('none',):
        flags.append('禁词' + bans)
    if badpos:
        flags.append('位置串bad=%d' % badpos)
    if badpipe:
        flags.append('台账竖线%d' % badpipe)
    if contig:
        flags.append('节号不连续')
    if head0:
        flags.append('缺§0')
    if seam:
        flags.append('末节非接缝')
    if K < lo or K > hi:
        flags.append('K=%d超区间' % K)
    if share < 25.0 and disp < 5:
        flags.append('4.1判薄')
    for f in flags:
        fam[f.split('%')[0].rstrip('0123456789=')] += 1
    if flags:
        bad.append((cid, size, share, stmt, u' '.join(flags)))
for r in bad:
    print('%s %6d B share=%5.1f%% stmt=%-3d %s' % r)
print('扫=%d 份，有旗标=%d 份' % (len(cids), len(bad)))
for k, v in fam.most_common():
    print('   %-14s %d 份' % (k, v))
