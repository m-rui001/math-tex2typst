# -*- coding: utf-8 -*-
# Append ledger item 14 to 队列台账.md as a single CRLF-terminated line, then re-measure.
import io

P = u'E:/math/' + u'/研究笔记/队列台账.md'.lstrip('/')
P = u'E:/math/研究笔记/队列台账.md'

ITEM = (u'14. 浅版债第三档三批收稿＋D07 重复块切除＋禁串三处与 D03 裸竖线回改＋gate_all 复量回 734/0（2026-10-14 07:35）。'
        u'**D04**（补 §35，讲全链条唯一的实截断双符号出处）本体侧复量：基线 104,152 起、写手交回 140,044、三处回改后 **140,041**，lines 484，CR 0，'
        u'`gate.py D04` 打印 `size= 140041 secs=36 contig=True rows=53 math=3560 CLEAN`；写手申报文末 37 行台账闸门看不见，本体侧自数竖线直方图 `{6:37}`，'
        u'同区另有 4 枚与 8 枚两行经核是正文里的绝对值竖线、不是表行。**D07**（补 §25，读 hull-routing 与 exposure-first-moment 两图面板）：'
        u'基线 85,934→写手交回 134,768，其申报的落盘事故（第 4 笔把锚点取在收工申报段的中段，令类别甲段与勘误段各多出一份逐字副本，479/481 行对 473/475 行，'
        u'名义 1,700 字节的笔实测 4,048 字节）由本体侧整块切除，实测 −2,330 字节、lines 484→480、math 2070 不变；'
        u'三处禁串（388 行对举句式、422 行三字连接串、438 行对举句式）改写句式不动定界符，`gate.py D07` 打印 `size= 132441 secs=26 contig=True rows=58 math=2070 CLEAN`；'
        u'该篇第五次申报里「重复两段现居第 479 行与第 481 行」的指称随切除失效，以本条为准。**D03**（补 §23，introduction 与 continuation 前 240 行）：'
        u'基线 96,760→**117,739**，写手自数新增 20 行台账直方图 `{6:19, 8:1}`，唯一超标行是磁盘第 331 行末格把绝对值写成两枚裸竖线，'
        u'按台账格内符号口径改成转义绝对值宏，竖线 8→6、`$` 数与行数不变，`gate.py D03` 打印 `size= 117750 secs=24 contig=True rows=51 math=2384 CLEAN`；'
        u'本篇禁串两遍自数全零，是本轮唯一没在禁串上翻车的档。**全库复量** `python _work/gate_all.py` → `total=734 bad=0`，上一轮 parked 的 bad=2 清零。'
        u'**两处量具更正**（都改变派单结论，记在此处）。其一，欠账表原先只按素材**全文件名**数引用，漏了台账里「序号:行号」的简写记法（形如 `07:120`），'
        u'于是把 D711／D232／D109 这类引用充分的笔记排成最大欠账，还把 161,981 字节、只引过两片、另有 199,919 字节从未引用的 D68 误判为「几乎全读完」；'
        u'`_work/debt_census.js` 现两种记法都数，并排除 build 目录自带的 tikz／pgf／glyphtounicode 等库文件，改后前三名 D533（244,683 B）／D68（199,919 B）／D605（195,416 B，'
        u'其 3,746 行主体文件零引用）已按三档派出。其二，残余 unclosed 三处（D222 347 行、D752 221 行、D245 356 行）的判形要改：'
        u'`_work/span_trace.js` 按闸门贪心配对逐 span 回放，三处的红旗位置都是**全文最后一个 span**，即配对比文件末尾更早断在那里、打印行并非缺符处；'
        u'展示式 `$$` 全文贪心配对，一枚落单就把其后上百行吞成一个 span（D222 那个吞了 3,636 字节），所以「逐行 `$` 数为偶」并不排斥这类缺陷，'
        u'真正的判据是该文件 `$$` 记号总数是否为奇，此前按行奇偶判形的通道对它是瞎的。')

raw = io.open(P, 'rb').read()
before = len(raw)
before_cr = raw.count(b'\r')
body = ITEM.encode('utf-8')
assert b'\r' not in body, 'CR inside the item'
lead = b'' if raw.endswith(b'\n') else b'\r\n'
pay = lead + body + b'\r\n'
new = raw + pay
assert len(new) - before == len(pay)
assert new.count(b'\r') == before_cr + pay.count(b'\r')
io.open(P, 'wb').write(new)

chk = io.open(P, 'rb').read()
ls = chk.decode('utf-8').split('\n')
print('bytes=%d (was %d, +%d) crlf=%d lone_cr=%d lines=%d' % (
    len(chk), before, len(chk) - before, chk.count(b'\r\n'),
    chk.count(b'\r') - chk.count(b'\r\n'), len(ls)))
print('items_seen=%d last_starts=%s' % (
    sum(1 for l in ls if l[:2].strip().rstrip('.').isdigit() and '. ' in l[:6]),
    ls[-2][:24].encode('unicode_escape').decode()))
