# `\H` 族腿：素材重定义撞上 KaTeX 内置名（2026-10-17）

## 族的实测形状

复量前后各一次，两边都对得上：

| | 站数 | 篇数 | 报错形 |
| --- | --- | --- | --- |
| 修前 | 33 | 2 | 30 × `Expected group as argument to '\H'`，3 × `Got function '\H' with no arguments` |
| 修后 | 0 | 0 | — |

量具：`_work/h_census.js`（corrected 掩码 + span 语法 + KaTeX，只收报错里点名 `\H` 的站，按 QUOTE／TABLE／PROSE 分桶）；站点表 `_work/h_sites.jsonl`（33 行）、`_work/h_sites_after.jsonl`（空）。D84 的 30 站形如 `\H^n`（15）、`\H^n\restrict`（12）、`\H^n|_L`（2）、`\H^n_\eta`（2）、`\H^n(E)`（1）；D31 的 3 站是 `v^\H`、`R^\H=`、`R^\H R`。

## 机制：两道缺口都在链上，不在笔记上

素材自己写 `\renewcommand{\H}{\mathcal H}`（`Riesz-transforms-…/build/paper.tex:13`），把 Hausdorff 测度命名交给 `\H`。而：

1. **表里没有这一条**。`tools/t2t/macros.py:15` 的 `OVERRIDE_KEYWORDS` 刻意把 `\renewcommand`／`\providecommand` 的定义丢进 `bad` 并只留一个空 body——在 pandoc 侧展开重定义会把公式变成它读不懂的管道。这个判断对转换管线是对的，但它让 `_work/preamble_tables.json` 对素材的重定义整体失明（D84 表只有 6 条，`\H` 不在其中）。
2. **拒渲形不是 `Undefined control sequence`**。KaTeX 自带 `\H`（匈牙利重音，必填一组实参），所以 `\H^n` 报的是 arity 错，`_work/katex_fix.js` 的名字采集那一刀看不见它——即便表里有 `\H` 也不会动手。

因此这两族的修法都不是"笔记写错了"：D84 逐字引素材，D31 只是借了一个未定义的简写。

## 落地的四处

1. `_work/preamble_table.py`：同一解析器再读一遍把 `renew|provide command` 归一成 `newcommand`，普通 `\newcommand` 同名时仍赢，走这条路进来的名字记进 `override` 字段（D84 → `['\\H']`，`ndefined` 6→7）。顺带堵掉一个覆盖事故：带 prefix 跑时 `out` 只含被筛中的那几篇，旧写法会把 732 键的整表写成 1 键，现在部分跑并入既有表。备份 `_work/preamble_tables.pre-redef.json`。
2. `_work/katex_fix.js`：`refused()` 除 `Undefined control sequence` 外，再从两种 arity 报错里收名字；凭据门不变——扩展仍要求该篇表里有这一条，且只落在本文件已经判为拒渲的跨上。
3. **D84**：`node _work/katex_fix.js "D84-" --apply`，32 处 `\H` → `\mathcal H`，该篇拒渲 37→17，字节 257366→257622，行数／`$`／反引号／CR 四项不变（工具自带断言）。引述行（467、613）与本体行一起展开，按宏族腿既有口径：只保代码跨度内的逐字，block quote 的数学随本篇定义走。
4. **D31**：素材里 `\H` 出现 0 次，共轭转置写作 `A^*`、`w^*Hw`（`03-hyperbolic.tex:65,74`），实对称转置写作 `vv^\top`（同文件 `:12,20`）；笔记同一行自己就在说"$*$-保持映射"，`^\top` 与 `^\H` 的对立是它自己立的。于是 4 处 `^\H` → `^*`，一单 `_work/c_note_fix.py D31`（命中 4＝定点上限，申报 `--dollars 0 --ticks 0`），174857→174853。判形前量的全库口径：裸 `^*` 11468 处、单一 `$…$` 内两枚及以上星号 3093 处——markdown 强调不是障碍，`^*` 就是全库写法（`_work/star_forms.py`）。

## 复量

- `_work/h_census.js` → `total=0`。
- 全库 `_work/dollarmath_census2.js --mask=corrected --digit=plain` → `spans=864990 katex_refused=269 files_hit=154`，修前 302；差额 33＝整族，无附带损伤。dollar 族仍 51 站／37 篇（不动）。
- `.tools/gate.py D31- D84-` → 两篇 CLEAN（rows 39／65，contig True，math 4654／6602）。

## 这一刀还开着的那扇门

`\renewcommand` 进表之后，全库可能还有一批同类 arity 拒渲（素材重定义 KaTeX 内置名）没被宏族腿领走：现在的 `preamble_tables.json` 只有 D84／D31 两篇是重建过的。全库重建表 + 重跑 `_work/katex_fix.js` 的干跑量数是下一步的第一张单——干跑不落盘，重建表只动 `_work`。

## 重建之后的两个读数（同一轮，均已复量）

全库重建 `preamble_tables.json`：732 篇、`missing_dir=2`、定义数 +217 条，132 篇带 `override` 名字（`\arraystretch` 42、`\P` 23、`\H` 5……）。同一把尺（`_work/katex_fix.js` 干跑，它自己不载全局宏表，所以基是 1380 那一套，**不与 census 的 267 混读**）：重建前 `files_touched=12 ops=72 refused 1380->1107`，重建后 `files_touched=14 ops=149 refused 1380->1050`——重定义凭据这一刀新解锁 2 篇／约 60 站（D310 `\op` 9 处、D596 `\dd`＋`\ee` 68 处）。

14 篇 149 处**已落**（`node _work/katex_fix.js --apply`，备份 `_work/*.pre-macro.md` 为这一代的前态，与宏族腿 #12 同名不同代，跨代数字不可比）：D04 D05 D222 D229 D254 D269 D273 D291 D302 D310 D45 D497 D596 D752。展开形如 `\dd\tau`→`\mathrm d\tau`、`\eps`→`\epsilon`、`\Hom`→`\operatorname{Hom}`、`\op(\sqrt N)`→`o_{\mathbb P}(\sqrt N)`，凭据一律是该篇素材 preamble。这一族的工具门槛保证只在"拒渲严格下降＋行数／`$`／反引号／CR 不变"时落盘。复量：census `268->267 refused`、`files_hit 153->152`、`dollar_family 51` 不动、`unclosed 0`；`.tools/gate.py` 这 14 篇加 D234 共 **15 篇 CLEAN**，字节与干跑预报逐篇相符。

## 顺手收掉的最后一枚 unclosed

`katex_refused` 里 `unclosed_spans` 全库只剩 1 枚，落在 D234:476——而 476 行自己配平（`$c_0$`／`$w$` 各一对，另四枚 `$` 在代码跨度里）。`_work/parity_walk.js D234-` 量到奇数行是 **464**：写手自述句 `把 "≤ 与 <$" 对照写成两句独立陈述` 把符号 `<$` 放在直引号里而非反引号里，那一枚字面 `$` 把全文奇偶翻转，红旗才掉在文末。修法＝把它折进代码跨度（`与 <$"` → `与 `<$>`"`，`_work/c_note_fix.py D234 --dollars 0 --ticks 2`，命中 1，77086→77089），字面符号一个不删。复量：`_work/unclosed_where.js` → `unclosed=0`；全库 census `268 refused / files_hit 153 / dollar_family 51`（269→268＝D234 退出拒渲名单）；`.tools/gate.py D234-` CLEAN（rows 47、math 2845）。

**判形依据补一条**：自述／登记句里引用定界符字面时，必须放代码跨度；直引号不管奇偶。这一族量具＝`_work/parity_walk.js`（报每行 masked `$` 计数与跨行 span），它可以把「红旗在文末」翻译成「元凶在某一行」。

