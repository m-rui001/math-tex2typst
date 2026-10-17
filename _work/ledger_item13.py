# -*- coding: utf-8 -*-
"""Append ledger item 13 (D02 收稿＋D04 在飞红旗 parked＋unclosed 三处假设否证)."""
import io, os, re

P = u'E:/math/' + u'研究笔记/队列台账.md'
raw = open(P, 'rb').read()
before, before_cr = len(raw), raw.count(b'\r')
lead = b'' if raw.endswith(b'\n') else b'\r\n'

ITEM = (u'13. 浅版债第二档收稿＋D04 在飞红旗 parked＋残余 unclosed 判形否证（2026-10-14 07:11）。'
        u'**D02 加深批**（补 §27）本体侧只读复量：bytes 78,126→**114,827**（+36,701）、lines 366、CR 0、'
        u'`## ` 标题 27→28、编号 §0–§27 连续无缺号无重号；`gate.py D02` 打印 '
        u'`size=114827 secs=28 contig=True rows=42 math=2356 CLEAN`。按第 12 条入档的新律（`gate` 的 `rows` '
        u'只数表头后连续块，文末新表它看不见）另数 §27 追加区台账行：**27 行竖线全为 6**、表头全文仅 1 份。'
        u'写手自报 Write=0、三笔 13,124／22,819／758 B，整片读毕 `02a-embedding.tex` 末行 207、'
        u'`06-cellular-automata.tex` 末行 192、`01-introduction.tex` 末行 80。**两处如实申报入档**：'
        u'其一，首次落盘若把全部工具调用一律计数则落在第 15 次调用，超出名义 6–12 窗口 3 次；'
        u'其二，旧稿第 232 行「三片未读、凡涉它们的陈述不得出现在 §20 之后」与盘面不符（§5、§15、§26 早已引用这三片），'
        u'已在 §27 末单列为过时申报、旧字节未动，且逐条对回原片未发现实质说错，故无需勘误回改。'
        u'**D04 在飞红旗 parked**：`gate_all total=734 bad=1`，唯一红旗在 D04，字段为 `ershi=2 contrast=2`'
        u'（`gate.py` 自带的两族禁串计数，非规格措辞），即其 §35 追加引入 2 处汉字数字「二十」族与 2 处对比句式族命中。'
        u'两次读数 117,462→120,664 B 说明写手仍在追加。**处置**：禁串按既有律走单 token 的 `sweep` 一趟回改，'
        u'但写手正在用「文末末段整段作锚」的方式追加，此刻动它末段会打断锚点，故排到 D04 交回复量之后立即执行，'
        u'不在飞行中改。目标 `gate_all` 复回 734/0。'
        u'**残余 unclosed 判形否证**：`_work/spacecloser_fix.js`（带「拒绝数不下降即整文件不动」加行数／`$` 数／'
        u'反引号数／CR 四道不变量）对 D222、D245、D752 三处打印 `NO-SITE`、`sites_edited=0`，未落盘任何字节（备份实测 0 份），'
        u'证明这三处**不是**已修的「闭符前多一个空格」族：D222 第 347 行与 D752 第 221 行的开口都是嵌在中文段落中段的 `$$`'
        u'（展示块被上一行的行内式吃掉配对），D245 第 356 行的开口是一个紧跟全角引号的 `$` 且位于该段末尾。'
        u'三处一律维持「逐处读上下文另判形，禁批量奇偶补偿」。'
        u'**浅版债余额**：D07 在飞（基线 85,934 B、25 标题、§0–§24 连续）；仅剩 D03 待派，其素材欠账已实测入单'
        u'（`figure-dependencies-caption.tex` 8 行／`figure-dependencies.tex` 36 行／`figure-retarded.tex` 64 行零命中，'
        u'`introduction.tex` 228 行仅 1 处、`continuation.tex` 491 行仅 1 处）。')

pay = lead + ITEM.encode('utf-8') + b'\r\n'
assert b'\r' not in ITEM.encode('utf-8')
new = raw + pay
assert len(new) - before == len(pay)
assert new.count(b'\r') == before_cr + pay.count(b'\r')
open(P, 'wb').write(new)
t = new.decode('utf-8')
print('before=%d after=%d item13=%d crlf=%d lone_cr=%d lines=%d' % (
    before, len(new), len(re.findall(u'(?m)^13\\. ', t)), t.count(u'\r\n'),
    len(re.findall(u'\r(?!\n)', t)), len(t.split('\n'))))
