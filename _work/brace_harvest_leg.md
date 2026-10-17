# `Extra }` 形采集腿：`\red` 族 10→0（2026-10-17，同轮第二支）

## 触发

上一支（`_work/label_family_leg.md`）拆拒渲残 254 枚的族形时，发现 `Extra }` 9 站与 `Expected '}', got 'EOF'` 10 站里有一批 `\red`：`F_{\red}`、`(\operatorname{Supp}\Lambda)_{\red}\cdot A^{q-1}`、`|D|_{\red}`。

复现：`katex.renderToString("F_{\\red}")` 报 **`Extra } at position 8`**，消息里根本没有 `\red` 这个名字。`_work/katex_fix.js` 的 `refused()` 只从 `Undefined control sequence` 与两种 arity 报错里采名字，所以这一族的候选名从来没进过队列——即便 D255、D292 的素材 preamble 里白纸黑字定义着 `\red → \mathrm{red}`（`preamble_tables.json` 的 `defs` 有这一条）。**缺口在链上，不在笔记上**：全库 undef 账上 `\red` 零记录，工单也从没发过它。

## 补的那一刀

`_work/katex_fix.js` `refused()` 的 catch 里加第四形：报错串匹配 `Extra \}` 或 `Expected '\}', got 'EOF'` 时，把**该数学跨度自己的全部控制字**列进同一个 `cmds` Map 当候选。不会误扩，理由三层：

1. `refused()` 调 KaTeX 时不载全局宏表，所以本篇 `defs` 里的名字在该跨度里本来就全是未定义的；
2. 主循环只对 `cmd in defs` 的候选动手（凭据门一字未动）；
3. 落盘要拒渲严格下降，且行数／`$`／反引号／CR 四项不变（工具自带的断言）。

干跑读数（同一把尺、同一基）：`files_touched=2 ops=8 refused 1253->1024`。`--diff` 逐行看过：`F_{\red}` → `F_{\mathrm{red}}`、`\mathcal O_{p(R),\red}` → `\mathcal O_{p(R),\mathrm{red}}`。

## 落地

- `_work/katex_fix.js --apply`：D255 `\red`×5（该篇拒渲 5→0），D292 `\red`×3（13→10）。备份 `_work/D255-…pre-macro.md`、`_work/D292-…pre-macro.md`。字节 73965→74005、71470→71494。
- 另两站素材**没有**定义 `\red`（D256、D333 的 `defs` 里没有这一条），但这两篇素材自己把约化子概形写作 `_{\mathrm{red}}`（D256 全素材 11 枚、D333 1 枚），与 D31 那一支「按素材自己的形回改」同口径，于是各一枚 `_work/c_note_fix.py --dollars 0 --ticks 0`（命中 1＝定点上限）：D256 96555→96563、D333 91942→91950。

## 复量（两次，两把尺）

- `_work/dollarmath_census2.js --mask=corrected --digit=plain`：`refused 254→246→244`（本支 −10，上一支 −13，全库本轮 267→244＝23 站，逐笔对得上）、`files_hit 152→150→148`、`spans 864974`、`undef` 合计 79→66（−13＝`\lem` 整族）、`undef.\red` 0、`dollar_family 51` 不动。
- 族内读数要说准：census 的 `other` 表里 **`Extra }` 9→0**（这十个站的全名都在这一档），而 `Expected '}', got 'EOF' at end of input` 仍 10、`Expected 'EOF', got '}'` 仍 27——那两档是别的原因（括号真缺／真多一枚），本支没碰，是下一支最大的两张牌。
- `.tools/gate.py`：D255（rows 44、contig True、math 1290）、D292（math 1594）、D256（math 2378）、D333（math 2836）四篇 **CLEAN**。gate 直接跑在 GBK 控制台上会 `UnicodeEncodeError`，那是打印编码不是笔记缺陷，加 `PYTHONIOENCODING=utf-8`。

## 残 244 枚的族形（本轮实测，供下一支挑）

对外读数 244 的构成（同一份 census 的 `other` 表，档位之间有重叠，别相加）：dollar 族 51（已定性、`_work/dollarmath_residual.md`）、`Expected 'EOF', got '}'` 27、`Unexpected end of input in a macro argument` 21、`No such environment: psmallmatrix` 12、`Expected '}', got 'EOF' at end of input` 10、`Expected group after '_'` 7、`Double subscript` 7、`Can't use function '\(' in math mode` 6；undef 长尾 66 枚，最大一档是 `\lc` 5、`\Csum` 4，其余每档 ≤3 且多为本篇素材无定义——按登记不发明留着。
两张待定性的牌：`\texttcaxe`(2)／`\textrewol`(1) 疑似尺的假阳（同一串直调 KaTeX 通过，报错名还把标签尾部印成反序）；`psmallmatrix` 12 是干净的单环境族，展开形要看该篇素材怎么排这个矩阵。
