# -*- coding: utf-8 -*-
"""Append ledger item 10 (CRLF bytes, assert-then-write, nothing else touched)."""
import io, os, re

P = u'E:/math/' + u'研究笔记/队列台账.md'
raw = open(P, 'rb').read()
before_cr = raw.count(b'\r')
before = len(raw)
# the file's last line currently carries no terminator at all; appending one adds bytes
# without rewriting any existing byte, which is what the 「只增不减」 rule cares about.
lead = b'\r\n' if not raw.endswith(b'\n') else b''

ITEM = (u'10. D351 加深批收稿＋D569 撤案＋残余宏缺陷重新分类（2026-10-14 06:47）。'
        u'**D351**：本体侧只读复量 bytes 110,401→127,522（+17,121）、lines 314、CR 0、'
        u'`## ` 级标题 25→26，`gate.py D351` 打印 `size=127522 secs=26 contig=True rows=53 math=3330 CLEAN`'
        u'（math 2,976→3,330，台账 53 行未动）；§26 标题实测落在第 293 行，末段申报句'
        u'「§14 之后本该排 §15, 本轮以 §26 补回那批内容, 旧号 §15 永久留空、不做搬正」逐字命中 1 次，'
        u'全文无 §15 标题也无孤块，故按 C2 口径旧号留空、零挪行。写手自报 Write=0、两笔 6,240 与 10,881 均在红线内。'
        u'**D569 撤案**：它申报的两起误删（§14、§27）正文早已在 §31 与 §34 内逐字照录（第 269-275 行、'
        u'第 291-293 行），缺的只是标题行，且原文写着「我不做搬运动作，只在此处全文照录恢复，接受编号断档」'
        u'「其节题应读作第二十七节」；`gate.py D569` 为 `size=73449 secs=33 contig=True rows=45 math=1459 CLEAN`。'
        u'作者已申报的断档不搬正，也不派单，本单撤销。'
        u'**残余重新分类**（`_work/residual_probe.js` 出 `residual_report.txt`，凭据仍是 KaTeX 与各篇自己的 preamble 表）：'
        u'refused 3,841 = 交叉引用与文本模式宏被行内式吞掉 **230 处／61 篇**（`\\eqref` 188、`\\lem` 13、`\\cite` 12、'
        u'`\\ref` 10、`\\Cref` 4、`\\label` 2、`\\prop` 1）＋异篇 preamble 确有定义的简写 **2,956**（`\\norm` 703、'
        u'`\\abs` 204、`\\Q` 169、`\\HS` 122、`\\ip` 109、`\\C` 105）＋任何 preamble 都没定义 **309**（`\\*` 25、'
        u'`\\calP` 15、`\\BE` 14、`\\O` 14、`\\OOo` 12、`\\bigrvert` 10）＋KaTeX 结构性拒绝 **346**'
        u'（嵌套 `$` 125、宏体内 `Unexpected end of input` 94、`\\H` 缺组 30、`psmallmatrix` 12、双上标 6）。'
        u'订正我此前申报的「外溢约 210 处」为 **230**；另据 `_work/spill_probe.js`，纯英文引文行（无中文）'
        u'形态的外溢仅 20 处／6 篇，其余外溢都带中文尾注，故按行语言判族会漏，必须按被拒命令本身判。'
        u'四族的处置口径不变：定界符族禁奇偶补偿、异篇简写按用户口径登记不臆造、无定义者维持申报，'
        u'闸门本身不看宏（`gate_all 734/0` 依旧成立）。')

pay = lead + ITEM.encode('utf-8') + b'\r\n'
body = ITEM.encode('utf-8')
assert b'\r' not in body, 'item text must not carry CR'
new = raw + pay
after = len(new)
assert after - before == len(pay)
assert new.count(b'\r') == before_cr + pay.count(b'\r')
open(P, 'wb').write(new)
t = new.decode('utf-8')
ls = t.split('\n')
print('before=%d after=%d item10=%d crlf=%d lone_cr=%d lines=%d' % (
    before, after, len(re.findall(u'(?m)^10\\. ', t)), t.count(u'\r\n'),
    len(re.findall(u'\r(?!\n)', t)), len(ls)))
print('tail=', repr(ls[-2][:60]))
