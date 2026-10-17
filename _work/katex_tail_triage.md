# KaTeX 长尾族定性：`\rangleG` / `\math` / `\two` / `\root`

只读调查产物。未改任何 `研究笔记/` 文件，未执行 git，未读 PDF/`pdftotext`，未读 `.tools/`。
素材侧只读了 `preprints\<目录>\build\**\*.tex`（typst/ 分片未作来源）。

## 0 口径与探针

- 普查清单：`E:\math\_work\katex_sites_now.jsonl`，364 行。
  实测字段为 `body, errClass, file, kind, line, lineText, tok` —— **没有 `col` 字段**（任务描述里的 `col` 不存在），列位由本次探针自行算出（1-based 字符列）。
- 四个目标 tok 在普查里的命中行数：**13 行**（`\rangleG` 3、`\math` 3、`\two` 3、`\root` 4），`kind` 全为 `INLINE`。
- 同族全库扫描（脚本 `probe_family.py`，产物 `probe_family_report.txt` / `probe_family_counts.json`，跨度分类另核于 `probe_family2.py` / `probe_plaincount.py`）：这 13 个数学跨度内出现点与 13 条普查行 **一一对应，本级无漏报、无级联**（另有 **19 个**同族串落在行内反引号代码跨度或 ``` 围栏里，本就不是渲染跨度：裸 `\math` 在代码跨度 16 个＝D26 9＋D30 2＋D77 1＋D106 4，`\inner` 在围栏 1 个，`\root` 在代码跨度 1 个，`\two` 在代码跨度 1 个，见 §3）。
- 全库字面串核对：`probe_conv.py` 扫 `研究笔记/*.md` 共 742 篇，**字面 `rangleG` 命中 0 次**。
- 素材侧定义/使用清点（`probe_src.py` → `probe_source.txt`）：

| 篇 | build 下 .tex 数 | `\inner` 定义 | `\root` 定义/使用 | `\two` 定义/使用 | 裸 `\math` 使用 | `\P` 重定义 |
|---|---|---|---|---|---|---|
| D26 | 1 | **有**，main.tex:19 | 0 / 0 | 0 / 0 | 0 | 0 |
| D30 | 11 | 0 | 0 / 0 | 0 / 0 | 0 | 0 |
| D77 | 13 | 0 | 0 / 0 | **0 / 0** | 0 | 0 |
| D106 | 10 | 0 | **0 / 0** | 0 / 0 | 0 | 0 |
| D238 | 13 | 0 | 0 / 0 | 0 / 0 | **0** | **有**，main.tex:29 `\renewcommand{\P}{\mathbb P}` |

结论性一句：`\two`、`\root`、裸 `\math` 在三篇素材里 **一个字符都没有**，不存在"按素材 preamble 展开"的路径；`\inner` 则相反，preamble 里确有同名定义。

- **时效与并发（重要）**：本次调查期间，D106 与 D238 两篇被并发编辑（实测 mtime `2026-10-15 17:34:10` / `17:34:09`，其余三篇 D26 10-14 21:05、D30 10-15 12:22、D77 10-14 08:59 未动）。并发落的内容正是本报告 §2.2/§2.6 提出的 5 处替换，`probe_landed.py` 实测：4 条 D106 OLD 与 1 条 D238 OLD **现命中 0、对应 NEW 各命中 1**，D106 字符数 145,349 → 145,385（+36）、D238 44,319 → 44,322（+3），与预测字节增量逐字吻合。
  因此 §2 里 D106 四行与 D238 L298 的"逐字原文"引的是**普查时点（本会话开工时）的形**，即普查清单所对应的那一版；当前盘面已是修后形（`probe_state_now.txt` 有两侧现状对照）。

---

## 1 结论速览（按出现点计，共 13）

| 判型 | 处数 | 处 |
|---|---|---|
| (a) 素材 preamble 有同名宏，按定义展开是唯一正解 → **登记不发明** | 3 | D26 L376 ×3（`\inner`） |
| (b) 融合／误写，**可机械替换**（有作者自述或本篇先例） | 5 | D238 L298 ×1；D106 L1750/1873/1913/1914 ×4 |
| (b) 融合／自造命令，但目标记号无先例 → **真缺陷，登记不发明，需作者定夺** | 3 | D77 L496 ×1；L552 ×2（`\two`） |
| (c) 假阳（动了破坏凭证） | 2 | D30 L827；D238 L744 |

- **真缺陷 8 处** = 可机械替换 5 + D77 的 3（D77 属真缺陷但无可落盘的合法目标写法）。
- **可机械替换 5 处**，字节增量合计 **+39**（D238 +3，D106 每处 +9）；美元定界符奇偶全部不变。**这 5 处已在本会话期间由并发编辑逐字落盘**（见 §0 时效条与 §7 复量），本报告不再重复执行。
- **登记不发明 6 处** = D26 3（(a)）+ D77 3（(b) 无先例）。
- **假阳 2 处**。
- 若采纳 D77 建议写法 `^{(2)}`：额外 3 处、每处 **−1 字节**（共 −3），定界符奇偶同样不变。

---

## 2 逐处定性与逐字原文

### 2.1 D26 `E:\math\研究笔记\D26-加倍Hilbert子集无双Lipschitz有限维嵌入.md` L376，3 处，判 **(a)**

普查 3 行的 tok 都是 `\rangleG`，列位 c56 / c98 / c148；三个跨度分别是：

整行逐字原文（L376，实测 423 字符 / 637 字节，行内 `$` 24 个＝偶，反引号 0 个）：

    直接展开验证：$\langle\|G-a\|^2\rangle=\langle\|G\|^2\rangle-2\inner a{\langle G\rangle}+\|a\|^2$，再把 $-2\inner a{\langle G\rangle}+\|a\|^2$ 拆成 $-\|a\|^2-2\inner a{\langle G\rangle-a}$，与 tex 形式一致。素材特别注明"论文写 $\langle\|G\|^2\rangle-\norm a^2-\ldots$，即 $-\norm a^2$ 项来自展开常数项"，我按上面两步核对通过。它的意义是把"$L^2$ 偏差"分解成三样可分别控制的量：二阶矩 $\langle\|G\|^2\rangle$（由 $K$ 给上界）、参考向量模方 $\|a\|^2$（由 nearmax 给靠近 $A$ 或 $B$）、均值偏移 $\|\langle G\rangle-a\|$（由线积分给）。

**判定依据**：

1. 该行里根本没有 `\rangleG`。全 742 篇笔记字面 `rangleG` 命中 **0**；本篇也 0。这是普查管线按 preamble 展开 `\inner` 时造出的级联伪符 —— 佐证在普查自己的 `body` 字段：第 3 行报的 body 是 `-\|a\|^2-2\inner a{\langle G\rangle}-a}`，而文件里真实跨度是 `-\|a\|^2-2\inner a{\langle G\rangle-a}`（`}` 被插到 `\rangle` 之后、`-a` 被挤到外面）。管线确实先改写过输入，`tok`/`body` 对原文不逐字忠实。
2. 三个跨度里真正未被 KaTeX 认识的命令是 `\inner`，而它在素材 preamble **确有同名定义**（唯一正解＝按定义展开）：

       E:\math\preprints\A-doubling-Hilbert-subset-with-no-finite-dimensional-bi-Lipschitz-embedding-September-25-2026\build\main.tex:19
       \newcommand{\inner}[2]{\langle #1,#2\rangle}

3. 素材对同一恒等式的原文（`build\main.tex:199-203`，eq:variance）：

       199| \begin{equation}\label{eq:variance}
       200|  \left\langle\norm{G-a}^2\right\rangle
       201|  =\left\langle\norm{G}^2\right\rangle-\norm a^2
       202|        -2\inner{a}{\langle G\rangle-a}.
       203| \end{equation}

   按定义 `\inner{a}{\langle G\rangle-a}` = `\langle a,\langle G\rangle-a\rangle`，与笔记 L376 的 `\inner a{\langle G\rangle-a}`（TeX 里 `\inner a{X}` ≡ `\inner{a}{X}`）展开结果一致 —— 笔记没有写坏，只是把作者宏带进了渲染跨度。
4. 笔记自己还把这段 tex 原文逐字贴在 ```tex 围栏里（**围栏不是渲染跨度，不构成缺陷**）：

       L368 | ```tex
       L369 | \begin{equation}\label{eq:variance}
       L370 |  \left\langle\norm{G-a}^2\right\rangle
       L371 |  =\left\langle\norm{G}^2\right\rangle-\norm a^2
       L372 |        -2\inner{a}{\langle G\rangle-a}.
       L373 | \end{equation}
       L374 | ```

5. 同族旁证：本篇 `\norm` 全篇 45 处，实测跨度分布＝**数学跨度内 2 处（都在 L376：`$\langle\|G\|^2\rangle-\norm a^2-\ldots$` 与 `$-\norm a^2$`）＋ ```tex 围栏内 43 处（逐字素材摘录）**，行内反引号内 0 处（`probe_family2.py`/`probe_plaincount.py` 实测）。`\norm` 与 `\inner` 一样只在 preamble 有定义（`build\main.tex:18` `\newcommand{\norm}[1]{\left\lVert#1\right\rVert}`）、KaTeX 里都不是内建命令，**但数学跨度内的 2 处 `\norm` 普查 0 报** —— 一报一不报，说明管线对"宏体里含定界宏（`\langle`/`\rangle`）的两参数宏"才出错，进一步佐证 `\inner` 的 `\rangleG` 是展开级联伪符、不是笔记侧笔误。

**动作**：0 替换。登记：`D26:376 ×3，作者宏 \inner，preamble 依据 build/main.tex:19，按定义展开；普查 tok \rangleG 为展开级联伪符`。

---

### 2.2 D238 `E:\math\研究笔记\D238-平方差自由集的固定幂节省.md` L298，1 处，判 **(b) 可机械替换**

整行逐字原文（L298，实测 109 字符 / 133 字节，行内 `$` 4 个＝偶，反引号 0）：

    $\lvert\mathcal Z_{\math P}((g_v))\rvert\le\prod_v Z_{\mathcal P}(g_v)^{1/d}$。证明的第一层：乘积律 $\mu_{\mathcal P}$ 在

判定：该行在 §7 首段（`## §7 带符号棋盘…` 在 L293，本行 L298 即首段第 4 行）。素材原文 `build\sections\functional.tex:47-53`（signed Hölder，正是笔记 L296-297 引用的 functional.tex:43-55）：

     47| \begin{equation}
     48|  Z_{\mathcal P}(g)\ge0,
     49|  \qquad
     50|  \left|\mathcal Z_{\mathcal P}((g_v)_{v\in V})\right|
     51|  \le\prod_{v\in V}Z_{\mathcal P}(g_v)^{1/d}.
     52|  \label{eq:signed-holder}

素材全 13 片里 `\mathcal Z_{\mathcal P}` 出现在 functional.tex:32/35/50/76/127/165 与 transfer.tex:151，**裸 `\math` 一个都没有**；`\mathbb P` 只经 `\renewcommand{\P}{\mathbb P}`（main.tex:29）出现，与下标 `\mathcal P` 无关。所以 `\math P` 是把 `\mathcal P` 切坏成 `\math` + `P` 的融合体，唯一正解就是 `\mathcal P`。
**更硬的依据**：本篇 §16 勘误（L741-744）作者已自述该处笔误并给出正确写法"应为 $\mathcal Z_{\mathcal P}$"；同篇 L315 已是合法形 `$M=\max_a\lvert\mathcal Z_{\mathcal P}((f_{a(v)}))\rvert$`。

替换（OLD 全文件唯一，命中 1 次；NEW 现不存在，命中 0 次）：

    OLD  \lvert\mathcal Z_{\math P}((g_v))\rvert          39 字节
    NEW  \lvert\mathcal Z_{\mathcal P}((g_v))\rvert       42 字节
    字节增量 = +3

定界符：该行 `$` 计数 4 → 4，偶性不变（替换不引入/删除 `$`）。

**现状**：该行盘面已是 `\lvert\mathcal Z_{\mathcal P}((g_v))\rvert…`，OLD 命中 0、NEW 命中 1（`probe_landed.txt`）；本篇现存 `\math P` 只剩 L744 那一处勘误引述（见 §2.3）。

---

### 2.3 D238 同篇 L744，1 处，判 **(c) 假阳（勘误条目里对被误写形式的逐字引用）**

整行逐字原文（L744，实测 60 字符 / 79 字节，行内 `$` 4 个＝偶，反引号 0）：

    $\mathcal Z_{\math P}$，应为 $\mathcal Z_{\mathcal P}$；其二，§7 末段

上下文（L741-748，§16 勘误与操作记录，`## §16` 在 L734）逐字：

    L741 | 第二条：复查发现两处 LaTeX 记号笔误，为免动已落盘正文，在此声明正确
    L742 | 写法供阅读者替换：其一，§3"把 $A\subseteq[N]$ 接上去"段内
    L743 | $Y(N,A)=Z_{\mathcal P_N}(G)$ 无误，但 §7 首段引用的算子式中误写
    L744 | $\mathcal Z_{\math P}$，应为 $\mathcal Z_{\mathcal P}$；其二，§7 末段
    L745 | $\lVert T\rvert_{H_U}\rVert$ 应为
    L746 | $\lVert T\rvert_{H_U}\rVert_{\mathrm{op}}$ 且开闭记号应配对
    L747 | $\lVert\cdot\rVert$。两处均不影响论证。探针行保留在 §0 登记块内，
    L748 | 其后正文未再引用它。编号顺序 §0 至 §16 动笔前已定，中途未调序。

判定：`$\mathcal Z_{\math P}$` 在这里不是被使用的记号，而是**被"误写 ……"引述的靶子**，包在 §16 的落盘协议声明叙述里（`在此声明正确写法供阅读者替换`）。把它"修好"会让句子自我抵消成"误写 Y，应为 Y"，凭证作废。另外它引述的靶子就是 §2.2 的 L298（该篇 `\math P` 全文只有 L298 与 L744 两处，L744 自己即引用位），所以**修 L298 后不必、也不应再修 L744**。

**动作**：0 替换。

---

### 2.4 D30 `E:\math\研究笔记\D30-负pinched三维Kähler流形无有界全纯坐标.md` L827，1 处，判 **(c) 假阳**

整行逐字原文（L827，实测 492 字符 / 817 字节，行内 `$` 2 个＝偶、反引号 30 个＝偶）：

    一处取证数据我必须如实记下并解释：素材头部写"$E:\math\lean\OAI\Geometry\Kahler$ 108 个 `.lean`、约 18,688 行"，而素材 §4.1 表格又写"36 个 `.lean`、约 6000 行，全部 sorry-free"。我实测该目录 `ls *.lean | wc -l` = 119 个文件、`cat *.lean | wc -l` = 18,688 行。`[推测]` 差异来源：36/6000 那一栏统计的是"直接对应论文构件的核心模块子集"（`Main`、`Definitions`、`Obstruction`、各 `Base*` 核心、`Hartogs*` 核心、`Pinching*` 核心），而 119/18688 是全目录（含 `BaseAdaptedHopf`、`BaseAnisotropic`、`BaseCauchyJets`、`BaseChart*` 等大量支持引理文件）。我采用全目录口径 119/18688 为准，18,688 行数与素材头部一致可作交叉验证；36/6000 是子集口径，两者不矛盾但需注明。

判定（被哪种跨度包住）：串 `E:\math\lean\OAI\Geometry\Kahler` **同时被两层跨度包住** ——

- 外层：中文双引号 `"…"` 内的**素材逐字摘录**（"素材头部写 …… "）。已在素材侧核到原件：`E:\math\研究笔记\素材\Kähler负pinched三维fold-素材.md`（103,687 字节）原文为
  `> Lean 形式化位于 \`E:\math\lean\OAI\Geometry\Kahler\`（108 个 \`.lean\` 文件，约 18,688 行）`，
  即 `108 个` 全素材仅 1 处、`18,688` 仅 1 处，笔记这段确是对素材头部的转述，数字与路径都是凭证本体。
- 内层：`$…$`。也就是说 `\math` 根本不是数学命令，而是 **Windows 路径 `E:\math\...` 的目录名**，被错的定界符当成了数学跨度。

所以 tok `\math` 是假阳：**不是命令级缺陷**，按 (b) 去换 `\math` 会把路径改成别的东西、破坏可核对性。真实缺陷只有一处、且属定界符层面（素材原文用的是行内反引号，笔记转述时写成了 `$`），见 §5 的"可选定界符修复"，不计入本次 token 级可机械替换。

本篇同族的其余 2 处 `\math`（L4 c11、L5 c9，`E:\math\preprints\...` 与 `E:\math\lean\...`）都在行内反引号代码跨度内，`kind` 非渲染跨度，普查也未报 —— 属正确行为。

**动作**：0 替换。

---

### 2.5 D77 `E:\math\研究笔记\D77-特征二下的五边形退化与Deligne--Drinfeld猜想证明反推.md` L496 / L552，共 3 处，判 **(b) 型真缺陷 → 但无可 precedented 目标写法，登记不发明**

普查行：L496 c373（1 处）、L552 c365 与 c407（2 处）。同篇 `\two` 全文共 3 处，**全部在数学跨度内、全部写作 `^{\two}`**，代码跨度里 0 处（普查报 3 行＝全数，无漏）。

L496 逐字原文（实测整行 867 字符 / 1,222 字节，行内 `$` 86 个＝偶；缺陷跨度及其左右各约 90 字符逐字如下，整行全文见 `_work\probe_lines.txt`）：

    …权 $n$ 上求和吃 $\sum_r$ 有限性 (由 $3r\le n$ 卡住)。我第一版没意识到 $d_n$ 与二元自由 Lie $\dim_{\mathbb Q}L_n^{\two}=\frac1n\sum_{d\mid n}\mu(d)2^{n/d}$ 之间的关系, 把后者当"上界"去比, 于是 $d_3=1$ 对 $2$、$d_5=1$ 对 $6$、$d_7=1$ 对 $18$、$d_9=1$ 对 $56$、$d_{11}=2$ 对 $186$、$d_{13}=3$ 对 $630$ 全都差近一个数量级; 两式只差生成元级数 $V(u)$, 一处 $\frac{u^3}{1-u^2}$ 一处 $\frac{2u}{1-2u}$, 后者每权 $2$ 枚、前者每奇权 $1$ 枚, 反演式同族。…

L552 逐字原文（实测整行 706 字符 / 1,020 字节，行内 `$` 44 个＝偶；缺陷所在段逐字）：

    …权 $1,2$ 的入口: $\dim_\mathbb Q W_1=\dim_\mathbb Q W_2=0$ (lem:low-weights, 02:13), 二元自由 Lie 侧 $\dim_\mathbb Q L_1^{\two}=2$ (即 $x,y$) 与 $\dim_\mathbb Q L_2^{\two}=1$ (即 $[x,y]$, 系数 $3$ 由三元式对 $[x,y]$ 给, 02:20-21), $\mathfrak f_{\mathrm{odd}}$ 侧 $d_1=d_2=0$ (奇权 $\ge3$ 起); 两侧方程空间与生成元集在此同归零, 归纳从 $n=3$ 起步 (08:182-183)。…

判定链：

1. KaTeX 无 `\two`；素材侧 `build\**\*.tex` 共 13 片，`\two` **定义 0、使用 0**（"two" 只作为英文单词出现 117 次）；素材也没有 `\math`/`\root`/`\inner` 裸命令。→ 不是 (a)，也没有"按 preamble 展开"的路。
2. 该处语义是"二元自由 Lie 代数的第 n 次分量的维数"（Witt 公式 `(1/n)Σ_{d|n} μ(d)·2^{n/d}`），上标要表达**生成元个数 2**；素材对同一对象的写法是散文/显式生成元形：`02-algebra.tex:13` "The degree-two free Lie algebra is spanned by \([x,y]\)"、"the free Lie algebra on \(a,b\)"、`\(\Lie_{\F}\langle A,C,B\rangle\)`、"ordinary free Lie algebra on \(A,B\)"，**素材里不存在任何 `^{\two}` 或 `^{(2)}` 形**。
3. 本篇先例扫描（`probe_notation.py` / `probe_conventions.txt`）：`^{(2)}` 0 次、`\mathtt` 0 次、`\text{` 1 次；`L_n^{\two}` 是该篇唯一表达"生成元数上标"的地方（3 处全是它）。本篇在数学里放词/名的主流是 `\operatorname{`（57 次）与 `\mathrm{`（39 次）。
   → 结论：这是作者自造的缩写（(b) 类真缺陷），但**目标记号在本篇与素材里都没有先例**，按规程"只登记不发明"，不自动落盘。

建议写法（需作者定夺；若采纳即 3 处机械替换）：

    OLD  L_n^{\two}     10 字节 →  NEW  L_n^{(2)}     9 字节   Δ = −1   （L496）
    OLD  L_1^{\two}=2   12 字节 →  NEW  L_1^{(2)}=2  11 字节   Δ = −1   （L552 c365）
    OLD  L_2^{\two}=1   12 字节 →  NEW  L_2^{(2)}=1  11 字节   Δ = −1   （L552 c407）

三条 OLD 均全文件唯一命中 1 次；NEW 现均不存在（命中 0）。定界符：L496 行 `$` 计数 86→86、L552 行 44→44，偶性不变。
备选（若嫌 `^{(2)}` 无先例）：`$\dim_{\mathbb Q}\operatorname{Lie}_{\mathbb Q}\langle x,y\rangle_n=\dots$`，走本篇 `\operatorname{Lie}` 的 5 次先例，但那是改写不是替换，字节增量非平凡，不建议机械执行。

---

### 2.6 D106 `E:\math\研究笔记\D106-五次Lienard系统的两个极限环：model-fitting-arcs三段论证的反推笔记.md` L1750 / L1873 / L1913 / L1914，共 4 处，判 **(b) 可机械替换**

素材侧：`build\**\*.tex` 共 10 片，`\root` **定义 0、使用 0**（"root" 只作英文单词出现在 sharpness/arcs/application/introduction 共 11 次）；素材一律用 `\sqrt`（如 `arcs.tex:491 \phi_\pm(u)=F(\pm\sqrt{2u})`、`application.tex:194 \frac{-3e-3cu+5au^2}{4\sqrt u}`）。→ 不是 (a)。

本篇先例（决定性）：笔记自己**已经在同一批 Lean 侧陈述里用合法形 `\mathtt{root}` 写过 4 次**（`probe_conv.py` 实测 `\mathtt` 全篇 6 次、`\mathtt{root}` 4 次）：

    L2879 | …$e=\sqrt2f_1,c=2^{3/2}f_3,a=2^{5/2}f_5$、$u=h=(\mathtt{root}\ h)^2/2$ 手算复核，
    L2887 | …$\delta=\inf_{(0,T]}p''$ 类下界，Lean 用一个具体的 $(\mathtt{root}\ T)^{-3}$ 形式），
    L2910 | …（$d_0=2f_2\to 2*a\,2$，$2b_0u\to 4a\,4(\mathtt{root}\ h)^2$，
    L2911 | …$e/(2\sqrt u)\to a\,1/\mathtt{root}\ h$ 等）。…

同时 `\root` 也恰好 4 处（下表的 4 个跨度），且 4 处全是 Lean 侧引用（`CoefficientCases.lean:74-81 / 83-97` 等）；也就是说本篇的分工是：**tex 侧数学用 `\sqrt`（全篇 45 次），Lean 标识符 `root h` 进数学跨度用 `\mathtt{root}\ h`**。4 处 `\root` 是把 `\mathtt{root}` 写坏成控制字 `\root` 的融合体，修法即回到本篇既有主流写法。

四处逐字原文（实测行长：L1750 65 字符/113 字节、L1873 90 字符/110 字节、L1913 68 字符/86 字节、L1914 82 字符/100 字节；`$` 分别 8/6/4/2 个，全偶）：

    L1750 | （这里的 $8a_4$ 就是 $2b_0$，公共部分；奇次部分的分母 $(\root h)^3$ 与 $u^{3/2}$ 对应），
    L1873 | 从 $a_3<0,a_1\ge0,a_5\ge0$ 得 $0<\text{third }a\,h$，分母 $\root h$ 的幂用 `div_pos`+`nlinarith`），
    L1913 | $8a_4+(-a_1)/(\root T)^3\le\text{curvature }a\,h$，即 $\delta$ 的具体形式取为
    L1914 | $(-a_1)/(\root T)^3>0$，用 `root h\le\root T` 与 `pow_le_pow_left₀`、`div_le_div` 单调化，

L1750 的上文（逐字，说明该跨度承接的是 Lean 定义原文，坐实"Lean 标识符"读法）：

    L1748 | `slope a h=a 1/root h+2*a 2+3*a 3*root h+4*a 4*(root h)^2+5*a 5*(root h)^3`、
    L1749 | `curvature a h=8*a 4+(-a 1+3*a 3*(root h)^2+15*a 5*(root h)^4)/(root h)^3`

四处替换（OLD 各自全文件唯一命中 1 次；NEW 现均命中 0 次）：

| 处 | OLD（逐字） | NEW（逐字） | OLD/NEW 字节 | Δ |
|---|---|---|---|---|
| L1750 c38 | `$(\root h)^3$` | `$(\mathtt{root}\ h)^3$` | 13 → 22 | **+9** |
| L1873 c55 | `$\root h$` | `$\mathtt{root}\ h$` | 9 → 18 | **+9** |
| L1913 c15 | `(-a_1)/(\root T)^3\le` | `(-a_1)/(\mathtt{root}\ T)^3\le` | 21 → 30 | **+9** |
| L1914 c10 | `$(-a_1)/(\root T)^3>0$` | `$(-a_1)/(\mathtt{root}\ T)^3>0$` | 22 → 31 | **+9** |

合计 **+36 字节**（4 处）。定界符奇偶：L1750 行 `$` 8→8、L1873 行 6→6、L1913 行 4→4、L1914 行 2→2，全为偶且不变。
注意 L1913 与 L1914 的 `(\root T)^3` 同串两次，所以 OLD 必须带上尾部区分物（L1913 用 `\le`、L1914 用整跨度 `$…$`），已在表中按唯一命中实测（`hits=1`）。
另：L1914 同一行还有一处 `\root` 在行内反引号里（`` `root h\le\root T` ``，c36），那是 Lean 代码跨度，**不得改动**，普查也未报。

**现状**：四处 OLD 现命中 0、NEW 各命中 1，盘面全文 `\mathtt{root}` 计 8 处（原 4 处先例 + 新落 4 处）、`\root` 只剩 1 处（即上条那个代码跨度，按规程保留）；字符数 145,349 → 145,385，与预测 +36 逐字吻合（`probe_landed.txt` / `probe_state_now.txt`）。

---

## 3 同族全数（含非渲染跨度的出现点）

`probe_family.py` 对五篇全文扫描，围栏（``` ``` ```）、行内反引号、`$…$` 三类跨度分开计：

| 篇 | 族 | 数学跨度内（＝缺陷候选，普查已报） | 行内反引号内（非缺陷） | ``` 围栏内（非缺陷） | 全篇合计 |
|---|---|---|---|---|---|
| D26 | `\inner` | 3（L376 c56/c98/c148） | 0 | 1（L372） | 4 |
| D26 | `\norm`（同族作者宏，旁证） | 2（L376，普查 **0 报**） | 0 | 43（```tex 围栏逐字摘录） | 45 |
| D26 | 裸 `\math` | **0** | 9（L4、L5×3、L6、L871×2、L1269×2，全是 `E:\math\` 路径） | 0 | 9 |
| D30 | 裸 `\math` | 1（L827 c27） | 2（L4、L5） | 0 | 3 |
| D77 | `\two` | 3（L496 c373；L552 c365、c407） | 0 | 0 | 3 |
| D77 | 裸 `\math` | 0 | 1（L3） | 0 | 1 |
| D106 | `\root` | 4（L1750/1873/1913/1914） | 1（L1914 c36） | 0 | 5 |
| D106 | 裸 `\math` | 0 | 4（L5、L7、L8、L9，路径） | 0 | 4 |
| D106 | `\two` | 0 | 1（L5，目录名 `two-limit-cycles`） | 0 | 1 |
| D238 | `\math P` | 2（L298 c20；L744 c14） | 0 | 0 | 2 |
| D238 | 其余裸 `\math` | 0 | 0 | 0 | 0 |
| 全 742 篇 | 字面 `rangleG` | 0 | 0 | 0 | **0** |

补充：D106 的 `root` 裸词（无左斜杠）全篇 32 次，绝大多数是 Lean 名/路径（如 L3054 `` `(-a 1)/(root T)^3` `` 在反引号内），不构成渲染跨度。

## 4 D238 的 `\math P` vs `\mathcal P` vs `\mathbb P`（任务点 4，实测计数）

| 形 | 本篇出现次数 | 说明 |
|---|---|---|
| `\math P`（`\math` + 空格 + 单字母） | **2** | L298、L744；两处都是 `\mathcal Z` 的下标位 |
| `\mathcal P` | **42** | 本篇主流（如 L297 `Z_{\mathcal P}(g)\ge0`、L298 同跨度右端 `Z_{\mathcal P}(g_v)^{1/d}`、L298 句末 `\mu_{\mathcal P}`、L315 `\mathcal Z_{\mathcal P}`） |
| `\mathcal{P}`（花括号形） | 0 | 本篇不用 |
| `\mathbb P` | **0** | 本篇根本没有 `\mathbb P` |
| `\mathbb{P}` | 0 | 同上 |
| 裸 `\P` | 0 | 本篇没用素材的 `\P` 宏 |

素材侧对应：`build\main.tex:29` `\renewcommand{\P}{\mathbb P}`（概率测度记号），`build\sections\functional.tex` 用 `\mathcal P` 作素数集下标（32/35/50/76/127/165），`transfer.tex:151` 同形。**主流写法是 `\mathcal P`，不是 `\mathbb P`**：缺陷下标位是"素数集"而非"概率"，且同一跨度右端、L297、L315、L744 后半句都是 `\mathcal P`。故 NEW 取 `\mathcal P` 有双重依据（素材原文 + 作者勘误自述 + 本篇 42:0 的用量比）。

## 5 落盘动作清单

本会话未写任何笔记（只读调查）。开工期间并发编辑已把"必做"5 处逐字落盘，实测复量见 §7；下列清单按普查时点的形给出，供对账。

已落盘（可机械替换，5 处，总 Δ **+39 字节**，盘面实测 D106 +36 字符、D238 +3 字符）：

1. D238 L298：`\lvert\mathcal Z_{\math P}((g_v))\rvert` → `\lvert\mathcal Z_{\mathcal P}((g_v))\rvert`（+3）
2. D106 L1750：`$(\root h)^3$` → `$(\mathtt{root}\ h)^3$`（+9）
3. D106 L1873：`$\root h$` → `$\mathtt{root}\ h$`（+9）
4. D106 L1913：`(-a_1)/(\root T)^3\le` → `(-a_1)/(\mathtt{root}\ T)^3\le`（+9）
5. D106 L1914：`$(-a_1)/(\root T)^3>0$` → `$(-a_1)/(\mathtt{root}\ T)^3>0$`（+9）

五条 OLD 在普查时点均实测全文件唯一命中 1（`probe_fixverify.txt`）；并发落盘后 OLD 命中 0、NEW 各命中 1（`probe_landed.txt`）。替换前后行数、`$` 计数、行内反引号配对全不变。

待作者定夺（3 处，Δ −3）：D77 的 `L_n^{\two}` / `L_1^{\two}=2` / `L_2^{\two}=1` → `^{(2)}` 形（本篇与素材均无先例，默认登记）。

登记不发明（3 处）：D26 L376 ×3 的 `\inner`，依据 `build\main.tex:19`；普查 tok `\rangleG` 是展开级联伪符，须回修管线而非修笔记。

不动（2 处假阳）：D30 L827、D238 L744。

可选定界符修复（token 级之外，需人工确认，字节 Δ **0**）：D30 L827 的 `"$E:\math\lean\OAI\Geometry\Kahler$ 108 个 …"` 若把外层 `$…$` 换成行内反引号，即与素材原文（用反引号）一致，KaTeX 不再介入；两个 `$` → 两个反引号，字节增量 0，引号内路径文字逐字不变。因它触碰的是"素材逐字摘录"的外壳，本次不计入机械替换。

## 6 本次自产探针（均在 `E:\math\_work\`，未写入 研究笔记/）

`probe_tail.py` → `probe_census_tail.json`、`probe_tok_counts.txt`；
`probe_lines.py` → `probe_lines.txt`（各处逐字整行）；
`probe_family.py` → `probe_family_report.txt`、`probe_family_counts.json`；
`probe_src.py` → `probe_source.txt`（素材侧定义/使用计数与逐字行区间）；
`probe_notation.py` → `probe_notation.txt`；
`probe_conv.py` → `probe_conventions.txt`、`d26_ctx.txt`、`d106_root_ctx.txt`；
`probe_ctx238.py` → `probe_ctx238.txt`（D238 章节表、§16 勘误逐字、素材路径核对）；
`probe_fixverify.py` → `probe_fixverify.txt`（OLD/NEW 唯一性、字节增量、`$` 奇偶）；
`probe_lendiff.py` → `probe_lendiff.txt`（各站点整行字符/字节/`$`/反引号实测，及 `(\root T)^3`=2、`\root`=5、`\mathtt{root}`=4、`\sqrt`=45、`L_n^{\two}`=1、`^{\two}`=3、`^{(2)}`=0）。
`probe_family2.py` → `probe_family2.txt`（跨度分类复核：数学/行内代码/围栏/数学外正文；`\norm` 的 2+43 分布即出于此）。
`probe_plaincount.py` → `probe_plaincount.txt`（纯串计数复核，不含正则歧义）。
`probe_state_now.py` → `probe_state_now.txt`（五篇 mtime、当前盘面逐字行）。
`probe_landed.py` → `probe_landed.txt`（OLD/NEW 现命中数与字符增量对账）。

注：`probe_lendiff.txt`、`probe_family_report.txt`、`probe_conv.txt`/`probe_conventions.txt`、`probe_notation.txt`、`probe_fixverify.txt` 均为**并发落盘之前**采得，其中的 `\root`/`\math P` 计数（`\root`=5、`\math P`=2）是普查时点口径；`probe_state_now.txt`/`probe_landed.txt` 是落盘后口径（`\root`=1、`\math P`=1）。两套数不一处并存，是本族站点在调查期间被修改造成的，跨口径不可比。

## 7 复量（修完再跑量具）

盘面现状与本族残差（`probe_state_now.py`、`probe_landed.py` 实测，均在并发落盘之后）：

| 处 | 普查时点形 | 现盘面 | 残差判定 |
|---|---|---|---|
| D106 L1750 | `$(\root h)^3$` | `$(\mathtt{root}\ h)^3$` | 已清 |
| D106 L1873 | `$\root h$` | `$\mathtt{root}\ h$` | 已清 |
| D106 L1913 | `(-a_1)/(\root T)^3\le` | `(-a_1)/(\mathtt{root}\ T)^3\le` | 已清 |
| D106 L1914 | `$(-a_1)/(\root T)^3>0$` | `$(-a_1)/(\mathtt{root}\ T)^3>0$` | 已清 |
| D238 L298 | `\lvert\mathcal Z_{\math P}((g_v))\rvert` | `\lvert\mathcal Z_{\mathcal P}((g_v))\rvert` | 已清 |
| D238 L744 | `$\mathcal Z_{\math P}$，应为 …` | 未变 | 固定假阳（勘误引述位），保留 |
| D30 L827 | `"$E:\math\lean\OAI\Geometry\Kahler$ 108 个 …"` | 未变 | 假阳（路径＋引号内素材摘录）；残留的是定界符层问题 |
| D77 L496/L552×2 | `^{\two}` ×3 | 未变 | 真缺陷，登记不发明，待作者定夺 |
| D26 L376×3 | `\inner` ×3 | 未变 | (a) 有 preamble 凭据，登记；须回修展开管线 |

sites 集合差：普查清单 13 行 → 现已消解 5 行，残 8 行，其中 **应动而未动＝0**、需作者定夺＝3（D77）、按规程保留＝5（D26 3＋D238 L744＋D30 L827）。
下一次复量若仍报 D26 那 3 行 `\rangleG`，问题在管线（`_substitute_cs` 一类的控制字展开咬定界宏），不在笔记。
