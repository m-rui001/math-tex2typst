# -*- coding: utf-8 -*-
"""Append ledger item 12 (D05 收稿＋定界符假开口两处修复). Adds bytes only."""
import io, os, re

P = u'E:/math/' + u'研究笔记/队列台账.md'
raw = open(P, 'rb').read()
before, before_cr = len(raw), raw.count(b'\r')
lead = b'' if raw.endswith(b'\n') else b'\r\n'

ITEM = (u'12. 浅版债第一档收稿＋定界符假开口两处修复（2026-10-14 07:06）。'
        u'**D05 加深批**（补 §26，接 §25 之后）本体侧只读复量：bytes 91,411→**109,772**（+18,361）、'
        u'lines 401、CR 0、`## ` 标题 26→27、编号连续无缺号无重号；`gate.py D05` 打印 '
        u'`size=109772 secs=27 contig=True rows=63 math=1436 CLEAN`。写手自报 Write=0、三笔 6,921／8,343／3,099 B。'
        u'它按本单要求先交错了「前二十五节位置串只覆盖十片，十八片从未被引」的欠账清单，实读 '
        u'`00-preface.tex` 全文 80 行与 `06-normalized-cube.tex` 实质末行 84。**关键核验**：`gate` 的 `rows` 只数表头之后连续那块，'
        u'文末新表它看不见，所以我自己按行量了追加区的台账行——18 行数据行竖线数全为 **6**（直方图 {"6":18}），'
        u'无第二份表头，全文 `$` 数 1,436 为偶。**教训入档**：文末带表的追加批必须本体侧另数竖线，不能拿 `rows` 未变当作没新增行的证据。'
        u'**定界符假开口（`unclosed_spans`）5 处已修 2 处**：D273 第 237 行把「全文单一 $$ 展示对出现在 §1」里被当成正文谈'
        u'论的裸 `$$` 收进代码格（该行反引号 2→成对，`gate` 仍 CLEAN）；D114 第 2721 行是既有缺陷族「行内代码闭合符误写成别种定界符」'
        u'的反向形态——逐字引文里源文的 `$k$` 后一个美元号被打成反引号，致该行反引号 29（奇）且引出一个永不闭合的数学开口，'
        u'单 token 改回 `$` 后该行反引号 28、`$` 2、CR 0、`gate.py D114` `size=241090 secs=34 contig=True rows=61 math=1631 CLEAN`。'
        u'全库 `unclosed_spans` 5→**3**：余下 D222、D245、D752 三处的逐行 `$` 数实测全为偶数（D222 第 345／347／349 行 14／4／12，'
        u'D752 第 220／221 行 4／4、第 222 行 50，D245 第 356 行 8），形态是严格闭合规则把某个候选闭合符判废（闭符后紧跟数字一类），'
        u'不是内容里真少了闭符。按既有律「定界符互串禁奇偶补偿」，这三处不做批量补偿，留待逐处读上下文判形。')

pay = lead + ITEM.encode('utf-8') + b'\r\n'
assert b'\r' not in ITEM.encode('utf-8')
new = raw + pay
assert len(new) - before == len(pay)
assert new.count(b'\r') == before_cr + pay.count(b'\r')
open(P, 'wb').write(new)
t = new.decode('utf-8')
print('before=%d after=%d item12=%d crlf=%d lone_cr=%d lines=%d' % (
    before, len(new), len(re.findall(u'(?m)^12\\. ', t)), t.count(u'\r\n'),
    len(re.findall(u'\r(?!\n)', t)), len(t.split('\n'))))
