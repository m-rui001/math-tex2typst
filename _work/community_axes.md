# community.md 轴 1–35 的原文（压缩时移出，未改动）

### 轴 1：图内文字保真度（#24 已修，684 → 12 处）
- 原先 **684 处泄露的命令名**（101 个词）出现在 `content()` 行里，是 `cetz.MATH_SYMBOLS` 缺 LaTeX → Typst 映射，代码路径故意保留未映射命令的字母。
- **已修（#24）**：三类补齐，全部先单独编译并读回字形（`_work/probe_verify_spellings.py` / `probe_verify_funcs.py`）：
  1. **符号/算子**：~75 个词补进 `MATH_SYMBOLS`（`\cap`→`inter`、`\approx`→`approx`、`\otimes`→`⊗`、`\chi`→`chi`、`\cos`/`\max`/`\sup`… → 同名裸算子）。
  2. **布局/尺寸**：`\left`/`\right`/`\big*`/`\textstyle`/`\limits` 与 `\small`…`\Huge` → 删除（`\left.`/`\right.` 的隐形定界点先单独去掉）。
  3. **声明/参数命令（新代码路径）**：`MATH_FUNCS` 把 `\mathcal`/`\mathbb`/`\mathbf`/`\mathrm`/`\mathsf`/`\mathfrak`/`\bar`/`\widehat`/`\widetilde`/`\sqrt`/`\check`… 映成 Typst 函数（`cal`/`bb`/`bold`/`upright`/`sans`/`frak`/`macron`/`hat`/`tilde`/`sqrt`/`caron`）；`MATH_DECL` 给裸 token 形式 `\mathcal M` 补花括号（含 `\rm`/`\bf` 开关，带 `(?![A-Za-z])` 防 `\bfseries` 被切）；`MATH_FRAC` 把 `\frac14`、`\frac{a}{b}` 归一成 `frac(a, b)`；`_unscript` 把 `z_{ij}` 拆成 `z_(i j)`（TeX 是 i·j 两个斜体原子，原来印成直立 `"ij"`）。
- 残留 12 处：`out`/`span`/`it`/`and`/`ref`/`the` 多为 `upright("…")` 的忠实算子名（量具假阳），`ij`/`rm`/`cr` 各 1–2 处边角。
- 工具：`_work/probe_tex_defined_words.py`（pdflatex `\ifcsname` 神谕），`_work/probe_missing_spellings.py`（pandoc 对照），`_work/probe_leak_after.py`（直接重建画布量残留，不依赖批跑）。

### 轴 2：布局保真度（#25 已修，残留 6 篇）
- **节点文字曾以 Typst 默认 11 pt 渲染，而 TeX 使用 9 pt（`\small`）**，高了 22.6 %。
- 框宽和坐标来自 TeX 的 9 pt 度量 → 文字溢出盒子、边框穿过相邻文本、换行数不同。
- 证据：
  - `_work/probe_node_font.py`：Self-dual 依赖图 tikz 控制 PDF span 高度 8.97 pt vs typst 12.54 pt。
  - `_work/probe_node_font_dropped.py`：932 张图中 793 张（85 %）命名了节点字号。
  - `_work/measure_tex_sizes.py`：pdflatex `\f@size` 测得 article 10pt 下 `\small`=9, `\footnotesize`=8, `\scriptsize`=7, `\tiny`=5, `\large`=12 ……（常量 `cetz.TEX_SIZE_PT`）。
- **为什么画布级 `set text(size:)` 不可行**：在 `canvas({ ... })` 代码块里写入裸 `set text(...)` 语句会使 Typst 把整个块的值变成 content 而非 array，触发 CeTz 断言失败（`Incorrect type for body: content`）。所以尺寸必须附着在节点文字本身上。
- **可行拼写**：`#text(size: 9pt)[…]`，与现有 `#text(fill: …)` 同一路径。
- **已修（#25）**：`cetz.node_font_size(o)` 从节点选项的 `font=` 读字号（`\small`→9pt，`\fontsize{X}`→Xpt），`emit_node` 把节点文本包成 `#text(size: Xpt)[…]`。**关键补充**：`picture_styles` 只收 `/.style` 键，画布头部的裸 `font=\small`（519 张，最大族）此前根本不进节点选项——`build()` 现在把它作为 `every node` 的 fallback 注入（节点自身 `font=` 与 `every node` 风格仍优先）。覆盖 519 头部 + 231 `every node` + 39 节点级 = 97 % 带字号图；剩余 14 张只在节点正文里写裸 `\scriptsize`，路径外。

### 轴 3：完整性（已封零）
- 1046 张转换、1 张证伪拒绝、0 张丢失 TikZ。

### 轴 4：连线几何（#26 已修）
- **症状**：`\draw (a) -- (b)` 被画成**中心到中心**，而 TikZ 裁剪到两节点边框——流程图里连线穿过节点文字；`(a.west)` 之类的锚点被忽略（回落到中心）。
- **证据**：Self-dual 依赖图（`preprints/Self-dual-.../figures/dependencies.tex`）原产物 `line((0,0),(2.5,-1.8))` 从 `finite` 框中心出发穿过其文字；`\draw (disks.west)--…` 里 `.west` 丢失，用了中心 `(2.5,-1.8)` 而非西边 `(0.72,-1.8)`。
- **已修（#26）**：`cetz.py` 新增
  - `COMPASS` + `_anchor_point(box, anchor)`：把 `.west`/`.north east`/`center` 等映射到盒边（圆节点用 `ring`，矩形用半宽/半高；未知盒或未知锚回落中心）。
  - `_clip_to_border(box, at, toward)`：从节点中心沿目标方向的射线与边框的交点（矩形取先到的那条半宽，圆取环）。
  - `_named_box(token, names)`：识别裸 `(name)` 坐标（带锚点的 `(a.west)` 已是边点，不裁剪）。
  - `translate_path` 维护与 `poly` 平行的 `poly_boxes`；`flush()` 裁两端；**中段有盒点**时把折线切成逐段 `line()`（一个折线带不了同一盒的两个不同边点）。
- **验证**：`_work/probe_gate_all.py` → built 918 / refused 14 / **compile-failed 0**（与改前一致）；`_work/probe_clip.py` 重建 dependencies 图：`(finite)--(disks)` → `line((0.6944,-0.5),(1.806,-1.3))`（离开底边、进入顶边），`(disks.west)` → `(0.7236,-1.8)`；`_work/probe_clip_render.py` 出图 `_work/clip_check.png` 目视连线全部止于框边。
- 覆盖：全语料 `--` 连接命名节点 **1241** 处（主路径）；`to`/`edge` 连接命名节点仅 12 处、`..` 32 处（贝塞尔路径暂不裁剪）。
- 测试：`tools/test_t2t.py` **93 项全过**（无断言改动）。
- 工具：`_work/probe_clip.py`, `_work/probe_clip_render.py`。

### 轴 5：浮动体完整性（#22，空图 12 → 3）
- **症状**：`#figure([], caption: [Figure N: …])`——caption 在、图画不在。12 处 / 8 篇。
- **根因**：`prep._lift_captions` 只认 `figure`/`table` 两种浮动体；任何其它环境里的 `\caption` 都被"提升"成一个带 `\mbox{}` 占位体的新浮动体，**图画被留在原地**，于是变成独立的 display 公式（canvas）＋空 caption 浮动体。
- **两个来源**：
  1. **`longtable`**（9 篇、12 个 caption）：pandoc 本就能读它，只要 `_lift_captions` 别去动它。
  2. **论文自定义浮动体**（`fixedfigure`/`chordfigure`，2 篇）：定义是 `\newenvironment{X}{\begin{minipage}…\def\@captype{figure}…}{…}`——caption 是 figure 的，但 pandoc 不知道 X 是浮动体。
- **已修（#22）**：`tools/t2t/prep.py`
  - `FLOAT_REGION` 增加 `longtable`；`FLOAT_HEAD` 仍只认 `figure|table`，`lift_captions` 里用 `FLOAT_HEAD.match(region)` 守住 `_split_floats`（`longtable` 的 `{spec}` 参数经不起它的重写）。
  - 新增 `custom_float_envs(pre_text)` / `promote_custom_floats(pre_text, body)`：扫前导区 `\newenvironment{X}`，读其定义里两个花括号组找 `\@captype{figure|table}`，把 body 里 `\begin{X}`/`\end{X}` 改名成标准浮动体。定义留在前导区不碍事（无人再调用）。在 `convert.py` 的 `lift_captions` 之前调用。
- **验证**：8 篇空图论文 → **12 → 3**，全部 compile；`_work/cetz_report.py` 全语料空图 **12 → 3**（cetz_converted 1046 不变、refused 1 不变）；`tools/test_t2t.py` **93 项全过**；11 篇受影响论文重跑（2 自定义 + 9 longtable），**11/11 compile**；`_work/rebuild_batch_report.py` → **724/724**。
- 截图：Grothendieck 论文 p13，Figure 1 的树/串图已回到 caption 下（原为空图）。
- 剩余 3（见 §7）：`An-explicit-power-saving`（嵌套 minipage 文本图，pandoc 丢正文）、`An-integral-scalar-curvature-bound`、`The-sharp-factor-of-IID-threshold`（minipage 包住 picture、caption 在 minipage 外）。
- 工具：`_work/probe_float_envs.py`（全语料非浮动体 caption 环境普查）、`_work/probe_fix_empty.py`、`_work/probe_renameenv.py`、`_work/probe_longtable.py`、`_work/probe_regen_needed.py` / `_work/regen_list.py`（按名单定向重跑）。

### 轴 6：表格表头重复（#23，部分已修）
- **症状**：`longtable` 的表头行在排版里出现两次（Complex-Matrix 论文 p85 的 `i j a_{ij}` 重复；`word_overlap_report` 把该页 549 对记成 "FIGURE"）。
- **根因**：`longtable` 用 `\endfirsthead`（首页表头，带本表 caption）和 `\endhead`（续页表头，带 `(continued)` caption）两段定义表头，**每页只印一个**；pandoc 没有"页"的概念，把两段都读成表头行 → 表头两行。
- **已修（#23a）**：`tools/t2t/prep.py` 新增 `dedupe_longtable_heads(body)`（`LONGTABLE_SECOND_HEAD = r"\\endfirsthead.*?\\endhead"` → 只留 `\endfirsthead`），在 `convert.py` 的 `lift_captions` 后调用。保留首页表头，caption 也从 `(continued)` 回到本表正文。
- **验证**：9 篇受影响论文重跑（**9/9 compile**）；Complex-Matrix p85 表头恢复单行、caption 为 `Table 6: Exact coefficients … of the barrier.`；`tools/test_t2t.py` 93 全过；全语料 **724/724**。
- 工具：`_work/probe_dedupe_lt.py`、`_work/probe_lt_affected.py`。
- 未修（§7）：caption 与表格末行在页底**重叠**（布局，`#figure(table(…))` 高度超页）。

### 轴 7：相对定位的 calc 参考（#27 已修）
- **症状**：`\node[below=16mm of $(count)!0.5!(bounds)$]` 这类节点被画到**画布原点**，压在别的节点上（Purely-Cosmetic 结构图：宽框 "Compatible perturbations…" 压在 "Ordinary units and cap pairing" 上，整图文字互相叠）。
- **根因**：`placed_at` 的 `OF_TARGET` 只认裸名字 `[-\w]+`，calc 参考 `$(…)!…!(…)$` 不匹配 → 返回 None → `_node_at` 的 `POSITIONED` 兜底正则 `[-\w]` 也不认 `$` → 落到 `_origin(xf)` = 原点。
- **已修（#27）**：`cetz.py`
  - 新增 `OF_CALC` 正则，`placed_at` 对 calc 参考调 `point("(" + expr + ")")`（走 `_calc_point`，它本就解 `$(A)!.5!(B)$` 与 `(A.south)`）；参考点是**没有盒子的点**，间距从该点量起。
  - `POSITIONED` 兜底改为 `[-\w$]`，让 `_calc_point` 解不出的形式（如 `!2cm!` 距离式）**拒绝整图**，而不是默默画到原点。
- **验证**：`_work/probe_gate_all.py` → **built 918 / refused 14 / compile-failed 0**（与改前完全一致，无新增拒绝）；Purely-Cosmetic 结构图重建：`analytic` 从 `(0,0)` → **`(3.377,-4.175)`**（count/bounds 中点下方），截图确认四框归位、无叠字；33 篇受影响论文重跑 **33/33 compile**；`tools/test_t2t.py` **94 项全过**（新增 `test_a_node_positioned_off_a_calc_reference_lands_on_it`）。
- 工具：`_work/probe_place.py`、`_work/probe_place_affected.py`。

### 轴 8：minipage 浮动体 + `\fbox` 正文（#28，空图 3 → 0）
- **两个来源，共 3 篇空图 + 24 篇 `\fbox` 丢正文**：
  1. **minipage 包住的图**（2 篇：`The-sharp-factor-of-IID-threshold`、`An-integral-scalar-curvature-bound`）：形状是 `\noindent\begin{minipage}{\linewidth}\def\@captype{figure}…\begin{tikzpicture}…\caption{…}\end{minipage}`。caption 是 figure 的，但 pandoc 只看见 minipage，`lift_captions` 把 caption 提走、图画留在原地当裸块——IID-threshold 论文的 caption 因此**漂到下一页**，与图分离（p41 图 / p42 caption）。
  2. **`\fbox{…}` 正文**（24 篇）：pandoc 的 LaTeX reader 不认 `\fbox`，把命令**连同花括号参数一起丢弃**——`pandoc -f latex -t native` 实测 `Text before \fbox{hello world} after.` → `Text before after.`；`A-Low-Space-Algorithm` 的表格里 `\fbox{\begin{tabular}…}` 整块 tabular 丢失。`An-explicit-power-saving` 的文本流程图 `\fbox{\begin{minipage}…}` 也是这样变成空图。
- **已修（#28）**：`tools/t2t/prep.py`
  - `promote_minipage_floats(body)`：用 `_top_minipage_spans`（深度计数，只取**最外层** minipage）找含 `\@captype{figure|table}` 的 minipage，把它的 `\begin{minipage}[t]{width}` 连同参数改名成 `\begin{figure}`、匹配的 `\end{minipage}` 改名成 `\end{figure}`。内层 minipage 是浮动体自身版式，保留。
  - `unwrap_fbox(body)`：`\\fbox\b(?=\s*\{)` → 删除（保留其花括号组）。`\b` 不落在 `fbox` 与后继字母之间，所以 `\fboxsep`/`\fboxrule` 不受影响。
  - `convert.py` 在 `lift_captions` 之前依次调用 `promote_minipage_floats`、`unwrap_fbox`。
- **验证**：3 篇空图论文 → **空图 0、全部 compile**（`_work/probe_fix_empty3.py`）；截图：IID-threshold p42 图与 caption 同页、`An-explicit` p4 文本流程图正文回收；24 篇 `\fbox` 论文重跑 **24/24 compile、空图 0**；`A-Low-Space-Algorithm` 表格里 `Left parent`/`own background` 等 10 处正文回归；`tools/test_t2t.py` **97 项全过**（新增 `test_a_minipage_that_names_its_float_type_becomes_that_float`、`test_an_fbox_keeps_what_it_encloses`）。
- 工具：`_work/probe_fix_empty3.py`（按名单转换 + 空图/compile 检查）、`_work/fbox_papers.txt`（24 篇名单）。

### 轴 9：长表格分页与 caption 落点（#29 已修，页底溢出 7 → 0）
- **症状**：`#figure(table(…), caption: …)` 高于一页时，**整张表与 caption 挤在同一页并冲出页底**（Complex-Matrix p85 溢出 18.9pt、hypercube p172 80.3pt、Signed-tensor p22 76.2pt、Abundance p4 43.3pt、Finite-angular p6 40.3pt、sharp-Fourier p27 17.4pt、Catalans p44 17.1pt）。
- **根因（量出来的）**：Typst 0.15 的 `figure` 是**不可断页的 block**。最小复现（`_work/probe_lt_repro.py` / `probe_lt_breakable.py`，300×400pt 页 + 60 行表）：裸 `table(...)` 正常断成 3 页；包进 `#figure` 后 60 行全落一页、最低 y=397.1（内容上限 380）；`figure(breakable: true)` **不是合法参数**（编译报错），`figure(block(breakable: true, table(…)))` 也无效（外层 block 仍不可断）。
- **已修（#29）**：`convert.PRELUDE` 加一行 `#show figure.where(kind: table): set block(breakable: true)`（`_work/probe_lt_showrule.py` 量得：`show figure: set block(...)` 与 `show figure.where(kind: table): ...` 都能断页且 caption 落在末行后；裸 `#set block(breakable: true)` 无效，因为 figure 自己设 block）。选 `where(kind: table)` 是为了只动表格浮动体、不碰图片 figure。断页后 `table.header` 自动在续页重复表头（与 LaTeX `\endhead` 同义）。
- **验证**：5 篇重跑 **5/5 compile**；Complex-Matrix 屏障表 52 行全在（`_work/probe_lt_rows.py`：p84 27 行 + p85 25 行，两页都有表头，caption 在 p85 末行后），截图 p84/p85 目视无叠字；全语料复跑 **724/724**；`_work/probe_page_overflow.py`（页底溢出检测器，排除页码块）>8pt 的 **7 → 0**，剩余旗标 ≤7.1pt 为末行降部噪声；`tools/test_t2t.py` **97 项全过**（新增 `test_a_table_taller_than_a_page_splits_and_puts_its_caption_after_the_last_row`，真渲染断言断页 + caption 在末页）。
- **残留 2 篇不是表格**：`Abundance` p4、`Finite-angular` p6 是**超高画布**——前者在 #30 重跑 tikzcd 后复测旗标已消失，后者真因是 minipage 份额（#32，见轴 11），修完两幅子图连 caption 完整落在第 6 页。
- 工具：`_work/probe_lt_repro.py`, `_work/probe_lt_breakable.py`, `_work/probe_lt_showrule.py`, `_work/probe_page_overflow.py`, `_work/probe_lt_after.py`, `_work/probe_lt_rows.py`, `_work/shot_pages.py`（通用按页截图）。

### 轴 10：tikzcd 交换图（#30 已修两处，剩两处）
- **普查**（`_work/probe_tikzcd_census.py`）：**49 篇 / 113 个 `tikzcd` 环境 / 525 个 `\arrow[...]`**；`gathered` 全语料 327 篇 932 处，但绝大多数在普通 display 公式里（pandoc 能读），只有 tikzcd 单元格里的那 4 处（1 篇）漏进画布。
- **症状**（`Abundance-in-numerical-dimension-one` p4 截图 `_work/shot/Abundance-...-p4.png`）：
  1. 单元格里 `\begin{gathered}…\\…\end{gathered}` 的**环境名漏成字面**（"…> 0 gathered"、"gathered Pic (|D|;R)"，8 处），多行被压成一行；
  2. **箭与单元文字脱节**：单元是多行文字时渲染位置与格点不符；
  3. ~~箭标签里的方向记号漏成 Typst 函数名：7 篇各 1 处~~ —— **量具假阳**：`$|w_n| arrow.r infinity$`、`$arrow.r.long$` 正是 Typst 里 → 的**正确拼写**（画布内的 `\to` 就该这么拼），`_work/probe_tikzcd_defects.py` 把 Typst 输出当 LaTeX 输入比对才报出来；真正的漏字只有 1 篇 8 处（＝症状 1）。
- **已修（#30 之一：多行单元）**：`cetz.py` 新增 `CD_STACK`/`CD_STACK_ENV`/`CD_NL`/`CD_LINE_CM` 与 `cd_lines`、`cd_protect_stacks`、`cd_width`。`build_cd` 的行切分先 `cd_protect_stacks`（把 `gathered` 等环境内部的 `\\` 换成哨兵，避免被当成换行撕开一行），单元再按哨兵拆成多行，逐行发 `content()`，整组**以其格点为中心**上下堆叠（与 tikzcd 排 `\xymatrix` 组一致）；箭端点的 `edge()` 半高按堆叠行数算，多行单元不再被箭穿过。环境名在进画布前被 `CD_STACK_ENV.sub(" ", …)` 清掉。
- **已修（#30 之二：整幅上下翻倒）**：截图才看得出来的缺陷——修完多行单元后 Abundance 的推证图**整幅倒过来了**。不猜，写 `_work/probe_cetz_ydir.py` 当神谕量：CeTz 画布 **y 轴向上**（y=2 比 y=0 高），而 tikzcd 的行号向下走。`build_cd` 的 `pos()` 改成 `(x, -r * rowsep)`，堆叠行里第一行取最高（`+((n-1)/2 - i) * CD_LINE_CM`）。
- **验证**：tikzcd/CD 论文 **56 篇重跑 56/56 compile**（`_work/regen_cd_list.py` → `regen_list.py`）；闸门 `_work/probe_gate_all.py` 仍 **built 918 / refused 14 / compile-failed 0**（未退化）；`Abundance` p3 截图目视：自上而下顺序正确、两行单元分开、无叠字；`tools/test_t2t.py` **98 项全过**（新增 `test_a_stacked_tikzcd_cell_keeps_its_lines_on_one_grid_row`，断言 `gathered` 不出现在产物里、两行落在 `(0, ±0.25)`、下一格在 `y=-3.2`、箭从 `-0.65` 走到 `-2.8`）。
- **未修**：斜箭的标签压在箭线上（文字被自己那条线划掉）；`gathered` 之外的多行写法。见 §7。
- **第二次量具假阳纠正**：`Abundance` 的 `\Pic` 出成 `"Pic"` **不是缺陷**。神谕链：`\DeclareMathOperator{\Pic}{Pic}` 在 `macros.parse_definitions` 的表里（`_work/probe_pic_macro.py` 读出 `preamble keys: ['\\Pic', '\\Spec']`），`macros.expand` 把它折成 `\operatorname{Pic}`，而 pandoc 对 `\operatorname{Pic}` 的 Typst 拼写正是 `"Pic"`（同一探针最后四行：`\operatorname{Pic}(|D|)` → `"Pic" \( \| D \| \)`，`\mathrm{Pic}` → `upright(P i c)`，裸 `Pic` → 斜体 `P i c`）。页面上 `_work/shot/Abundance-...-p41.png` 肉眼读作直立体 **Pic (|D|, 𝓡)**，与 TeX 同。⇒ 判「命令名印成字母」必须比**渲染页**，不能 grep `main.typ` 里的 `"Word"`；正文那几处同理（此前记的「正文里同一宏正常」两边都不成立）。
- 工具：`_work/probe_tikzcd_census.py`, `_work/probe_tikzcd_defects.py`, `_work/probe_cd_stacked.py`, `_work/probe_cetz_ydir.py`（y 方向神谕）, `_work/regen_cd_list.py`。

### 轴 11：图内数值与版式抽查（#31、#32 已修）
- **#31 `\tfrac` 印成字面**（截图：`Finite-angular` p6 节点框里是 `t = tfrac 12`）。
  - 根因：`cetz.MATH_FRAC` 只认 `\frac`，而 amsmath 的 `\tfrac`/`\dfrac`/`\cfrac` 不在 `MATH_SYMBOLS` 里，`quote_words` 就把命令名拼成直立字符串 `"tfrac"`，参数 `12` 留在外面。
  - 修：`MATH_FRAC` 的名字读作 `\\[tdc]?frac`，三种前缀与 `\frac` 同路（Typst 只有 `frac`，字号差不是内容差）。`\tfrac12` 的无花括号参数由原有的两参数式接住。
  - 验证：`_work/probe_tfrac.py` 五种写法全部出 `frac(a, b)`；产物里 `"tfrac"|"dfrac"|"cfrac"` **12 篇 → 0 篇**，12 篇重跑 **12/12 compile**；`test_node_math_carries_no_grouping_braces` 加两条断言（总数 98 → 99）。
  - 注：全语料 902 篇含 `\tfrac`，但走 pandoc 数学通道的（正文 display）本来就对，只有**图内**那 12 篇需要重跑。
- **#32 minipage 里的图按整页列宽放大**（`Finite-angular` p6 溢出 40.3pt 的真因）。
  - 源：两个 `\begin{minipage}[t]{0.48\linewidth}` 并排子图，各自 `\begin{tikzpicture}[x=0.205\linewidth,…]`。TeX 在 minipage 里**重定义 `\linewidth`**（＝0.48×列宽），而 `cetz.expand_linewidth` 把图里的 `\linewidth` 一律折成**整页**列宽的厘米数 → 线性尺寸 2.08 倍，两幅叠起来冲出页底。
  - 修：`prep.scale_linewidth_in_minipages(body)`（`convert.py` 里排在 `unwrap_boxes` 之前、图被 `TIKZ_SPAN` 摘走之前）：按 `_top_minipage_spans` 递归走 minipage，把它的宽度份额乘进图体内每个 `\linewidth` 的系数上（`0.205\linewidth` → `0.0984\linewidth`，裸 `\linewidth` → `0.4800\linewidth`）。只碰 `\linewidth`：**minipage 不重定义 `\textwidth`**，那个宏仍属整页；图外的文字一个字节都不改。
  - 验证：`_work/probe_minipage_share.py` 逐行核对（份额相乘、`node text width` 也折、`\textwidth` 与图外不动）；`_work/regen_share_list.py` 用「跑一遍前后比对」精确量出**全语料只有 1 篇文本会变**，重跑 **1/1 compile**；`Finite-angular` p6 截图：Figure 1 两幅子图＋caption 完整落在第 6 页，不再出页底。新增 `test_a_picture_in_a_subfigure_is_sized_to_the_subfigure_column`（总数 99）。
- **残留（未修）**：12 篇的并排 minipage 子图现在仍**竖排**（LaTeX 里是左右两栏）——见 §7；`_work/probe_minipage_census.py` 量的这个数。

### 轴 12：`[??]` 封零（#33 数学内的外部 bib、#34 浮动体里离 caption 最远的 `\label`）
- **#33 正文 display 里的 `\citep{外部 bib 键}` 出成 `[??]`**（`Kadisons` p4，`[??] Lemma 2.9, Equation (19)`）。
  - 根因：`mathconv.bake_refs` 只折「有编号的名字」（`\label` / `.aux`），指向 `refs.bib` 的键在这一步根本没有编号可引；带 note 的 `\citep[..]{}` 那段文字连 note 一起被吞。
  - 神谕：`_work/probe_cite_math.py` 量出 Typst 的 `$ … #cite(<key>) … $` 合法且印 `[17]`（`form:` 只吃 normal/prose/full/author/year；Typst 数学里没有 `\quad`，要 `#h(1em)`）；`_work/probe_cite_token.py` 量 pandoc 对陌生 token 的保留形状＝`upright("ZQMCITE…")`。
  - 修：`bake_refs` 把 bib 键折成 `ZQMCITE<key>` 记号塞进 `\text{[记号] note}`，`convert_formulas` 出口用 `unbake_cites` 还原成 `#cite(label("key"))`＋`upright(" note")`；`Book.math_refs` 负责把 `pre.bib_keys` 灌进记号表。**note 必须重新包进 `upright`**：裸拼进公式时首轮 0/3 compile，报 `unknown variable: Lemma`。
  - 验证：`_work/probe_mathcite_scope.py` 量出全语料正好 **3 篇**在公式里 cite；3 篇重跑 **3/3 compile**；p4 读回 `[17] Lemma 2.9, Equation (19)`；`[??]` **4 → 1**；产物里 `ZQMCITE` 0 处；新增 `test_a_formula_that_quotes_an_external_bibliography_cites_it`（真跑 pandoc 往返，99 → 100）。
- **#34 `Conditional-information` 的 `Table~\ref{sweeps:transfer-table}` 悬空**（最后一个 `[??]`，p43 `Table [??] records the resulting substitutions…`）。
  - 根因（`_work/probe_ltbl_aux.py` 双神谕）：那张 `longtable` 的 caption 带 `\label{sweeps:transfer-table}`，另有六个行内 `\phantomsection\label{…}`。pdflatex 的 aux 对**七个名字一律答 4**——浮动体只走 caption 那一次计数，行里的 `\label` 只记录自己站在哪儿；而 pandoc 把**整个区域内最后一个** `\label` 当成 Div 的 ident（这里＝`sweeps:assembly-collision-HS`），其余六个全部离开 AST。原 `prep.label_aliases` 只吃「紧跟 caption 的那条 label 链」，行里的名字不在链上，于是无处归属。
  - 修：`label_aliases` 读**整个 float region** 的 `\label`，除最后一个外全部指向最后一个（单 caption 的前提不变）。链式那条老规则被同一句包住，`_caption_group` 不再是 alias 的入口。
  - 验证：`_work/probe_alias_scope.py` 在 `_work/flat/_work_tex`（prep 之后、pandoc 之前那份源）逐篇比对旧/新规则：**全语料只有 1 篇新增 alias**（6 个名字，其中 1 个真被 `\ref`）；重跑 **1/1 compile**；p43 读回 `Table 4 records …`，p44 caption `Table 4: Sweep bounds …`；`_work/probe_ltbl_min.py` 用测试里那段最小源复现同一形状（Div ident=`row:two`、Table ident 空）；新增 `test_a_label_inside_a_float_names_that_float_however_far_its_caption_sits`（100 → 101）。
- 复量：`_work/dangling_report.py` → 724/724 compiled、`[??]`/`??` **0 files 0 marks**、`dangling_ref` **0**。闸门（#34 之后）：`_work/probe_gate_all.py` → **built 918 / refused 14 / compile-failed 0**（`_work/gate_after_34.txt`，与 #30/#32 后同数）；`tools/test_t2t.py` **101 项全过**。
- 新旗标一条：`missing_bibkey` **1**（`Exact-Birch-Swinnerton-Dyer-…` 第 204 行 `\cite{B,C,Dv}`，全源只有这一个 `Dv`、没有任何 `\bibitem{Dv}`，页上印 `[24,23,?]`）——作者自己缺的条目，TeX 也无从回答，不入残留清单。

### 轴 13：节点自身高度（#35 已修，Turn-Based p15 压字）
- **现象**：`Turn-Based-Stochastic-Mean-Payoff-Games-…` p15 里两行长标签盒子与上下的节点盒互相压字。此前 §7 把它记成「边标签压在节点盒上」，**诊断错了**：出问题的 `persist`、`last` 是作者用 `\node […] at (…) {…}` 写的**节点语句**，不是边上的 `midway` 标签（`_work/probe_grown_place.py` 重放 `build` 前半程、逐个打印命名节点的中心与半宽半高即可看清）。
- **根因**：`node_size` 只读作者**声明**的尺寸（`text width`、`minimum width/height`、`inner sep`），从不算文字自己占多高。于是六行的盒子在引擎里高 78.275pt，转换器记的是 `minimum height` 那 2.8pt；邻居按 `below=6mm of up` 落点时只让过 2.8pt 的一半，文字就直接叠上去了。
- **神谕（`_work/measure_node_row_height.py` + `measure_node_box_shapes.py`，pdflatex 量的）**：
  - 行高律 **`H = 2·inner_sep + line + (rows−1)·leading`**，`inner sep` 恰好加两倍；`\\[Xpt]` 精确再加 Xpt；结尾多一个裸 `\\` 不加任何高度。
  - 每种字号的 `line`（首行基线以上整高）与 `leading`（行距）逐档量成 `TEX_LINE_HEIGHT_PT`（10pt＝4.7055/12.0，9pt＝4.2750/11.0，`fontsize{9}{11}` 读 9pt 那行；表里没有的尺寸一律不猜，返回 `None`）。
  - **裸节点（没有 `text width` 也没有 `align`）从不折行**：1、2、3 行都还是 4.706pt——所以只有作者亲手写的 `\\` 才算行，转换器和 Typst 都不替它断。
  - 落点侧（`_work/measure_own_height_placement.py`）：`below=1cm of <点>` 的单行节点，引擎给 −1.2452cm＝1cm 加自己那半高，即「让过」是真语义。
- **修（一条路径，`tools/t2t/cetz.py`）**：`node_size(o, xf, text=None)` 在没有声明高度时用 `_text_height` 按上面的律补一个；`_node_body(rest)` 从节点语句里取出 label 花括号原文喂它。**只改「邻居按什么让位」，不改「画出来是什么」**——`emit_node` 继续发作者写下的那个框，字形尺寸交给 Typst 自己量；`\coordinate` 与 `_anchor_ring` 保持文字盲（它们本来只关心边框）。
- **验证**：`tools/test_t2t.py` **102 项全过**（改了 `test_a_node_positioned_by_two_distances…` 与 `test_a_node_positioned_off_a_calc_reference…` 的期望数，新增 `test_a_node_sized_by_its_own_text_stands_tall_enough_to_be_stepped_over`——六行 `text width=5.7cm, inner sep=8pt` 的框在 `\small` 下记 78.275pt 那一档）；闸门 `_work/probe_gate_all.py` → **built 918 / refused 14 / compile-failed 0**（与 #30/#32/#34 后同数）；`_work/probe_grown_yield.py` 按「重放 `build` 比对节点表」圈出 **104 张画布变化 / 98 篇**，`_work/regen_list.py` 重跑 **98/98 compile**，其中**新出图 0 张、丢图 0 张**。
- 截图对照 `_work/shot/main-p15.png` 与 `_work/latex_grown.png`：压字消失，`up.south → persist.north` 正好是作者声明的 6mm。
- **已知两处不足**（都记在代码注释里，不是本轮引入的）：作者写 `text width` 段落、被 TeX **自动折行**（超出自己写的 `\\`）的行数算不到，会少算；没写 `inner sep` 时转换器用 `INNER_SEP = 0.1 cm`（2.822pt），引擎默认 ≈4.60pt，所以单行裸节点让位量记成 0.366cm 而非 0.490cm——差半毫米级，肉眼不可见，但同族的第二档缺陷（框不铺满 `text width`、`Stealth` 箭尖丢失）已在 §7 挂号。

### 轴 14：箭尖（#36 已修，137 张画布的箭头没有头）
- **现象**：语料里 137 张画布写了箭尖却画不出头。`flow/.style={-{Stealth[length=2mm]},thick,draw=black!65}` 是流程图的标准写法，`Turn-Based` p15 每条连线都是光头。普查工具 `_work/probe_arrow_keys.py` 逐张画布把选项键喂给真的 `opts()`＋`arrow_mark`，把丢头的键的形状全打出来：`-{Stealth[length=2mm]}` 69、`-{Latex[length=2mm]}` 24、`-{Stealth}` 17、`|<->|` 4、`|-|` 1，其余是带 `length`/`width` 各种数值的同族，另有两端都写的 `{Latex[..]}-{Latex[..]}`。
- **三处断**（不是一处，前两处各遮住一半）：
  1. `opts()` 在**第一个** `=` 处切键值，于是 `-{Stealth[length=2mm]}` 碎成 `-{Stealth[length` ＋值 `2mm]}`；`texutil.top_level_find` 原来只把 `{}` 算深度，现按 `split_top` 的口径把 `(`、`[`、`{` 都算一层——TikZ 的选项值本来就把自己的 `=` 关在方括号里。这一改顺带治好了 `decoration={…=…}` 一类同源残键。
  2. `arrow_mark` 只认 `->`、`<-`、`<->`、`.->`、`<-.` 五个字面键，命名箭尖从来没有解析过。
  3. `picture_styles` 用 `val.strip("{} ")` 剥样式定义的花括号，而**整条样式只有一个箭尖**时作者写的是 `{-{Stealth[length=2mm]}}`：字符级 strip 会把箭尖自己的开括号连同外面那对一起吃掉，交出 `-{Stealth[length=2mm]` 碎片，闸门当场崩在 `ValueError: unbalanced group`。改成一次只剥**一对配平的**括号（`_braced`）。
- **神谕**（都是量出来的，不是名字对名字）：
  - pdflatex（`_work/measure_tikz_tips.py`）：`-Stealth` 头 **3.57×2.69pt 实心**、`-latex`/`-Latex` **3.99×2.99 实心**、`-stealth` 3.19×3.19 实心、`-Triangle` 2.97×3.53 实心；而**裸 `>` 是 2.07×4.78 的开口 V**（`fill=False`），`-to` 也开口，`-|` 是一根 4.58pt 竖线；arrows.meta 下 `o`/`x` 直接是 unknown tip kind。
  - CeTz（`_work/probe_mark_shapes.py`、`probe_mark_heads.py`）：可用的名字是助记符 `">" "<" "<>" "[]" "[" "]" "|" "o" "+" "x" "*" ")>" ">>"`；`"latex"`/`"Latex"`/`"to"` 断言 Unknown mark；默认头 5.67×4.25pt（aspect .75）且**默认不填实**。
  - `_work/probe_mark_per_side.py`：`mark: (end: (symbol: ">>", length: 2mm, width: 1mm, fill: black))` 这种**每侧一个字典**的写法全部生效，一侧给 `length` 不会牵动另一侧；数组侧 `end: (">", "|")`、数组里套字典都画得出。`fill:` 是让头变实心的唯一开关。另：`mark:` 只能是 `line` 的同级参数，塞进 `stroke:` 里会 "maximum function call depth exceeded"。
  - 对齐结论：pdflatex 量的 Stealth/Latex aspect（.754/.75）与 CeTz `">>"`/`")>"` 的 .75 同族，所以 `Stealth`→`">>"`、`Latex`→`")>"` 并带 fill；裸 `>` 两边都是开口 V，**保持不发 fill**。
- **修（`tools/t2t/cetz.py`）**：`_arrow_spec(key)` 在**最后一个**顶层 `-` 处分成两侧（`-.->` 的头在尾、`<-.` 的头在首、`|<->|` 从中间断），`_arrow_tips(side)` 先去掉边上属于线型拼写的 `.`/`-`，再逐段读助记符或 `{Name[options]}`；认不出的字母串使整键被判为「不是箭尖规格」，所以 `x-scale=-1`、`text-b` 不会被误当成尖。`_mark_item` 只在需要携带东西时发字典形式，助记符家族发的仍是原来那个裸字符串——`->`/`<->`/`<-` 的输出**与改前逐字节相同**，改动面严格等于新增头的面。
- **顺带必须修的第四个坑，也是本轮最大的一处自我纠正**：`sane()`（第 2946 行）逐行数 `(`/`)`、`[`/`]` 配平，而 CeTz 的曲头名字里就带括号（`")>"`）、竖线头带方括号（`"]"`）。先按「删掉双引号字符串再数」修了一版——**那一版把一张好图弄丢了**：`Deforming-hypersymplectic…` 的节点文字里有个作者写的 `K\"ahler`，命令名被 `_markup_text` 删掉后留下一个裸 `"`，字符串配对从此错位，`sane` 判不合格、`convert` 拒绝，产物里那张画布整个不见了（该篇 `#raw(block: true, lang: "latex")` 是 0 段，说明拒绝的图是**丢**而不是引出来，这一条另记进 §7）。最终把括号/方括号计数**整条撤掉**，`sane` 只留 `$` 奇偶：结构是否配平由紧跟其后的 `compiles()` 判，Typst 才是权威；数括号既救不了什么（不配平的画布本来也编译不过），又会误杀「字符串里合法带括号」的写法。撤掉之前先做了对照（`_work/probe_sane_control.py`）：这条计数否决的 46 张画布**全是新写法引出来的**——每张的不合格行里都带 `mark:`，**mark-free 的一张也没有**。也就是说这条计数过去没偷偷丢掉任何图，撤它只为 #36 服务，不牵扯另外 574 篇重跑（`_work/probe_sane_yield.py` 那个「36 篇」的读数是拿今天的画布回放旧规则，把新拼写当成了旧损失，已作废，只留作对照的分子）。这一族的坑只有走 `convert` 的批会撞到；`_work/probe_gate_all.py` 只调 `build`，量不到（闸门照旧 918/14/0，是测试里那句 `cetz.convert` 把它抓出来的）。
- **验证**：`tools/test_t2t.py` **103 项全过**（新增 `test_a_named_arrow_tip_takes_the_mark_that_draws_the_same_head`：一张图里同时验 `-{Stealth[length=2mm]}` 拿 red 作 fill、`|-|` 两端竖线、双层花括号的 `{{Latex[length=1.3mm]}-{Latex[length=1.3mm]}}` 两侧各自 0.13cm，以及光写 `>=stealth` 的图**不**发 `mark:`）；闸门 **918/14/0**（与 #35 同数）；`_work/probe_arrow_keys.py` → **canvases still missing a head: 0**；`_work/probe_arrow_yield.py` 按新写法圈出 **185 张画布 / 150 篇**，名单写进 `regen_needed.txt`，`_work/regen_list.py` 重跑**两轮**（箭尖一轮、撤计数一轮），两轮都 **150/150 compile**、各 95s；`_work/probe_arrow_regen_guard.py` 前后快照 canvases / quoted-latex / marks 三个数——**图一张没少、一段 LaTeX 没多**才算过：150 篇从 **canvases 311 / quoted 0 / marks 317** 走到 **311 / 0 / 1156**（中间那一版按字符串配平数括号的 `sane` 曾把 canvases 压成 310，少的正是 `Deforming` 那张，撤掉计数后回到 311）。
- **已知不足**：没写 `length` 的 `-{Stealth}`（17 张）用 CeTz 默认头 5.67pt，而 pdflatex 量的 TikZ 默认 Stealth 只有 3.57pt——形状同族、放大约 1.6 倍，没有拿它当缺陷记账；作者写裸数字（用户单位）的 `length` 不发（`_size` 那种数法是「几个轴单位」，与箭尖无关，宁可不带）；`Triangle`、`to` 这些 CeTz 没有对应名的尖仍然不画头——普查里这些名字一张都没有，不替它们编映射。

### 轴 15：带距离的方向键（#37 已修，边标签只贴线不挪位）
- **现象**：`Deforming-hypersymplectic…` p78 的两个 `node[above=20pt]` 标签压在箭线上，而 pdflatex 里它们离线 20pt。语料里 `above=`/`below=`/`left=`/`right=` 后面跟一个距离的写法，转换器只当「没有方向键」处理——锚点取默认、位置取作者写的坐标，字就贴在原点那一格上。
- **神谕（`_work/measure_side_key_offset.py`，pdflatex `\pgfextracty` + `\pgfpointanchor{a}{center}`）**：`above=d` 让节点的 **south 锚**落在作者坐标之上方 `d` 处——也就是说中心偏移恰好是 `d + 半高`，而**不是** `d + 半高 + outer sep`；裸 `above`（不带 `=`）才是「只选锚点、再加 outer sep」。三轴量出来 `(0,+1)`、`(0,-1)`、`(+1,0)`、`(-1,0)` 四个方向，`below=1cm` 给 −1.0cm 整。
- **两处断**：
  1. `_node_anchor` 的裸词循环只认 `o.get("above") is not None` 里值为空的那种，`above=20pt` 的值是 `"20pt"`，被当成别的键漏掉。
  2. `_node_shift` 原来第一行就是 `if not any(k in o for k in MOVES): return (0.0, 0.0)`，方向键从来没有进过偏移计算。
- **修（`tools/t2t/cetz.py`）**：`SIDE_MOVE`（1776 行）存四个方向的单位向量，`_side_key(o)`（1779）返回 `('above','20pt')` 或 `None`——判据是值能过 `_size`，所以 `above=6mm of up` 这种走另一条路径的写法由调用方在别处处理；`_node_anchor` 在裸词循环之后加一段：带距离的方向键同样发 `anchor: "south"`；`_node_shift`（3074）改成先把 `xshift`/`yshift`/`shift` 折进 `off`，再叠上 `SIDE_MOVE * _length(d)`，两条腿共用一个返回。两个 `emit_node` 调用点本来就把 `off` 加到位置上，所以独立节点、命名节点、边标签一处修全覆盖。
- **`above=20pt,anchor=north` 两键并存**：作者显式的 `anchor=` 赢（`_node_anchor` 的顺序保证），偏移照发——这正是 TikZ 的语义，度量里读到 `(1, 1.706)` + north。
- **已知不接的两类**（写进测试当反向断言，不是漏）：`above=6mm of up` 走 `placed_at`，这条路径自己算 `of`，这里再叠一次会翻倍；`above=2em` 这种 `UNITS` 里没有的单位不发（`_size` 认不出 `em`，见 §7）。
- **验证**：`tools/test_t2t.py` **104 项全过**（新增 `test_an_edge_label_that_names_its_distance_stands_that_far_off_the_line`：一张图里同时验 `above=20pt`→`content((1, 1.706), [N], anchor: "south")`、`below=6mm`→`(1, 0.4)`/north、`right=1cm`→`(2, 1)`/west、`left=1cm`→`(0, 1)`/east、`above=20pt,anchor=north`、路径内 `-- node[above=20pt] {t}`→`content((2, 0.7056), …)`，以及上述两类的反向断言）；闸门 **918/14/0**；**改动面用打桩 diff 量，不用关键词普查**：`_work/probe_side_regen_guard.py` 把 `cetz._side_key` 打桩成 `lambda o: None` 回放旧行为，逐张画布比对 → **131 张画布 / 105 篇**会变，`_work/probe_side_yield.py` 的静态普查只圈到 **54 张 / 44 篇**——差额全是样式展开（`.style` 里的 `every node`）和 `above = 20pt` 带空格的写法，静态正则看不见。名单取 diff 那份，重跑 **105/105 compile**；快照三个数（canvases / quoted-latex / marks）**图一张没少、一段 LaTeX 没多**。截图：`Deforming…-p78.png` 两个标签已离开箭线，`No-percolation…-p31.png` 无回归。

### 轴 16：图内重音（#38 已修，`K\"ahler` 印成 `K“ahler`）
- **现象**：#36 那一轮已经撞上过它——节点文字里的 `K\"ahler` 在产物页上读作 `Hyperk“ahler`：命令名被 `_markup_text` 删掉后留下一个裸 `"`，而 Typst 把行内的裸 `"` 排成弯引号。当时只为了「别丢图」撤掉了 `sane` 的括号计数，症状本身没治。
- **神谕**：
  - pdflatex（`_work/probe_accent_shapes.py`）：重音分两族拼写——**标点控制符**（`\"` `\'` `` \` `` `\^` `\~` `\=`）直接吃字母，`\"a` 就是 ä；**字母控制符**（`\v` `\u` `\H` `\c`）不吃，`\vc` 是一个命令名，必须 `\v c` 或 `\v{c}`。这就是 `(?![A-Za-z])` 那条形同白送的守卫，同一族坑在 `\bfseries` 上已经记过一次。
  - 同一普查里，不加守卫的 `\v|\u|\H|\c|\d|\b` 会把 **369 条 `\draw`、107 条 `\color`** 当成重音——这条数字留在代码注释里当证据，不许再拿无守卫的正则量语料。
  - Typst（`_work/probe_accent_emit.py` / `check_accent_page.py`）：把画布编译后从页上读回字形，确认组合后的字母真的落纸。
- **修（`tools/t2t/cetz.py`）**：`ACCENT_MARK`（1235）把十个重音映成 **Unicode 组合符**（`¨` U+0308、`´` U+0301、`ˇ` U+030C……），`_accents`（1241）用 `unicodedata.normalize("NFC", letter + mark)` 合成——**没有逐字母映射表**，`\"{o}`、`\"o`、`\v c` 三种拼写走同一条路径。落点在 `node_text`（1267）里 `\\textcolor` 守卫之后、`NODE_MATH` 切分之前，所以散文和数学片段一起覆盖。
- **验证**：`tools/test_t2t.py` **105 项全过**（新增 `test_an_accent_written_on_a_node_composes_into_its_letter`：画布里含 `Hyperkähler café česká`、`cetz.convert` 对 `\"{o}ver \u{a}ppel` 为真、`_accents` 对 `\color red`/`\draw node`/`\vc`/`\cycle`/`\alpha` 是恒等、`_accents(r"\v c \vc \v{c}") == "č \vc č"`）；打桩 diff（`_work/probe_accent_regen_guard.py`，把 `_accents` 打桩成恒等）→ **4 张画布 / 4 篇**，重跑 **4/4 compile**、丢图 0；闸门 **918/14/0**；页级复量 `_work/check_accent_page.py`：p78 读作 `Hyperkähler`，词中不再有弯引号。

### 轴 17：声明的宽度铺不满框（#39 已修，`text width=5.7cm` 的框贴着文字收边）
- **现象**：作者写 `text width=D` 是要一个**宽 D 的段落盒**——文字在里面折行、框按 D 画。转换器只拿 D 去算**行高**（#35），从不把它交给 Typst：`box_args` 只发 `inset:`，产物里 448 行 `#box(` 没有一行带 `width:`，于是框收成文字的自然宽度，`Turn-Based` p15 那种「两个 5.7cm/10.5cm 的说明框 ＋ 9mm 连线」在页上变成两块贴着字的窄盒，连线看着像悬空短横。
- **一条律，两个消费方**：#35 的 `node_size` 已经读过这四个尺寸键来算**落点**（`below=6mm of up` 要让过半高），同一条宽度却没人画给 Typst——所以本轮不是新增一条规则，而是把已经量过的律**接到第二个消费方**上。宽度从 `node_size` 里抽成 `node_frame_width(o, xf)`（518 行），`node_size` 自己改为调用它：摆放与描边读的是同一个数，不会再各算一份而漂移。
- **神谕**：
  - pdflatex＋fitz（`_work/measure_textwidth_frame.py`，上一轮已量）：`text width=D` 的框是 **D ＋ 2·inner sep**、段落**贴左**；`minimum width=D`/`minimum size=D` 的框**恰为 D**、内容居中。默认 inner sep 实测 0.117cm ≈ 0.3333em，与转换器一直发的 `inset: 0.3333em` 同数——所以 `width:` 是**外框**（Typst 语义），`inset:` 从内吃，两者相加正好是 TeX 那侧的「内容宽 D ＋ 两侧留白」。
  - CeTz（`_work/probe_box_width_anchor.py` → `_work/probe_box_anchor_ruler.py`）：`content(point, body)` 把**排版好的 body 居中在点上**——给盒子加宽，中心不动（用 `line((40,-60),(40,60))` 当尺，加宽前后左右边缘各外扩 30.3pt，中心读数 −30.3…+30.3 完全对称）。这一条决定了**发 `width:` 不需要动落点**：#35 的半高、#37 的偏移照旧。探针第一次读绝对 x 时误判成「左对齐」，是尺子把它纠正回来的——`anchor: "left"` 在 CeTz 里根本不存在（panic：`Anchor 'left' not in anchors`），合法名是 `center`。
- **修（`tools/t2t/cetz.py`）**：`emit_node` 多收一个 `width`，带框节点在 `#box(` 参数表首位发 `width: %.4gcm`；贴左还是居中由 `_node_align(o)`（1828）判——作者写了 `align=center|right` 就用它，写了 `text width` 而没写 `align` 就**不发包**（Typst 默认贴左，正是 TeX 的默认），其余情况发 `center`。`_box_body(text, align)`（1861）是唯一的落笔处：`#align(center)[…]` 或直接 `[…]`，因为 **Typst 的 `box` 没有 `align:` 参数**（传了报 unexpected argument）。`grown_box`（1872，#35 那条「测量高度」的路径）同样接 `align`，两条画框的路径共用 `_box_body`。三个 `emit_node` 调用点（`translate_path` 里边标签两处、`translate_statement` 一处）各自把 `node_frame_width(no, xf)` 递进去，独立节点、命名节点、边标签一处修全覆盖。
- **验证**：`tools/test_t2t.py` **106 项全过**（新增 `test_a_declared_measure_lays_the_frame_that_wide`：`draw, text width=2.8cm` → `#box(width: 3cm`（2.8 ＋ 2×0.1）且**没有** `#align(`；`minimum width=2cm` → `width: 2cm` ＋ `#align(center)`；`align=center` 覆盖 `text width` 的贴左默认；`align=left` 不发包；只写 `text width` 不写 `draw` 时**不**发 `#box(`；两行 `text width=2cm, minimum height=1cm` 的节点 `cetz.convert` 为真）；闸门 **918/14/0**（与 #35–#38 同数，本轮只给已有画布加参数，既不多一张图也不少一张图）；打桩 diff（`_work/probe_width_regen_guard.py`，把 `emit_node` 打桩成丢掉 `width`、`_node_align` 打桩成恒返 `center`——**故意不打桩 `node_frame_width`**，因为旧代码里同一个数本来就由 `node_size` 读去做落点，打了桩会把 #35 的既有行为也算进本轮的账）→ **65 张画布 / 62 篇**，重跑 **62/62 compile**；`_work/probe_product_snapshot.py` 逐篇数「源图数 / 页上 canvas 数 / quoted-latex 数」，前后两份**逐行相同**（114 图 / 111 canvas / 0 段 LaTeX，那 3 篇 SHORT 是 §7「拒绝即丢」的旧账，本轮没有新增）；产物里新增 **385 行 `#box(width:`**。截图：`Turn-Based` p15 与 `_work/latex_turn15.png` 控制版逐框对齐（两个 5.7cm 框贴左、10.5cm 框 `align=center` 居中），`Almost-Linear-Time…` p21 的下方两个说明框同样铺满——该图中部 `16x_e`／`16(L+1)` 压字属 §7 的字宽互压旧账，不是本轮引入。
- **改动面为什么比普查小**：`_work/textwidth_needed.txt` 那 94 篇是「产物有 `#box(` 而无 `width:`」的账面数，本轮 diff 只有 62 篇。差额由 `_work/probe_width_units.py` 逐值喂给真正的读尺函数 `cetz._length` 量出：能读出的 **`text width` 426 / `inner sep` 870 / `minimum width` 145 / `minimum size` 70** 处，读不出的 **23 处 / 9 篇**，形状全部是 `text width = .84\textwidth`、`.27\linewidth` 这一类**相对页宽**的量——`_size` 见到反斜杠名字就退，宁可不发（与 #37 对 `em`/`ex` 的处置同一条纪律）。顺带一条**否证**：这四个键的取值里**一个 `em`/`ex` 都没有**，§7 那行「相对单位」只属于方向键与箭尖，别把它记到框宽头上。
- **差额最后是靠「从转换器内部数」结的账，不是靠解释**：`_work/probe_width_coverage.py` 把 `emit_node` 包一层，记下每一个真正落到 `#box(` 里的节点拿到了什么测量——全语料 **1489 个带框节点，857 个带 `width:`**，按声明键分：**`text width` 779 / `minimum width` 78 / 无测量 597 / `text width` 被拒 35**，而「有可读测量却没发出 `width:`」的节点 **0 个**。也就是说 94 与 62 之间没有漏网的：普查数的是**篇**，一篇里多数 `#box(` 本来就没有声明宽度（那 597 个），只有 62 篇的框真的拿到过测量。剩下的 24 篇「有可读测量却没变」也各有了着落——它们的尺寸写在**形状节点**上（`\node[draw,circle,minimum size=9mm]`），那条路走的是 `content(区间, …, frame:)`、半程 0.45cm 正是 9mm 的一半，从来不需要 Typst 的 `width:`。顺着这条线摸出两个新面，已各记 §7 一行（形状节点带宽度时丢 `frame:`；空内容节点）。
- **已知不足**：相对页宽那 23 处仍发不出 `width:`（已记进 §7 新行）；`text width` 与 `minimum width` 同时出现时取**较大者**（`node_frame_width` 里 `max`），而 TeX 是「`minimum width` 只兜底、不覆盖」——扁平源里**同一张选项表**同时写这两个键的写法 0 处（`\[[^\]]*` 级 grep），会并存的只剩样式展开一条路，没查，先按不劣化处理；框加宽后**相邻框会不会贴上**没有量——CeTz 的 `content` 不参与排版、盒子只画不占位，本轮截图未见新压字，但这是一条没结账的面。

### 轴 18：节点上挂的 `label=` 整个不见（#41 已修，388 个节点 / 60 张画布 / 46 篇）
- **现象**：`label=above:{$f$}` 是 TikZ「不建盒子也要把字挂到某个点上」的写法，给圆点命名、给框的某边加注都靠它。转换器**没有任何一处读这个键**：`emit_node` 一遇到空的正文花括号就直接返回，于是 `\node[circle,fill,inner sep=1.5pt,label=above:$v$] at (…) {};` 画出了点、丢了名字。Kaplansky 那篇 p9 的图 1 有 5 个点、10 个 label，产物页上点全在、一个字母都没有——caption 却写着「white vertices p, q, both labelled f」，图与说明对不上。
- **账面先纠正一次**：§7 旧行那 **108 张图 / 82 篇** 是**关键词数错了对象**——数的是「带空内容节点的图」，不是「带 `label=` 的图」。按选项表数（`_work/probe_label_option.py` 把 `emit_node` 包一层，只看真正建起来的图）：`label=` 落在 **388 个节点**上，其中 **385 个挂在空内容节点**（丢的就是它唯一的文字）、3 个挂在有正文的节点上（丢的是加注），合起来 **60 张画布 / 46 篇**。位置槽只有八个方位词：**`below` 108 / `above` 84 / `left` 75 / `right` 75 / `below left` 16 / `above left` 15 / `below right` 13 / `above right` 12**，共 398 次悬挂——比节点多 10，因为有 10 个节点写了两个 `label=`（源里数出来的），而 `opts()` 是后写覆盖前写，第二个在选项表里就已经没了。**TeX 里两个 label 是两个节点**，所以这一键改成累积（`opts` 里对 `label` 特判 `setdefault(...).append`），不是新增功能而是让解析器看得见作者写的东西。
- **神谕**（`_work/measure_label_offset.py`，pdflatex；给 label 自己起名 `[name=L]` 再 `\pgfextractx` 读它的锚点，才量得到「挂在哪」而不是「父节点在哪」）：
  - label 是**第二个节点**，它自己的盒（含 **1pt** 默认 `inner sep`）**贴**在「方向射线离开父节点边框」那一点上，**间隙 0**——不是父节点中心加一个定长。
  - 裸 `label:$f$` 与 `label=above:$f$` 读数逐位相同：缺省位置就是 `above`。
  - `above left:` 与 `135:` 是同一个读数，而对角射线穿过一个 1.2cm×8pt 的宽扁盒时，从**短边**出去（实测 `(-0.1482, 0.1482)`），不是从角点——所以对角两支都用 `min(hw, hh)`，单边各用自己的半程。
  - 前言键改的是同一条推距：`[inner sep=…]` **顶掉**那 1pt，`[label distance=…]` 在它上面**相加**（第一版把 `label distance` 写成替换，产物落点 -0.2117 而非 -0.2469，被测试的期望值逮住），`[xshift=…,yshift=…]` 只平移。
- **修（`tools/t2t/cetz.py`）**：`label_placements(o)`（1919）把一条 `label=` 拆成「位置向量、CeTz 锚名、正文、推距、平移」，`label_lines(at, o, pal, extent)`（1974）按父节点的半程算出悬挂点、发 `content(点, [正文], anchor: "…")`；`emit_node`（2002）在节点自己那几行之后统一追加，于是空节点、有正文的节点、边标签上的节点三条路径共用同一支落笔。为此 `emit_node` 的 `at` 从**字符串**改成**坐标**（要拿它做向量加法），并多收一个 `extent`——父节点的半宽半程由 `node_size` 带着正文算，三个调用点（`translate_path` 两处边标签、`translate_statement` 一处）各自把已经算过的 `own` 递进去，与 #39 的「一条律两个消费方」同构。锚名是 CeTz 的那一套（`south`/`south-east`/`east`…），`"left"` 不存在。
- **不猜的代价由 LOST 计数定出来**：位置写法里凡是解析器不认识的（`[name=L]` 这类带前言未知键、`45:` 这类角度）一律**返回 None、整图拒绝**，而不是挑个方向蒙一个。这个「拒」的范围一开始划错了：打桩 diff（`_work/probe_label_regen_guard.py`）报 **lost: 3**——三张**本来能编译**的图被新代码打成废图，逐张看源码才认出它们是 `[inner sep=1.5pt]above:…`、`[label distance=2mm]left:…`、`[xshift=…,yshift=…]` 三种前言写法。**这三条键不是先想到的，是 LOST 计数逼出来的**（`_work/probe_label_refusals.py` 监听 `label_placements` 的 None 出口做同一条判据的复查）。补完后 diff 回到 **lost: 0**，闸门仍是 **built 918 / refused 14 / 编译失败 0**——与 #35–#39 四轮同数，本轮既不多一张图也不少一张图。
- **验证**：`tools/test_t2t.py` **107 项全过**（新增 `test_a_label_hangs_off_the_edge_it_names`：`above:$f$` 落 `(0, 0.1411)` 且锚是 `south`、`left:$p$` 落 `(-0.1411, 0)` 锚 `east`、`above left:$x$` 走短边落 `(-0.1308, 0.1308)` 锚 `south-east`；`{above:$f$}` 带花括号与裸 `$f$` 三者逐位相同；一个节点两个 label 两行都发；带正文宽盒的对角落点 `(-0.1661, 0.1661)`；`[name=L]` 让 `cetz.build` 交回 None；三条前言键的读数各按神谕写死）；打桩 diff **60 张画布 / 46 篇**、lost 0，重跑 **46/46 compile**；`_work/probe_product_snapshot.py` 前后两份**逐行相同**（113 图 / 109 canvas / 0 段 LaTeX）；**从转换器内部复量**：同一支普查在修完后重跑，报「`label=` 数到却没画出来的节点：**0**」（398 次悬挂全部落笔）；截图 `Kaplansky` p9 与 `_work/latex_kap.png` 控制版逐点比对，`f p q a b x v` 与右半 `f r a b x v` 十处方位一致（此前点全在、字母全丢）。
- **已知不足**：`pin` / `pin edge`（TikZ 里带一根引出线的 label）语料 **0 处**，所以没为它写分支，普查里那一类是空的——将来撞上再说；label 的**字宽**仍不参与避让，`left` 锚的标签会压进邻居的盒子（§7 的「字宽互压」那一条腿现在更吃紧了：本轮往页上**新增了 398 处文字**，这是它们第一次真的存在）；角度型位置（`45:`）与 `[name=…]` 仍按拒绝处理，认出的是「不猜」而非「不能修」，要做的话得把 `\angle` 的射线-边框交点也量一遍。

### 轴 19：`circle` 只有一个直径（#40 已修，1,200 个圆节点 / 139 张画布 / 105 篇）
- **现象**：Kurosh p36 那一圈 11 个顶点、以及语料里 773 个 `\node[circle,fill,inner sep=1pt] {}` 小点，圆要么被画成方的、要么半径与作者写的 `inner sep` 无关。
- **账面先纠正两次**：§4 旧行 40 写的「`circle` ＋ 只有 `minimum width`，15 节点 / 7 篇」按选项表复量是 **0 处**（`_work/probe_circle_face.py`）——真实分布是**空节点 952 / 带声明尺寸的 161 / 只有文字的 87**，合起来 **1,200 个圆节点 / 139 张画布 / 105 篇**。第二次纠正：本轮开工时以为「形状经样式（`vertex/.style={circle,…}`）进来会变成 `shape=circle` 键、旧代码看不见」，实测**语料里 `shape=circle` 出现 0 处**，样式表在 `opts()` 里合并后交回的仍是裸 `circle` 键，旧代码一直看得见（`grep -l "shape=circle" _work/flat/*.tex` → 0）。判据是 `_work/probe_stub_reaches_emitter.py`：同一张图分别用「恒 `rect`」和「只认裸键」两种桩重放，后者与现网输出**逐字节相同**（22 行差异只出现在前者）。**所以本轮修的不是拼写解析，是四条没实现的几何律。**
- **神谕**（pdflatex，`_work/measure_shaped_node_frame.py`，逐例从画出的路径量）：
  - `circle` 是**正方形**的：`minimum width=1cm`、`minimum height=1cm`、`minimum size=1cm` 三种写法在**两根轴上**都读 `east - center` = 14.426pt——作者写的数是**直径**，且只会有一个直径；两个不等键取较大者、与顺序无关（`minw1-minh06` 与 `minw06-minh1` 同读数）；文字比框宽时圆跟着长大（`minw1-long` → 44.496pt）。
  - **空**节点的半径 = √2 · `inner sep`（锚点读数里再半个线宽）：默认 4.914pt、`inner sep=1pt` 1.614pt、`2pt` 3.029pt、`5mm` 20.321pt、`0pt` 0.700pt、`minimum size=1cm` 14.426pt。转换器此前一律发 0.05cm，撞上 `inner sep=1pt` 恰好对（0.0499），其余全错——这就是为什么 773 个点的图看起来「没问题」。
  - `ellipse` 保留两轴独立（28.653 × 7.005pt），CeTz 没有这个框，另记 §7。
- **CeTz 侧**（`_work/measure_circle_padding.py`、`measure_circle_pair_engines.py`）：`content` 的 `frame:` 只有 `none`/`"rect"`/`"circle"` 三种，而 `"circle"` 画的是给定盒子的**外接**圆——边长 s 的 range 出 s√2（`minimum size=9mm` 画成 1.2758cm，pdflatex 是 0.9000）。把 range 的半程再除以 √2 落到 **0.9030cm** ✓。文字尺寸的圆走 `content(点, [文字], frame: "circle", padding: 0.3333em)`，两引擎在同一批正文上比值 1.03–1.10（多出来的是量具用 11pt 页面而 TeX 是 10pt）；`inset:` 写在框参数上**什么都不改**，能送到边框的只有 `padding:`。
- **修（`tools/t2t/cetz.py`）**：一个守卫 `node_shape`（550，`shape=` 与裸键两种拼写归一）＋四个消费方——`node_size`（576）把圆夹成正方形（**只在量出来的直径非零时返回**，否则文字高度那条老回退就丢了，第一版栽过一次：243 条「other」全是箭端点被搬回原点）、`emit_node`（2076）里 range 按 `CIRCLE_FRAME`（548）收缩、无尺寸圆走 `padding:` 点式、空节点发 `circle(点, radius:)`、`_anchor_ring`（686）认得圆好让箭离开圆形边框、`dot_radius`（778）＝√2·`node_inner_sep`（565）与声明尺寸的较大者。三个 `emit_node` 调用点各把节点自己的 `inner sep` 递进去。
- **验证**：`tools/test_t2t.py` **108 项全过**（新增 `test_a_circle_keeps_its_round_border_whatever_it_declares`：三种 `minimum` 写法同落 `content((-0.3536, -0.3536), (0.3536, 0.3536), …, frame: "circle"`、`[shape=circle]` 同样圆、`inner sep=1pt` 的文字圆发 `padding: 0.03528cm`、空节点发 `radius: 0.04989` 与 `radius: 0.5`、没要框的节点仍只有正文）；打桩 diff **138 张画布 / 105 篇、lost 0**——注意**这是上界**：桩把 #40 之前就存在的裸键框形也一并撤了，那 238 行 `other`（箭端点）里混着既有行为，本轮真正新增的是四条律；闸门 **918/14/0**，与 #35–#41 五轮同数，**一张图不多一张不少**（开工时记的「多画出一张 Translative 图」是桩假象，`_work/probe_gained_canvas.py` 复量：现网 918 / 忠实旧律 918 / 恒 rect 桩 917）；重跑 **104/104 compile**，`_work/probe_product_snapshot.py` 前后两份逐行相同（104 篇 234 图 / 230 canvas / 0 段 LaTeX）；截图 `_work/clip-A-Counterexample-to-Ku-p36.png` 与 `_work/latex_kurosh2.png` 逐框比对。
- **已知不足**：`ellipse`（语料 8 节点）、`diamond`（2）、`regular polygon` 没有 CeTz 对应框，`node_shape` 只认圆，其余一律交回 `rect`；非圆的空节点仍是硬编码 0.05cm；`text width` 加在圆上、以及比声明直径更宽的标签，都仍按声明画（TeX 会让圆长大，我们的框不会）——见 §7。

### 轴 20：作者量出来的框，字却贴在框角上（#42 已修，421 行 / 82 张画布 / 70 篇）
- **现象**：#40 的截图里 Kurosh p36 右栏四个 `block` 框（`minimum width=12mm, minimum height=6.5mm`），`j+1` 的字母压在**左边框**上、`j` 干脆骑在框线上；pdflatex 控制版里它在框的正中。圆上的数字偏得少（框小），但同一个毛病。
- **神谕**：pdflatex 那侧（`_work/measure_tex_node_text_centre.py`，逐例量「画的框」与「字的墨」）——`minimum width=2cm, minimum height=1cm` 的节点 dX **+0.00** / dY **+0.45pt**（那 0.45 是字形盒自身的不对称，**无框节点读回同一个数**，所以它是量具常数不是偏移）；两行标签 dX +0.01 / dY +0.31；`text width=2cm` 不带 `align` 时**水平贴左**（dX -4.13，左留白 3.32 / 右留白 11.58）**但垂直仍然居中**（dY +0.31）；`align=center` 把水平覆盖回居中。Typst 这侧（`_work/measure_cetz_range_align.py`）：`content(range, [正文], frame:)` 把正文排在 range 的**左上角**——一个字母在 2cm×1cm 的框里 dX **-26.1**、dY **+11.2pt**；`#align(center + horizon)` 两个轴一起落位（**-0.1 / -0.4**），两行正文同样 -0.1 / -0.1；`#align(right + horizon)`、`#align(left + horizon)` 各自只改水平那一半。
- **为什么 #39 那一轮没撞见**：`text width` 的量当时全落在 `#box(width:)` 这条路上——盒子自己 hug 高度、CeTz 又把排好的盒子**居中在点上**，所以那条路径只有水平一半可管。**垂直这一半只在作者同时写了宽和高、 emitter 交出 range 框时才存在**；同一张律的两个消费方，一个天生满足、一个从不满足，从前 421 行里没有一个被发现。
- **修（`tools/t2t/cetz.py`）**：`_box_body`（1930）多一个 `horizon` 形参，range 分支交回 `#align(<水平> + horizon)[…]`；水平那一半仍由 `_node_align`（1897）判——`align=` 最大、写了 `text width` 而没写 `align` 就贴左、其余居中，**与 #39 同一条律、同一个落笔处**。`#box(width:)` 与 `grown_box` 两条路径不传 `horizon`：它们的盒子贴着文字，没有「中间」可对。
- **验证**：`tools/test_t2t.py` **109 项全过**（新增 `test_a_sized_frame_holds_its_words_in_the_middle`：`minimum width=2cm, minimum height=1cm` → `#align(center + horizon)[j]`、`align=right` → `right + horizon`、`text width=2cm, minimum height=1cm` → `left + horizon`，以及两种「不该有 horizon」的框：只有 `minimum width` 的 `#box(` 路径、`inner sep` 撑开的点式圆）；打桩 diff（`_work/probe_align_regen_guard.py`，桩＝`_box_body` 在 `horizon=True` 时只回裸 `[text]`、另两条路径交回真函数——这一轮的账**不多不少**，因为 range 分支在 #42 之前根本不叫这个函数）→ **82 张画布 / 70 篇、lost 0、无一行落在 `other`**，新行 260（rect）＋161（circle）＝ **421 行**，与产物普查 `_work/probe_align_face.py` 数的「页上带 range 框的行 421 / 70 篇 / 152 张画布」逐行对得上；重跑 **70/70 compile**，快照 pics 152 / canvas 152 / raw 0 前后**逐行相同**；闸门 **918/14/0**（421 行新写法在 typst 下全部编译通过，`#set` 混在 range 正文里没有被拒）；截图同一张 Kurosh p36：四个 `block` 框与两个 `j`/`i` 框的字全部落到框中，与 `_work/latex_kurosh2.png` 逐框一致。
- **已知不足**：`left + horizon` / `right + horizon` 在语料里 **0 处样本**（421 行全是默认 center），写法覆盖了但没有产物可核；框居中后**相邻框会不会贴上**仍未量（§7「字宽互压」那条腿）；这张图另外暴露的两处缺陷不属于本轮，已另记 §7：`rounded corners` 在 range 框这条路上整个丢掉、以及画布只按**点**算尺寸导致最下面那条虚线标签压在 caption 上。

### 轴 21：图级的 `>=<name>` 没落到裸 `->` 上（#43 已修，1,659 行空心 V / 432 张画布 / 291 篇）
- **现象**：还是 #42 那张 Kurosh p36——控制版里 10 支箭是**实心** Stealth 头，产物里 10 支是空心 V。图头写了 `[>=Stealth]`，`opts()` 读回 `{'>': 'Stealth'}`，`_arrow_spec(">")` 答 None，于是这条声明被读完就丢，图上每一支 `->` 都按 TikZ 的原始 `>` 画。#36 教过发射器**写在箭上的**名字（`-{Stealth}->` 出 `(symbol: ">>", fill: black)`），图级默认是同一支头的另一种写法，语料里比写在箭上更常见。
- **面**：453 张图声明、291 篇；取值只有四个词，且都是 `TIP_WORDS` 已有的名字（Stealth 217／Latex 157／stealth 77／latex 7），一张图内不混用（stealth 族 291 张、latex 族 162 张，mixed 0）；450 张写在图头，3 张写在别处。旧代码下这些图里有 **1,659 行**发裸 `">"`／`"<"`（`_work/probe_tip_default_face.py`）。`arrows.meta` 由 476 篇装着——**不装它，大写名是 fatal error**，`\begin{tikzpicture}[>=Stealth]` 直接编译失败。
- **神谕**（`_work/measure_tikz_tips.py`，`ge:` 与 `site:` 两块）：三种落点都会改头，**且与选项先后无关**——`\draw[<->,>=Stealth]`、`\draw[>=Stealth,<->]`、`/.style={<->,>=Stealth}`、图头 `>={Stealth}`（带花括号）全部画出实心 Stealth；声明**不泄露出自己所在的那条语句**（紧随其后的 `\draw[->]` 仍是空心 V），`\begin{scope}[>=stealth]` 的也一样、出了 scope 就还原。三种头各有尺寸：什么都没写＝**空心** V 2.07×4.78pt（与 CeTz 裸 `">"` 记号同形，所以**没声明的图一张都不该动**），`>=latex/Latex`＝实心 3.99／3.76×2.99，`>=stealth/Stealth`＝实心 3.19／3.57×2.69。
- **一个先被话解释掉的差额**：打桩 diff 说 426 张、普查说 432 张，我先前把这 6 张写成「pgf 从左到右执行选项，`<->` 写在 `>=` 之前就不改头」。**那句话是猜的，而且一测就错**——上面那四种顺序实测全都改头。真因是两种读点没读：`>=` 也可以写在语句自己的括号里或 `/.style` 里（`resolve_opts` 早已把它合并进这条语句的选项表），以及 `>={Stealth}` 的**花括号**留在了值上（`opts()` 交回 `'{Stealth}'`，`TIP_WORDS` 查不到）。量具是 `_work/probe_tip_residue.py`（逐张打印六张的源上下文）和 `_work/probe_tip_decl_site.py`（三层选项表各答什么）。
- **修（`tools/t2t/cetz.py`）**：`arrow_default`（2283）认名字前先 `_braced` 剥一层型；`arrow_mark`（2310）在 `_named_side` 之前先问这条语句合并后的选项表里有没有 `>`，有就以它为准（**最内层赢，且不回退到外层**——外层名字认识、内层名字不认识时仍画裸字符，那是守卫存在的理由），没有才用 `build`（4066）从图头串下来的 `default`。`default` 沿 `translate_statement`（3251）→ `translate_path`（2891）→ 两处 `arrow_mark` 传下去，`_named_side`（2302）只把默认写在**裸记号**上，已经自己命名的尖不动。
- **验证**：`tools/test_t2t.py` **111 项全过**（新增两项：图头默认改两头、命名尖不被改，`test_a_tip_default_written_where_the_arrow_is_written_reheads_that_arrow` 覆盖语句两种顺序／style 覆盖图头／带型图头／声明不外泄／内层不认识的名字不回退）；复量具报空心 V **1,659 行 / 432 图 → 0 / 0**；打桩 diff（`_work/probe_tip_regen_guard.py`，桩＝`arrow_default` 恒 None，两条读点一起哑）**432 张画布 / 284 篇、lost 0**，实心 Stealth 头 1,102＋实心 latex 头 557＝**1,659**，与普查行数逐条对上；闸门、重跑、截图见 §4 行 43。
- **已知不足**：`\begin{scope}[>=stealth]` 这一族语料 **0 处样本**，实测律已写在这里，但 `_walk_scopes`（3536）只把 scope 选项交给 `_transform`，语句选项里没有它，所以这条路**没写代码**（写了也没有产物可核）；同族大小写差 ~0.2pt（Stealth 3.57×2.69 对 stealth 3.19×3.19、Latex 3.76×2.89 对 latex 3.99×2.99），CeTz 只有 `">>"`／`")>"`／`">"` 三个记号可用，按同族并成一档；`>=Triangle` 这类没量过的名字保留裸字符（语料 0 处）。

### 轴 22：整张图被换成打印出来的占位标记（#44 已修，3 图 / 1 篇）
- **现象**：`Cylinder-amplitudes…` 的三张图在页上什么都不画，caption 底下只剩一行字面 `2TTIKZ1`。图不是被拒绝的（拒绝会留一段 quoted raw LaTeX，页上 `lang: "latex"` 数是 0），是**被抬出去之后没抬回来**。
- **成因**：`convert.preserve_tikz` 先把 TikZ 源从正文里摘走、在原处留一个 `ZQT2TTIKZ<i>` 占位，转换完再 `text.replace('ZQT2TTIKZ%d' % i, done)` 换回画布。占位符**两边不空格**，而它落在作者正文的中间：`\centering\begin{tikzpicture}` 摘走图之后就成了 `\centeringZQT2TTIKZ1`。**TeX 的控制词吃到第一个非字母为止**，于是这一串被读成一个命令 `\centeringZQT`，后面的 `2TTIKZ1` 成了正文里的普通数字＋字母——pandoc 把不认识的命令整体吞掉、把尾巴当字面留在页上，回收那一步在解析后的正文里找不到完整标记，图就地没了。
- **怎么被发现的**：不是任何一项残留量具报的，是 #43 的两支自家量具对不上账逼出来的——按选项表重建「声明了 `>=` 的图」build 侧 432＋40＝472 张，页上只有 463。差额逐篇摊到源语句（`_work/probe_tip_named_split.py`）才看见这一篇 build 3 张、页上 **0** 张。先前那句「图少一张大概是闸门吃图」是猜的，实测整轮闸门吃图的只有那 1 张已证伪的旋转椭圆。**「图没少」这一项当时是绿的，因为量的是 canvas 总数对 canvas 总数，没有跟源图数对**——§5 那条「两支量具对不上就把差额打印到源语句上」在这里第二次兑现。
- **面**：标记紧贴字母控制词的写法全语料 **3 处 / 1 篇**（`_work/probe_marker_fusion.py` 数 `(?<=[A-Za-z])\begin{tikzpicture}`，反向「图正文末尾紧贴字母」0 处）。
- **修（`tools/t2t/convert.py`）**：占位符两边各补一个空格，就这一处。**补两侧而不是只补出事的那一侧**：标记两侧都可能挨着作者的字符，而多出来的空格在别处不花钱——六篇同族论文（标记前后本来就空着）补完空格后产物**逐字节相同**（`_work/probe_marker_pad_sample.py`）。
- **验证**：新增测试 `test_a_picture_written_tight_after_a_control_word_still_reaches_the_page`（12 行论文、`\centering\begin{tikzpicture}` 紧挨；断言编译过、`#cetz.canvas(` 在、`TTIKZ` 不在、caption 词在）。断言是**先证明会咬**再留下的：把补空格撤掉，产物里确实是 `[2TTIKZ0]`。那一重跑后这一篇页上 canvas **4 / 源图 4**、`TTIKZ` **0** 处、quoted LaTeX **0** 段；测试 **112 项全过**。
- **已知不足**：`preserve_tikz` 不是唯一的 lift-out 记号——#33 的 cite token 也是「作者正文里插一个陌生串再换回来」，那一族当时刻意选了不会被 TeX 读成控制词的拼写并有 pandoc 神谕（`_work/probe_cite_token.py`）垫底，但没有一支**横向**量具问「还有哪些占位符可能挨着字母」。这一句应作为所有 lift-out 的收口判据，不是本轮的账。

### 轴 23：Typst 把分组下标的花括号印了出来（#45 已修，页上 935 处 / 235 篇）
- **现象**：#42 那张 Cylinder p92 的图里，节点写着 `$x_{i+1}$`、`$N_{e,0}$`、`$z_a^{c_1}$` 的地方，页上**连着花括号一起印出来**——`x{i+1}`。正文里的公式没有这个毛病，只有图里的标签有。
- **神谕**（typst＋fitz，`_work/brace_probe4.typ`／`brace_probe5.typ`／`brace_probe6.typ`，逐条编译后从页上读回）：
  - `$x_{i+1}$` → 页上 `x{i+1}`（**括号照印**）；`$x_(i+1)$`、`$x_i$`、`$N_(e,0)$`、`$z_a^(c_1)$`、两层 `$x_(a^(i+1))$`、`$D_r^(+)$` → 干净。
  - 一串字母不能直接并进括号：`$z_(ij)$` 把 `ij` 读成一个未知名字，会被引号通道印成正体，所以要隔开——`z_(i j)`。数字与字母数字混排不需要（`x_{12}` → `x_12`）。
  - **作者用 `\{` 要的就是那个字符**：`$c_{\{k,j\}}$` 页上印 `c{{k,j}}`（组的括号与转义的括号**都**印，多一对），`$c_(\{k,j\})$` 印 `c{k,j}` ✓——所以转义括号留在括号里面，外面那一组照样要换掉。
- **为什么只有图里错**：这条律在两个通道各写了一遍。正文公式走 pandoc，它本来就发圆括号；图内标签走 `cetz._math_body`，那里只把「纯字母数字」的一组剥掉（`_unscript`），复合的一律原样交给 Typst——于是 935 处留在页上。**同一条律的两个消费方，一个天生满足、一个从不满足**，与 #42 的「垂直居中」是同一个形状。
- **修（`tools/t2t/cetz.py`）**：`_unscript` 换成 `_group_scripts`（1164），`SCRIPT_GROUP`（1161）的体允许转义对（`(?:\\.|[^{}])*`），由**最内层向外**反复改写：单个原子不留组、字母串隔开、其余进括号、括号不配平的原样留着（宁可印一对括号，也不交给闸门一张语法错的图）。
- **验证**：测试 **112 项全过**（`x_(i+1)`／`x_(i j)`／`N_(e,0)`／`z_a^(c_1)`／`x_12`／`hat(A)_i` 与转义那一族 `c_(\{k,j\})`、`\1_(\{v\})` 各一条）；打桩 diff（`_work/probe_brace_regen_guard.py`，桩＝把 `_group_scripts` 换回旧那一条 `re.sub`）**changed 300 张画布 / 231 篇、lost 0、写下的分组 936 处**；闸门 **918/14/0**；重跑 **231/231 compile**。
- **账面结清靠的是页，不是桩**：产物普查 `_work/probe_brace_scripts.py` 开工时数 **935 处 / 235 篇**，比打桩 diff 多 4 篇——差额不是量具噪声，是**桩真的看不见那四篇**：`probe_brace_regen_guard` 直接叫 `cetz.build`，跳过了 `convert` 在前的 `expand_linewidth` 与 `build_cd`，于是 `x=.85\linewidth` 定轴的图新旧都建不出来（None==None），整篇不进名单。改由产物侧驱动名单（`_work/probe_brace_left.py`：页上画布里还剩几行带 `{`，并区分「引号串里的字面括号」与「没改到的组」）→ 补 **8 篇**重跑，暴露出转义括号那一族 **7 行 / 3 篇**，再补 **3 篇**，现报 **0**。三步：935 → 20 → 7 → **0**。
- **截图收口**（用户 standing 指令）：`A-boundary-only…` p11 图 3 的 `z_a^{c_1}`、`[z_b^{c_2},z_c^{c_3}]` 已无括号；`The-Factor-Two…` p14 图 1 的 `c{k,j}`、`Q{k,j},j` 只剩作者要的那一对（fitz 从页上读回 `𝑐{𝑘,𝑗}`）。**同一张截图另见一处不属于本轮的缺陷**：`\draw[<->] (k)--(j)` 的箭**插进了只按文字撑开的盒子**（源 1061-1066 行），已另记 §7。
- **已知不足**：`_group_scripts` 只在图内标签这一条路上；正文那一路本来就对，没有并轨的必要，但**下一次再给数学排版律打补丁时，两路都要各自在产物上数一遍**（§5 已记）。

### 轴 24：pgf 的默认 `inner sep` 被花在每一个有框节点上（#46 已修，1,204 行 / 279 张画布 / 223 篇）
- **现象**：`\node[draw, inner sep=2pt] {text}` 的框在页上比 TeX 窄半格，`inner sep=0pt` 那种「框贴着字」的写法更是完全没生效——产物里每一条 `#box(` 都写着同一个 `inset: 0.3333em`。作者明明把量写下来了，转换器也明明会读（`node_inner_sep` 从 #40 起就在读），可 `#box(` 这条路压根没问过它。
- **神谕**（typst＋fitz，`_work/measure_box_inset_gap.py`，每例一页、fitz 读外框宽与字到框边的左右间隙）：
  - `inset:` 是**两侧各花一次**的留白：同一段 9.5pt 的字，`inset: 2pt` → 框 13.500（左右各 2.000），`inset: 5pt` → 19.500（各 5.000），`inset: 0pt` 与**根本不写 `inset:`** 都是 9.500（各 0.000）——所以留白只有这一个来源，不发就是没有。这正是 TeX 那侧 `frame = text + 2 · inner sep`（`_work/measure_shaped_node_frame.py`）的同一条律，两侧相加才能对上。
  - **默认的 `0.3333em` 跟着节点自己的字号走**：9pt 正文上 `inset: 0.3333em` 左右各 3.000pt（框 14.549 = 字 8.550 ＋ 2×3.000），10pt 上是 3.33pt（#39 量的 0.117cm）。所以**默认值必须留在 em 里**——把它换算成 cm 就冻在了图头那个字号上，节点自带 `#text(size:)` 时又错一次。
- **修（`tools/t2t/cetz.py`）**：新增 `node_inset(o)`（1967）一条路径：作者写了量就 `_length(..., IDENT)` 换成 `cm`，没写就原样发 `0.3333em`；`box_args`（1996）第一件事改成 `"inset: " + node_inset(o)`。**没有把 `emit_node` 已算好的 `pad` 传进来**（§7 原本提议的做法）：`pad` 是 `node_inner_sep` 返回的 **cm 浮点**，默认值经它一算就变成绝对长度，正是上面那条 em 律禁止的；`node_inset` 直接把「读得出来就读、读不出来留给 em」这一条律写在一个名字里，两条路（`#box(` 与 range 那条 `grown_box`）都从这一个来源取值。
- **验证**：测试 **113 项全过**（`inner sep=5pt`→`inset: 0.1764cm`、`6pt`→`0.2117cm`、`0pt`→`0cm`、无声明→`0.3333em`，以及 `text width=2.8cm, inner sep=5pt` 的 `#box(width: 3.153cm, inset: 0.1764cm` 一起断言）；打桩 diff（`_work/probe_inset_regen_guard.py`，桩＝`node_inset` 恒回 `"0.3333em"`）**changed 279 张画布 / 223 篇、写下 1,204 行、lost 0、gained 0**（闸门口径 identical 639 / changed 279 / refused both 14）；闸门 **918/14/0**（与 #41–#45 后同数）。
- **三把量具对账**：普查 `_work/probe_inset_face.py`（包住 `box_args`，按 `_length` 读不读得得分三类）报 **readable 1,207 / default 195**，1,207 处分布在 **280 张画布 / 223 篇**；打桩 diff 只 1,204 行 / 279 张。差额不是噪声：`_work/probe_inset_discarded.py` 逐张比对「本张叫过几次带声明的 `box_args`」与「产物里有几行非默认 `inset:`」→ **1204 == 1204，差异 0 张**，那 3 处活在最终被拒绝的画布上（建得出来但闸门不吃）。作者写的量种类：`5pt` 382、`6pt` 217、`1pt` 122、`2pt` 107、`4pt` 98、`7pt` 92、`1.5pt` 80、`3pt` 60、`8pt` 19……
- **名单收口时漏网的那一族——pgf 把留白分轴写**：重跑 235 篇后产物侧还剩 **74 行 / 19 篇**带默认 `inset:`，逐篇把源语句打出来才看见 `Diagonal-Fourier…` 写的是 **`inner xsep=7pt, inner ysep=6pt`**——同一个留白的**逐轴拼法**（27 处声明 / 11 篇），我的针（`inner sep\s*=`）不认，`node_inset` 也不读。两条神谕把它钉死：
  - **pdflatex**（`_work/measure_tex_inset_axes.py`，读锚点半宽半高）：默认框 `ab` 是 8.811 / 7.005pt，`inner sep=0pt` 是 5.478 / 3.672 → 两轴各花 3.333pt；`inner xsep=7pt` 只推半宽（12.478 / **7.005，竖轴纹丝不动**）；`inner sep=2pt, inner xsep=7pt` 给 x=7 / y=2，**同样两个选项反过来写给 x=y=2**——pgf 按**书写顺序**执行、后面的通用键盖住两轴，与 #43「pgf 从左到右执行选项」是同一条律的再一次现身；`text width=3cm` 半宽 46.212，配 `inner xsep=7pt` 变 49.879、配 `inner ysep=7pt` 仍是 46.212 → **撑宽段落框的只有横轴**。
  - **typst**（`_work/measure_inset_axes.py`，fitz 读四条边距）：`inset: (x: 7pt, y: 6pt)` 横竖各花各的（框 23.500×18.580）；`(x: 7pt, y: 0.3333em)` 这种混排合法、em 仍按该节点字号读（13.246 = 6.58＋2×3.333）；**字典里没写的轴拿到 0，不是默认**——`inset: (x: 7pt)` 的高与完全不写 `inset:` 一模一样（6.580）→ 一发字典就必须两轴都写。
- **修（并轨到一条路）**：新增 `PADDING_KEYS`（566）＋`node_padding(o, xf)`（569），**按选项表的书写顺序**累积两轴、没人写的轴交回 None（默认留给调用方决定它值多少：打印的那路留在 em，要长度的那路取 `INNER_SEP`）。三个消费方从此共用一个来源：`node_inset`（页上的留白，两轴不同就发字典）、`node_inner_sep`（595，横轴 cm：圆的 `padding:`、空节点的半径、`emit_node` 的 `pad`）、`node_frame_width`（524，`text width` 的撑宽）。**§7 原来提的「把 `emit_node` 算好的 `pad` 传进 `box_args`」没采纳**：`pad` 是 cm 浮点，默认 `0.3333em` 经它一算就冻在图头字号上，正是上面那条 em 律禁止的。
- **面**：`_work/probe_padding_face.py` 数出带轴键的框节点 **42 个**（30 个两轴都写、12 个只写横轴；源里 27 处声明是因为一个 `/.style` 喂好几个节点），字典落在 **9 张画布 / 8 篇**；**没有一处把通用键和轴键写在同一个节点上**——「顺序看不见」那一族在本库是空的（样式与节点交错的那种写法才需要真按字节排序，记 §7）。
- **验证**：测试 **114 项全过**（`inner xsep=7pt` → `(x: 0.2469cm, y: 0.3333em)`、两轴相等不发字典、`text width=3cm` 配横轴 `width: 3.494cm` 配纵轴仍 `3.2cm`）；打桩 diff（桩＝`node_padding` 只认 `inner sep`）**changed 10 张画布 / 9 篇 / 55 行，lost 0、gained 0**，而且**箭端跟着框走**（`line((-3.65,-0.5635), (-3,-1.181))` → `(-3.076,-1.181)`，连线终于从变宽后的边框离开）；名单由 `_work/probe_padding_product.py` 驱动（比较**页 vs 新 build 的 `inset:` 记号多重集**）→ **10 篇 47 行**，重跑 **10/10 compile**，复量 **0**。闸门 **918/14/0**。
- **313 → 14 → 10：#45 那个坑的另一面**：`probe_padding_product` 第一版报 **313 篇**。两层原因，都不在转换器里——针扫了整页，把正文排版用的 `inset: (left: 0.5em)` 当成了画布记号；更要紧的是我给 `expand_linewidth` 传了 `line_cm=None`，于是 `\linewidth` 定轴的图**一张都建不出来**，`Harmonic-heights` 那 21 行本来就是对的却被报成残留。**同一份名单，桩的基太窄会漏（#45），太窄也会误报（本轮）**：判据只能是「批跑怎么算列宽，量具就怎么算」——改叫 `convert.line_cm(prep.parse_preamble(src))` 后 313 → 14 → 修好记号范围 → 10 篇，且这 10 篇全是 `0.3333em`（页上花默认、新代码花声明）。

### 轴 25：图内公式被整体引号化印成源码（#47 已修，页上 159 处 / 87 篇 → 79 处 / 46 篇）
- **现象**：`A-Kaplansky…`（KL flowchart）里 `$P_{y,b}=P'_{\iota(y),b'}$` 上页成了 `$"P_(u,b)=P'_(u',b')"$`——整个公式被引号包起来，Typst 把引号串当**正文**排，于是下划线、尖号、命令名全都印成作者打的字母；同一条公式在正文通道里却是真数学。**病根不是映射表缺词，是守卫的形状**：`math_safe` 里「一个 `_`/`^` 得有东西挂着」写成了**允许表**（前一个字符必须是字母数字，或 `"` `}` `)` `]` 五个之一），落在这个表外面的每一种写法都掉进 `_math_body` 的引号回退。
- **神谕一：什么字符能站在 `_` 前面**（typst＋fitz，`_work/measure_script_base.py`，每个前缀一份文档）。判据写了两条，第二条才是关键：**编译过**，**且**页面上不留一个裸 `_`——「靠把下划线排成正文来让编译通过」与拒绝没有区别。测下来 prime（`P'_`）、范数的闭竖线、`+`、`-`、`=`、`/` 之外的字形、甚至**空格**全是合法基底；真正不接受的只有：一个**开括号**收尾（`(_`）、一个**裸 `/`**、**另一个脚本**（`x__`／`x^^`）、`#`、`$`，外加 `/*`、`//`、`*/` 三个注释串和一个字母粘数字（`eq0` 在 Typst 里是一个未知标识符，不是一个乘积）。
- **神谕二：把守卫拒绝的每一条交回权威**（typst，`_work/measure_refused_formulas.py`）。旧表在语料里拒绝 **81 条**画布公式，去重后 **80 个**不同的串逐个作为「它本来要变成的数学」编译 → **80 个全排得出**。这条量具的存在理由写在它自己的 docstring 里：这个守卫的失败模式**不是少一个记号，是整张图掉出页**（不编译的画布被 `cetz.py:1304` 那道闸门吃下），所以「保险起见拒掉」的代价是图，不能凭一张抱怨过的图加一个字符。
- **神谕三：引号词能不能挂脚本**（typst，`_work/probe_typst_script_syntax.py`）——发射器一旦把 label 从引号串里放出来，`$"alpha"_r$` 这种拼写要先单独编译一次确认它合法；这一条是「放出来可不可写」的前置检查，不是可选的验证。
- **修（`tools/t2t/cetz.py`）**：`math_safe`（1255）那一条律换成**否定表**——`for m in re.finditer(r"[\^_]", tex)` 里问的是「前一个**收尾**的字符是不是 `([{/^_` 之一（以及整个串是否空）」，不是「是不是五个许可字符之一」。一条路径、一个名字，其余三条（`#`/`$`、注释串与字母粘数字、首尾裸 `/`）本来就在同一个函数里，形状对齐之后它们读起来是同一句话。
- **验证**：**「脚本没有基底」这一族 81 处 → 0**（`_work/probe_math_safe_refusals.py` 现网重放，`no-base` 桶空），守卫总拒绝 **110 → 29**（81 ＋ 29 ＝ 110 是旧允许表的账面）；页上引号串 **159 处 / 87 篇 → 79 处 / 46 篇**（`_work/probe_quoted_math.py`，按 `canvases()` 只数画布行）；名单由产物侧驱动（`_work/probe_quoted_product.py`，比较的是**记号多重集**不是条数，因为这条改动改变的是公式**长什么样**），重跑后本轮复量 **0 篇 0 行**；闸门 **918/14/0**（与 #41–#46 后同数）；测试 **115**。
- **79 处不是漏网**：新否定表仍然拒掉的 **29 处**分四族（`_work/probe_math_safe_refusals.py` 逐条打到触发的哪一句规则）——字母粘数字 **13 处 / 6 篇**（`W_s0,f_s0`：Typst 把 `s0` 读成一个未知标识符）、串里有 `#`/`$` **10 / 5**（`\#` 是字面井号）、注释串 **4 / 3**（`L_*/3`）、首尾裸 `/` **2 / 1**——守卫在挣它的饭钱；其余引号串是 `_quote_run` **故意**发的词（Typst 把 `eq0`、`kappakappa` 读成一个标识符，作者要的两个字母只能以词的形式落页，见 cetz.py:1246 那条守卫）。同一支量具在**正文**通道报 342 处 / 148 篇，那是 pandoc 那侧的事，与本轮无关。

### 轴 26：路径里的节点读不到样式，只填充的框被编出一条边框（#49 已修，430 行 / 161 张画布 / 122 篇 ＋ 115 节点 / 28 篇）
- **现象（两张都是「记得抽查图片」那一轮的截图带出来的，不是文字量具报的）**：Kurosh 图 3 里 `s₁`/`s₂` 两个白底标签本该**断开**它们所站的那支箭，产物里箭笔直穿过字母。源写的是 `\draw[first] (j) -- node[arrowlabel,pos=.64,above,sloped] {$s_1$} (j1);`（`_work/flat` 2761 行），`arrowlabel/.style={fill=white,inner sep=2pt}` 声明在同一个图的头里（2742 行）。两处断：
  - **`translate_path` 的 in-path 节点没过 `resolve_opts`**：独立 `\node[arrowlabel]` 那条路（3374）一直会展开样式，路径里的 `node[…]` 拿到的是**裸选项表**，于是 `fill`/`inner sep` 一起读不到，发射出来的是 `content((1.5, 0), [$s_1$])`——没有框、没有留白、没有白底。
  - **只写 `fill=` 的框被编造出一条边框**：样式读到之后 `box_args` 仍给每条框补一个 `stroke: (thickness: 0.4pt)`，页上就出现控制版没有的灰盒轮廓。
- **神谕一：pgf 在路径里放的是一个节点**（对照渲染，`_work/render_pair.py` 出 Kurosh 的 tex/typ 两张页图）。控制版里带样式的路径节点有白底框、`inner sep` 让位、`above,sloped` 贴着箭走，与独立 `\node[<name>]` 同读数；四个书写形状（独立／路径内 × 内联量／`/.style`）在修完之后由 `_work/probe_inpath_node_options.py` 打出**逐字相同**的 `content` 行——这条 parity 是我现在唯一能指向的转换器侧证据，「in-path 节点继承 `every node`」这类更一般的说法本库没有单独量过，别当律引（与 #43「pgf 从左到右执行选项」是同一个「样式会到处喂节点」的事实，但只核到了 `/.style` 这一族）。
- **神谕二：只填充不描边**（pdflatex＋fitz 内容流，`_work/measure_fill_only_frame.py`，三个独立文档、每个数一页的路径）。`node[fill=white]` 压在一条长线上 → 页上是**一条 `s`（那支线）＋ 一个 19.4×14.3pt 的 `f` 矩形，矩形四周没有任何描边**；`draw,fill=white` → 同一个矩形变成 `fs`；裸节点（只有 `inner sep`）→ 只剩那条 `s`。这就是 pgf 的 `frame = fill-only → 不 stroke`。而 Typst 的 `box` 不写 `stroke:` 时**画自己的默认框**（§5 那条老坑要反过来读：「不写 stroke 就什么都不画」说的是 `line`，框恰恰相反），所以「无边框」必须说出口。
- **修（两条腿各一个落笔处）**：① `translate_path`（3070）在 `_node_tilt`/`_node_shift`/`_path_pos` 读摆放键**之前**叫 `resolve_opts(no, styles)`——与独立节点那一条（3374）同一个函数、同一个约定，没有新增第二条展开路径；② `box_args`（2017–2025）的描边那一步改成三叉：`stroke_args` 读得到就发读到的、读不到但写了 `draw` 就发 0.4pt、**两者都没有就发 `stroke: none`**。`box_args` 只在 `box_visible(o)` 下被叫（`draw` 或非 `none` 的 `fill`），所以第三叉**只**是 `fill=` 独占那一批，不会把裸节点也发出去。
- **面（只能用旧律打桩来量，见 §5 新增那条）**：`_work/probe_49_face.py` 把 `box_args` 桩回「无颜色就补 0.4pt」的旧行为、逐张画布与现网 diff（列宽一律用批跑那句 `convert.line_cm(prep.parse_preamble(src))`）→ **changed 161 张画布 / 122 篇 / 430 行，lost 0、gained 0**（闸门口径 identical 766 / changed 161）。第二条腿由 `_work/list_inpath_style_nodes.py` 逐节点打到源语句 → **115 个 in-path 节点调用了声明过的样式 / 28 篇**（例：`[arrowlabel,right,pos=.5] -> {'fill': 'white', 'inner sep': '2pt'}`、`[above=9mm,lab] -> {'font': '\footnotesize', 'align': 'center'}`）。两腿并集 **132 篇**写进 `_work/regen_needed.txt`（122 ＋ 28，交集 18）。
- **验证**：重跑 **132/132 compile**（`_work/regen50.log`，111 s）；页上无边界填充框 `_work/probe_49_page_tally.py` 报 **fresh 430 行 / 122 篇 vs 页 427 行 / 122 篇**，差的 3 行由 `_work/probe_49_missing_frames.py` 逐张归属到同一篇四次覆盖论文——探针没重放批次注入的图内声明（`convert.with_declarations`），不是丢内容（`Self-dual` 那篇 16/16 逐张对上）；闸门 **918/14/0**；测试 **116**。截图：Kurosh p34/p36 与 Tachikawa p14/p15/p22 的 300 dpi 裁带与 pdflatex 控制版逐框对照，白底标签断开箭头、自己无边框。
- **顺手把一条**我自己发明的**断言改对了**：`test_a_path_can_take_its_arrow_from_an_invoked_style` 原先断言框上有 `stroke: (thickness: 0.4pt)`，那是我写测试时**替 pgf 发明的**边框（#44 那一轮的产物），不是量出来的。旧断言就是缺陷本身——改断言之前先用 `_work/measure_fill_only_frame.py` 数路径，别反过来让测试把 bug 钉成规格。
- **这一轮同时留下两个新缺陷**（都还是从截图看出来的，见 §7）：**#50** 节点上的裸颜色被当成框的描边色（该染文字），`A-projective-fourfold…-non-Stein…` 产物 404–405 行的 `[blue]` 框着一串黑字；**#51** `to[bend left=12]` 上的 `node[arrowlabel,above]` 落在**弦**上而不是弧上。

### 轴 27：节点上的裸颜色被当成框的描边色（#50 已修）
- **现象**：`A-projective-fourfold…-non-Stein…` 产物 404–405 行，`[blue]` 写在一个 `fill=white` 的框节点上，发出来是 `stroke: (paint: rgb("#1f5791")), fill: rgb("#ffffff")`——页上蓝框包黑字。pgf 的律是裸颜色键染**文字**，要描边得写 `draw=<color>`；`box_visible` 的 docstring 从 #40 起就写着这条，只是没落到描边那一步。
- **修**：`box_args` 的描边三叉第一叉加条件——颜色只有在 `draw` 出现过时才能进 `stroke:`，否则进文字墨色（与 #25 的字号包裹同一条 `#text(...)` 路）。
- **验证**：闸门 918/14/0、测试随轮次涨到 125；该篇重跑后页上框回黑描边、字回蓝墨。

### 轴 28：路径的 stroke 与箭尖按 pgf 模式决定（#52 已修）
- **现象**：`\filldraw`／`\draw`／`\fill` 三个动词的描边与填实组合没被分开读，纯填充的路径被补出一条描边（与 #49 的节点框同族，落在路径侧）。
- **修**：`translate_path` 按动词模式决定 `stroke:`/`fill:` 的有无，不再一律补描边。
- **验证**：闸门 918/14/0；Canonical p99 的 `fill=gatecore!12` 面板在 #54 之前已不再带编造的边。

### 轴 29：无框节点丢掉 `text width`，整张图溢出页外（#53 已修，138 节点 / 56 篇 ＋ 24 节点 / 3 篇）
- **现象**：`Canonical-conformal-limits-o` p99 的 panel (a) 整块跑到页外（节点矩形读到 x=-440pt，`_work/clip_by_colour.py` 按填充色逐页裁带量出）。源写的是 `\node[align=left,font=\footnotesize,text width=7.4cm,inner sep=0pt]`——**没有框**。pgf 的律：`text width=D` 让节点排一段 D 宽的段落，**与画不画框无关**；产物里没有 `box`，Typst 把整段散文排成一行 36cm，画布被撑到 1018pt。
- **神谕**：`_work/measure_box_default_stroke.py` 读 fitz 内容流——一个不写 `stroke:` 的 `#box` 发出**零个描边算子**（没有默认边框），所以拿 `box` 承载量度在页上不花一分钱；`_work/probe_invisible_measure.py` 包住 `emit_node` 数面：写了 `text width` 而无框的节点 **138 个 / 56 篇**，另 24 个写 `minimum width`（3 篇）。
- **修**：`emit_node` 的无框分支在 `width is not None` 时发 `#box(width: …, inset: <节点自己的 inner sep>, <按 align 排好的正文>)`，不带 `stroke:`/`fill:`；同轮把节点标签里的 `\par` 落成 `#parbreak()`（`\\` 仍是 `#linebreak()`）——`_work/measure_node_par.py` 量得固定宽 `box` 里两段之间 20.4pt、行距 14.4pt，四个标签 / 四篇靠它才分成三段。
- **面与验证**：重跑 59/59 compile；全库页外墨扫描 `_work/probe_offpage.py` 由 6 篇降到 4 篇（余下 4 篇是已记的宽画布居中与丢弃 `\clip` 两行）；p99 裁带核验 panel (a) 回页内、7.4cm 注记排成三段；闸门 918/14/0、测试 124。

### 轴 30：图的声明表只跟到第一张图，后面几张画成黑块（#54 已修，1 篇 / 2 张画布 / 8 处黑填充）
- **现象**：同一篇 p99 的 panel (b)/(c) 是两块实心黑。源在 figure 开头写五个 `\definecolor`，后面跟三张 `tikzpicture`；`convert.picture_scopes` 把声明表只交给**紧跟的那一张**，于是第二、三张图里 `fill=gatecore!12` 解析不出颜色，`translate_path` 的黑兜底（cetz.py 的 `if fill is None and painted: fill = "black"`）把面板涂黑。
- **神谕**：TeX 的顶层 `\definecolor` 不在 group 里，对全文其余部分一直有效；`_work/ask_colour.py` 打出第 6 张图 `palette has gatecore: None`、`_work/ask_decls.py` 打出它的 decls 为空串，两条读数把链钉死。
- **修**：`picture_scopes` 的声明改成**向前累积**（`seen` 列表），宏表仍逐图截止（后图的重定义不能回答前图）；docstring 写明累积方向与覆盖顺序。
- **面**：`_work/probe_decls_forward.py` 把旧律打桩回逐图、逐张画布 diff → **changed 1 篇 / 2 张画布，fill: black 2→0 与 6→0**，其余 531 篇逐字相同。重跑该篇后 p99 三个面板全是浅色描边框；闸门 918/14/0、测试 124→125。

### 轴 31：节点标签里的 `\[ … \]` 被印成转义源码（#55 已修，1 标签 / 1 篇）
- **现象**：p99 panel (c) 的注记在页上是 `e^ Hm_*w>2B_0.` 与 `D^{f(p_j,z_j;local collar)}<e.` 两串转义散文。源在节点标签里写了两段 `\[ … \]` 展示公式。
- **链（三节，缺一节都修不掉）**：① `MATH_ENVELOPE.sub("", src)` 本来为剥掉**包着整张图**的展示外壳，却把图内每一个 `\[`/`\]` 一起剥掉；② 剥剩的公式体交给散文通道，命令名被删、符号被转义；③ 就算不剥，`NODE_MATH` 也只认 `$…$` 与 `\(…\)`，且 `.` 不跨行——论文的展示式自成一行，`\[` 与体之间是换行。
- **修**：新增 `strip_envelope`，外壳只在 `PICTURE_ENV` **之外**剥；`NODE_MATH` 加第三支 `\[ … \]` 并带 `re.S`；`node_text` 把展示式发成独占一段的 `$…$`（前后 `#parbreak()`，Typst 里独占一段的数学就是居中展示式），标签首尾的空段落剥掉。
- **面**：`_work/probe_envelope_churn.py` 旧律打桩 diff → **changed 1 张画布、lost 0、gained 0**；`_work/probe_cd_brackets.py` 数 tikzcd 块带方括号定界符 **0 个**。300 dpi 裁带核验注记排成散文＋居中展示式；闸门 918/14/0、测试 125。

### 轴 32：accsupp 的十六进制标签被当成公式印上页（#56，3 处 / 1 篇）
- **现象**：All-temperature p30 一整行 `02212002000640029 ⨯ … D835DCB1…` 跑出左页外 72.8pt（`_work/page_overflow_report.py` 新量具报出：逐篇读 `main.typ` 的 `#set page` 边距，用 fitz 量每行/每支画超出边距盒多少）。源是 `\MathActualText{<hex>}{<math>}`——accsupp 的无障碍宏，hex 是标签串的 UTF-16 码元；旧律第一条只认 4–8 位 hex，56/84 位的标签落进第二条「单参数即公式」，hex 被当公式留下、真公式反而成了裸花括号组。
- **修**：hex 的判据改「码元成对」`(?:[0-9A-Fa-f]{2})+`，长度不再作判据（长度判不住：一个 underbrace 标签 84 位）；测试 126。**面**＝全库 `ActualText{` 后 ≥10 位 hex 的首参：**3 处 / 1 篇**（同一条公式的三个 underbrace 标签，另两篇的 hex 都 ≤8 位旧律已吃下）；重跑 1/1 编译，200 dpi 裁带核验公式与 (6.5) 完整、页外不再有数字。

### 轴 33：编号 display 的编号贴在公式旁而非右边距（#57，全库）
- **现象**：旧律把编号作为 `quad "(3.3)"` 写进数学体：编号不靠右边距（LaTeX 的排法是编号在边距处、正文居中不受它影响），且把已超宽的 display 再撑宽一个编号——`_work/overflow_histogram.py`（新量具：逐篇取最坏超宽行分桶，并标它是不是编号）报 **85 篇 >10pt，其中 32 篇的最坏行就是自己的编号**。
- **神谕**（`_work/tag_place_probe.typ` 三版量出）：`#math.equation(block: true, numbering: …)[ body ]` 的 body 落在**正文模式**（`<=` 印成两个字符；全库重跑 716 篇编译失败，日志的 `compiled=8` 是**成功数**不是失败数）；markup 里裸 `[` 会把方括号印上页、且其中的 `#set` 泄漏成全局（下一条无编号公式也拿到编号）；只有 **code-mode 块** `#[#set math.equation(numbering: n => …)` 换行 `$ body $ <label>]` 三件全对：body 是数学、编号右缘＝页宽−边距、无编号的下一条不受影响、`@` 引用仍解析。编号必须给**函数**：字符串 pattern 会把 `(1.68)` 里的 `1` 当占位符替换掉。
- **面与验证**：全库重跑 run115 **724/724 编译**；超宽 >10pt **85→29 篇**，「最坏行是编号」一族 **32→0**；测试 **127**（新测试用 fitz 量编号右缘贴边距、正文仍居中）。余下 29 篇是超宽公式体、verbatim 代码块与已知宽画布——与 TeX 同病或已另案（Perfect-completeness／Strongly-rational 等）。

### 轴 34：标题后的第一段被缩进（#58，682 篇 article）
- **神谕**（`_work/class_control.py`，pdflatex 两类对照）：article 把标题引出的那段排成齐左（x0=72.0）、下一段才缩进（88.9）；amsart 相反，**每段都缩进**（84.0，含标题后那段，缩进 12pt）。PRELUDE 写的是 `first-line-indent: (amount: 1.5em, all: true)`——682 篇 article 的每一页、每个标题后的第一段都多了一个 LaTeX 从不印的缩进。
- **修**：`_prelude` 按 `p.documentclass` 分派 `(amount, all)`：ams 族 `(12pt, true)`，其余 `(1.5em, false)`；`prep.Preamble` 新增 `documentclass`。测试 129（新测试用 fitz 量两类的 x0：article 72.27/88.8，amsart 84.3/84.3）。
- **面与验证**：run116 **724/724 编译**；产物普查 `all: false` **682 篇**、`all: true` **42 篇**，与 `_work/flat` 的 `\documentclass` 普查逐篇对上；De-Giorgis p3 与 A-conditional-abelianity p3/p4 的 200 dpi 裁带肉眼确认齐左／缩进各归其类。

### 轴 35：标题字号写死 11.5/13pt（#59，2 篇）
- **现象**：PRELUDE 硬写 `#show heading: set text(size: 11.5pt)` 与 level 1 的 `13pt`，而语料 body 字号是 722 篇 11pt、1 篇 10pt、1 篇 12pt——那篇 12pt 的 amsart（A-conditional-abelianity）小节标题 11.5pt **比自己的正文还小**。
- **修**：字号改成 body 的比例（`HEAD_SUB, HEAD_TOP = 11.5/11, 13/11`，`_prelude` 里按 `p.fontsize` 算、`%g` 收尾），11pt 时字符串与今天逐字相同（722 篇零改动），12pt 得 12.55/14.18、10pt 得 10.45/11.82。产物普查三对字号 722/1/1，与 body 普查对上；裁带确认 12.55pt 标题明显大于 12pt 正文。
