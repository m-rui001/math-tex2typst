# -*- coding: utf-8 -*-
"""Append ledger item 11 (material-dir rescue + second macro pass). Adds bytes only."""
import io, os, re

P = u'E:/math/' + u'研究笔记/队列台账.md'
raw = open(P, 'rb').read()
before, before_cr = len(raw), raw.count(b'\r')
lead = b'' if raw.endswith(b'\n') else b'\r\n'

ITEM = (u'11. 素材目录抢救＋宏腿第二遍（2026-10-14 06:59）。'
        u'旧缺陷是「16 篇笔记找不到素材目录，因而没有 preamble 表、宏无从展开」：'
        u'`_work/dir_rescue.py` 改用**该笔记自己引用过的 `.tex` 文件名**去比对每个 `preprints/<目录>/build`，'
        u'即只有全部命中（或 ≥80% 命中且对次优目录有双倍余量）且无平手才算归对'
        u'—— 平手与弱命中一律不猜。'
        u'实测 16 篇全部有候选，接受 14 篇，拒 2 篇：D258 只命中 1 片且两片平手，D259 引 12 片仅 2 片对得上。'
        u'`preamble_table.py` 接了这层兜底后 `with_dir` 718→**732**、`missing_dir` 16→**2**（表 462,077 B）。'
        u'据此对抢救回来的 8 篇（D08 D15 D21 D90 D128 D232 D306 D320）跑宏腿第二遍：'
        u'`files_touched=8 ops=886`，八篇自身拒绝数 734→14；D03 D06 D07 有表但本就零拒绝，不动。'
        u'全库复量：`katex_refused` 3,841→**3,118**、`files_hit` 323→318、top10 覆盖 51.5%；'
        u'`gate_all total=734 bad=0` 不变，备份 491→499 份。基线累计：28,271→3,118（清掉 88.8%）。'
        u'在飞档位 3：D02 补 §27（未读的 `02a-embedding.tex` 207 行／`06-cellular-automata.tex` 192 行／`01-introduction.tex` 80 行）、'
        u'D04 补 §35（`08-affine.tex` 51 行零命中／`introduction.tex` 278 行仅 1 处／`07-spectral.tex` 333 行）、'
        u'D05 补 §26（自查位置串欠账后取两片 ≤40 KB）；浅版债剩 D03 D07 待派。')

pay = lead + ITEM.encode('utf-8') + b'\r\n'
assert b'\r' not in ITEM.encode('utf-8')
new = raw + pay
assert len(new) - before == len(pay)
assert new.count(b'\r') == before_cr + pay.count(b'\r')
open(P, 'wb').write(new)
t = new.decode('utf-8')
print('before=%d after=%d item11=%d crlf=%d lone_cr=%d lines=%d' % (
    before, len(new), len(re.findall(u'(?m)^11\\. ', t)), t.count(u'\r\n'),
    len(re.findall(u'\r(?!\n)', t)), len(t.split('\n'))))
