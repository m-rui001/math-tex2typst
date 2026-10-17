# psmallmatrix 环境族腿：12 站＝全库出现次数，一站两缺陷那枚要靠 ink 才看得见（2026-10-17）

## 触发

上一腿（`_work/macarg_leg.md`）收口后全库拒渲 **186**。按报错形排队，
`No such environment: psmallmatrix` **12 站／4 篇**（D214 两站、D24 三站、D47 六站、D49 一站）。

## 定性与凭据

`psmallmatrix` 是 **mathtools** 的环境，定义就是 `\left(\begin{smallmatrix}…\end{smallmatrix}\right)`；
KaTeX 只带 amsmath 的 `smallmatrix`，环境表里没有带笔名的那几个（`_work/psmall_probe.js`：
`psmallmatrix`／`bsmallmatrix`／`psmallmatrix*` 全报 `No such environment`，`smallmatrix`／`pmatrix`／
`matrix`／`vmatrix` 全 RENDERS）。所以这不是量具侧的事：笔记用了**自己的渲染器印不出来的环境名**。

改法取 house 形，两处独立凭据指向同一形：
- 笔记侧：全库 `\begin{smallmatrix}` 66 处里 **63 处前驱就是 `\left(`**（`_work/psmall_cred.py`，
  另 2 处裸写、1 处普通括号）。
- 素材侧：D214 `selector.tex:151`、D47 `topology.tex:27` 原文就是
  `\left(\begin{smallmatrix}-1&1\\1&1\end{smallmatrix}\right)`。三篇素材的 preamble 都 `\usepackage{amsmath,…,mathtools}`，
  作者用 `psmallmatrix` 是合法的，笔记把它折成了一个 KaTeX 不认的名字。

族面量过：全库 `psmallmatrix` 出现次数 **12 ＝ 拒渲站数**，围栏／代码跨度里没有隐形同族
（`_work/psmall_face.py` 逐环境名普查），所以这一族不需要上一腿那种第二把尺。

## 一站两缺陷：`No such environment` 会挡住后面的账

D49:116 那一站修前的整个跨是
`\begin{psmallmatrix}0&-1\\mathbf 1&0\end{psmallmatrix}`——行分隔 `\\` 后面跟着**丢了反斜杠的 `mathbf`**。
KaTeX 撞到环境名就停，第二条缺陷一个字不报；按「消失 12／新增 0」收站的话这枚会静默留在盘上。
把它单独渲染才量出代价：AS-IS ink 是 `(0−1mathbf10)`，字母 `mathbf` 印成了墨。
素材凭据 `main.tex:21` `\newcommand{\1}{\mathbf 1}`——作者的字面形是带空格的 `\mathbf 1`（KaTeX 认），
所以补一枚反斜杠、不改写成 `\mathbf{1}`。

**律：错误消息只报第一个撞上的东西，一站可能叠多处缺陷。收站不能只比站点集合，要对每一站读渲染墨。**
量具 `_work/psmall_ink_check.js`＝把修前 body 的 cell 序列（数字与减号，`−` 要折回 ASCII `-` 才可比）
与新形 KaTeX ink 逐站对齐；KaTeX 同一式子发两份（MathML 副本数字顺序不守阅读序），断言只能按
「ink 以 want 开头」写，不能按字节相等写。12 站全 CELL-OK。

## 落地

`_work/psmall_apply.py`：9 条 OLD/NEW 覆盖 12 站，驱动预数读的是「前面几条落完之后」那一形
（D47 的裸 `\begin{psmallmatrix}1&1\\1&2\end{psmallmatrix}` 在 `\phi=` 那条之前命中 3、之后才是 1，
所以 `\phi=`／`\psi=` 两条必须先落）。`$`／反引号差全 0。

读数：全库拒渲 **186→174**，站点集合差 **消失 12／新增 0**（`sites13` vs `sites14`），
`No such environment` 类归零，其余类一位未动（`\mathbf in text mode` 那 2 站是 D192 的旧账，不是本腿新伤）；
第二遍 `sites15` 与 `sites14` 集合完全相同（量两次）；`.tools/gate.py D214 D24 D47 D49` 四篇 CLEAN。
字节 4 篇各 +11～+121，行数全不变。

## 残（下一腿候选，按站点数）

`Can't use function '$' in math mode` 45（dollar 族 49 站已判不动，见 `_work/dollarmath_residual.md`）／
`Expected '}', got 'EOF'` 8（真·缺闭符，与上一腿的 SPLIT 不同形）／
`Expected group after '_'` 7＋`^` 5／`Double subscript` 7＋`Double superscript` 6／
`Can't use function '\('` 6（pandoc 转义族，墨价已在 typst 轴 76 量过）／
`Expected 'EOF', got '\right'` 5／表格环境 `Expected & or \\ or \cr or \end` 2＋`Expected 'EOF', got '\end'` 1＋
`Got function '\operatorname@' with no arguments` 1。
