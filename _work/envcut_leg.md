# 腿 #59：环境边界切断族（4 单／4 篇，`katex_refused` 115 → 111）

## 读数

- 量具 `_work/dollarmath_census2.js`（同一把尺读两遍）：
  `files=734 spans=864968 → 864975`、**`katex_refused=115 → 111`**、`files_hit=75 → 71`、`unclosed_spans=0`。
  两遍台账 `_work/dollarmath_sites27.jsonl`／`sites27b.jsonl` **sha256 相同**
  （`3f145546b836…4fc00acfa`）＝落盘量两次坐实。
- 集合差 `_work/sites_diff.js sites26 sites27 envcut_fix.json`：**前=109 后=105，REMOVED=4／ADDED=0**，
  执行位 4/4 全部可归到规格那四篇。
- `spans` **上升 7**：D101 补回闭符后，那一条从 189 行一路吃到下游的 runaway 跨被切成若干合法跨。
  跨度数上升不是回归，是配对归位的应有之形——读账时别把它当新增缺陷。

## 四站三形（都坐在「数学跨与环境的接缝」上）

报错名分三种，实质都是**环境没关上就遇到边界**：

1. **行内闭符吞掉 `\end{pmatrix}`**（D442:119，`Expected & or \\ or \cr or \end`）
   `$B_j=\begin{pmatrix}0&b_j^\top\\ -b_j&0$`。凭据
   `preprints/Hyperbolicity-Cones-Without-Semidefinite-Lifts-October-5-2026/build/source/02-cone.tex:32`
   逐字 `B_j=\begin{pmatrix}0&b_j^\top\\-b_j&0\end{pmatrix},`，同篇 109／110 行两个 pmatrix 都写得完整＝本篇内凭据齐。
   `$`／反引号都不动，字节 +13。
2. **半截闭合境**（D431:77，`Mismatch: \begin{pmatrix} matched by \end{pm}`）
   坏形是 `\end{pm}`（**带那枚闭括号**）。凭据
   `…/build/sections/transport-matching.tex:22-26` 的 eq:transport-matrix。字节 +5。
   **第一版规格把修法写成往 `}` 后面接 `atrix}`**，得到 `\end{pm}atrix}`——那还是 `\end{pm}` 加一串散字符，
   KaTeX 同一处报错一字不变；是 `fix_probe` 的「修法 仍 ERR」这一格把它逮住的（规格未落盘就回炉）。
   正确形＝`atrix` 补在 `}` **之前**。另：old 不能写成裸 `\end{pm}`，整篇 `str.replace` 要吃所有 `\end{pm}` 开头的形，
   本篇实测只命中 1 次是运气不是量具，所以 old 用**整段 body**。
3. **留档引文少一枚开符**（D589:118，`Expected & or \\ or \cr or \end`；本腿唯一改判的一站）
   原句 `其 Gram 矩阵减恒等有分块形 $\begin{pmatrix}0&O_{S,T}\\ O_{S,T}^{*}&0$ 型` 的写法要谨慎,
   原文在 `…:480` 至 `…:483` 给出 $\begin{pmatrix}0&O_{S,T}\\ O_{S,T}^{*}&0\end{pmatrix}$…`。
   量具在这一行报的**反引号开=1**（该行反引号共 17 枚＝奇数）说的是同一件事：`型` 后那枚是**只有闭符没有开符**的半对。
   两形对照后取**补开符**：
   - 补 `\end{pmatrix}`＋删那枚反引号＝把引文当式体，结果是同一矩阵在这一句里印两遍，
     而这一句讲的正事是「这种写法要谨慎」，句子当场自相矛盾；
   - 补开符＝承认它是**逐字引文**（原样留着那个截断的坏形），后半句给完整形，正是笔记要说的事；
     反引号 17→18 成偶，该行下游那 8 枚引文码跨度一起归位。
   `$` 差 0、反引号 +1、字节 +1。素材 `…/build/strong-ulam-stability.tex:480-483`
   `\begin{pmatrix}0&O_{S,T}\\O_{S,T}^*&0\end{pmatrix}.`＝笔记报的行号区间对得上。
   这也是「**消旗标≠修笔记**」的一格：删掉那枚反引号能把旗标消得更彻底，但它改的是作者的引文意图。
4. **逐字引文少闭符 ⇒ 跨度吃掉下游正文**（D101:189，`Expected 'EOF', got '\end'`）
   第 183—190 行是四空格缩进的引用块（逐字引素材 lemma 的排版），块里把素材的 `\(` `\)` 一律重写成 `$`，
   末行 `for the representation of $E_{\rm disc}.` 漏了闭符 ⇒ 块内 `$` 成奇数，跨度从 189 行吃到下游，
   报错名却挂在 `\end{lemma}` 上。素材
   `…/build/sections/transfer.tex:35` 逐字 `for the representation of \(E_{\rm disc}\).`——**闭符在素材里存在**，是笔记漏搬。
   `$` +1、字节 +1。量具侧一条：`_work/dm_lib.js` 的掩码剥围栏 ` ``` ` 与行内反引号，
   **不剥四空格缩进代码块**，所以块内 `$` 照样参与配对（这一站是真缺陷，不是假阳）。

`$` 差＝0／0／0／+1，反引号差＝0／0／+1／0，四篇行数不变。

## 尺的分工与本次新立的一条律

- `body` 两单（1、2 形）：`_work/fix_probe.js`——修前应 ERR、修法 OK 并打墨
  （D442 墨读 `B_j=(0 b_j^⊤ / -b_j 0)`、D431 `M_θ=(0 θ / Q_θ· T_θ)`）。
- `delim` 两单（3、4 形）：`_work/delim_probe.py` 修前／`--after` 两格——
  D589 `反引号开 1→0`、D101 `单$ 1→2`。
- **新律：旧形残差而不是旧形计数。** 有一族修法往旧串里**插入字符**（old 是 new 的子串，本腿的 D442 就是），
  落盘后 `count(old)` 天然不归零——新形自己含着旧形，`fix_verify` 原先的「行内不含旧形／全篇旧形＝0」对这一族报**假异常**。
  判据改成 `residual = count(old) − count(new)·new.count(old)`，定义只写在新尺 `_work/spec_resid.py` 一处，
  `fix_verify` 与 `delim_probe --after` 共用；不插字符的修法 `new.count(old)`＝0，同一公式退化成旧形计数，不必分叉。
  回归自检：拿已收的 `env_fix.json`（腿 #57，4 单）与 `digit_fix.json`（腿 #58，6 单）在新尺上重读，
  两趟都 **异常=0**，与当年报告一致。
- 顺带一条 masking 律：`delim_probe` 的「单$」在**反引号错配**的行上会被 masking 掩盖——
  D589 修前 6、修后 18 不是多写了 `$`，是那一枚孤闭符把行后半段当 code 跨度屏蔽了。两个读数都成偶，
  只有真假之分，所以这一格要连带读「反引号开」。

## 收尾

- 规格 `_work/envcut_fix.py` → `_work/envcut_fix.json`（4 单带 `level`），
  `fix_apply.py` DRY 异常 0 → `--apply` 四单各命中 1、字节差＝申报值。
- `_work/fix_verify.py` 4/4 残差 0；`_work/delim_probe.py --after` 4/4 偶、开态 0；
  `.tools/gate.py D442 D431 D589 D101` → 四篇 **CLEAN**（rows 68／37／38／84，secs 14／17／14／17）。
- 一次性取证脚本 `_work/envcut_counts.py` 已删；`_work/spec_resid.py` 留作公共尺。

## 残余（111 枚）与下一支

48 枚 `Can't use function '$' in math mode`（`_work/dollarmath_residual.md` T3，判定不动）＋
60 枚 `errClass=null` 未定义控制字族＋零星三枚：D142:561 `Expected 'EOF', got '&'`（引文里的对齐符进了非数组数学跨）、
D104:155 `got '_'`、D108:424 `\operatorname@` 无参。下一支从这三枚里挑。
