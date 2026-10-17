# C46 ample线丛的局部正性（arXiv:alg-geom/9408003）

## 0 取证边界

- arXiv id：`alg-geom/9408003`（素材头部转发行给出投递时间 Tue, 9 Aug 1994 12:54:08 -0700，`main.tex:1-3`）。
- 原题名（逐字）：Local Positivity of Ample Line Bundles。
- 作者（逐字，API 署名）：Lawrence Ein, Oliver Küchle, Robert Lazarsfeld；素材扉页三行署名 `Lawrence Ein`、`Oliver K\"uchle`、`Robert Lazarsfeld`（`main.tex:52-57`），并带 NSF 与 DFG 资助脚注。
- 发表年月：1994-08-09。
- 素材目录：`E:\math\被引素材\alg_geom_9408003`，唯一文件 `main.tex`，实测 54104 字节、1272 行（派单记 1273 行，以盘面 1272 为准；差在末行 `\bye` 计数）。文档类 `amsppt`，版头自述 "AMS-TeX version 2.1, 23 pages"（`main.tex:11`）。
- 本语料引用它的稿号与 bib key（原样登记）：D318（bib key `EKL1995`）；D385（bib key `EKL1995`）。
- 取材薄读之处：`main.tex:1201-1272` 为参考文献尾部（键 `KoMM`、`La`、`Mo`、`Nad`、`Nak`）与作者地址块，只用于核对引用键名，不作内容来源；素材无图形文件，无 `.pdf`；取证共 4 次读取，覆盖 `main.tex` 全篇 1-1272 行。
- 记法换算登记：素材宏 `\P`/`\Pb`（即 `\bold{P}`/`\Bbb P`）一律写作 `\mathbb P`；`\O`、`\F`、`\I`、`\B`、`\V`、`\D` 这些 `\Cal` 形写作 `\mathcal O`、`\mathcal F`、`\mathcal I`、`\mathcal B`、`\mathcal V`、`\mathcal D`；`\R`、`\Q`、`\Z`、`\C` 写作 `\mathbb R`、`\mathbb Q`、`\mathbb Z`、`\mathbb C`；`\eps` 写作 `\varepsilon`；`\mult` 写作 `\operatorname{mult}`；`\cv` 写作 `\cdot`；`\rndup{}`（取整括号 `\ulcorner\urcorner`）不在正文搬用，按文义写成取整描述。

## 1 论文申报的主定理与 Seshadri 常数的两条定义

论文目的在引言开头申报：对任意维复射影簇上的一般点，给出度量 ample 线丛局部正性的 Seshadri 常数的下界（`main.tex:63-65`）。设 $X$ 为不可约复射影簇，$L$ 为 nef 线丛，$x \in X$ 为光滑点。Demailly 定义（吹高形，`main.tex:71-78`）：取 $f : Y = \operatorname{Bl}_x(X) \to X$ 与例外除子 $E = f^{-1}(x)$，则

$$ \varepsilon(L, x) = \sup \{ \varepsilon \ge 0 \mid f^{*}L - \varepsilon \cdot E \ \text{为 nef} \}, $$

其中 $f^{*}L - \varepsilon E$ 按 $\mathbb R$-除子理解，nef 意为对每条不可约曲线 $C' \subset Y$ 有 $f^{*}L \cdot C' \ge \varepsilon\, E \cdot C'$（`main.tex:79-81`）。两条即时事实：$L$ Very ample 时 $\varepsilon(L,x) \ge 1$ 对每个光滑点成立（`main.tex:81-82`）；Seshadri 判据说 $L$ ample 当且仅当存在 $\varepsilon > 0$ 使 $\varepsilon(L,x) \ge \varepsilon$ 对一切 $x \in X$ 成立（`main.tex:83-88`）。前史：在光滑射影曲面上，ample 线丛满足 $\varepsilon(L,x) \ge 1$ 对至多除去可数多个点成立（`main.tex:93-96`），这条初等结果是本文高维推广的出发点。

主定理 Theorem 1（`main.tex:102-110`）逐条给出：设 $L$ 为 $n$ 维不可约射影簇 $X$ 上 nef 且 big 的线丛，则

$$ \varepsilon(L,x) \ge \frac{1}{n} $$

对 $X$ 除去可数个真闭子簇并集之外的所有 $x$ 成立；进一步若 $L$ ample，则对任意 $\delta > 0$，集合 $\{ x \in X \mid \varepsilon(L,x) > \frac{1}{n+\delta} \}$ 包含 Zariski 开稠密子集。更强的一般判别形（`main.tex:111-116`）：若存在可数真闭子簇并集 $\mathcal B \subset X$ 与实数 $\alpha > 0$，使得对 $1 \le r \le n$ 和每个不含于 $\mathcal B$ 的 $r$ 维子簇 $Y \subset X$ 有

$$ \int_Y c_1(L)^{r} \ge (r \cdot \alpha)^{r}, $$

则充分一般的 $x \in X$ 处 $\varepsilon(L,x) \ge \alpha$。尖锐性方向：Miranda 构造给出对任意 $b > 0$ 存在 $X, L, x$ 使 $0 < \varepsilon(L,x) < b$（`main.tex:117-120`），故不存在与 $X, L$ 无关、在每个点都成立的下界；而常数 $\frac{1}{n}$ 大概率不最优，作者猜想充分一般点处 $\varepsilon(L,x) \ge 1$（`main.tex:121-124`）。

约定（`main.tex:237-265`）：全文在复数域上工作；"一般点"指非空 Zariski 开集，"充分一般点"（very general）指除去可数个真闭子簇（`main.tex:241-244`）；$L^{r} \cdot Y = \int_Y c_1(L)^{r} \in \mathbb Z$ 记子簇次数（`main.tex:246-249`）；nef 即对所有有效曲线 $L \cdot C \ge 0$，Kleiman 判据等价于落在 $\operatorname{NS}(X)_{\mathbb R}$ 中 ample 锥闭包内，nef 且 big 等价于 $L^{n} > 0$（`main.tex:250-257`）。这些约定同样适用于 $\mathbb Q$-Cartier $\mathbb Q$-除子的数值类（`main.tex:257-258`）。

## 2 Seshadri 常数初等论：jet 刻画、开性、Miranda 例与上界

定义 1.1（$\inf$ 形，`main.tex:276-286`）：

$$ \varepsilon(L,x) := \inf_{C \ni x} \left\{ \frac{L \cdot C}{\operatorname{mult}_x(C)} \right\}, $$

下确界取遍过 $x$ 的所有约化不可约曲线 $C \subset X$；$L$ 只需是 $\mathbb Q$-Cartier $\mathbb Q$-除子。引理 1.2（`main.tex:291-298`）声明 $\inf$ 形与吹高 $\sup$ 形相等价，且上确界实为最大值（`main.tex:299`）。

jet 生成刻画（命题 1.3，`main.tex:312-328`）：设 $L$ 在 $n$ 维光滑射影簇上 nef 且 big。(1.3.1) 若 $r > \frac{s}{\varepsilon(L,x)} + \frac{n}{\varepsilon(L,x)}$，则 $|K_X + rL|$ 在 $x$ 生成 $s$-jet；等号边界 $r = \frac{s+n}{\varepsilon(L,x)}$ 时加条件 $L^{n} > \varepsilon(L,x)^{n}$ 结论不变。(1.3.2) 反向：若存在 $\varepsilon > 0$ 与常数 $c$ 使得只要 $r > \frac{s}{\varepsilon} + c$ 就有 $|K_X + rL|$ 在 $x$ 生成一切充分大 $s$ 的 $s$-jet，则 $\varepsilon(L,x) \ge \varepsilon$。效果上算 $\varepsilon(L,x)$ 等价于找线性函数 $f(s)$ 使伴随系列 $|K_X + f(s)L|$ 在 $x$ 生成 $s$-jet（`main.tex:308-311`）。

证明链（`main.tex:331-356`）。方向一（Demailly Prop. 6.8 式论证）：归约到消没 $H^{1}(X, \mathcal O_X(K_X + rL) \otimes \mathcal I_x^{s+1}) = H^{1}(Y, \mathcal O_Y(K_Y + rf^{*}L - (s+n)E)) = 0$，数值分解为中间式

$$ rf^{*}L - (s+n)E \equiv \frac{s+n}{\varepsilon}\,(f^{*}L - \varepsilon E) + \left( r - \frac{s+n}{\varepsilon} \right) f^{*}L, $$

两项分别 nef、系数非负，且整体 big，Kawamata-Viehweg 消没给出结论（`main.tex:337-341`）。方向二：取过 $x$ 的约化不可约曲线 $C$，$\operatorname{mult}_x(C) = m$；$|K_X + rL|$ 生成 $s$-jet 的几何含义是可取 $D_x \in |K_X + rL|$ 使 $\operatorname{mult}_x(D_x) = s$ 且切锥任意给定，令 $D_x$ 与 $C$ 的切锥正常交，则 $D_x$ 与 $C$ 本身正常交，得

$$ C \cdot (K_X + rL) \ge \operatorname{mult}_x(C) \cdot \operatorname{mult}_x(D_x) = m \cdot s, \qquad \frac{C \cdot L}{m} \ge \frac{s}{r} - \frac{C \cdot K_X}{r m}, $$

再由 $r \le \frac{s}{\varepsilon} + c + 1$ 与 $s \to \infty$ 取极限（`main.tex:343-355`）。

开性引理 1.4（`main.tex:363-381`）：$L$ ample，若已知某光滑点 $y$ 处 $\varepsilon(L,y) > B$（$B$ 正有理数），则 $\{ x \mid \varepsilon(L,x) > B \}$ 含 Zariski 开稠密集。论证：由 (1.2) 知 $M_y = f_y^{*}L - B E_y$ ample，而 ampleness 在平坦族中是开条件，故存在光滑点集上的非空开子集 $U$ 使 $x \in U$ 时 $M_x$ ample，再由 (1.2) 反推 $\varepsilon(L,x) > B$。这条把 very general 结论升格为 open 结论，是定理 1 第二句的引擎。

Miranda 例（命题 1.5，`main.tex:387-413`，给出 $0 < \varepsilon < b$ 的具体构造）：取 $\mathbb P^{2}$ 中 $d \gg 0$ 次约化不可约曲线 $C$ 与重数 $m > \frac{1}{b}$ 的点 $y \in C$；再取 $d$ 次既约曲线 $C'$ 与 $C$ 横截，$d$ 充分大且 $C'$ 足够一般时，$C, C'$ 张成的铅笔中每条曲线约化不可约。吹高铅笔基底得曲面 $S$ 与纤维化 $f : S \to \mathbb P^{1}$（不可约纤维，其一即 $C$），例外除子给出与 $C$ 在一点横截的截面 $\Gamma$。固定 $a \ge 2$，令 $N = aC + \Gamma$：Nakai 判据给 $N$ ample；数值为 $N \cdot C = 1$ 而 $\operatorname{mult}_y(C) = m$，故 $\varepsilon(N,y) \le \frac{N \cdot C}{m} = \frac{1}{m} < b$。高维化按 Viehweg 观察：$X = S \times \mathbb P^{n-2}$，$L = \operatorname{pr}_1^{*}N \otimes \operatorname{pr}_2^{*}\mathcal O_{\mathbb P}(1)$，则 $\varepsilon(L,(y,z)) \le \varepsilon(S,y) < b$ 对一切 $z$，坏集 $V = \{y\} \times \mathbb P^{n-2}$ 为余维 2（`main.tex:408-412`）。 Remark 1.6：余维 1 坏集上能否任意小未解决，曲面情形已被 EL 排除（`main.tex:415-417`）。

Remark 1.7（`main.tex:420-434`）：Fujita 猜想主张 $n$ 维光滑簇上 ample $L$ 使 $\mathcal O_X(K_X + (n+1)L)$ 自由、$\mathcal O_X(K_X + (n+2)L)$ very ample；外推 hoped 形式 $|K_X + (n+s+1)L|$ 在每点分离 $s$-jet 不真：由 (1.3.2) 与 (1.5)，不存在依赖 $n$ 而与 $X, L$ 无关的线性 $f(s)$ 使 $|K_X + f(s)L|$ 在全部点生成 $s$-jet（$s \gg 0$）；曲面上则存在二次 $f(s)$（Beltrametti-Sommese、Demailly）。

Remark 1.8（`main.tex:436-453`）：上界 $\varepsilon(L,x) \le \sqrt[n]{L^{n}}$ 对一切 $x$ 成立，理由是 $(f^{*}L - \varepsilon(L,x)E)^{n} \ge 0$。应用例：$X$ 简单 Abel 簇、$L$ 主极化时，Nakamaye 证 $\varepsilon(L,x) \ge 1$ 于所有点，于是

$$ 1 \le \varepsilon(L,x) \le \sqrt[n]{n!} \approx \frac{n}{e}, $$

齐性使该值与 $x$ 无关，成为 p.p.a.v. 的典范实不变量 $\varepsilon(L)$；又 $L \cdot C \ge n$ 对任何曲线成立，故 (1.1) 中计算 $\varepsilon$ 的曲线不可能是光滑曲线（`main.tex:451-453`）。（前一笔 Remark 1.7 段中 "hoped 形式" 系笔误，当作 "期望形式"，依规格不回改落盘内容，在此申报更正。）

## 3 重数引理：沿覆盖族求导降重数（Proposition 2.3）

§2 是全篇的技术枢纽，作者申报该节本质用到特征零（`main.tex:459-464`），其灵感来自 Nakamaye 展示的 Dyson 引理（关于 $\mathbb P^{1} \times \mathbb P^{1}$ 中曲线奇点）的证明（`main.tex:231-234`）。预备记号：光滑簇 $M$ 上有效除子 $E$ 的重数函数 $x \mapsto \operatorname{mult}_x(E)$ Zariski 上半连续；对不可约子簇 $Z \subset M$，$\operatorname{mult}_Z(E)$ 定义为在 $Z$ 一般点处的取值（`main.tex:466-471`）。

引理 2.1（逐纤维重数不变，`main.tex:477-486`）：$X, T$ 光滑不可约，$Z \subset X \times T$ 不可约且在第二投影下支配 $T$，$E \subset X \times T$ 有效除子，则对一般 $t \in T$ 与纤维 $Z_t$ 的任一不可约分支 $W_t \subseteq Z_t$ 有

$$ \operatorname{mult}_{W_t}(E_t) = \operatorname{mult}_Z(E). $$

证明要点（`main.tex:487-520`）：更一般地设 $f : M \to T$ 光滑簇态射、$V \subset M$ 光滑且支配 $T$、$\operatorname{mult}_V(E) = a$。定义塔算子：$b \le a$ 时定义 $E$ 的截面 $s \in \Gamma(M, \mathcal O_M(E))$ 落在 $\Gamma(M, \mathcal O_M(E) \otimes \mathcal I_V^{b})$ 中，于是决定

$$ \delta_b(s) \in \Gamma(V, \mathcal I_V^{b}/\mathcal I_V^{b+1}(E)) = \Gamma(V, \operatorname{Sym}^{b} N_{V/M}^{\vee}(E)), $$

即 $s$ 沿 $V$ 法方向的 $b$ 阶 Taylor 项；局部坐标验证 $\delta_b(s) = 0$（$b < a$）而 $\delta_a(s) \ne 0$。限制到纤维有 $\delta_b(s)|_{V_t} = \delta_b(s_t)$；支配族上局部自由层的非零截面在一般纤维各分支上限制非零，故 $\delta_b(s_t)$ 在 $b<a$ 时为零、$b=a$ 时非零，即 $\operatorname{mult}_{W_t}(E_t) = a$。Remark 2.2（`main.tex:522-537`）给解析版本：过 $(x,t)$ 取 $Z \to T$ 的局部全纯截面 $\sigma$，化为全纯映射 $p : T \to X$，在局部坐标 $y = x - p(t)$ 下按 $y, t$ 展 Taylor 即得 $\operatorname{mult}_{p(t)}(E_t) = \operatorname{mult}_{(p(t),t)}(E)$。

命题 2.3（降重数主引理，`main.tex:542-554`）：设 $X, T$ 光滑不可约、$T$ 仿射，$Z \subseteq V \subseteq X \times T$ 不可约且 $V$ 支配 $X$，$L$ 为 $X$ 上线丛，$E \in |\operatorname{pr}_1^{*}(L)|$ 为 $X \times T$ 上除子。记

$$ \ell = \operatorname{mult}_Z(E), \qquad k = \operatorname{mult}_V(E). $$

则存在 $E' \in |\operatorname{pr}_1^{*}(L)|$ 使

$$ \operatorname{mult}_Z(E') \ge \ell - k, \qquad V \nsubseteq \operatorname{Supp}(E'). $$

方案是取 $T$ 上阶 $\le k$ 的一般微分算子 $D$，令 $E'$ 为 $\sigma' = D\sigma$ 的除子（$\sigma$ 定义 $E$）。不变化设置（`main.tex:565-610`）：$\mathcal D_T^{k}$ 为 $T$ 上阶 $\le k$ 微分算子层，其截面作用在 $\Gamma(X \times T, \operatorname{pr}_1^{*}L)$ 上是合法的，因为 $L$ 的转移函数 $g_{\alpha\beta}(x)$ 只依赖 $x$，$t$-向算子保持系数：$D s_{\alpha}(x,t) = g_{\alpha\beta}(x) D s_{\beta}(x,t)$。不变形式为典范包含

$$ \operatorname{pr}_2^{*}\mathcal D_T^{k} \hookrightarrow \mathcal D_{X \times T}^{k}(\operatorname{pr}_1^{*}L) = P_{X \times T}^{k}(\operatorname{pr}_1^{*}L)^{\vee} \otimes \operatorname{pr}_1^{*}L, $$

其中 $P^{k}$ 是主层（principal parts）层；关键同构 $P_{X \times T/X}^{k}(\operatorname{pr}_1^{*}L) = \operatorname{pr}_2^{*}P_T^{k}(\mathcal O_T) \otimes \operatorname{pr}_1^{*}L$ 由主层构造加投影公式得到，再配上满射 $P_{X \times T}^{k} \twoheadrightarrow P_{X \times T/X}^{k}$（`main.tex:580-599`）。截面 $\sigma$ 给出同态 $j_{\sigma} : \operatorname{pr}_2^{*}\mathcal D_T^{k} \to \operatorname{pr}_1^{*}L$，$D\sigma$ 即 $\operatorname{pr}_2^{*}D$ 在 $j_{\sigma}$ 下的像。

证明正文（`main.tex:615-649`）：$T$ 仿射故 $\mathcal D_T^{k}$ 全局生成，取生成截面子集 $D_{\alpha} \in \Gamma(T, \mathcal D_T^{k})$；令 $B = \{ (x,t) \mid D_{\alpha}\sigma(x,t) = 0\ \text{对一切}\ \alpha \}$。断言 $V \nsubseteq B$：固定 $x \in X$ 使纤维除子 $E_x \subset T$ 真，则 $(x,t) \in B$ 当且仅当 $\operatorname{mult}_t(E_x) > k$（$D_{\alpha}$ 在 $t$ 处生成 $\mathcal D_T^{k}$），而 $V$ 支配 $X$，对 $\operatorname{pr}_1 : X \times T \to X$ 用引理 2.1 得一般 $(x,t) \in V$ 处 $\operatorname{mult}_t(E_x) = \operatorname{mult}_V(E) = k$，断言得证。于是一般组合 $D$ 使 $\sigma' = D\sigma$ 不在 $V$ 上恒零；阶 $\le k$ 算子至多把重数压低 $k$，故 $\operatorname{mult}_Z(E') \ge \ell - k$。

## 4 主定理 Theorem 3.1 的证明骨架

定理陈述（`main.tex:655-666`）：设 $L$ 为 $n$ 维不可约射影簇 $X$ 上 nef 线丛。若存在可数真闭子簇并集 $\mathcal B \subset X$ 与正实数 $\alpha > 0$，使对每个 $r$ 维不可约子簇 $Y \subset X$（$1 \le r \le n$，$Y \not\subseteq \mathcal B$）有数值条件

$$ (L^{r}) \cdot Y \ge (r \cdot \alpha)^{r}, \tag{3.1.1} $$

则 $\varepsilon(L,x) \ge \alpha$ 对除去可数个真闭子簇并集之外的所有 $x \in X$ 成立。

从 (3.1) 导出引言定理 1 的链条（`main.tex:667-677`）：(3.1.1) 取 $r=n$ 给出 $L^{n} \ge (\alpha n)^{n} > 0$，故 $L$ big；反向地，nef 且 big 的 $L$ 按 Mori 备忘（`Mo`, (1.9)）可写 $aB = A + E$（$A$ ample、$E$ 有效、$a \gg 0$），于是 $L$ 限制到 $Y \not\subset E$ 仍 big，数值条件 (3.1.1) 对 $\alpha = \frac{1}{n}$ 自动成立。引言定理 1 第一句随之而来，第二句由开性引理 1.4 升格。

归纳与归约（`main.tex:680-695`）：$\dim X = 1$ 时命题显然；归纳假定维数 $< n$ 已知。取奇点解消 $f : X' \to X$，$L' = f^{*}L$：对不在 $f$ 基本 locus 内的 $r$ 维子簇 $Y$ 及其真变换 $Y'$ 有 $(L^{r}) \cdot Y = (L'^{r}) \cdot Y'$；对 $f$ 同构点上的 $x$ 及 $x' \in X'$，由 $\inf$ 定义 (1.1) 得 $\varepsilon(L,x) = \varepsilon(L',x')$。故可设 $X$ 光滑。

坏集的可数结构（3.3，`main.tex:697-717`）：若 $\varepsilon(L,x) < \beta$，存在约化不可约曲线 $C_x \ni x$ 使 $\beta \cdot \operatorname{mult}_x(C_x) > L \cdot C_x$。指标对 $(C,x)$ 的集合由可数个不可约拟射影簇参数化（Hilbert 概形 + 平坦曲线族中约化不可约是构造条件）；于是 $U_{\beta} = \{ x \mid \varepsilon(L,x) < \beta \}$ 是可数多个局部闭集之并。证明归结为：对任意小有理 $\delta > 0$，$U_{\alpha-\delta}$ 不含 Zariski 开集；因 $U_{\alpha} = \bigcup_{\delta \in \mathbb Q^{+}} U_{\alpha-\delta}$。固定 $\delta \ll \alpha$，记 $\gamma = \alpha - \delta$，反设存在 Zariski 开 $U \subseteq X$ 使 $\varepsilon(L,x) < \gamma$ 于一切 $x \in U$。

Seshadri 例外曲线族（3.4，`main.tex:723-747`）：每点 $x \in U$ 有过 $x$ 的约化不可约曲线 $C_x$（称以 $x$ 为基点的 Seshadri 例外曲线）满足 $\gamma \cdot \operatorname{mult}_x(C_x) > L \cdot C_x$。由可数参数化，存在不可约 $T$、支配态射 $g : T \to X$ 与 $X \times T$ 中不可约子簇 $C$（在 $T$ 上平坦），使纤维 $C_t$ 是以 $g(t)$ 为基点的例外曲线：$\gamma \cdot \operatorname{mult}_{g(t)} C_t > L \cdot C_t$；缩 $T$ 后设 $T$ 光滑仿射、$g$ 拟有限；$\Gamma \subset X \times T$ 为 $g$ 的图。

连接构造 (3.5.1)（仿 Kollár-Miyaoka-Mori，`main.tex:753-770`，证明 `main.tex:775-808`）：对支配 $X$ 与 $T$ 的不可约闭子簇 $Z \subset X \times T$，构造不可约闭 $CZ \subset X \times T$，满足 $Z \subseteq CZ$、$\dim CZ \le \dim Z + 1$，且一般纤维 $(CZ)_t = \overline{\bigcup_{s \in S_t} C_s}$，$S_t \subset g^{-1}(Z_t)$ 闭且支配 $Z_t$。做法：$S' = (g \times \operatorname{id}_T)^{-1}(Z) \subset T \times T$，取分支 $S_1$ 使像支配 $Z$，$\dim S_1 = \dim Z$（$g$ 拟有限）；$\pi : C \to T$ 为第二投影，$V_1 = (\pi \times \operatorname{id}_T)^{-1}(S_1) = \{ (x,s,t) \mid x \in C_s,\ g(s) \in Z_t,\ (s,t) \in S_1 \}$，$p : V_1 \to S_1$ 纤维为不可约曲线故 $\dim V_1 = \dim S_1 + 1$，截面 $\sigma(s,t) = (g(s),s,t)$；取 $V = \operatorname{pr}_{13}(V_1)$，它含 $Z$ 的开集，$CZ = \overline{V}$。构造保证 $(CZ)_t$ 是"基点落在 $Z_t$ 稠密可构子集上的例外曲线并集"。

归纳步 (3.6.1)（`main.tex:811-834`）：断言 $Z$ 真含于 $CZ$。反设 $CZ = Z$：取 very general $t$，$x \in Z_t$ 一般，则由 (3.5.3) 存在以 $x$ 为基点的例外曲线 $C_s \subset Z_t$，于是 $\varepsilon(L|_{Z_t}, x) < \gamma$ 在 $Z_t$ 的稠密开集上成立。$Z_t$ 各分支维数 $< n$，可用归纳假设，前提是核验 $L|_{W_t}$ 满足 (3.1.1)：$Z \to X$ 支配故一般 $t$ 下无分支落在 $\mathcal B$ 内，very general $t$ 时 $\mathcal B \cap W_t$ 是 $W_t$ 的可数真子簇并；对 $Y \subseteq W_t$、$\dim Y = r$、$Y \not\subset \mathcal B \cap W_t$，有 $(L|_{W_t})^{r} \cdot Y = L^{r} \cdot Y \ge (r\gamma)^{r}$。归纳假设触发矛盾（$\gamma < \alpha$ 而条件里的 $\alpha$ 换成 $\gamma$ 恰够），故 $Z \subsetneq CZ$。

升链 (3.7)（`main.tex:837-849`）：$Z_0 = \Gamma$、$Z_1 = C$、$Z_{i+1} = CZ_i$（$1 < i \le n-1$ 时用 (3.5.1)），由 (3.6.1) 严格升，$Z_i$ 对 $T$ 的相对维数为 $i$，且 $Z_n = X \times T$，得链

$$ \Gamma = Z_0 \subset Z_1 \subset \cdots \subset Z_{n-1} \subset Z_n = X \times T. \tag{3.7.1} $$

隙论证 (3.8)（`main.tex:851-884`）：逐点看，$L^{n} \ge (\alpha n)^{n} > (\gamma n)^{n}$，Riemann-Roch 给出 $h^{0}(\mathcal O_X(kL)) = k^{n} \frac{L^{n}}{n!} + o(k^{n})$，而在一点施加重数取整 $[k\gamma n + 1]$（素材记号 $[\cdot]$ 为取整）只耗 $\frac{(k\gamma n)^{n}}{n!} + o(k^{n})$ 个条件，故 $k \gg 0$ 时任意点 $x$ 处存在 $E_x \in |kL|$ 使 $\operatorname{mult}_x(E_x) > k\gamma n$。全局化：置 $b = [k\gamma n + 1]$，$\mathcal F = \operatorname{pr}_{2,*}(\operatorname{pr}_1^{*}(kL) \otimes \mathcal I_{\Gamma}^{b})$ 是正秩挠-free $\mathcal O_T$-模，$T$ 仿射故全局生成；取非零截面 $\sigma$，即得除子 $E \in |\mathcal O_{X \times T}(\operatorname{pr}_1^{*}(kL))|$ 满足 $\operatorname{mult}_{\Gamma}(E) > k\gamma n$。

收束 (3.9)（`main.tex:886-923`）：沿链比较重数，$\operatorname{mult}_{Z_0}(E) = \operatorname{mult}_{\Gamma}(E) > k\gamma n$ 而 $\operatorname{mult}_{Z_n}(E) = 0$，故存在指标 $i$（$0 \le i \le n-1$）使

$$ \operatorname{mult}_{Z_i}(E) - \operatorname{mult}_{Z_{i+1}}(E) > k\gamma. $$

对 $Z_i \subseteq Z_{i+1} \subseteq X \times T$（$Z_{i+1}$ 支配 $X$）套用命题 2.3，得 $E' \in |\operatorname{pr}_1^{*}(kL)|$ 使 $\operatorname{mult}_{Z_i}(E') > k\gamma$ 且 $Z_{i+1} \nsubseteq \operatorname{Supp}(E')$。固定一般 $t$：$E'_t \in |kL|$ 不含 $(Z_{i+1})_t$ 的任何分支，且由引理 2.1 对 $(Z_i)_t$ 的每个分支 $W_t$ 有 $\operatorname{mult}_{W_t}(E'_t) = \operatorname{mult}_{Z_i}(E') > k\gamma$；取一般 $x \in W_t$，则 $\operatorname{mult}_x(E'_t) > k\gamma$。由 (3.5.3)，存在以 $x$ 为基点的例外曲线 $C_s \subset (Z_{i+1})_t$ 且 $C_s \nsubseteq \operatorname{Supp}(E'_t)$，交正常，得最终不等式链

$$ k (L \cdot C_s) = E'_t \cdot C_s \ge \operatorname{mult}_x(E'_t) \cdot \operatorname{mult}_x(C_s) > k\gamma \cdot \operatorname{mult}_x(C_s), $$

即 $L \cdot C_s > \gamma \operatorname{mult}_x(C_s)$，与 $C_s$ 之例外性矛盾。Theorem 3.1 证毕（`main.tex:917-923`）。

## 5 应用：伴随系列的 jet 生成、双有理性与多典范映射

推论 2（`main.tex:130-139`）：$L$ 为 $n \ge 2$ 维光滑射影簇上 nef 线丛，给定 $s \ge 0$，若对某个可数真子簇并集 $\mathcal B$ 之外的每个 $r$ 维子簇 $Y \subseteq X$ 有 $\int_Y c_1(L)^{r} \ge (r(n+s))^{r}$，则 $|\mathcal O_X(K_X + L)|$ 在一般点生成 $s$-jet，即求值映射

$$ H^{0}(X, \mathcal O_X(K_X + L)) \to H^{0}(X, \mathcal O_X(K_X + L) \otimes \mathcal O_X/\mathcal I_x^{s+1}) $$

满射；特别 $h^{0}(X, \mathcal O_X(K_X + L)) \ge \binom{n+s}{n}$。推导链：定理 3.1 以 $\alpha = n+s$ 给 $\varepsilon(L,x) \ge n+s \ge r$ 处（1.3.1）的 $r=1$ 情形（等号边界配 $L^{n} > \varepsilon^{n}$，此路由 (3.1.1) 之 $r=n$ 情形 $(n(n+s))^{n} \ge (n+s)^{n}$ 严格控制），$\binom{n+s}{n}$ 是 $s$-jet 空间 $\mathcal O_X/\mathcal I_x^{s+1}$ 的秩。数值化推论：$A$ ample 时 $\mathcal O_X(K_X + (ns + n^{2})A)$ 在几乎所有点生成 $s$-jet（`main.tex:140-141`），核验为 $((ns+n^{2})A)^{r} \cdot Y \ge (ns+n^{2})^{r} \ge (r(n+s))^{r}$（$r \le n$，$r=n$ 时 $(ns+n^{2}) = n(n+s)$ 取等）。它与 Kollár 非消没定理（`Ko1` §3）互补（`main.tex:126-129`）。

双有理判别引理 4.1（`main.tex:933-972`）：$X$ 光滑 $n \ge 2$，$L$ nef 且 big，若存在可数真子簇并集 $\mathcal V$ 使 $\varepsilon(L,x) \ge 2n$ 于 $X - \mathcal V$，则 $\mathcal O_X(K_X + L)$ 双有理很丰富。证明先给一般事实：有理映射 $\phi_{|B|}$ 双有理到像 当且仅当 存在可数真子簇并集 $\mathcal V$ 使 $\phi$ 在 $X - \mathcal V$ 上有定义且单叶（开集非空即可，`main.tex:943-953`）。核心消没为两点分离：$x \ne y \in X - \mathcal V$ 时

$$ H^{1}(X, \mathcal O_X(K_X + L) \otimes \mathcal I_x \otimes \mathcal I_y) = 0. $$

设 $f : Y \to X$ 吹高 $x, y$，例外除子 $E_x, E_y$；$\varepsilon(L,x) \ge 2n$ 经 (1.2) 给出 $\frac{1}{2}f^{*}L - nE_x$ 与 $\frac{1}{2}f^{*}L - nE_y$ 皆 nef，故 $f^{*}L - nE_x - nE_y$ nef；再由上界 (1.8) 得 $L^{n} \ge (2n)^{n} > 2n^{n}$，故该 $\mathbb Q$-除子还 big，Kawamata-Viehweg 消没完成。

推论 3（`main.tex:150-154`）：$L$ nef 且 big、$n \ge 2$ 时，对一切 $m \ge 2n^{2}$，$|K_X + mL|$ 双有理很丰富。链条：定理 3.1 给 $\varepsilon(L,x) \ge \frac{1}{n}$，齐次性 $\varepsilon(mL,x) = m\varepsilon(L,x) \ge \frac{m}{n} \ge 2n$，套引理 4.1 于 $mL$。特别 $X$ 一般型极小（$K_X$ nef 且 big）时多典范有理映射 $\phi_{|mK|}$ 在 $m > 2n^{2}$ 双有理到像（`main.tex:155-160`），以稍弱常数推广 Ando 的 $n \le 5$ 结果（`main.tex:160-161`，文献 `An`）。

$\mathbb Q$-除子框架（`main.tex:978-1031`）：注记 4.2：$\varepsilon(mL,x) = m\varepsilon(L,x)$ 把定理 3.1 搬到 nef $\mathbb Q$-Cartier $\mathbb Q$-除子（`main.tex:978-985`）。设定 4.3：$X$ 光滑不可约 $n \ge 2$，$L$ nef 且 big $\mathbb Q$-除子，$\Delta$ 为正规交叉支撑的小数部分 $\mathbb Q$-除子（$\lfloor \Delta \rfloor = 0$），$N$ 整除子满足 $N \equiv L + \Delta$。命题 4.4：$L$ 满足 (3.1.1) 且 $\alpha \ge n+s$ 时，$|K_X + N|$ 在充分一般点 $x \notin \operatorname{Supp}(\Delta)$ 生成 $s$-jet（$\mathbb Q$-形 Kawamata-Viehweg 消没，`main.tex:1001-1008`）；$s=0$ 情形 Kollár 已在更大一般性下证明（`Ko1` §3），推出 generically large 代数基本群簇上 big 线丛有 $H^{0}(X, \mathcal O_X(K_X + L)) \ne 0$（`main.tex:1010-1014`，`Ko2` §8）；`Ko2` 引理 8.2 保证 generically large $\pi_1$ 时任意 ample $L$ 有有限 étale 覆盖 $m : X' \to X$ 使 $m^{*}L$ 合于 3.1 假设，但如何下传更多信息未明（`main.tex:1018-1023`）。命题 4.5：设定 4.3 下若充分一般处 $\varepsilon(L,x) \ge 2n$，则 $\mathcal O_X(K_X + N)$ 双有理很丰富；结合注记 4.2，(3.1.1) 以 $\alpha \ge 2n$ 成立即可（`main.tex:1026-1033`）。

推论 4.6（`main.tex:1037-1060`，指数 $r$ 极小一般型簇）：$X$ 只有终端奇点、$K_X$ nef 且 big、$rK_X$ Cartier，则 $|mrK_X|$ 对 $m \ge 2n^{2} + 1$ 双有理很丰富。证明骨架：取对数解消 $f : Y \to X$，终端奇点给出 $K_Y + \Delta \equiv f^{*}K_X + P$（$\Delta$ 小数 nc、$P$ 整、有效、$f$-例外），移项得 $K_Y + \Delta + (mr-1)f^{*}K_X \equiv f^{*}(mrK_X) + P$。数值链的中间式：由 (3.1) 对 $rK_X$（Cartier、nef、big）有 $\varepsilon(f^{*}\mathcal O_X(rK_X), y) \ge \frac{1}{n}$ 于 $Y$ 的充分一般点，齐次性给 $\varepsilon(f^{*}K_X, y) \ge \frac{1}{nr}$，于是

$$ \varepsilon((mr-1)f^{*}K_X) \ge \frac{mr-1}{nr} \ge 2n + \frac{r-1}{nr}, $$

末步即 $m \ge 2n^{2}+1$ 的算式核验：$\frac{mr-1}{nr} = \frac{m}{n} - \frac{1}{nr} \ge 2n + \frac{1}{n} - \frac{1}{nr} = 2n + \frac{r-1}{nr}$。对 $N \equiv \Delta + (mr-1)f^{*}K_X$ 用命题 4.5，$|f^{*}(mrK_X) + P|$ 双有理很丰富；$P$ 为 $f$-例外故 $H^{0}(Y, \mathcal O_Y(f^{*}(mrK_X) + P)) = H^{0}(X, \mathcal O_X(mrK_X))$，结论下传 $X$。（申报更正：第 5 节推论 2 段中 "$\varepsilon(L,x) \ge n+s \ge r$ 处" 一句排版串行，应读作：定理 3.1 以 $\alpha = n+s$ 给出充分一般点处 $\varepsilon(L,x) \ge n+s$，此时 $\frac{s+n}{\varepsilon(L,x)} \le 1$，命题 1.3(1.3.1) 取 $r=1$（等号边界情形补 $L^{n} > \varepsilon^{n}$，由数值假设的 $r=n$ 情形控制）即得 $s$-jet 生成；其余内容不变。）

## 6 与本语料的接缝

本稿不读语料稿，接缝按派单原样登记：引用本文的语料稿为 D318（bib key `EKL1995`）与 D385（bib key `EKL1995`），两处引用键相同。键名年份 1995 对应本文的正式刊出版，本素材仅含 1994-08-09 预印本 v1，两版内容的对应关系未在本稿内核验，登记为待查；语料稿侧回引具体行位由本体侧统一执行。

被引内容在 C 稿中的读法约定：语料稿若以 `EKL1995` 指"下界定理"，读作本文 Theorem 3.1（`main.tex:655-666`）及其推论引言定理 1（`main.tex:102-110`），即 nef 且 big 线丛在充分一般点处 $\varepsilon(L,x) \ge \frac{1}{n}$，一般判别形为 $(L^{r}) \cdot Y \ge (r\alpha)^{r} \Rightarrow \varepsilon(L,x) \ge \alpha$；若指"伴随丛生成 jet"，读作推论 2（`main.tex:130-141`），常数 $ns + n^{2}$ 与 $h^{0} \ge \binom{n+s}{n}$ 均出于此；若指"多典范映射双有理"，读作推论 3 与推论 4.6（`main.tex:150-160`、`main.tex:1037-1042`），阈值 $m \ge 2n^{2}$、指数 $r$ 情形 $m \ge 2n^{2} + 1$；若指"Seshadri 常数定义与 jet 等价"，读作定义 1.1、引理 1.2、命题 1.3（`main.tex:276-356`）。记号对齐：语料稿常用 $\varepsilon(L,x)$ 即本文 $\eps(L,x)$；$\operatorname{mult}$、$\mathcal I_x$、$\operatorname{Bl}_x$ 的写法以本稿第 0 节换算表为准；本文 $\mathcal B$（坏集，可数真子簇并）与语料稿中同字母对象无涉，回引时留意区分。方法层面的接缝点有三处常被外部转引：其一，命题 2.3 的"沿参数方向求导降重数"引理（素材明言希望它有其他应用，`main.tex:213-216`）；其二，Kollár-Miyaoka-Mori 式连接构造 (3.5.1) 与归纳链 (3.7.1)；其三，Miranda 例给出的逐点无一致下界现象（`main.tex:387-413`），凡语料稿讨论 Seshadri 常数下界的最优性时应对接此处。（收稿前更正申报两处：第 5 节 $\mathbb Q$-除子框架段原用长破折号连接条目名与内容，违反记法条款，已逐字改为冒号形（注记 4.2、设定 4.3、命题 4.4、命题 4.5 四处），条目内容未动；第 2 节标题原多一个下划线（"_jet"），已逐字更正为 "jet"。两处均属合规性修复，不属于删改既述内容。）
