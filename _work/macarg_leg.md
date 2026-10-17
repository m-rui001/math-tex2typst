# 内层 `$` 把 `\text{}` 关在段外：宏参 EOF 一族 21 站与两站隐形的 `\Set`（2026-10-17）

## 触发

上一腿（`_work/brace_gauge_leg.md`）收口后全库拒渲 209。按报错形排队，
`Unexpected end of input in a macro argument` 有 21 枚，是当时最大的一族。这条消息在站点表里被截到
55 字符，分不了形，于是逐站重放给 KaTeX 听（`_work/macarg_replay.js`），再按现场窗口分族
（`_work/macarg_windows.py`）。

## 四族

1. **内层 `$` 落在 `\text{}` 里（7 站／7 篇）**——D139 `$4^D\cdot(\text{$s$ 的固定幂})=\exp(O(s^2))=o(n)$`、
   D163、D30、D396、D57、D582、D750。作者的写法是「把话夹进式子，话里再点一个变量」，
   在 `.tex` 里 `\text{}` 内的 `$…$` 完全合法。**但发布侧的跨度语法（remark 那条邻接律：闭符前不空白、
   后不数字）会在内层那枚 `$` 关段**：前半截断在 `\text{` 上＝宏参 EOF，后半整段掉成正文。
   量具拿整条式子喂 KaTeX 是 RENDERS 的（`_work/macarg_shapes.js`），**所以「内容没写坏」与「读者看到什么」
   是两个问题**——这一族的凭据必须是跨度语法，不是 KaTeX。
2. **光杆控制字独占一枚跨度（6 站）**——`$\eqref$` 四站（D233、D446、D480、D575）与 `$\red$` 一站（D463）
   都是登记句：作者要说的是**那个命令名**，不是用它。`\eqref` 在全库宏表里 arity=1、`\red` 是 KaTeX 内置
   带参函数，所以光杆写出来报的是宏参错而不是未定义。`$\mathbb N\to\Set$`（D157）同理。
3. **拼接残伤（5 站＝D351 第 78 行）**——`RD=\mathrm\operatorname{Id}`：宏族腿展开 `\Id` 时把 `\mathrm`
   塞在已经展开好的 `\operatorname{Id}` 前面。本篇另有 9 处合法形 `\mathrm{Id}`（104、108、158、160、218、
   229、246 行）＝凭据。
4. **漏符／作者申报（3 站）**——D326 第 40 行的 `$$…\arccos(-\sqrt q/2),$$` 缺一枚 `}`；
   D521 的 `\frac{\mathfrak}2` 少了字母 `S`（本篇 `\mathfrak S` 14 处、素材 `07-extraction.tex:59`）；
   D576 的 `\frac{33k+28)/5}`。

## 两处申报形怎么分开处理（本腿唯一的排版判断）

D326 与 D576 都是作者自己申报过的错，但坏的**载体**不同：
- D326 坏在 `$$…$$` 里，而且一枚式子带着另一枚正确的（`p_q=…`）——整条展示式一起拒渲，
  读者连正确那半也看不到。作者第 41 行的申报是「第二式括号应当闭合」并给出正确形＝授权补这一枚 `}`。
- D576 坏在一行清单的末项，作者当场写了「最后一处我笔误，正确写法是 $\frac{33k+28}{5}$」。
  这里的错误记录**是这行清单的一部分**，搬正会让那句自陈失去指称物。改成代码跨度：坏形照样印出来
  （作为字面 TeX），拒渲归零，句子一个字不动。

## 修法与凭据

22 条定点修补由 `_work/macarg_apply.py` 驱动（同一把尺 `_work/c_note_fix.py`，不复制断言）：
- 族 1 剥掉内层那两枚 `$`（`\text{$s$ 的固定幂}` → `\text{s 的固定幂}`，D582 有两对所以 `$` 少四枚）。
  字母一个不删，代价是注释里的变量从数学斜体变成正文直立——话本就在 `\text{}` 里。
- 族 2 的 `$\eqref$`／`$\red$` 翻成代码跨度（全库 `` `\eqref` `` 已有 17 处／12 篇先例；
  D463 本篇 `\mathrm{red}` 18 处），`$\Set$` 按登记形写 `\mathrm{Set}`。
- 族 3 五处各带自己的左右手做 OLD（`$RD=` 与 `$RD=PL+H_0=` 差一枚 `$` 的位置，第一版把 `(` 写在
  `}` 之后＝零命中，那是我的串边界错，不是正文的事）。
- 族 4 三处补符。

## 读数

全库拒渲 **209→186**（`_work/dollarmath_sites11/12/13.jsonl`，复量两遍站点集合差＝消失 0／新增 0）。
站点集合差：**消失 22、新增 0**——21 站宏参 EOF 全清，另带掉 2 枚 `Can't use function '$'`
（原先后半掉成正文时又被配成另一枚坏跨度）。按报错形的差值只有这两行：
`Unexpected end of input in a macro argument` 21→0、`Can't use function '$' in math mode` 47→45，
其余形一站不动。spans 864974→864965，dollarFamily 51→49，files_hit 128→114。
18 篇 `.tools/gate.py` 全 CLEAN。

## 两站隐形的同族（尺上不报，墨是错的）

`_work/macarg_family_scan.py` 扫全库时才看见：`\Set` 是 KaTeX 内置的带参函数，
`\Set(\text{OrderedDistinctPoints }r)` **渲染通过**，发出来的墨却是 `{(}OrderedDistinctPoints r)`
——多出一对花括号。尺子只数拒渲，所以 D128:315、D157:795 两站从没进过任何工单（与
`_work/label_family_leg.md` 记的「同一族缺陷一半隐身」同形）。两站按 `\mathrm{Set}` 一起改了。
D139:111 那一枚 `\Set` 在反引号里，是 `sampler.tex:102` 的逐字引文，不动。

`\text{…$…$…}` 这一族的全库面是 **26 处／22 篇**：7 处拒渲（本腿改完）、
5 处坐在 `$$…$$` 里（闭符是 `$$`，内层 `$` 无害）、14 处在围栏或 `>` 引用块里＝逐字 tex 引文，也不动。
判「动不动」靠的是 `_work/textdollar_face.js`：按跨度语法算出这一处落在哪一枚跨度里、
那一跨的 body 是什么、重放结果，以及 `provOf` 的掩码类别（F 围栏／c 行内代码／P 正文）。
只看文本形状（`\text{` 里有 `$`）会把 19 处好形一起拖进来。

## 残（下一腿候选，按站点数）

`Can't use function '$' in math mode` 45（dollar 族已判，残留逐行窗口在
`_work/dollarmath_residual.md`）／`No such environment: psmallmatrix` 12／`Expected '}', got 'EOF'` 8／
`Expected group after '_'` 7＋`^` 5／`Double subscript` 7＋`Double superscript` 6／
`Can't use function '\('` 6（pandoc 转义族，轴 76 已量过墨价）／`Expected 'EOF', got '\right'` 5／
表格环境 `Expected & or \\ or \cr` 2＋`\end` 1。
