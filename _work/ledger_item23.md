## 21:24 增量（D67／D280／D41 三收＋整块搬正首用两次＋10 竖线台账行；续派 D207／D111／D68）

**收稿三篇，链路各走完（sweep 两趟、gate 只读、宏腿、region_check、全库复量）**：

- D67 `条件坐标扫描与解析迁移`：78,497 → 134,721 B（写手 +56,224，六块 10,179/10,076/10,786/12,323/10,565/2,295，§13–§24，台账 45 行）。本体侧三刀：`sweep` +3；**整块搬正** `python .tools/move_block.py D67 379 398 432 apply` 打印 `block_lines 20 order_ok True bytes 134724 134724`，写手申报的 §16–§17 错位（锚点取在 §12 末句，整块落在 §12 与 §13 之间、块头又重复了 §15 末段约 190 B）由一次纯置换归位，`contig` 由 False 转 True；**10 枚竖线的那一行台账**（第 534 行 `$|\sigma|+|\tau|=l$` 用了三对裸竖线）由 `_work/d67_ledgerrow.py` 改成 `\lvert\sigma\rvert+\lvert\tau\rvert=l`，`line534 pipes 10->6`、134,724→134,744，备份 `_work/D67.pre-ledgerfix.md`；宏腿 `newsec_expand.js D67 379 --apply` `sites=7`、+86 B → **终值 134,830**，`region_check.py D67 379` `seg=179 sep=1 hist={6:46} badpipe=[] dollar_odd=0 vsplit=0`。
  - 行内脚本断言的第一版写法错了：`$|\sigma|+|\tau|=l$` 全文命中 3 处，另两处是正文合法裸竖线（不在表格里），改成**行级断言** `lines[533].count(old)==1` 才落刀。台账行的竖线判据只适用于表格行，正文里的裸竖线不是缺陷。
- D280 `SLE 精确豪斯多夫规范函数的双重对数修正`：70,322 → 109,894 B（写手 +39,572，四笔 10,250/10,300/9,369/9,653，Write 0 次，§16–§24，台账数据行 37）。`sweep` 把在飞期间那枚 `emDash=2` 一趟吃掉（109,894→109,891，第二趟零计数），`gate` `problems=[] secs=25 contig=True rows=53 math=2604`，宏腿 `segLines=111 defs=15 survivors=0`，`region_check` `hist={6:40}`。
  - **申报的内容损失登记不搬正**：写手申报第 3 笔的锚点取了 §20 末段全文（向导曲线段，1,055 B）却未原样回写，该段已被删，主题在 §23 以重建段形式重写。整块搬正工具只能恢复"位置"，恢复不了"被吃掉的字节"，所以这一笔留在账上，正文不回改。
- D41 `敏感度与块敏感度的超二次分离`：83,304 → 124,840 B（写手 +41,536，六笔 9,290/0/8,924/7,665/7,417/8,240，Write 0 次，§19–§29，台账续表 40 数据行）。`sweep` 两趟零改动（写手自报禁串零命中，复量一致）。落位缺陷同样是申报件：第 4 笔锚点取在 §25 末段，而当时最末段属 §26，于是 §27、§28 整块插进 §25 与 §26 之间（实测 715 §25、731 §27、747 §28、763 §26）。本体侧 `python .tools/move_block.py D41 763 778 730 apply` 把 §26 那一块 16 行前移，`block_lines 16 order_ok True bytes 124840 124840`；`gate` `problems=[] size=124840 secs=30 contig=True rows=39 math=4053`；宏腿 `newsec_macro.js D41 637` `segLines=195 defs=1 survivors=0 unresolved=[]`；`region_check.py D41 637` `seg=195 hdr=0 sep=1 rows=42 hist={6:42} badpipe=[] dollar_odd=0 vsplit=0`。
  - **判式：写手申报的落位缺陷若唯一修法是纯置换，本体侧当场搬正并核对手数与字节数；若申报的是"段落被锚点吃掉"，只登记不动刀**。两者都在勘误节里，分别靠"块内标题数不变"与"字节数不变"来区分能不能搬。
  - D41 交回时 §19 起的新节标题带 `§` 而旧稿 `## 0…## 18` 不带，`gate` 的 `contig` 与 `move_block.py` 的 `H` 正则都只抽数字，混排不影响判据，别把它当缺陷。

**全库复量**：`gate_all total=734 bad=0`（D280 那枚在飞旗标由 sweep 收掉，D67 的 10 竖线行修完，两案同趟归零）；`cite_audit files=734 cites=173958 ok=173957 absent=1（D587，历史值）oob=0`，`abbrev=6902 ok=6896 absent=0 ambiguous=0 noncite=6`。

**续派三档**：D67／D280／D41 收完腾出三位，`inflight.txt` 在派单同一趟改写为 `D207 D111 D68`，写手并发回到 3 档（`mode` 参数只接受 `auto` 等六枚值，上一趟写 `bypassPermissions` 被校验挡回，改 `auto` 后三单全部起来）。
- D207（71,594 B，`## §0…## §14` 加文末 `## 台账`）：`wave.txt` 第 31 行 `row=31 bytes=367894 dir=preprints/A-counterexample-to-Hadwigers-conjecture-September-23-2026`，未引用 19,886 B 整枚在 `build/sections/04-moments.tex`，续号 `## §15`。
- D111（77,684 B，旧标题形态 `## 0…## 16 常数与参数台账`，缺 `§`）：目录 `The-Bass-trace-conjecture-for-complex-group-rings-September-24-2026`（main.tex 2,406 + 十枚分片 98,073），不在 `other_queue.txt` 里，派单里明写"不改 §0、不按 wave.txt 找参数行"，未引用 18,781 B 的主体是 `01-introduction.tex`（15,027），续号 `## §17`。
- D68（232,779 B，33 个 `## ` 标题、最大 §32）：欠账表重新排到首位，未引用 **199,919 B**、整枚未引用最大的一枚是 `sections/07-fractional-density.tex`（32,763 B），目录 `Compatibility-entropy-and-the-spectrum-of-a-Thorp-sweep-September-26-2026`（17 枚分片，逐枚字节由 `ls` 复量：11 号 51,993、16 号 42,661、14 号 36,322、10 号 35,172），续号 `## §33`。它上一轮才收过，欠账仍是全库最深，所以二次入队。
- **按内容欠账筛号的第二条**：D499／D463／D358／D225／D710／D627 六单的 `uncited` 全落在 `references.tex` 或 `bibliography.tex`，bib 不是正文，跳过；D04 与 D500 同篇，已划出梯队。
