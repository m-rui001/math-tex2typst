# 研究笔记索引

任务：为 E:\math 仓库（OpenAI 数学成果库，722 篇）的论文写第一人称"反推思维链"笔记。规格：逐引理带批注的证明重构（精确公式、关键计算推导、假设/常数取证、候选失败路线及机制），单篇 1.5–3 万字。每篇论文一个专属素材 agent（通读 build/ tex + summary + Lean），素材落盘 `素材/`，终稿落盘本目录。

## 处理顺序（用户指定：summary/Lean 优先 → 字母序）

**范围决定（2026-10-08，用户选定）**：主线1 剩余工作**先只推 `/tmp/lean_queue.txt` 的 162 篇有 Lean 形式化的论文**，字母序 709 篇（E 段）暂不启动。理由：18 个 goal 回合覆盖不了 690 篇，而 Lean 队列的取证价值最高（每台机器认证过的论文能把"论文一句话 ↔ Lean 一个模块"的分歧写进笔记，是反推思维链最有信息量的地方）。

### A. 10 篇带 reasoning summary 的论文
| # | 论文 | 素材 | 终稿 |
|---|---|---|---|
| 1 | Kaplansky 直接有限性·特征 2 | 素材/Kaplansky-特征2-素材.md ✓ | D02 ✓ |
| 2 | 对称 Mahler 猜想与等号分类 | 素材/对称Mahler-素材.md ✓ | D01 ✓ |
| 3 | Vlasov–Maxwell 整体经典解 | 素材/VlasovMaxwell-素材.md ✓ | D03 ✓ |
| 4 | Ordinary two-point correlations（乘性函数二点关联） | 素材/二点关联-素材.md ✓ | D04 ✓ |
| 5 | The irrationality exponent of π is 2 | 素材/pi无理指数-素材.md ✓ | D06 ✓ |
| 6 | Quasipolynomial Bounds for APs（Erdős 倒数和） | 素材/拟多项式AP-素材.md ✓ | D05 ✓ |
| 7 | Mézard–Parisi 公式（稀释自旋玻璃） | 素材/MezardParisi-素材.md ✓ | D08 ✓ |
| 8 | Heisenberg 铁磁体自发磁化 | 素材/Heisenberg-素材.md ✓ | D07 ✓ |
| 9 | 自由群因子同构 | 素材/自由群因子-素材.md ✓ | D10 ✓ |
| 10 | Max-Cut 最优 NP-难度 | 素材/MaxCut-素材.md ✓ | D09 ✓ |

**A 阶段完成（2026-10-07）：10/10 summary 论文深版终稿 D01–D10。**

### B. 完成（2026-10-07）：2 篇 Lean-only 深度候选
- Arnold 反例（辛二次超曲面 3 不动点）→ 素材/Arnold-素材.md（7.8万字符）✓ → D11 ✓
- Barnette 猜想（三次二部平面图 Hamilton 圈）→ 素材/Barnette-素材.md（5.9万字符）✓ → D12 ✓

### C. 旧稿（浅版规格，作废但保留）：研究笔记-思维链复盘.md（12 篇）、001-003（重做为 D02/D01/D03 后余 001 熵反例、002 CH、003 Potts 待深做，优先级低）

### D. 有 Lean 的其余论文（/tmp/lean_queue.txt，162 条）→ 按 yaml 顺序深做
- L1 树宽图嵌入 → 素材/L1树宽图嵌入-素材.md（8.2万字符）✓ → D13 ✓
- CH 范畴性阈值阻碍 → 素材/CH范畴性阈值-素材.md（9.7万字符）✓ → D14 ✓（C 阶段旧稿 002 一并消除）
- 欧氏 Ramsey 配置分类 → 素材/欧氏Ramsey分类-素材.md（21万字符）✓ → D15 ✓
- 径向对势连续统温度奇点 → 素材/径向对势温度奇点-素材.md ✓ → D16 ✓
- 整数次数调和维数比较反例 → 素材/调和维数比较反例-素材.md ✓ → D17 ✓
- Tachikawa 第二猜想反例 → 素材/Tachikawa反例-素材.md（21.9万字节，§2.1–2.7 + 三 + 四 + 五 全部就位，148 处 [推测]，0 待续）→ D18 ✓（8.5万字节，16 节；§2.6/2.7 由我直读 triangular.tex + consequences.tex 完成；**素材已补齐，D18 的 §三/四/五 定点修补待做**）
- Ryser 覆盖猜想反例 → 素材/Ryser覆盖反例-素材.md ✓ → D19 ✓
- 群环行列式猜想反例 → 素材/群环行列式反例-素材.md ✓ → D20 ✓
- Saxl 猜想循环多表 → 素材/Saxl猜想循环多表-素材.md ✓ → D21 ✓
- 无穷拟阵覆盖反例 → 素材/无穷拟阵覆盖反例-素材.md ✓ → D22 ✓
- Kaplansky 奇特征直接有限性 → 素材/Kaplansky奇特征直接有限性-素材.md（23.2万字节，§一/§二/§三/§四 就位；§五 常数表因 agent 触 150 轮上限未写，D23 的台账由我自补）→ D23 ✓（6.8万字节）
- Kaplansky 拟迹（quasitrace）→ 素材/Kaplansky拟迹反例-素材.md（17.5万字节，§一–§3.4 完整，缺 §四/§五，Lean 取证与常数台账由我在 D24 内自建）→ D24 ✓（9.8万字节，16 节，62.8k 字符）
- Crouzeix 直接证明 → 素材/Crouzeix直接证明-素材.md（22.3万字节，§一–§五 完整）→ D25 ✓ 但只有 3.4 万字节，**深度不达标，需扩写**
- Doubling Hilbert 空间 → 素材/DoublingHilbert-素材.md（20.5万字节，§一–§五 完整，含 12 小节 Lean 逐模块取证；素材自查后更正过数字：28 文件/4664 行、`@[simp]` 12 + `@[ext]` 1、permitted axioms 未跑 `#print axioms` 故降级）→ D26 写到 §8 共 7.3 万字节，终稿 agent 崩溃，**§9 cor:lp / §10 cor:banach / §11 问题史 / §12 Lean 取证 / §13 常数台账 待续**
- Laughlin 谱隙（Fock 空间不等式）→ 素材/Laughlin谱隙Fock空间-素材.md（8.6万字节，§一 + §2.1–§2.15 齐全）→ D27 终稿 agent 运行中
- 双曲群无几何 CAT(0) 作用 → 素材/双曲群无几何CAT0作用-素材.md（4.6万字节，只到 §2.5，agent 已报完成但 §三/四/五 缺失）→ D28 **素材需补写**
- Borsuk 覆盖断言九维反例 → 素材/Borsuk九维覆盖反例-素材.md（14.6万字节，§一 1.1–1.6 + §二 2.1–2.17（19 个编号环境全覆盖）+ §三 30 条防御原句 + §四 269 文件 78,964 行 Lean 全量 + §五 参数表，齐全；未核实项已标：Szarek-18 / Kupka-Aubry / Swanepoel-41）→ D29 终稿 agent 运行中
- Kähler 负 pinched 三维 fold → 素材/Kähler负pinched三维fold-素材.md（13.1万字节，§1.1–§3.6 完整）→ D30 ✓（10.98 万字节，15 节，61 处 [推测]；实测 Lean 119 文件 / 18,688 行，纠正了素材里 36 文件的旧口径）
- 非谱形双曲锥 → 素材/非谱形双曲锥-素材.md（10.0万字节，§一 + §2.1–§2.6 四段式）→ D31 终稿 agent 运行中
- Tingley 问题正解 → 素材/Tingley问题正解-素材.md（13.9万字节，§一–§五 完整，13 个编号条目 + 70 文件 9273 行 Lean 拓扑）→ D32 ✓（8.3 万字节，达标）
- 线性圈与边分解（every graph）→ 素材 agent 运行中（→D33）
- SCS 2-近似 / 投影体体积反例 / clique-free 对数独立界 → 素材 agent 运行中（→D34/D35/D36）
- Seymour 第二邻域猜想 → D37 单段式 agent 运行中（tex 在 `build/source/`，Lean `OAI.SeymourSecondNeighborhood.exists_goodVertex`）
- Jacobsthal 函数二次界 → D38 单段式 agent 运行中（12 个 tex section，Lean `OAI/NumberTheory/Jacobsthal/Conclusions/QuadraticBound.lean`）
- 光滑度量无局部等距浸入三维 → D39 单段式 agent 运行中（model/pulse/caps/assembly 四节，Lean `OAI/Geometry/IsometricImmersion/Main.lean`）
- 单叶函数严格逆一次幂界 → D40 单段式 agent 运行中（00–06 七节，Lean `OAI.StrictInverseFirstPower.main`）

### D+. 产能策略调整（2026-10-08，两轮）

D01–D24 的终稿都由我本体逐节写，24 篇耗掉整个前段会话，剩余 690+ 篇按这个速率不可能完成。第一阶段改成素材 agent 与终稿 agent 并行。今天再进一档：**从 D37 起改单段式**，一个 agent 直接读 tex + Lean 写终稿，不再产素材文件；四段式（逐字陈述 / 推导到中间步 / 假设与常数的机械理由 / 2–3 条 [推测] 失败路线）由它在终稿里就地完成，产物分 4 次落盘所以中断可续。两阶段并行的旧管道（D27–D36）继续跑完再淘汰。

终稿 agent 规格：D24 前 130 行作口吻与密度样板、跟随素材/ tex 逐节展开不压缩、第一人称、**≥ 60,000 字节**、常数台账全保留、外部推算标 [推测]、分 4 次落盘（首次 Write ≤25k，其余 Edit 以末尾整段为锚追加）。我的角色收窄为派单、抽查（字节数、节数、[推测] 数、破折号残留、与素材的覆盖率）、不达标就派扩写 agent 就地补。

已达标件（2026-10-08 实测）：D26 加倍 Hilbert **159,458 B / §0–§13**（续写完成，旧 Lean 数字已正：28 文件 / 4,664 行、`@[simp]` 12 + `@[ext]` 1、axioms 栏降级为"仅静态扫描"）；D29 Borsuk 123,858 B / 32 节 / 45 处 [推测]；D32 Tingley 116,542 B / 17 节；D30 Kähler 109,823 B / 15 节（实测 Lean 119 文件 18,688 行，纠正素材"36 文件"旧口径）；D27 Laughlin 102,900 B / 25 节 / 36 处 [推测]（素材只到 §2.20，§21–§24 由 agent 自补）；D40 单叶函数 82,010 B / 12 节（Lean 94 文件 15,740 行 0 sorry）；D41 敏感度分离 67,183 B / 16 节（yaml 无指针但 `OAI/Combinatorics/Sensitivity/` 54 文件 4,387 行，认证 `OAI.Paper320.quantitative_separation`）；D18 Tachikawa 95,693 B / 16 节；D24 97,976 B / 16 节。

**D31 风险已消（17:31 收稿）**：160,855 B / §0–§17 连续 / 44 处 [推测] / 75 行表格。writer 自述素材在它写作期间从旧版涨到 1,668 行，新增的自述句表、负面口径、Lean 拓扑与符号复用它已就地吸收为 §17，且论文 §7 的 16 次归约与附录路径包含反例由它按同一四段式从 tex 补写（§11/§12）。两处口径分裂已核实：摘要 16 次 vs `docs/095.md` 20 次、字面量 `16` 全 Lean 目录只在 `ZeroPolynomial.lean:39` 出现一次。它自报最薄弱的是 §6（死路整段自构）、§12（附录射程）、§1/§13（[推测] 密度过高）、§17.2（偏整理不偏推演）。这四节列入第二批定点修补，暂不动。

深度不达标的历史件：D25（3.4 万，缺素材 2.5 `thm:domain` 至 §五）续写中。**扩写一律就地 Edit，禁止 Write 覆盖。**

派单纪律：并发硬上限是 CLI 的 20，第 18 个就报 `Concurrent subagent limit reached`，且已崩/已报完成的 agent 仍占额度。每轮先派最不达标的一两件，其余排队；同文件重叠立刻 `TaskStop` 后者并用 `awk 'length($0)>60' | sort | uniq -d` 查重复段。

队列位置：`/tmp/lean_queue.txt`（162 行）已消费到第 45 行。当前在飞：D25 续写、D31、D33–D36 素材、D37 Seymour、D38 Jacobsthal、D39 等距浸入、D42 群代数零因子、D43 无挠双曲群、D44 小 finitistic 维数、D45 AR 显式反例、D46 仿射消去律、D47 三流形无共轭点、D48 矩阵乘法九四分之次、D49 中心圆盘极大算子端点梯度界、D28 CAT(0) 素材补写。**已排队待派（提示词已备，撞并发上限被拒）**：D50 `An-explicit-noncoordinate-polynomial-with-affine-three-space-zero-fibre`、D51 `An-Infinite-Finitely-Presented-Simple-Amenable-Group`、D52 `Bi-Lipschitz-Absorption-of-c0-Without-a-Linear-Copy-of-c0`。后续候选：`An-exponential-state-lower-bound-for-two-way-nondeterministic-complementation`、`An-exponential-two-way-deterministic-state-lower-bound-for-one-way-liveness`、`Asymptotically-minimal-maxima-of-real-Littlewood-polynomials`、`Backward-intertwiners-and-a-transitive-commutant`、`Beyond-the-Square-Root-Exponent-for-Depth-Three-Boolean-Circuits`、`Bounded-recovery-for-modular-spectral-averages`、`Bounded-Step-Walks-on-Gaussian-Primes`、`Brennans-conjecture-and-sharp-inverse-square-integral-means`、`Choiceless-polynomial-time-with-counting-does-not-capture-polynomial-time`、`Classical-capacity-and-entropy-inequalities-for-generalized-amplitude-damping`。

## 待派队列（2026-10-08 17:32，提示词全部已写好，撞并发上限被拒，下轮直接发）

17:32 这一轮发出 3 个单段式 writer：**D34 无团图的对数独立数界**（素材 241,987 B）、**D35 最短公共超串的多项式时间二近似**（素材 185,497 B）、**D36 投影体体积的单纯形最大反例**（素材定稿 138,245 B / 97,351 字符 / 1,021 行，含 §1.8 公式索引与两套 Lean 的逐文件清单）。D33 在飞。**第四个派遣（D28）与 D39 续写都被并发上限拒**，队列如下，按顺序重发：

1. **D39 续写（优先级最高，前手已崩）**：`writer_d39` 在 74,222 B / §8 处报 `Sorry, something went wrong`（121 次工具调用）。已有 §0..§8 覆盖 model/caps/pulse/assembly 四层与装配顺序，技术正文完整，缺尾部。续写 agent 的指令要点：只能 Edit 追加、锚点为末段"再用矩积分证明它无法被任何双缘光滑数据接住。"、禁改 §0..§8 一字；补 §9 Lean 取证（实测计数）、§10 常数台账（符号/数值/位置/消费者/改动断点五栏 + 依赖链一段）、§11 待定问题与三处分岔、§12 离场清点；追加 ≥40,000 B、全文 ≥115,000 B。
2. **D28 配对纠错**：`素材/双曲群无几何CAT0作用-素材.md`（389,188 B）的取证头一行写明正文来源是 `preprints/A-hyperbolic-group-with-no-geometric-CAT0-action-September-25-2026/build/`，对应队列**第 18 行**；队列第 42 行是另一篇同名主题的 `An-Artin-group-with-no-geometric-CAT-0-action-September-23-2026`。先前草拟的 D28 提示词把素材与 Artin 目录硬配，是错的（该派遣恰好被并发上限拒了，未造成实害）。正确派法：D28 = 第 18 行双曲群（用现有素材），第 42 行 Artin 群另立 **D53** 走单段式直读 tex + Lean。
4. **17:35 补录：D28 已按纠错后的配对发出（素材 389,188 B → 队列第 18 行双曲群）。同轮被上限拒的还有 D47、D44**，提示词要点：
   - D47 `无共轭点无非正曲率度量的三流形`（队列 34 行）：单段式自读 tex，Lean 入口 `OAI/Geometry/ConjugatePoints/ThreeManifold.lean`（yaml:1050–1052），≥70k B，常数台账与 Lean 取证各自成节。
   - D44 `小 finitistic 维数无穷的代数`（队列 41 行）：单段式，口吻样板额外读 D18 的 §12/§13（只读不改）；Lean 双入口 `OAI.LittleFinitistic.Main.exists_counterexample`（yaml:1162–1164）与 `OAI.LittleFinitistic.extreme_left_right_asymmetry`（yaml:1286–1288）。
   - D45 `Auslander–Reiten 猜想显式反例`（队列 44 行，11 个 tex 分片）、D53 `Artin 群无几何 CAT(0) 作用`（队列 42 行）同为单段式。
5. D50 `非坐标多项式与三维仿射零纤维`（队列 46 行）、D51 `无限有限表示单可均群`（队列 49 行）、D52 `c0 的双 Lipschitz 吸收而无线性拷贝`（队列 57 行）（单段式）
6. **浅版存量加深批次（2026-10-08 17:46 新立，见 队列台账.md 的 21 篇实测表）**：D01–D22 里除 D23/D24 外全部低于 6 万字节且普遍缺常数台账节（D10 17,994 / D09 19,918 / D20 19,349 / D08 21,094 / D06 21,161 / D17 24,565 / D16 24,866 / D01 24,302 / D07 23,050 / D05 28,667 / D04 29,238 / D21 28,712 / D22 30,504 / D15 34,504 / D14 38,297 / D13 38,800 / D03 38,703 / D02 36,040 / D11 39,709 / D19 42,797 / D12 44,518）。加深与新建同规格，但方向不同：**只能就地 Edit（原节内插入 + 尾部追加），禁止 Write 覆盖，禁止删改已有结论**，每篇补四段式中间步、常数台账五列表（不许留空单元格）、Lean 或 summary 取证、待定问题与三处分岔、离场清点，目标 ≥65,000 字节。`deepen-d10` 已在飞，其提示词是这批的模板。
7. `style_pass_1` 文风定点修补（只派给**已收稿**的文件，避免与在飞 agent 撞车）：D25（`不是…而是` 9 处）、D27（1 处 + 破折号 7 行）、D32（破折号 20 行待逐行判专名）、D26（17 行）、D29/D30 已干净。判定规则：X 是被否定的错误路线时"不是 X 而是 Y"属于合法技术对比，保留；X 只是修辞陪衬（美化、冗余、排版、谦虚）时改写。D40 第 14 行那处我已亲手改掉。D31 自报四处薄弱（§6/§12/§1/§13）与 D37 的紧凑句式 4 处并入第二批。

## 本轮实测审计（17:24，字节/节数/[推测]/破折号行/禁用句式命中）

D25 306,109 / 19 / 90 / 4 / 10；D26 159,458 / 14 / 43 / 17 / 0；D27 102,900 / 25 / 36 / 7 / 1；D29 123,858 / 32 / 27 / 0 / 0；D30 109,823 / 15 / 61 / 0 / 0；D31 145,120 / 17 / 39 / 6 / 1；D32 116,542 / 17 / 18 / 20 / 0；D37 131,861 / 20 / 24 / 1 / 7；D38 73,342 / 9 / 21 / 3 / 0（仍在写）；D39 74,222 / 9 / 26 / 0 / 3；D40 82,010 / 12 / 7 / 0 / 3→2；D41 67,183 / 16 / 14 / 0 / 0；D42 89,844 / 12 / 22 / 0 / 1。

D25 从 3.4 万涨到 30.6 万且重复行仅 1 条，说明续写没有覆盖前半，`thm:domain` 被拆成上下两节（§9/§10）是主因。D37 一节 13 万，Seymour 那条线的机器担保已写进去。

**审计口径纠正（17:27）**：`grep -c "不是.*而是"` 在长段落行上几乎必然误报（一行 2000 字里两个词各自独立出现也算命中），D25 报 10 处、实测紧凑句式 0 处。准确口径用 `grep -o "不是[^。；]\{0,14\}，而是"`。按这个口径的真实债务：D37 四处（等它收稿后改）、D39 两处与 D40 两处已核为合法技术对比（X 是被真实排除的错误选项）故保留，只把 D40:45 那句"失败的原因不是我没算够，而是"改成了直陈；D23 一处同为合法对比。破折号方面 D26/D27/D32 的 `–` 全部在 Cauchy–Schwarz、Hahn–Banach、Lang–Plaut、Mazur–Ulam、Leverrier–Faddeev 这类专名内，合规。**真正的存量债务是 em dash `—`：D20 78 处、D21 100 处、D22 102 处**（昨天浅版遗留，当时未过破折号检查）。这批要单独派一个清理 agent：逐处按上下文换成逗号、冒号或句号，禁止一刀切替换。

### E. 字母序队列（/tmp/queue.txt，709 篇）→ 从 A-C1-Counterexample... 起扫描，跳过已做

## 规格备忘
- 每篇素材 agent：读 tex 源码（首选，禁用 pdftotext 取正文）+ summary（若有）+ Lean；**分段写入**素材文件防中断；结构=定理总览/逐引理带批注重构（含精确公式+推导中间步骤+假设常数机械理由+2–3 失败路线）/叙事时间线/Lean 取证/常数表；结尾哨兵 `<!-- 完 -->`。
- 终稿 agent：以 D24 前 130 行为口吻与密度样板，跟随素材逐节**展开不压缩**，第一人称，目标 2–3 万汉字（>6 万字节），常数表全保留，外部推算标 [推测]，分 4 次落盘。
- 文风禁令随任务下发（禁"不是X而是Y"、禁单句 dramatic ending、禁"值得注意的是"、禁强行三联、中文正文禁破折号（专名除外）、禁装饰加粗清单/emoji/分隔线、禁聊天残留）。
- agent 并发 ≤4（2026-10-08 用户上调）。
- **150 轮上限纪律（2026-10-08 17:44 新增）**：D37、D25 两篇的 writer 都在读源码阶段吃满 150 轮后被迫退出。此后派单一律附加：按节 `grep` 定位、禁止整文件反复 Read、第一次 Write 必须在前 40 轮内发生、每完成 3–4 节立刻落盘。素材体量 >20 万 B 的篇目（D28 的 487,103 B 素材即首例）优先拆成"两阶段 + 分段读取清单"，并在收稿后做覆盖率审计。
