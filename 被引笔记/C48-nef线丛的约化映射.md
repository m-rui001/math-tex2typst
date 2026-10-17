# C48 nef线丛的约化映射（arXiv:math/0106147）

## 0 取证边界

- arXiv id：`math/0106147`。
- 原题名（逐字）：A reduction map for nef line bundles。
- 作者（逐字，API 署名）：Thomas Bauer, Frederic Campana, Thomas Eckl, Stefan Kebekus, Thomas Peternell, Slawomir Rams, Tomasz Szemberg, Lorenz Wotzlaw；素材 `<author>` 域作 "Th.~Bauer, F.~Campana, Th.~Eckl, S.~Kebekus, Th.~Peternell, S.~Rams, T.~Szemberg, and L.~Wotzlaw"（`main.tex:41-42`），八人分属 Bayreuth、Nancy 1、Erlangen、Essen、Berlin 五地（`main.tex:44-66`）。
- 发表年月：2001-06-18。
- 素材目录：`E:\math\被引素材\math_0106147`，唯一文件 `main.tex`，实测 25871 字节、662 行（派单记 663 行，以盘面 662 为准）；文档类 `amsart`，`\date{\today}` 未定版（`main.tex:39`）；目录无 `.pdf`、无图形文件；`amscd` 交换图仅用于四处纤维化示意，本稿以文字与位置串转述其内容，不搬 CD 环境。
- 本语料引用它的稿号与 bib key（原样登记）：D318（bib key `BCEKPRSW2002`）；D385（bib key `BCEKPRSW2002`）。
- 取材薄读之处：`main.tex:629-657` 为参考文献表（键 `Ca81`、`Ca94`、`De00`、`Ha70`、`HL83`、`Pa98`、`Ts00`），只用于核对被引记号；素材正文含 latin1 重音乱码（地址域），不影响数学；取证共 2 次读取，覆盖 `main.tex` 全篇 1-661 行。
- 记法换算登记：素材宏 `\bR`、`\bC`、`\bQ`、`\zed`（`{\Bbb …}` 形）写作 `\mathbb R`、`\mathbb C`、`\mathbb Q`、`\mathbb Z`；`\Pic` 写作 `\operatorname{Pic}`；`\Chow` 写作 `\operatorname{Chow}`；正文里 `\mathbb{F}_1` 是 Hirzebruch 曲面、`\mathbb P_2`（`main.tex:618` 素材笔误）读作 `\mathbb P^{2}`；素材定理计数器按节重置且 `lemma/corollary/proposition/definition/question/remark/conjecture/examples/claim` 与 `theorem` 共享（`main.tex:16-26`），本稿编号即按该共享计数顺序推算：定理 2.1（存在性）、定义 2.2、定义 2.3、定理 2.4（数值平凡判据）、命题 2.5（弱判据）、定理 2.6（类版本）、定义 2.7（nef 维数）、命题 2.8、推论 2.9、问题 2.10、命题 2.11、主张 3.1、定义 3.2；其中"定理 2.4"有素材自引旁证（`main.tex:300` 处明文引 Theorem 2.4），其余编号若与他本版本有出入以位置串为准。

## 1 背景：Tsuji 的申报与本文三件成果

缘起（`main.tex:75-91`）：Tsuji 在预印本（键 `Ts00`，LANL math.AG/0001023）中就射影流形上伪有效线丛 $L$ 申报了一组结构性断言，核心是存在一个亚纯"约化映射"（reduction map）：过 $X$ 一般点有一条极大的不可约 $L$-flat 子簇，且该映射应是几乎全纯的（almost holomorphic），即紧纤维不碰约化映射的不定点 locus；素材明言 `Ts00` 的证明极难追随（`main.tex:82-83`）。本文的三件成果随之申报（`main.tex:85-91`）：其一，在 $L$ nef 情形建立约化映射的存在性并证明它几乎全纯，这条也在 `Ts00` 中被明确申报过；证明完全代数，对照 `Ts00` 的深度解析方法；其二，给出一个基本例子说明 $L$ 仅为伪有效时，`Ts00` 申报的约化映射不可能几乎全纯，与 `Ts00` 的断言相反；其三（正文第 4、5 节）围绕约化映射定义 nef 维数 $n(L)$ 并把它与 $\kappa$、$\nu$ 两个旧不变量对接。工作出自 2001 年 1 月 Bayreuth 小型工作营，由 DFG 重点计划 "Global methods in complex geometry" 支持（`main.tex:93-95`）。

主定理（定理 2.1，`main.tex:102-115`）：设 $L$ 是正规射影簇 $X$ 上的 nef 线丛，则存在几乎全纯的、支配的、连通纤维的有理映射 $f : X \dashrightarrow Y$（称约化映射），满足

1. 对 $f$ 的所有维数为 $\dim X - \dim Y$ 的紧纤维 $F$，$L$ 在 $F$ 上数值平凡；
2. 对每个一般点 $x \in X$ 与每条过 $x$ 且 $\dim f(C) > 0$ 的不可约曲线 $C$，有 $L \cdot C > 0$。

且 $f$ 在 $Y$ 的双有理等价意义下唯一。该定理在 `Ts00` 中被申报而无完整证明（`main.tex:117-118`）。

两条定义先行落地。数值平凡与 nef（定义 2.2，`main.tex:120-126`）：$L$ 数值平凡指对一切不可约曲线 $C \subset X$ 有 $L \cdot C = 0$；nef 指 $L \cdot C \ge 0$。满射 $f : Y \to X$ 下 $L$ 与 $f^{*}L$ 的这两个性质等价（`main.tex:128-129`）。几乎全纯（定义 2.3，`main.tex:131-137`）：$f : X \dashrightarrow Y$ 在最大全纯开集 $X^{0} \subset X$ 上的限制 $f|_{X^{0}}$ 有紧纤维，则称 $f$ 几乎全纯。

全文骨架即素材目录结构（`\tableofcontents`，`main.tex:70`）：第 2 节先证数值平凡判据（定理 2.4，工具是曲面情形弱判据命题 2.5），再经 Campana 纤维化构造得到定理 2.1；随后把结论推广到 $(1,1)$ 类（定理 2.6）；定义 $n(L)$ 并证 $\nu(L) \le n(L)$（命题 2.8）与 $\kappa(L) \le n(L)$（推论 2.9）；第 2.4 小节的标题是"约化映射的结构"，内含问题 2.10 与逐情形刻画（命题 2.11 等）；第 3 节（标题 A Counterexample）给反例。

## 2 数值平凡判据：从 Hodge 指标定理到链论证

定理 2.4（判据本体，`main.tex:150-156`）：设 $X$ 为不可约射影簇（不必正规），$L$ 为 nef 线丛，则 $L$ 数值平凡当且仅当 $X$ 中任意两点可被一条由曲线组成的连通链 $C$ 连接且 $L \cdot C = 0$。这里 $L \cdot C = 0$ 按链的各个分支计数：链上每条不可约曲线 $C_i$ 满足 $L \cdot C_i = 0$（素材在证明段把假设写成"任意两点可被与之相交次数为 $0$ 的曲线连接"，`main.tex:212-214`）。

证明先化约到曲面弱判据。命题 2.5（弱判据，`main.tex:164-175`）：设 $S$ 为不可约射影曲面（不必正规），$q : S \to T$ 为到曲线、连通纤维的态射；若存在 nef 线丛 $L \in \operatorname{Pic}(S)$ 与曲线 $C \subset S$ 使 $q(C) = T$ 且

$$ L \cdot F = L \cdot C = 0, $$

$F$ 为一般 $q$-纤维，则 $L$ 数值平凡。

命题 2.5 的证明（`main.tex:177-207`）分光滑与奇异两步。光滑步是 Hodge 指标定理的直接推论：取 $D = C + nF$，$n \gg 0$，则 $D^{2} > 0$（交叉项 $C \cdot F > 0$ 支配 $C^{2}$）；指标定理给

$$ (L \cdot D)^{2} \ge L^{2} \cdot D^{2}, $$

由假设 $L \cdot D = L \cdot C + n L \cdot F = 0$，故 $L^{2} \ge 0$ 与 $L^{2} \cdot D^{2} \le 0$ 比较得 $L^{2} = 0$；于是指标不等式取等，$L$ 与 $D$ 成正比：$L \equiv kD$，$k \in \mathbb Q$；再由 $0 = L^{2} = k^{2} D^{2}$ 与 $D^{2} > 0$ 得 $k = 0$，即 $L^{2} = 0$ 且 $L \cdot D = 0$ 升级为 $L$ 数值平凡（光滑曲面上 nef 且自交 $0$ 的 $L$ 对所有曲线交数为 $0$：任意曲线 $B$ 代入 $(L + tB)^{2} \le 0$ 侧展开发 $L \cdot B = 0$，素材未写此末步、由 nef 与 $L^{2} = 0$ 标准得到，登记为省略步）。奇异步：取解消 $\delta : \tilde S \to S$，$\tilde C \subset \delta^{-1}(C)$ 取满射到 $C$ 的分支；$q \circ \delta$ 纤维可能不连通，作 Stein 分解 $\tilde S \xrightarrow{\tilde q} \tilde T \to T$（$\tilde T \to T$ 有限，交换图在 `main.tex:195-201`）；由构造 $\tilde q(\tilde C) = \tilde T$，$\delta^{*}(L)$ 在 $\tilde C$ 与 $\tilde q$ 一般纤维上交数皆 $0$，光滑步给出 $\delta^{*}(L)$ 平凡，结论沿 `main.tex:128-129` 的拉回不变性下传。

定理 2.4 的证明（`main.tex:210-287`）。反向平凡。设任意两点可被 $L$-度 $0$ 链连接，要证任意不可约曲线 $B \subset X$ 有 $L \cdot B = 0$。取定 $a \in X \setminus B$；对每个 $b \in B$ 存在含 $a, b$ 的连通曲线 $Z_b$ 使 $L \cdot Z_b = 0$。关键紧致化（`main.tex:221-225`）：$\operatorname{Chow}(X)$ 的各分支紧、分支仅可数，故可取一紧不可约曲线 $T \subset \operatorname{Chow}(X)$ 使曲线族 $(Z_t)_{t \in T}$ 覆盖所有"同时含 $a$ 与某 $b \in B$"的情形；配万族 $S \subset X \times T$ 与投影 $p : S \to X$、$q : S \to T$（交换图 `main.tex:228-234`）。

断言 1（`main.tex:236-246`）：存在不可约分支 $S_0 \subset S$ 使 $p^{*}(L)$ 在其上数值平凡。理由：一切 $Z_t$ 含 $a$，故 $S \supset \{a\} \times T$；取含该曲线的分支 $S_0$；$\{a\} \times T$ 与 $q$ 的所有纤维相交且 $p^{*}(L)$ 在其上度 $0$，$L \cdot Z_t = 0$ 给纤维交数为 $0$，命题 2.5 触发（$S_0$ 上 $q|_{S_0} : S_0 \to T$ 是一般纤维为曲线的曲面映射）。

断言 2（`main.tex:248-283`）：$p^{*}(L)$ 在整个 $S$ 上数值平凡。反设存在非平凡分支，把分支并集分为 $S_{\mathrm{triv}}$ 与 $S_{\mathrm{ntriv}}$（`main.tex:255-265` 的显式定义），两者皆非空（断言 1 保 $S_{\mathrm{triv}}$，反设保 $S_{\mathrm{ntriv}}$）。$S$ 是 $\operatorname{Chow}(X)$ 中曲线的万族，$q$ 等维，故每个二维分支满射到 $T$；一般 $t$ 的连通纤维 $q^{-1}(t)$ 同时碰两个子簇，交集中有支配 $T$ 的曲线 $D \subset S_{\mathrm{triv}} \cap S_{\mathrm{ntriv}}$。取 $D$ 所在分支 $S_j \subset S_{\mathrm{ntriv}}$：$D$ 满射 $T$ 且 $p^{*}(L) \cdot D = 0$（因 $D \subset S_{\mathrm{triv}}$），纤维交数又为 $0$，命题 2.5 判出 $p^{*}(L)|_{S_j}$ 数值平凡，与 $S_j \subset S_{\mathrm{ntriv}}$ 矛盾。收尾（`main.tex:285-287`）：取 $B' \subset p^{-1}(B)$ 任一分支，$p^{*}(L) \cdot B' = 0$ 给出 $L \cdot B = 0$（投影保持交数：$p_* B' = B$ 计重数），定理 2.4 证毕。（更正申报：本段首行 "按链的各个分支计数" 系中英混杂笔误，读作 "按链的各个分支计数"；落盘文本已随下一笔逐字改为 "各个"。）

## 3 定理 2.1 的证明与 $(1,1)$ 类版本

约化映射的构造（`main.tex:289-298`）：在 $X$ 上定义等价关系 $x \sim y$ 当且仅当 $x, y$ 可被连通曲线 $C$ 连接且 $L \cdot C = 0$。由 Campana 的纤维化定理（键 `Ca81`：Coréduction algébrique d'un espace analytique faiblement kählérien compact，Invent. Math. 63 (1981) 187-223，`main.tex:632-634`；另见 `Ca94` 附录），存在几乎全纯、连通纤维的有理映射 $f : X \dashrightarrow Y$ 到正规射影簇 $Y$，使一般两点 $x \sim y$ 当且仅当 $f(x) = f(y)$。此 $f$ 即所求。

三条性质的核验（`main.tex:300-318`）。性质 (2)：一般点 $x$ 与 $\dim f(C) > 0$ 的过 $x$ 不可约曲线 $C$ 必有 $L \cdot C > 0$：若 $L \cdot C = 0$，则 $C$ 上的点两两 $\sim$，由 $f$ 的刻画 $f(C)$ 为点，与 $\dim f(C) > 0$ 矛盾（此即等价关系定义的直接回放，素材把它作为已知）。一般纤维平凡：$L|_{F} \equiv 0$ 由定理 2.4 得到（`main.tex:300-301` 引 Theorem 2.4：一般纤维上任意两点可被 $L$-度 $0$ 链连接，链在纤维内取）。

任意紧纤维（性质 (1) 的非一般纤维情形，`main.tex:302-318`）：设 $F_0$ 是维数 $\dim X - \dim Y$ 的任意紧纤维，要证 $F_0$ 内一切曲线 $C$ 有 $L \cdot C = 0$。取 $X$ 上 ample $H$ 与 $m \gg 0$，选

$$ D_1, \ldots, D_k \in |mH|, \qquad D_1 \cdot \ldots \cdot D_k \cdot F_0 = C + C', $$

使右端含给定的不可约曲线 $C$ 与有效剩余 $C'$（一般位置的完全交截分解）。则交数链为

$$ L \cdot (C + C') = L \cdot D_1 \cdot \ldots \cdot D_k \cdot F, $$

$F$ 为 $f$ 的一般纤维：右端因 $L|_{F} \equiv 0$ 而为 $0$（$D_i$ 在 $F$ 上截出 $\dim F - k$ 维子簇，$L$ 在其上度仍 $0$），故 $L \cdot (C + C') = 0$；$L$ nef 给出每项非负，和为 $0$ 迫使 $L \cdot C = 0$。唯一性（`main.tex:114` 的申报）由性质 (2) 的 "一般点同纤维当且仅当 $\sim$" 刻画在双有理意义下强制，素材未展开、登记为省略步。

类版本（定理 2.6，`main.tex:320-360`）：素材明言定理 2.1 与 2.4 从未真正用到 $L$ 是线丛，只用到 $c_1(L)$ 是 nef 类，连有理数性都不需要（`main.tex:322-326`）。设置：$X$ 光滑射影簇（为简单只处理光滑情形，`main.tex:327-328`），$\alpha \in H^{1,1}(X, \mathbb R)$ 称 nef，若它在 Kähler 类生成锥的闭包中；$\alpha$ 数值平凡指 $\alpha \cdot C = 0$ 对一切曲线；对奇异子空间 $Z$，$\alpha$ 在其上数值平凡定义为某（从而所有，引 `Pa98`，Paun，Math. Ann. 310 (1998) 411-421）解消 $\hat Z \to Z$ 上拉回 $f^{*}(\alpha)$ 数值平凡（`main.tex:334-342`）；$Z$ 光滑时与 $\alpha|_{Z}$ 落在 $Z$ 的 Kähler 锥闭包中等价（`main.tex:342-343`）。结论逐条平移：存在几乎全纯支配连通纤维有理映射 $f : X \dashrightarrow Y$，(1) $\alpha$ 在一切维数正确的紧纤维上数值平凡，(2) 一般点处 $\dim f(C) > 0$ 的曲线有 $\alpha \cdot C > 0$，$f$ 双有理唯一；附带推论式陈述：若一般两点可被 $\alpha \cdot C = 0$ 的链连接，则 $\alpha \equiv 0$（`main.tex:357-359`）。（补充申报：第 2 节 "each" 笔误的逐字更正用了全局替换，该句更正括注内的引文也随之变成了 "各个"，括注现读作：首行 "按链的各个分支计数" 原印 "按链的 each 分支计数"，已更正。）

## 4 nef 维数 $n(L)$ 与 $\kappa$、$\nu$ 的对接

定义（定义 2.7，`main.tex:363-372`）：约化映射的目标 $Y$ 双有理唯一，故 $\dim Y$ 是 $L$ 的不变量，称 nef 维数，记 $n(L) := \dim Y$。对照不变量：数值 Kodaira 维数 $\nu(L)$ 定义为使 $L^{k} \not\equiv 0$ 的最大 $k$；等价地，固定 ample $H$，$\nu(L)$ 是使 $L^{k} \cdot H^{n-k} \ne 0$ 的最大 $k$（`main.tex:374-377`）。

命题 2.8（`main.tex:379-396`）：

$$ \nu(L) \le n(L). $$

证明链（`main.tex:386-396`）：取 very ample $H \in \operatorname{Pic}(X)$，记 $\nu := \nu(L)$，$n := \dim X$；用 $n - \nu$ 个 $|H|$ 的一般元截出 $Z$，则 $\dim Z = \nu$，且由 $L^{\nu} \cdot H^{n - \nu} > 0$ 知 $L|_{Z}$ big（且 nef）。断言 $\dim f(Z) = \nu$：否则 $Z$ 被含于 $f$ 一般纤维的曲线 $C$ 覆盖，$L \cdot C = 0$（性质 (1)），与 $L|_{Z}$ big 矛盾（big 线丛在一般点处对覆盖族的交数正）。于是 $\dim Y \ge \dim f(Z) = \nu$。

推论 2.9（`main.tex:398-404`）：

$$ \kappa(L) \le n(L), $$

即 Iitaka-Kodaira 维数也不超过 nef 维数（由 $\kappa(L) \le \nu(L)$ 与命题 2.8 复合，素材只写结论与 `\qed`，`main.tex:401-403`）。

分离反例（第 2.4.1 小节，`main.tex:427-433`）：$L$ big 且 nef 时 $n(L) = \dim X$ 成立；反向不真：存在曲面 $X$ 与线丛 $L$ 使 $L \cdot C > 0$ 对一切曲线 $C$ 成立而 $L^{2} = 0$，此时 $n(L) = 2$、$\nu(L) = 1$，命题 2.8 的不等式严格。显式首例归 Mumford，出处按素材引 `Ha70`（Hartshorne, Ample subvarieties, LNM 156，见 `main.tex:431-433` 与文献行 `main.tex:643-645`）。第 2.4.2 小节（`main.tex:435-439`）补同一情形的曲线侧读法：$n(L) = \dim X = 2$ 时 $L \cdot C > 0$ 对至多可数个不可约曲线之外的全部成立，这些例外曲线必有半负自交 $C^{2} \le 0$。

## 5 $n(L)=1$ 的下传结构与伪有效情形的反例

开问题（问题 2.10，`main.tex:414-425`）：约化映射在什么合理条件下可取成全纯？能否构造不可全纯化的例子？当时两者皆未知。丰沛猜想（abundance）蕴含 $L = K_X$ 情形可取全纯；作者预期 $L = -K_X$ 时亦有全纯约化映射。

$n(L) = 1$、$\dim X = 2$（`main.tex:443-499`）。此时 $Y$ 可取光滑曲线，几乎全纯的 $f : X \to Y$ 因而全纯。命题 2.11：存在 $Y$ 上 $\mathbb Q$-除子 $A$ 使

$$ L \equiv f^{*}(A). $$

解析证明（`main.tex:457-485`）：nef 线丛携带正曲率闭 (1,1) 电流度量的奇异 Hermite 度量 $h$，曲率电流 $T$ 满足 $c_1(L) = [T]$。因 $L \cdot F = 0$ 且 $Y$ 上任何 $(1,1)$ 形式 $\varphi$ 闭，推压前电流：

$$ f_{*}(T)(\varphi) = T(f^{*}\varphi) = [T] \cdot [f^{*}\varphi] = 0, $$

最后一步因 $[f^{*}\varphi] = \lambda [F]$（$\lambda$ 为常数、$F$ 为纤维）。故 $f_{*}(T) = 0$。设 $Y_0$ 为 $f$ 局部满射的最大开集、$X_0 = f^{-1}(Y_0)$，由 `HL83`（Harvey-Lawson, Invent. math. 74 (1983) 169-198）公式 (18)：

$$ T|_{X_0} = \sum \mu_i F_i, \qquad \mu_i > 0, $$

$F_i$ 为 $f|_{X_0}$ 的纤维；于是 $\operatorname{supp}(T - \sum \mu_i F_i) \subset X \setminus X_0$，后者维数 $1$；再用经典定理（同引 `HL83`）：

$$ T - \sum \mu_i F_i = \sum \lambda_j G_j, \qquad \lambda_j > 0, $$

$G_j$ 为 $X \setminus X_0$ 的不可约分支（纤维的组分）；由 $(\sum \lambda_j G_j)^{2} = 0$ 与 Zariski 引理，$\sum \lambda_j G_j$ 是纤维的倍数，故 $L \equiv f^{*}(A)$。

代数证明（`main.tex:488-498`，作者自注：不解析证明那样易推广到高维，见第 2.3.4 小节）：取 $X$ 上 ample $A$ 与正有理数 $m$ 使 $L \cdot A = m F \cdot A$，置 $D = mF$，则 $L^{2} = L \cdot D = D^{2}$ 且 $L \cdot A = D \cdot A$；记 $r = L^{2}$、$d = L \cdot A$，考察 ample 的 $L' = L + A$、$D' = D + A$，有

$$ (L' \cdot D')^{2} = (r + 2d + A^{2})^{2} = L'^{2} \cdot D'^{2}, $$

Hodge 指标取等迫使 $L'$ 与 $D'$ 数值成正比，从而 $L$ 与 $D$ 数值成正比，$L \equiv f^{*}(A)$。申报素材两处粗糙：`main.tex:497` 句尾 "and so do $L$ and $D$" 与前句重复（原文如此）；`main.tex:485` 末行把 $Y$ 误写为 $B$（"a suitable $\mathbb Q$-divisor $A$ on $B$"），读作 $Y$。同小节标题号 "2.3.4" 提示解析证明的推广位在第 2.3 小节第 4 段，即素材盘面 `main.tex:443` 起的 $n = 1$ 讨论（登记按盘面）。

推广（`main.tex:501-510`）：$n(L) = 1$、$\dim X$ 任意时结论不变：$f : X \to Y$ 全纯且 $L \equiv f^{*}(A)$；$n(L) = 0$ 当且仅当 $L \equiv 0$。

反例节（第 3 节，`main.tex:513-624`）。Tsuji 主张（主张 3.1，`main.tex:516-531`）：$(L, h)$ 为光滑射影簇上带奇异 Hermite 度量的线丛、曲率电流 $\Theta_h$ 非负，则存在双有理唯一的有理纤维化 $f : X \dashrightarrow Y$：(a) $f$ 在 $Y$ 的一般点处正则；(b) $(L, h)|_{F}$ 对 very general 纤维良定义且数值平凡；(c) $\dim Y$ 在诸纤维化中最小。$(L, h)$ 数值平凡与交数的定义（定义 3.2，`main.tex:532-553`）：对 $\mathcal I(h^{m}) \otimes \mathcal O_C \to \mathcal O_C$ 在 $C$ 一般点处一切 $m$ 皆同构的不可约曲线，

$$ (L, h) \cdot C := \limsup_{m \to \infty} \frac{\dim H^{0}(C, \mathcal O_C(mL) \otimes \mathcal I(h^{m})/\mathrm{tor})}{m}. $$

素材申明主张按字面平凡（唯一性除外），真意是"$(L, h) \cdot C = 0$ 的曲线全被 $f$ 缩掉"，且 (c) 应读作：$x$ very general 时过 $x$ 的一切曲线有 $(L, h) \cdot C > 0$（`main.tex:554-561`）。

反例本体（`main.tex:563-619`）：$X = \mathbb P^{2}$（齐次坐标 $(z_0 : z_1 : z_2)$），$L = \mathcal O(1)$，$h$ 由过点 $p = (1:0:0)$ 的直线不完全线性系统诱导，对应 psh 函数

$$ \phi = \frac{1}{2} \log (|z_1|^{2} + |z_2|^{2}). $$

指数理想的计算借 `De00`（Demailly, Trieste 讲稿 2000）5.9 的代数化与 5.8 的直接推像公式：$\mathcal J_p = (z_1, z_2)$ 既约点理想整闭；吹高 $\mu : \mathbb F_1 \to \mathbb P^{2}$（Hirzebruch 曲面），$\mu^{*}\mathcal J_p = \mathcal O(-E)$，$K_{\mathbb F_1} = \mu^{*} K_{\mathbb P^{2}} + E$；$(z_i \circ \mu)$ 生成 $\mathcal O(-E)$ 故 $m \phi \circ \mu \sim m \log g$（$g$ 局部生成元），$\mathcal I(m \phi \circ \mu) = \mathcal O(-mE)$，于是

$$ \mathcal I(m\phi) = \mu_{*}\big( \mathcal O(K_{\mathbb F_1} - \mu^{*} K_{\mathbb P^{2}}) \otimes \mathcal I(m\phi \circ \mu) \big) = \mu_{*} \mathcal O_{\mathbb F_1}((1 - m)E) = \mathcal J_p^{\,m - 1}. $$

曲线交数：$C \subset \mathbb P^{2}$ 光滑、次数 $d$、亏格 $g$。$p \notin C$ 时 $\mathcal O_C(mL) \otimes \mathcal J_p^{m-1} = \mathcal O_C(mL)$，$(L, h) \cdot C = d$。$p \in C$ 时为 $\mathcal O_C(mL - (m-1)p)$，次数 $md - m + 1 = m(d - 1) + 1$，Riemann-Roch 给

$$ \limsup_{m \to \infty} \frac{\dim H^{0}(C, \mathcal O_C(mL) \otimes \mathcal I(m\phi))}{m} = \limsup_{m \to \infty} \frac{m(d - 1) + 1 + 1 - g}{m} = d - 1. $$

结论（`main.tex:614-619`）：Tsuji 的纤维化在此例中只能取平凡映射 $\mathbb P^{2} \to \mathbb P^{2}$：不能缩到点（存在 $(L,h) \cdot C \ge 1$ 的曲线），也不能几乎全纯映到曲线（$\mathbb P^{2}$ 不含自交消失的曲线，素材 `main.tex:618` 印作 "$\mathbb P_2$"，读作 $\mathbb P^{2}$），与 (c) 矛盾。遗留问题（`main.tex:621-624`）：去掉条件 (a) 后主张是否成立；线性系统诱导的奇异度量情形，纤维化是否可取该线性系统诱导的有理映射。

## 6 与本语料的接缝

本稿不读语料稿，接缝按派单原样登记：引用本文的语料稿为 D318（bib key `BCEKPRSW2002`）与 D385（bib key `BCEKPRSW2002`），两处同键；键名年份 2002 提示对应正式刊出版（刊发信息素材内无记载，本素材为 2001-06-18 预印本），两版差异未核验，登记为待查；语料稿侧回引具体行位由本体侧统一执行。

被引内容在 C 稿中的读法约定：语料稿若以该文献指"nef 线丛的约化映射存在唯一"，读作定理 2.1（`main.tex:102-115`），两条特征（紧纤维数值平凡、一般点处横越曲线正交）与双有理唯一性都在该陈述内；若指"nef 维数"，读作定义 2.7 与命题 2.8、推论 2.9 的链条 $\kappa(L) \le \nu(L) \le n(L)$（`main.tex:363-404`）；若指"数值平凡判据（链连接）"，读作定理 2.4（`main.tex:150-156`）；若指 "$(1,1)$ nef 类的同型定理"，读作定理 2.6（`main.tex:344-360`）；若指"$n(L) = 1$ 时 $L \equiv f^{*}(A)$ 的下传"，读作命题 2.11 及任意维推广（`main.tex:443-510`）；若指"伪有效情形几乎全纯性失效的反例"，读作第 3 节 $\mathbb P^{2}$ 算例，交数具体值 $(L,h) \cdot C = d$（$p \notin C$）与 $d - 1$（$p \in C$）在 `main.tex:596-612`。记号对齐：本稿 $n(L)$ 是 nef 维数，注意与素材中作维数符号的 $n = \dim X$（如 `main.tex:387-389` 证明内）区分；$\nu(L)$ 在本文取"数值 Kodaira 维数"义（最大 $k$ 使 $L^{k} \not\equiv 0$），与 Seshadri 常数语境无关；$\equiv$ 恒指数值等价。方法输出：证明完全代数这一点对语料稿可能重要，核心外部件只有两处（Campana 纤维化 `Ca81`/`Ca94`、曲面弱判据里的 Hodge 指标定理），其余是交数操作。收稿前更正申报：本稿第 1、3 节共四处把有理映射箭头写作 `\dasharrow`（素材原文记号，非可渲命令），已逐字更正为 `\dashrightarrow`，映射陈述内容未动；第 5 节 "次mersive" 中英混杂笔误亦已逐字更正为 "局部满射"。更正申报：第 5 节 "设 $Y_0$ 为 $f$ 次mersive 的最大开集" 系中英混杂笔误，素材原文 maximal open subset over which $f$ is a submersion（`main.tex:468-469`），读作 "$f$ 局部满射的最大开集"，已随本笔逐字更正。
