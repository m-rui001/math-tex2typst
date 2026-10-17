# display-only 环境族腿（2026-10-17）

## 读数
`node _work/dollarmath_census2.js --sites=…`：`katex_refused` **120 → 117**（sites23 → sites24），两遍一致
（`files=734 spans=864970 katex_refused=117 files_hit=76 unclosed_spans=0`，`dollar_family=48` 不动）。
按站键去重 117，`node _work/sites_diff.js … _work/env_fix.json` → **REMOVED=3／ADDED=0**，3 站全部落在规格的 4 单上
（D134:523 两单消一站、D376:141、D444:56＝**3 站／3 篇**）。旗标一条：`D134 消 1 期望 2`——
`expect` 数的是**该行内 old 的命中数**，台账数的是**跨度**，同一行两处删空格只塌掉那一头越界的闭符，
与上一腿「D191 消 2 期望 1」互为镜像，不是内容异常。
`.tools/gate.py` 三篇全 CLEAN（`math=2564/1394/1898`）——本族同样不在闸门射程里。

## 三形与素材凭据
三行报错名都叫「环境用错了模式」，实质三形，`level` 各不同（grammar／delim／body）。

**一、`"$ …$"` 的逐字引文：开符紧跟空格 ⇒ 闭符被当开符，跨度一路跑到后行**（D134:523，grammar，两单）。
素材 `Product-projection-localization-…/build/sections/bootstrap.tex:33-40`：`\begin{equation}` 的**式体行首带一个缩进空格**
（` 0\le s<a<u<w<t<b,\qquad …`），`\[` 块同样（` P=[M=0],\qquad H=[M\ge N^t],…`）。笔记把两条展示式压成行内 `$…$`
时把行首空格一起搬了进去。跨度语法（`_work/dm_lib.js:182`：`if (i + 1 >= n || WS[m.s[i + 1]]) { i++; continue; }`）
**拒绝以紧跟空白的 `$` 作开符**，于是这一对的开符被跳过、闭符反倒成了开符，从 523 行尾一路吃到后面那个合法闭符，
把中间 `> "\begin{equation}…\end{equation}"` 的整段逐字引文拖成一个数学跨——报错名才是 `{equation} can be used only in display mode`。
修法＝删这两枚**行首缩进空格**（各 −1 字节，`$`／反引号计数都不动，D134 116483→116481）。
与 [[dollarmath-closer-veto-tiering]] 残留工单 T3-WS-BUT-NOT-A-SPLIT 那 22 处「删空格会改引文字面」不同：
那一族删的是英文词间空格，这里删的是 LaTeX 环境体的**缩进**，不落在任何词上。

**二、行文中点名环境名**（D376:141，delim）。`($\begin{CD}$ 环境,第 43 到 50 行)`——说的是**那个环境的名字**，不是交换图；
素材 `Etale-covers-…/build/sections/04-quotient.tex:44-50` 逐字确是 `\begin{CD}`，内容不错，错在定界符。
全库 house 形是用**行内代码**点名 LaTeX 记号（`_work/env_house_census.py`：`\begin{equation}` 数学或正文 1,189／代码跨度 5、
`align` 59／1、`CD` 2／0、`tikzcd` 1／0，而 `$\begin{…}$` 形只有这一站），照 house 形翻成反引号：`$` 差 −2、反引号差 +2、字节 +0。

**三、`tikzcd` 交换图被写进 `$$…$$`**（D444:56，body）。素材 `Infinitely-many-closed-geodesic-images-…/build/sections/local.tex:444-454`
的图真是 `\begin{tikzcd}` 配 `\arrow[r,"\cong"]`，KaTeX 无此环境（`No such environment: tikzcd`），全库也只这一处＝无先例可抄。
两个候选里选**同方交换图的 amscd 形**：`{CD}` 是 KaTeX 认识的 display 环境（实测 `@>>>`／`@VVV`／`@>>x>` 全 OK，
而 CD 里写 `\arrow` 报 Undefined control sequence），四个对象、两条 `\cong` 横箭、两条 `\mathrm{res}` 竖箭逐条搬成
`@>\cong>>`／`@V{\mathrm{res}}VV`／`@VV{\mathrm{res}}V`／`@>>\cong>`；先例是 psmallmatrix 那族改 house 形（渲染优先于逐字环境名）。
另一候选「整段进代码跨度」＝把图退化成源码，读者看不见交换图，只在无可重编码时才用。字节 −35（72986→72951），`$`／反引号不动。

**这一站还有第二处缺陷，报错不会说**：笔记第二条竖箭写 `\arrow[d,"\mathrm{res"}]`——闭引号被花括号吃在 `}` 里侧
（素材是 `\arrow[d,"\res"]`）。KaTeX 只报环境名那一撞；这一处是靠把台账 body 逐字抄进规格（`_work/_diffold.py` 找第一处分叉）
才看见的，重编码成 `{CD}` 时一并回到正确形。

## 工具链：第三把尺与 `level` 三值
- 规格 `_work/env_fix.py` → `_work/env_fix.json`，4 单带 `level`；**三把尺各吃一形**：
  `node _work/fix_probe.js`（式体级）判 1 单、跳过 3 单并申报理由；`python _work/delim_probe.py`（定界符级）判 4 单；
  `node _work/span_grammar_probe.js`（跨度语法级，**本轮新写**）判 2 单。三处 DRY／APPLY／落盘后 `异常=0`。
- 新尺的来历：形一在两把旧尺上**全瞎**——`fix_probe` 拿的是台账那一跨，改的正是这一跨的边界；`delim_probe` 数枚数，
  而 D134 修前修后 `单$` 都是 10。`span_grammar_probe.js` 复用同一套 `dm_lib`（`corrected`＋`spans`＋`bodyOf`＋`lineOf`，
  不另抄语法＝仍是一把尺），在内存里做 old→new（命中数≠`expect` 计异常）、重算全篇被拒跨，报修前→修后与 removed/added；
  `added` 非零直接计异常。`fix_probe.js` 的跳过条件一并从硬编码 `delim` 改成 `level && level !== 'body'`。
- `fix_verify.py` 4/0；delim_probe `--after` 4/0（D376 单$ 64 成偶、D444 `$$=2`）；`span_grammar_probe` 消 3／新增 0
  （D134 6→5、D376 1→0、D444 1→0）。

## 残余与下一支
117 枚：`errClass=null` 的未定义控制字族 60、`Can't use function '$'` 48（[[dollarmath-closer-veto-tiering]] 定性为被邻接律否决的合法闭符，不动）、
`\mathbf in text mode` 2（D192:75／D192:144，DISPLAY）、表格环境 `Expected & or \\ or \cr or \end` 2（D442:119、D589:118）、
余 5 枚单例（D101:189 `got '\end'`、D104:155 `got '_'`、D108:424 `\operatorname@` 无参、D142:561 `got '&'`、D431:77 pmatrix 配对）。
下一支＝`\mathbf in text mode` 那 2 站。

## 收尾
scratch 探针已删：`_work/_rows.py`、`_work/_pline.py`、`_work/_dump.py`、`_work/_diffold.py`。
`_work/amp_house_census.py` 写了没跑通（`BSL` 未定义），按「无平行副本」律一并删除。
