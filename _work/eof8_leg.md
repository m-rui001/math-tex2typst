# `Expected '}', got 'EOF'` 腿：8 站全是「一枚定界符」，两站是同一个坏形的两种地位（2026-10-17）

## 触发与读数

psmallmatrix 那腿（`_work/psmall_leg.md`）之后全库拒渲 **174**。本腿靶 `Expected '}', got 'EOF'`
**8 站／7 篇**。落地后 **174→166**，站点集合差 **消失 8／新增 0**，该类 **8→0**、其余类一位未动；
第二遍读数与第一遍集合完全相同（`sites16` vs `sites17`）；七篇 `.tools/gate.py` 无 FLAG。

## 八站逐条（凭据都到素材那一行）

| 站 | 坏形 | 修法 | 凭据 |
| --- | --- | --- | --- |
| D16:303 | `$\sup_{h\in$ 紧区间$\}$`（中文夹在两个半跨之间） | 合回一整跨 `$\sup_{h\in\text{ 紧区间}}$`，`$` 少两枚 | 段首标 `[推测]`，素材无凭据；`\operatorname{紧区间}` 也渲染但触发三条 strict 警告，不取 |
| D335:244 | `$Z_*e^{-1.2D$` | 补 `}` | 素材 `04-continuum.tex:744` `\(Z_*e^{-1.2D}\)` |
| D335:304 | 同一枚坏形出现在作者登记句的引文里 | 引文改代码跨度 `` `$Z_*e^{-1.2D$` ``，正文一字不动 | 该行本身就是工单：「漏了一个右定界符，应为 $Z_*e^{-1.2D}$」 |
| D402:169 | `x_{ij(byb^{-1})` | `x_{ij}(byb^{-1})`（根子群与参数括号各关各的） | `kernel.tex:219` 逐字 |
| D490:139 | `s^{A-1))` | `)`→`}` | `06-early.tex:136-137` `\left(\frac{C_2}{s+s_N}Z(s)+C_{A,\delta}s^{A-1}\right)\dd s` |
| D500:326 | `$B^{-1-c_{*}/2)$` | `)`→`}` | `localization.tex:74` `$B^{-1-c_*/2}$` |
| D762:493 | 表格格内 `$n^{-5/6+15m$` | 补 `}` | `fluctuations.tex:125` `=n^{-5/6+15m}` |
| D765:385 | `(P_j^{\mathrm{eu})^{-1}` | `(P_j^{\mathrm{eu}})^{-1}` | `model.tex:484`，且**同一行前半**就写作正确形 |

内容不变量由 `_work/eof8_verify.py` 逐条量字符差：**只补或只换定界符，字母与汉字一个不删**
（`丢={'$':2}`＋`加={t,e,x,…}` 那一行是 D16 的合跨，唯一动了拼写的站点）。

## 两枚律

1. **同一个坏形在正文与在登记句里，地位不同**（上一腿 D365/D576 已立，本腿 D335 再证一次）：
   244 那条 OLD 必须带上下文「，再抬…去掉限制，得」，否则一替换把 304 行的引文一起抹平——
   引文是作者申报的留档，改成代码跨度才是既停红又不改史的做法。登记句里引用定界符**字面**要进代码跨度
   这条早就记过（`material-redef-vs-katex-builtin.md` 第 6 点）。
2. **收站凭什么说「没有第二处缺陷」**：本腿 8 站消失后新增 0，说明这些跨整体重解析通过——
   parse-error 型缺陷瞒不住（补掉第一个撞点，第二个会作为新站再现）；
   但**只错墨不报错**的缺陷（如 psmallmatrix 那腿丢掉 `\mathbf` 反斜杠、`\Set` 发 `{(}`）在集合差里是零信号，
   必须逐站读渲染墨。**两把尺各有各的瞎处，缺一把就有一族过关。**

## 残（下一腿候选，按站点数）

`Can't use function '$' in math mode` 45（dollar 族 49 站已判不动，`_work/dollarmath_residual.md`）／
`Expected group after '_'` 7＋`^` 5／`Double subscript` 7＋`Double superscript` 6／
`Can't use function '\('` 6（pandoc 转义族，typst 轴 76 已量过墨价）／
`Expected 'EOF', got '\right'` 5／`Expected & or \\ or \cr or \end` 2＋`Expected 'EOF', got '\end'` 1＋
`Got function '\operatorname@' with no arguments` 1＋`\mathbf in text mode` 2（D192，未看）。
