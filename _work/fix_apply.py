# -*- coding: utf-8 -*-
r"""通用定点修补执行器：`python _work/fix_apply.py <spec.json> [--apply]`。

规格由 `_work/dbl_fix.py` 这类单一来源生成，每单＝
{cid, line, old, new, expect, dollars, ticks, cred}。
派单前逐条查在飞稿（`.tools/inflight.txt`），执行交给 `_work/c_note_fix.py`
（临时文件＋fsync＋os.replace，自报命中数与 `$`／反引号/行/字节不变量）。
DRY 一趟把同篇多单在内存里串行预数，避免「第二单在 DRY 里看不到第一单的效果」这种假象；
任一单零命中、非零退出、预数不符 → 计数，APPLY 模式异常非零则不声称收腿。
"""
import glob
import io
import json
import os
import subprocess
import sys

spec_path = sys.argv[1]
apply_mode = '--apply' in sys.argv
fixes = json.load(io.open(spec_path, encoding='utf-8'))

inflight = set()
p = u'.tools/inflight.txt'
if os.path.exists(p):
    for line in io.open(p, encoding='utf-8'):
        wid = line.strip().split()[0].split(u':')[0] if line.strip() else u''
        if wid.startswith(u'D'):
            inflight.add(wid)

bad = 0
sim = {}
for f in fixes:
    cid = f[u'cid']
    if cid in inflight:
        print(u'%s:%d  SKIP（在飞）' % (cid, f[u'line']))
        bad += 1
        continue
    fn = glob.glob(os.path.join(u'研究笔记', cid + u'-*.md'))
    if not fn:
        print(u'%s:%d  NOFILE' % (cid, f[u'line']))
        bad += 1
        continue
    if cid not in sim:
        sim[cid] = io.open(fn[0], encoding='utf-8').read()
    here = sim[cid].count(f[u'old'])
    sim[cid] = sim[cid].replace(f[u'old'], f[u'new'])
    cmd = [sys.executable, os.path.join(u'_work', u'c_note_fix.py'), cid,
           u'--old', f[u'old'], u'--new', f[u'new'],
           u'--dollars', str(f[u'dollars']), u'--ticks', str(f[u'ticks'])]
    if apply_mode:
        cmd.append(u'--apply')
    r = subprocess.run(cmd, capture_output=True, text=True, encoding='utf-8')
    out = ((r.stdout or u'') + (r.stderr or u'')).rstrip()
    tail = out.split(u'\n')[-2:]
    flag = u'' if here == f[u'expect'] else u'  <== 预数不符'
    print(u'%s:%-5d 预数=%d 期望=%d $=%+d 反引号=%+d  %s%s' % (
        cid, f[u'line'], here, f[u'expect'], f[u'dollars'], f[u'ticks'],
        u' / '.join(tail), flag))
    if r.returncode != 0 or u'零命中' in out or here != f[u'expect']:
        bad += 1
print(u'%s 单数=%d 覆盖站=%d 异常=%d' % (
    u'APPLY' if apply_mode else u'DRY', len(fixes),
    sum(f[u'expect'] for f in fixes), bad))
