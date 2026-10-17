# community.md §3 移出的量具（原文，未改动）

| 文件 | 角色 |
|---|---|
| `_work/probe_relative_units.py` | `em`／`ex` 这类字号相对单位在 tikzpicture 里的面：**全语料 0 处**（语料里 706 个 `em` 全在 `\emergencystretch` 与 `\hspace`，13 个 `ex` 在 `\vrule`／`\\[1ex]`），所以 `UNITS` 少这两个单位没有落点 |
| `_work/probe_justified_cells.py` | 量「空格字形自己有多宽」（`rawdict` 的 chars，只取 `c == " "`），阈值 12 pt。**上一版按相邻词距离量是错的**：公式不进词表，723/724 篇全命中 |
| `_work/probe_font_forms.py` | 统计 `font=` 选项的三种来源 |
| `_work/probe_font_locus.py` | 字号声明位置分类：画布头部 519 / `every node` 231 / 节点级 39 / 正文裸命令 4 |
| `_work/probe_font_coverage.py` | 直接重建画布量覆盖（不依赖批跑）：766/793 带字号图 |
| `_work/probe_font_wrap_check.py` | 逐例验证 `#text(size:)` 包裹与「只写形状不写字号」不误伤 |
| `_work/regen_font_sample.py` / `_work/regen_rest.py` | 小批量 / 收尾重跑，带 compile gate |
| `_work/measure_tex_sizes.py` | pdflatex 测量 `\f@size` |
| `_work/probe_canvas_set_size.py` | 验证 `#text(size:)` 拼写在 canvas 内生效 |
| `_work/probe_leak_names.py` | 每个泄露命令名 + pandoc 原始答 + 出现次数（spell/echo/other 三分类） |
| `_work/probe_verify_spellings.py` / `probe_verify_funcs.py` | 候选拼写单独编译并读回字形，防「编译过但符号错」 |
| `_work/probe_lt_repro.py` / `probe_lt_breakable.py` / `probe_lt_showrule.py` | 长表格断页的最小复现与拼写对照（量出 figure 不可断页） |
| `_work/probe_lt_rows.py` / `probe_lt_after.py` | 断页后行数/表头/caption 落点核验 |
| `_work/probe_cetz_ydir.py` | **CeTz 画布 y 方向神谕**：y 轴向上，tikzcd/矩阵布局的行号要取负（#30） |
| `_work/probe_cd_stacked.py` | `gathered` 单元拆多行的中间量具 |
| `_work/probe_tfrac.py` | 图内 `\tfrac`/`\dfrac`/`\cfrac` 与 `\frac` 的拼写对照（#31） |
| `_work/probe_minipage_census.py` | 并排 minipage 子图与「minipage 里的图按 `\linewidth` 定尺」普查（#32） |
| `_work/probe_minipage_share.py` | `scale_linewidth_in_minipages` 的逐行核对（份额相乘、`\textwidth` 不动） |
| `_work/regen_frac_list.py` / `_work/regen_share_list.py` | 按产物泄露 / 按「跑一遍前后文本比对」精确圈出受影响论文 |
| `_work/probe_cite_token.py` | **pandoc 神谕**：陌生 token 走数学通道后的保留形状，记号拼写据此定（#33） |
| `_work/probe_mathcite_scope.py` | 普查「公式里 cite 外部 bib」的论文（正好 3 篇）；`probe_cite_scope.py` 是其正文对照版 |
| `_work/probe_ltbl_aux.py` | **pdflatex + pandoc 双神谕**：同一 `longtable` 的 aux 七名同答 4 vs Div ident 只留区域内最后一个 `\label`（#34） |
| `_work/probe_ltbl_min.py` / `_work/probe_lt_shape.py` | 最小形状复现与真论文区间的 AST 形状打印（`-t json`，别用 `-t native`：不是 JSON） |
| `_work/probe_alias_scope.py` | 在 `_work/flat/_work_tex`（prep 后、pandoc 前）逐篇比对新旧 alias 规则，量出「只有 1 篇会变」 |
| `_work/measure_node_row_height.py` | **pdflatex 神谕**：行高律 `H = 2·inner_sep + line + (rows−1)·leading`，逐字号量 `line`/`leading`（#35） |
| `_work/measure_node_box_shapes.py` | 各种声明形状（裸节点 / `text width` / `\\[Xpt]` / 结尾裸 `\\`）的实测高，`TEX_LINE_HEIGHT_PT` 的数与「裸节点从不折行」都出自这里（#35） |
| `_work/probe_grown_place.py` | 重放 `build` 前半程，逐个打印命名节点的中心与半宽半高；把「边标签压字」证伪成 `\node` 自身高度的判据就是它（#35） |
| `_work/probe_grown_yield.py` | 比对改动前后的节点表，圈出受影响的画布与论文并写 `_work/regen_needed.txt`（#35：104 张 / 98 篇） |
| `_work/probe_placement_numbers.py` / `probe_grown_test_numbers.py` | 把测试里两处 `content((x, y))` 期望值按新算法逐一算出来 |
| `_work/probe_mark_shapes.py` / `probe_mark_heads.py` / `probe_mark_per_side.py` | **CeTz 神谕**：可用助记符名单、默认头尺寸、每侧独立字典 `mark:` 拼写是否生效（#36） |
| `_work/probe_arrow_yield.py` / `probe_arrow_regen_guard.py` | 按新写法圈重跑名单 / 前后快照 canvases、quoted-latex、marks 三个数（#36：185 张 150 篇 → 311/0/317 走到 311/0/1156） |
| `_work/probe_sane_control.py` | 对照：`sane` 的括号计数否决的 46 张画布**全带 `mark:`**，mark-free 一张也没有——证明撤掉计数不牵扯旧图（#36） |
| `_work/probe_textwidth_yield.py` | 普查声明了 `text width`/`minimum *` 而产物 `#box(` 不带 `width:` 的画布与论文（写 `_work/textwidth_needed.txt`，448 行 / 94 篇） |
| `_work/measure_side_key_offset.py` | **pdflatex 神谕**：`above=d` 让 south 锚离坐标 `d`（中心偏移＝`d`＋半高，不含 `outer sep`），裸 `above` 才加 `outer sep`（#37；`\typeout` 读数要按 `MO (\S+) (-?[\d.]+)pt(-?[\d.]+)pt` 扫，别按空格切列） |
| `_work/probe_accent_shapes.py` | **pdflatex＋正则神谕**：标点控制符直接吃字母、字母控制符不吃（`(?![A-Za-z])` 守卫的依据）；无守卫版把 369 条 `\draw`、107 条 `\color` 当重音，只留作反面证据（#38） |
| `_work/probe_accent_emit.py` / `check_accent_page.py` | 编译画布并从页上读回字形：确认 `Hyperkähler` 落纸、词中不再出弯引号（#38） |
| `_work/probe_accent_regen_guard.py` | 把 `_accents` 打桩成恒等回放旧行为，逐张画布 diff → 4 张画布 / 4 篇（#38） |
| `_work/probe_box_width_anchor.py` → `probe_box_anchor_ruler.py` | **CeTz 神谕**：`content(point, body)` 把排好的 body **居中在点上**，给盒子加宽中心不动（尺子是一根 `line((40,-60),(40,60))`，加宽前后左右各外扩 30.3pt 对称）；`anchor: "left"` 在 CeTz 里不存在，会 panic `Anchor 'left' not in anchors`（#39）。第一版探针读绝对 x 误判成左对齐，是尺子纠正的——**量位置要带尺，别读单点** |
| `_work/probe_width_reconcile.py` | 把 94 篇账面名单与 62 篇 diff 名单**逐篇对齐**（可读／全拒／无键三档），报出 24 篇不一致——差额不解释清楚就不算收口，这 24 篇最后追出 §7 的「形状节点」新面（#39） |
| `_work/probe_shape_size.py` | 声明尺寸的形状节点各是什么下场：`circle`＋`minimum size` 走区间形式（半程＝尺寸一半，正确）、`circle`＋只有 `minimum width` 时 **`frame: "circle"` 消失**、空内容一律拒；附 15 节点 / 7 篇的关键词普查（§7 形状行） |
| `_work/probe_label_emit.py` | 11 张画布的正反例（八方位、花括号、双 label、三条前言键、`[name=L]` 该拒），逐张 `cetz.convert` 编译并读回 |
| `_work/probe_label_regen_guard.py` | 打桩 diff：把 `label_placements` 桩成「答不出任何位置」（`lambda o: []`）回放旧行为——**不桩 `emit_node`**，它的签名与节点本体不是本轮的账。结果 **60 张画布 / 46 篇、lost 3**，那 3 张正是三条前言写法，认识之后 lost 0。名单写 `_work/regen_labels.txt`（**不是** `regen_needed.txt`：`_work/regen_list.py` 只认后者，跑批前要先 `cp`） |
| `_work/probe_label_refusals.py` | 监听 `label_placements` 的 None 出口，把「因不认识而整图拒绝」的写法逐条打出来——LOST 计数说「有三张图坏了」，这一支说「坏在哪三个键上」，两者是同一判据的两半 |
| `_work/probe_circle_regen_guard.py` / `probe_circle_line_shift.py` | #40 的打桩 diff（桩 `node_shape` 恒答 `rect`）→ 138 张画布 / 105 篇、lost 0，行分类 952 空节点 / 238 箭端点 / 155 声明圆 / 87 文字圆；后者把同一张图的新旧画布逐行并排印在源语句旁边，用来把「other」从话解释变成看得见的行。**这两个数都是上界**，见轴 19 |
| `_work/measure_tex_node_text_centre.py` | **pdflatex 神谕**（#42）：作者写了尺寸的节点，字在框**正中**（`minimum width=2cm, minimum height=1cm` dX +0.00 / dY +0.45pt，两行同数，那 0.45 与无框节点同数＝量具常数）；`text width` 贴左（dX -4.13）**但垂直仍居中**（dY +0.31）；`align=center` 覆盖回居中；圆同律 |
| `_work/probe_align_face.py` | #42 的账面：先印九种节点拼写各自发什么（哪几条路有 range 框、哪几条走 `#box(width:)`），再在产物上数「带 range 框的 `content` 行」→ **421 行 / 70 篇 / 152 张画布**（rect 260、circle 161），与打桩 diff 的行数逐条对得上 |
| `_work/probe_align_regen_guard.py` | #42 的打桩 diff：桩 `_box_body`——`horizon=True` 时只回裸 `[text]`，另两条路径交回真函数。因为 range 分支在 #42 之前**根本不叫这个函数**，这一轮的账不多不少（82 张 / 70 篇、lost 0、无 other 行） |
| `_work/probe_block_node_lines.py` | 打印某一篇某张图的画布正文行 ＋ 该样式表合并后的选项表（「框里的字为什么贴左」就是从这里看见发的既是 range 又无 `#align`）；`picture_styles(core)` 要传**前言 dict**而不是正文串 |
| `_work/probe_tip_sites.py` | 七个落点正反例（语句两种顺序、style 覆盖图头、带型图头、命名尖不被默认改写、最内层是不认识的名字时**不回退**到外层）——测试里的断言就是从这里抄的，先印再断言 |
| `_work/probe_tip_regen_guard.py` | #43 的打桩 diff：桩 `cetz.arrow_default = lambda val: None`（守卫整个撤回旧行为，两条读点一起哑），逐图 diff 并按头分类 → **432 张画布 / 284 篇、lost 0**，实心 Stealth 头 1,102 ＋实心 latex 头 557 ＝ **1,659**，与普查的空心 V 行数**逐条对上**。名单写 `_work/regen_needed.txt` |
| `_work/probe_tip_offhead.py` | 打印 `>=` 写在图头**之外**的那几张源语句（本轮 3 张，全在 `\draw[...]` 的括号里）——落点分布只有比例，要判断「漏的是不是同一族」得看原文 |
| `_work/probe_tip_named_split.py` | 把命名画布按来源分两档（`>=` 图头 432 张 1,693 行／逐语句写尖 40 张 193 行），再**逐篇**比 build 张数与页上张数。**就是这一支把 #44 抓出来的**：差额名单五篇，其中 Cylinder 是 build 3／页 0。两个坑：`GE` 正则没捕获组时 `v[0] or v[1]` 交出 `'>'`，把「读不到名字」打印成假象；stdout 的 `TextIOWrapper` 别自己再包一层——导入的模块已经包过，二次包裹报 `I/O operation on closed file` |
| `_work/probe_marker_fusion.py` | 数「摘出去的占位符会不会被读成控制词」：`(?<=[A-Za-z])\begin{tikzpicture}` 3 处 / 1 篇，反向 0 处（#44 的账面） |
| `_work/probe_marker_pad_sample.py` | 补空格前后的逐字节对照：六篇同族论文产物 **IDENTICAL**——「这个改动在别处不花钱」要用字节证，不是用「应该没事」（#44） |
| `_work/probe_brace_scripts.py` | 数页上还带着花括号的分组下标：画布内 **935 处 / 235 篇**、画布外 49 处 / 4 篇（外那批全在 `$"…"$` 引号串里，是**故意**的字面，不算账）。画布内 235 篇与打桩 diff 的 231 篇差 4 篇，差的是转义花括号 `\1_{\{v\}}` 那一族与引号串里那批——**改完之后要复量，剩余要能逐篇解释**（#45） |
| `_work/probe_brace_regen_guard.py` | #45 的打桩 diff：桩 `cetz._group_scripts` 回旧的那一条 `re.sub(r"([\^_])\{([A-Za-z0-9]+)\}", …)`，逐张画布 diff → **918→918 built、changed 300 / 231 篇、lost 0**，写下的分组 936 处、改动行上仍带括号的 2 处（同一篇的转义花括号，见 §7）。名单写 `_work/regen_needed.txt` |
| `_work/probe_inset_face.py` | #46 普查：包住 `box_args`，按 `_length(..., IDENT)` 读不读得得分三类 → **声明了量的框节点 1,207 / 默认 195**，分布在 280 张画布 / 223 篇，另打值的直方图（`5pt` 382、`6pt` 217、`1pt` 122、`2pt` 107……） |
| `_work/probe_inset_regen_guard.py` / `_work/probe_inset_discarded.py` | #46 的打桩 diff（桩＝`node_inset` 恒回 `0.3333em`）→ **changed 279 张 / 223 篇 / 1,204 行，lost 0、gained 0**；对账具逐张比「带声明的 `box_args` 叫了几次」与「非默认 `inset:` 有几行」→ **1204 == 1204、差异 0 张**（那 3 处活在最终被拒的画布上）。**坑**：数非默认行要用 `inset: (?!0\.3333em)`，数全部 `inset:` 会把 195 处默认也算成差额 |
| `_work/probe_inset_product.py` / `_work/probe_inset_page.py` | #46 的产物侧名单（页上几行仍花默认、源里写过 `inner sep` 吗）→ 1,308 行 / 235 篇，重跑后 **74 行 / 19 篇**；`probe_inset_page` 逐篇比「页上的默认行 vs 新 build 的默认行」→ **只有 1 篇真的陈旧**，而那一篇正是分轴拼法那一族。**坑（两轮都踩）**：这类比较的基必须与批跑一致——`line_cm=None` 会让 `\linewidth` 定轴的图一张都建不出来，把已经正确的页报成残留 |
| `_work/probe_padding_regen_guard.py` / `_work/probe_padding_product.py` | #46 第二腿的打桩 diff（桩＝`node_padding` 只认 `inner sep`）→ **changed 10 张 / 9 篇 / 55 行、lost 0、gained 0**，箭端跟着框走；名单由「**页 vs 新 build 的 `inset:` 记号多重集**」驱动：313（针扫到正文的 `inset: (left: 0.5em)` ＋ `line_cm=None`）→ 14 → **10 篇 47 行**，重跑 10/10，复量 **0** |
| `_work/probe_inset_declared_kept.py` | 节点级判据：在 `convert` 的完整前处理基上（1,058 图 / 1,044 建）问「声明了量的节点有没有仍被回成默认」→ **spent 1,207 / 默认 195 / 漏 0**。「应该消失的串」收到 0 之后要用它把「剩下的到底是故意」说清楚 |
| `_work/dump_inset_pic.py` / `_work/dump_padding_pic.py` | 只读打印一图的 `-`/`+` 对照（不碰编译）：把某一篇的画布行与「桩下的画布行」并排出来，用于逐行核对而不是猜。**坑**：论文目录名只能 glob 出来，台账里的 44 字截断名拿去当路径必然 `FileNotFoundError`（`Kurosh` 的真名是 `A-Counterexample-to-Kuroshs-Division-Ring-Problem-September-23-2026`，cmp 图上的 `Rin` 是台账截断） |
| `_work/probe_typst_script_syntax.py` | 发射器改动的前置编译检查（#47）：`$"alpha"_r$`、`$alpha_r$`、`$"alpha" dot.op "x"$` 各编译一次——「把 label 从引号串里放出来」可不可写，先看这一步 |
| `_work/probe_quoted_math.py` | 页上 `$"…"$` 引号串的分通道普查（画布行 vs 正文行用 `probe_tip_product` 那台状态机切）：#47 前 figure **159 处 / 87 篇**，后 **79 / 46**；同支在 body 通道报 342 / 148，那是 pandoc 侧、别混进本轮账面。另打「引号里还剩哪些字符」（`_` 18、`^` 9）——字符种类就是守卫形状的直接证据 |
| `_work/probe_quoted_product.py` | #47 的产物侧名单（比较**记号多重集**不是条数：这条改动改的是公式**长什么样**）→ 重跑后 **0 篇 0 行**。**基与批跑一致**这一条又一次生效：列宽取 `convert.line_cm(prep.parse_preamble(src))` |
| `_work/probe_inpath_node_options.py` | 四个书写形状的转换器侧 parity（独立／路径内 × 内联量／`/.style`，#49）：修完四行 `content` **逐字相同**。它是「修好了没有」的判据，不是 pgf 语义的神谕——语义那一半靠对照渲染（`_work/render_pair.py` 的 Kurosh tex/typ 页图） |
| `_work/list_inpath_style_nodes.py` | 把 115 个节点逐个打到源语句与展开后的选项表（`[arrowlabel,right,pos=.5] -> {'fill': 'white', 'inner sep': '2pt'}`），按键给直方图——「样式喂到路径节点」到底是哪些键，读数不靠猜 |
| `_work/probe_49_page_tally.py` / `_work/probe_49_missing_frames.py` | #49 的产物侧对账：页数 `stroke: none` 框 **427 / 122 篇** vs 新 build **430 / 122 篇**；逐张归属具（切 `frame_args` 时要**在第一层深度的 `[` 处截断**，因为 CeTz 把正文写在 `#box(…)` 里面）把 3 行差额归到同一篇的四次覆盖上——探针没重放 `convert.with_declarations`，不是丢内容 |
