# C47 随机k-SAT的临界指数（arXiv:math/0005136）

## 0 取证边界

- arXiv id：`math/0005136`。
- 原题名（逐字）：On the critical exponents of random $k$-SAT。
- 作者（逐字，API 署名）：David B. Wilson；素材扉页署名为 "David B. Wilson, One Microsoft Way, Redmond, WA 98052, U.S.A."（`sqrt.tex:38-45`）。
- 发表年月：2000-05-13。
- 素材目录：`E:\math\被引素材\math_0005136`，主文件 `sqrt.tex`，实测 38262 字节、778 行（派单记 779 行，以盘面 778 为准，差在文件末行换行符计数）；同目录另有样式文件 `dbw.sty`，仅用于解释宏包记号，不作内容来源；目录无 `.pdf`；参考文献经 `\bibliography{sqrt}` 外挂（`sqrt.tex:775`），本稿不读 `.bib`，涉及文献处只转述素材正文写明的数值与结论。
- 本语料引用它的稿号与 bib key（原样登记）：D458（bib key `Wilson2002`）；D729（bib key `Wilson`）。
- 取材薄读之处：`sqrt.tex:532-576` 为整段被注释掉的"totally-free bystander 规则与素蕴含式"备用论证，本稿在接缝处登记其存在与结论走向，不视为正文定理；`sqrt.tex:771-778` 为致谢与文献挂接行。取证共 2 次读取，覆盖 `sqrt.tex` 全篇 1-778 行。
- 记法换算登记：素材宏 `\eps` 即 `\varepsilon`；`\Var`、`\Cov` 已是 `\operatorname{Var}`、`\operatorname{Cov}` 形，照写；`${\cal F}_{n,p}$`、`${\cal F}_{n,m}$` 写作 `\mathcal F_{n,p}`、`\mathcal F_{n,m}`；`\citen`、`\tfn` 等引文排版宏不落正文；素材定理环境自动编号为 Theorem 1、2 与 Lemma，本稿按素材实际标签称 Theorem sqrt、Lemma rg-balls、Lemma many-free、Corollary 3-sat 等并给位置串，不复制 `\label`。按素材环境的自动编号，它们是定理 1、引理 2、引理 3、推论 4、推论 5、推论 6，下文即用这套编号。

## 1 模型、阈值、转变宽度与指数 $\nu$ 的申报数值

模型定义（`sqrt.tex:80-84`）：$n$ 个布尔变量；literal 是变量或其否定；$k$-clause 是底层变量两两不同的 $k$ 个 literal 的析取；随机 $k$-SAT 公式是 $m$ 条均匀随机 $k$-clause 的合取；可满足指存在赋值使公式取 TRUE。可能 clause 总数 $M = 2^{k} \binom{n}{k}$（`sqrt.tex:183-184`、`sqrt.tex:272-274`）。三个标准系综（`sqrt.tex:66-70`、`sqrt.tex:180-189`）：无放回选 $m$ 条、有放回选 $m$ 条、每条 clause 独立以概率 $p$ 入选（$\mathcal F_{n,p}$）。经验事实：$2$-SAT 阈值 $m/n \to 1$（`sqrt.tex:54-57`）；$3$-SAT 临界比 $\alpha_3 \approx 4.2$，$m/n < \alpha_3 - \varepsilon$ 时几乎必然可满足、$m/n > \alpha_3 + \varepsilon$ 时几乎必然不可满足，且判定难度在阈值附近最大（`sqrt.tex:86-93`）。严格结果：Friedgut 定理给出锐阈值，某临界比处可满足概率从近 $1$ 急落到近 $0$（`sqrt.tex:99-102`）；但 $k > 2$ 时未证明临界比趋于常数，可能是在已知上下界间摆动的慢变化函数：一般 $k$ 的下界 $(\log 2) 2^{k-1} - (\log 2 + 1)/2 - o_k(1)$、上界 $(\log 2) 2^{k}$（`sqrt.tex:103-108`），$k = 3$ 的紧界为 $3.42$ 与 $4.506$（`sqrt.tex:106-108`）。

宽度与指数的定义（`sqrt.tex:110-123`）：特征宽度 $\Delta$ 是使可满足概率从 $2/3$ 降到 $1/3$（一般地从 $1 - \varepsilon$ 降到 $\varepsilon$）所需增加的 $m$ 量；信念是 $\Delta = \Theta(n^{1 - 1/\nu})$，隐常数依赖 $\varepsilon$ 而 $\nu$ 不依赖；$\nu$ 是否良定义并不先验显然，可随 $n$ 缓振或依赖 $\varepsilon$（`sqrt.tex:124-126`）；记号 $\nu$ 与统计力学的 $\nu$ 无关，后者对应此处的 $2 - \alpha$ 位（`sqrt.tex:117-123`）。$2$-SAT 已证宽度多项式增长且 $\nu = 3$（`sqrt.tex:126-128`）。实验与启发式数值（`sqrt.tex:61-63` 与表 `sqrt.tex:141-178`）：$\nu_3 = 1.5 \pm 0.1$、$\nu_4 = 1.25 \pm 0.05$、$\nu_5 = 1.1 \pm 0.05$、$\nu_6 = 1.05 \pm 0.05$，启发式猜 $\nu_k \to 1$（$k \to \infty$）。本文主申报（`sqrt.tex:132-135`、`sqrt.tex:64-66`）：给一个简单证明，每个固定 $k$（只要 $\nu$ 良定义）都有 $\nu \ge 2$，即特征宽度至少 $\Theta(n^{1/2})$，三个系综同时成立，并对 $q$-可着色与随机图 $q$-core 出现有同类结果。

$\mathcal F_{n,p}$ 系的旧论证（`sqrt.tex:180-209`）：即便 $pM = m$，clause 数仍是 $m \pm \Theta(m^{1/2})$，由此直接得 $\nu \ge 2$（`sqrt.tex:189-193`），该界与无序统计力学系统的 Harris 判据相关（`sqrt.tex:193-195`）；此论证依赖 clause 数的方差，而无放回 $\mathcal F_{n,m}$ 中该方差为零；反例说明两个系综确有差别：性质"$m \le 4.2n$"在 $\mathcal F_{n,m}$ 中 $\nu = 1$、在 $\mathcal F_{n,p}$ 中 $\nu = 2$（`sqrt.tex:196-203`）。本文结论是可满足性性质即便在 $\mathcal F_{n,m}$ 中也宽度至少 $\Theta(n^{1/2})$（`sqrt.tex:207-209`）。

推论级附带结果（引言申报，工具在第 2 至 5 节）：其一，$m_r(n)$ 记可满足公式比例降到 $\le r$ 的最小 $m$；Crawford-Auton 曾以 $m_{1/2}(n) = \alpha_3 n + A n^{1 - 1/\nu}$ 拟合得 $\nu = 1$、后改 $\nu = 3/5$（`sqrt.tex:211-219`）；本文推出：至多存在一个 $r$ 使 $m_r(n) = \alpha_3 n + o(n^{1/2})$，否则转变过锐（`sqrt.tex:220-222`）；$2$-SAT 中该特殊 $r$ 经验值约 $91\%$，$3$-SAT 无理由相信它是 $1/2$（`sqrt.tex:223-226`）。其二，带 pure literal rule 的 SAT 求解器：若 $m$ 条 clause 时递归调用数落在 $[L, U]$ 的概率为 $p$，则 $m + \Delta$ 条时该概率为 $p + O(\Delta/\sqrt{n}) + o(1)$，即典型（typical，非中位）计算难度的临界指数至少 $2$（`sqrt.tex:237-251`）。其三，$q$-core 转变：Pittel-Spencer-Wormald 证锐度并给宽度上界 $n^{1/2 + o(1)}$ 而无下界，本文补下界 $\Theta(n^{1/2})$（`sqrt.tex:253-261`）。

## 2 bystander 规则、定理 1 与三条推论的数值

设置（`sqrt.tex:269-285`）：$M$ 个可能 item；$k$-SAT 时 item 是 clause、$M = 2^{k} \binom{n}{k}$；$q$-core 与 $q$-可着色时 item 是 $n$ 顶点图的边、$M = \binom{n}{2}$。性质把 item 集合分为 proper 与 improper 两类；可满足性是 clause 集上的性质，$q$-core 存在性是边集上的性质，也允许非单调性质（如某求解器递归调用数超过 $L$）。

bystander 规则定义（`sqrt.tex:287-295`）：把 item 集划分为 relevant 与 bystander 两类（记 $G$ 为 bystander 集），约束条件是：对任何 $B \subseteq A$，$B$ 有性质当且仅当 $B \setminus G$ 有性质，即在 $A$ 内 subsets 上 bystander items 从不影响性质。SAT 用 partially-free 规则：某 clause 的某个 literal 的底层变量在公式中别处不再出现，则该 clause 是 bystander；把该变量赋适当值即可满足该 clause 而不影响其余公式（`sqrt.tex:297-304`）。$q$-core 与 $q$-可着色用图版 partially-free：边的某端点度数为 $1$ 则该边是 bystander（`sqrt.tex:306-310`）。注记：也可用"经反复 pure literal rule 最终被消解的 clause"作 bystander，但 partially-free 更易分析，符合"简单严格证明"的目标（`sqrt.tex:312-317`）。

定理 1（主定理，`sqrt.tex:319-332`）：设某性质有 bystander 规则，使 $m$ 个随机 item 的集合中以概率 $1 - \varepsilon$ 至少有 $\gamma m$ 个 bystander（item 可无放回或有放回选取）。又设 $m_1 < m$ 个随机 item 有性质的概率为 $p_1$，$m_2 < m$ 个为 $p_2$，且 $\beta \le m_1/m \le 1 - \beta$、$\beta \le m_2/m \le 1 - \beta$，则

$$ |m_1 - m_2| \ge \left( |p_1 - p_2| - \varepsilon \right) \sqrt{2\pi m}\, \sqrt{\frac{\gamma \beta (1 - \beta)}{1 - \gamma}}\, (1 - o(1)), $$

其中 $o(1)$ 在 $m \to \infty$ 而 $\beta, \gamma$ 固定时趋于 $0$（`sqrt.tex:330-331`）。非正式内容：bystander 多则转变不可能太锐（`sqrt.tex:334-335`）。

引理 2（红绿球峰高界，`sqrt.tex:336-346`）：$m$ 个球中 $\gamma m$ 绿、$(1 - \gamma) m$ 红，无放回抽 $\beta m$ 个；则"第 $\beta m$ 个被抽球为红且抽中恰 $\ell$ 个红球"的概率作为 $\ell$ 的函数是单峰的，且至多

$$ \frac{1 + o(1)}{\sqrt{2\pi m}} \sqrt{\frac{1 - \gamma}{\gamma \beta (1 - \beta)}}, $$

$o(1)$ 在抽中红、抽中绿、未抽红、未抽绿四者的期望都大时变小（`sqrt.tex:343-345`）。证明推迟到素材第 3 节（本稿第 4 节）。

引理 3（partially-free 计数，`sqrt.tex:438-445`）：item 为 $k$-clause、边或 $k$-一致超边，$k$ 固定，$m = O(n)$，则高概率下 partially-free item 数为

$$ (1 + o(1)) m \left[ 1 - \left[ 1 - e^{-km/n} \right]^{k} \right], $$

即与朴素期望一致（`sqrt.tex:447-448` 说明用途：该引理用于反驳若干实验与启发结论，故给出谨慎证明）。

推论 4（$3$-SAT 与一般 $k$-SAT 的宽度下界，`sqrt.tex:453-464`）：设 $1 > p_1 > p_2 > 0$ 固定，$n$ 变量 $m_1$ 条 clause 的随机 $3$-SAT 可满足概率 $\ge p_1$、$m_2$ 条的 $\le p_2$，则

$$ m_2 - m_1 \ge (0.0015 + o(1)) \times (p_1 - p_2) \times \sqrt{n}, $$

$o(1) \to 0$（$n \to \infty$）；特别 $\nu_3 \ge 2$（若良定义）。一般固定 $k$：$m_2 - m_1 \ge (p_1 - p_2) \Theta(\sqrt{n})$，$\nu_k \ge 2$。推导链（`sqrt.tex:466-492`）：$m_i/n$ 皆贴近临界比 $c_3(n)$，$3.42 \le c_3(n) \le 4.571$（$4.506$ 界细节当时未出版，故用 $4.571$，`sqrt.tex:467-471`）；记上下界为 $\check c_k, \hat c_k$，取 $m = n (c_k(n) + t)$（$t > 0$ 待定），由引理 3 得 bystander 比例 $\gamma = 1 - [1 - e^{-k(c_k(n) + t)}]^{k} + o(1)$，定理 1 的 $\beta = t/(c_k(n) + t)$（`sqrt.tex:476-480`）；单调性核验：$\gamma$ 随 $c_k(n)$ 单调减，而 $m \beta (1 - \beta) = n t c_k(n)/(c_k(n) + t)$ 单调增，故

$$ |m_1 - m_2| \ge (|p_1 - p_2| - o(1)) \sqrt{2\pi n} \sqrt{\frac{\check c_k t}{\check c_k + t}} \sqrt{\frac{1 - [1 - e^{-k(\hat c_k + t)}]^{k}}{[1 - e^{-k(\hat c_k + t)}]^{k}}} (1 - o(1)) = (p_1 - p_2) \Theta(\sqrt{n}), $$

$3$-SAT 取 $t = 0.3$ 得常数 $0.0015$（`sqrt.tex:484-491`）。

推论 5（$q$-core，`sqrt.tex:494-513`）：$q$-core 是每点度数 $\ge q$ 的最大子图；其出现有锐阈值且临界比精确已知：$c_3 \approx 3.35$、$c_4 \approx 5.14$、$c_5 \approx 6.81$、$c_k = k + \sqrt{k \log k} + O(\log k)$（`sqrt.tex:496-498`）。结论：$q \ge 3$ 时转变特征宽度 $\ge \Theta(\sqrt{n})$。论证与 SAT 同型，只是 item 是边、$k = 2$ 固定而 $q$ 变动（`sqrt.tex:500-502`）。附注：逐边加入时 $q$-core 大小以一条边从 $0$ 跳到 $\Theta(n)$（PSW 定理），推论 5 是关于该跳跃时刻的陈述（`sqrt.tex:509-513`）。

推论 6（$q$-可着色，`sqrt.tex:515-530`）：$q$-可着色边数有锐阈值（Achlioptas-Friedgut）；$\check{}$Luczak 证 $c_q/(q \log q) \to 1$（$q \to \infty$）；$2.01 \le c_3 \le 2.495$（`sqrt.tex:520-523`）；$q \ge 3$ 时转变宽度至少 $\Theta(\sqrt{n})$，同样 $k = 2$。

## 3 定理 1 的证明：随机标记、临界整数与交错单峰估计

证明框架（`sqrt.tex:351-431`）。记 item 为 $C_1, \ldots, C_M$。无放回时 $\sigma$ 取 $\{1, \ldots, M\}$ 的均匀随机排列，有放回时 $\sigma$ 取 i.i.d. 均匀整数列；$f_m = \langle C_{\sigma(1)}, \ldots, C_{\sigma(m)} \rangle$ 是均匀随机（无/有放回）$m$-item 序列；$g_m$ 为其中 bystander 数，$r_m = m - g_m$ 为 relevant 数（`sqrt.tex:352-360`）。临界整数定义（`sqrt.tex:361-365`）：$\ell$ 称 positively critical，若 $f_m$ 中前 $\ell$ 个 relevant item 的集合 proper 而前 $\ell - 1$ 个 improper；negatively critical 反之。该定义把"性质随 relevant 集合增长而翻转"的位置离散化为整数集。

标记论证（`sqrt.tex:366-377`）：取与 $\sigma$ 独立的均匀置换 $\tau$，用它从 $f_m$ 中标记 $b$ 个 item（$\tau$ 像上的 $C_{\sigma(\cdot)}$）；被标记集合与先 $\tau$ 后 $\sigma$ 的选取同分布，故是均匀随机 $b$-item 集（无/有放回）。设标记中有 $L$ 个 relevant。因 $f_m$ 次序已随机，可改为保留 $f_m$ 的前 $L$ 个 relevant 与前 $b - L$ 个 bystander；所得集合 $\hat f_{m,b}$ 是均匀随机 $b$-item 集，且 $\hat f_{m,b}$ 是否有性质由 $L$ 决定（关键的分布等式在此完成从"$b$ 个均匀 item"到"按序取前 $L$ 个 relevant"的切换）。

条件化的相邻差分（`sqrt.tex:378-384`）：

$$ \Pr[\hat f_{m,b}\ \text{proper} \mid f_m] - \Pr[\hat f_{m,b-1}\ \text{proper} \mid f_m] = \Pr[\text{relevant 标记数为 positively critical 且第 } b \text{ 个标记 relevant} \mid f_m] - \Pr[\text{negatively critical 且第 } b \text{ 个 relevant} \mid f_m]. $$

交错与单峰（`sqrt.tex:385-405`）：正负临界整数在 $\mathbb Z$ 中交错排列；令 $f(\ell) = \Pr[\text{relevant 标记数} = \ell,\ b\ \text{个标记 relevant} \mid f_m]$，由引理 2（对 $f_m$ 中 relevant/bystander 二分即红绿球模型）知 $f(\ell)$ 单峰。设临界整数为 $\ell_1, \ldots, \ell_c$、$\ell_\mu$ 使 $f$ 最大，则交错和两侧估计：

$$ \sum_{i=1}^{c} (-1)^{i - \mu} f(\ell_i) \le f(\ell_\mu), \qquad \sum_{i=1}^{c} (-1)^{i - \mu} f(\ell_i) \ge f(\ell_\mu) - f(\ell_{\mu+1}) - f(\ell_{\mu-1}) \ge -f(\ell_\mu), $$

左式把相邻项成组配对（$f(\ell_{\mu+1}) - f(\ell_{\mu+2}) \ge 0$ 等，由单峰性），右式同理反向配对（`sqrt.tex:391-405`）。于是相邻差分受峰高控制：

$$ \left| \Pr[\hat f_{m,b}\ \text{proper} \mid f_m] - \Pr[\hat f_{m,b-1}\ \text{proper} \mid f_m] \right| \le \max_\ell \Pr[\text{relevant 标记数} = \ell,\ b\ \text{个标记 relevant} \mid f_m] \le \frac{1 + o(1)}{\sqrt{2\pi m}} \sqrt{\frac{r_m/m}{(g_m/m)(b/m)(1 - b/m)}} $$

（`sqrt.tex:407-411`，中间一步由引理 2 代入局部比例 $\gamma \to g_m/m$、$\beta \to b/m$）；再设 $g_m \ge \gamma m$ 且 $\beta m \le b \le (1 - \beta) m$，得一致界

$$ \le \frac{1 + o(1)}{\sqrt{2\pi m}} \sqrt{\frac{1 - \gamma}{\gamma \beta (1 - \beta)}} $$

（`sqrt.tex:412`；素材此处即 $\gamma\beta(1-\beta)$ 形，$o(1)$ 在 $m \to \infty$、$\beta, \gamma$ 固定时变小，`sqrt.tex:414-415`）。

汇总（`sqrt.tex:415-429`）：对 $b$ 从 $m_1$ 到 $m_2$ 逐段 telescoping，按事件 "$f_m$ 的 bystander 数 $\ge \gamma m$" 分解概率，条件概率部分乘 $|m_1 - m_2|$ 与上面的峰高界，坏事件部分直接以 $\varepsilon$ 入账：

$$ |p_1 - p_2| \le |m_1 - m_2| \frac{1 + o(1)}{\sqrt{2\pi m}} \sqrt{\frac{1 - \gamma}{\gamma \beta (1 - \beta)}} + \varepsilon, $$

移项即定理 1。（更正申报：上一段末尾排版误 $\beta$ 为 `1 - \β`，落盘文本保留，此处声明读作 $1 - \beta$；第 2 节引理 2 段 "$o(1)$ 在抽中红…的期望都大"一句，素材原文为 the expected number of sampled red balls, sampled green balls, unsampled red balls, and unsampled green balls 皆大（`sqrt.tex:343-345`），应读作四格期望均趋于无穷；第 2 节推论 6 中 "$\check{}$Luczak" 排版误，当作 Łuczak，素材作 `\L uczak`（`sqrt.tex:520`）。）（补充申报：第 3 节一致界展示式中的误植 `\β` 已在后续一笔中执行逐字更正为 `\beta`，展示式其余部分与上下文未动，符合"在后一笔更正并申报"的口径。）

## 4 引理 2 证明：超几何单峰性与 Stirling 展开链

记号 $g = \gamma m$（绿）、$r = (1 - \gamma) m$（红）、$b = \beta m$（抽取数）（`sqrt.tex:581-584`）。第 $b$ 个被抽球恰为第 $\ell$ 个红球的精确概率（`sqrt.tex:585-586`）：

$$ P(\ell) = \frac{\binom{r}{\ell} \binom{g}{b - \ell} \frac{\ell}{b}}{\binom{r + g}{b}}. $$

相邻比（`sqrt.tex:587-593`）：

$$ \frac{P(\ell)}{P(\ell + 1)} = \frac{\ell (g - b + \ell + 1)}{(r - \ell)(b - \ell)}, $$

该比关于 $\ell$ 单调，立即给出单峰性（`sqrt.tex:594`）。定位峰：解 $P(\ell) \ge P(\ell + 1)$ 得 $\ell (g - b + 1 + b + r) \ge r b$ 即 $\ell \ge rb/(r + g + 1)$，最优 $\ell = \lceil rb/(r + g + 1) \rceil$，与 $rb/(r + g)$ 之差至多 $1$（`sqrt.tex:595-602`）。

峰高估计用 Stirling 精确形 $n! = n^{n} e^{-n} \sqrt{2\pi n} \exp[1/(12n + \delta_n)]$ 余项，$0 \le \delta_n \le 1$（`sqrt.tex:606-607`；此处落盘初笔误作 `\sqrt{2\pi m}`，已在后一笔逐字更正为 `\sqrt{2\pi n}` 并申报）。置 $\lambda = \ell/m$，展开（`sqrt.tex:609-627`）：

$$ P(\ell) = \frac{\lambda}{\beta} \left[ \frac{(1 - \gamma)^{1 - \gamma} \gamma^{\gamma} \beta^{\beta} (1 - \beta)^{1 - \beta}}{\lambda^{\lambda} (1 - \gamma - \lambda)^{1 - \gamma - \lambda} (\beta - \lambda)^{\beta - \lambda} (\gamma - \beta + \lambda)^{\gamma - \beta + \lambda}} \right]^{m} \frac{1}{\sqrt{2\pi m}} \sqrt{\frac{(1 - \gamma) \gamma \beta (1 - \beta)}{\lambda (1 - \gamma - \lambda)(\beta - \lambda)(\gamma - \beta + \lambda)}} \exp(o(1)). $$

两处舍弃论证是关键中间步。其一，$\exp[1/(12n + \delta_n)]$ 误差部分的总乘积不超过 $1$，因为 $\ell \le r$、$r - \ell \le m - b$、$b - \ell \le b$、$g - b + \ell \le g$ 四个不等式恰好保证各阶乘修正项配对后不超界，故删去仍以 $P(\ell)$ 的上界自标（`sqrt.tex:629-632`）。其二，方括号幂次项 $[\cdots]^{m}$ 若大于 $1$，则在保持比例 $g/m$、$\ell/m$、$b/m$ 不变的条件下增大 $m$，可把该"概率"放大到任意大乃至超过 $1$，矛盾，故亦可删（`sqrt.tex:633-636`）。余下

$$ P(\ell) \le \frac{1}{\sqrt{2\pi m}} \sqrt{\frac{(1 - \gamma) \gamma \lambda (1 - \beta)}{\beta (1 - \gamma - \lambda)(\beta - \lambda)(\gamma - \beta + \lambda)}}, $$

代入 $\lambda = (1 - \gamma) \beta \pm 1/m$（峰的定位式，`sqrt.tex:645`）化简（`sqrt.tex:646-656`）：

$$ P(\ell) \le \frac{1}{\sqrt{2\pi m}} \sqrt{\frac{1 - \gamma}{\beta (1 - \beta) \gamma}} (1 + o(1)), $$

$o(1)$ 消失条件为四个混合量 $\beta(1 - \gamma) \gg 1/m$、$\beta \gamma \gg 1/m$、$(1 - \beta)(1 - \gamma) \gg 1/m$、$(1 - \beta) \gamma \gg 1/m$（`sqrt.tex:658-659`），与引理陈述中四期望皆大的说法一致。注记（`sqrt.tex:662-668`）：审稿人建议的替代引理改数 nearly free 变量/顶点并用鞅大偏差不等式，常数更差但证明短得多；本文保留初等证明因其背景要求低。

## 5 引理 3 证明：$d$-free 概率、协方差控制与容斥

参数约定（`sqrt.tex:671-676`）：item 是 $k$ 个布尔变量的 clause 时取 $r = 2$（每个变量两种 polarity），item 是图边（$k = 2$）或 $k$-一致超边时取 $r = 1$；可能 item 总数 $M = r^{k} \binom{n}{k}$；$k$ 固定、$m = O(n)$，故 $k$ 与 $m/n$ 的函数记为 $O(1)$；$k \to \infty$ 随 $n$ 的情形留待更细分析、文中不处理。

$d$-free 定义（`sqrt.tex:681-684`）：item 的前 $d$ 个变量（clause 情形）或前 $d$ 个顶点（边/超边情形）不出现在集合中任何其它 item 里。无放回时单 item 的 $d$-free 概率（`sqrt.tex:686-695`）：

$$ \Pr[\text{item 为 } d\text{-free}] = \frac{\binom{r^{k} \binom{n - d}{k}}{m - 1}}{\binom{r^{k} \binom{n}{k} - 1}{m - 1}} = \prod_{i = 0}^{m - 2} \frac{r^{k} \frac{(n - d)(n - d - 1) \cdots (n - d - k + 1)}{k!} - i}{r^{k} \frac{n (n - 1) \cdots (n - k + 1)}{k!} - i - 1}. $$

用落降符号 $(n)_k = n(n - 1) \cdots (n - k + 1)$ 简写。核心代数恒等式（`sqrt.tex:696-697`）：

$$ \frac{a - \delta}{b - \delta} = \frac{a}{b} - \frac{1 - a/b}{b - \delta} \delta, $$

逐项估计（`sqrt.tex:699-708`）：

$$ \frac{r^{k} \frac{(n - d)_k}{k!} - i}{r^{k} \frac{(n)_k}{k!} - i - 1} = \frac{(n - d)_k}{(n)_k} - \frac{1 - (n - d)_k / (n)_k}{M - (i + 1)} (i + 1) + \frac{1}{M - (i + 1)} = \frac{(n - d)_k}{(n)_k} \exp[O(1/M)] = \exp[-dk/n + O(1/n^{2})], $$

其中用了 $1 - (n - d)_k/(n)_k = (1 + o(1)) dk/n$ 与 $m = O(n)$ 的规模；有放回抽样时 $\exp[O(1/M)]$ 误差项不出现（`sqrt.tex:709-710`）。乘起来得：集合中给定 item 为 $d$-free 的概率是 $\exp[-(1 + o(1)) d k m/n]$，期望个数 $m \exp[-(1 + o(1)) d k m/n]$（`sqrt.tex:711-712`）。

协方差控制（`sqrt.tex:714-743`）：$X_C^{(d)}$ 为 item $C$ 的 $d$-free 示性变量。无放回下两点联合（`sqrt.tex:715-724`）：

$$ \Pr[C, C' \text{ 皆 } d\text{-free}] = \Pr[\text{两者的前 } d \text{ 个变量互不入对方}] \times \frac{\binom{r^{k} \binom{n - 2d}{k}}{m - 2}}{\binom{r^{k} \binom{n}{k} - 2}{m - 2}} = \left( 1 - \frac{2dk - d^{2} + o(1)}{n} \right) \prod_{i = 0}^{m - 3} \frac{r^{k} \frac{(n - 2d)_k}{k!} - i}{r^{k} \frac{(n)_k}{k!} - i - 2}, $$

每因子同前法估计为 $\frac{(n - 2d)_k}{(n)_k} \exp[O(1/M)]$（`sqrt.tex:725-733`）。比对期望乘积的比值链（`sqrt.tex:736-741`）：

$$ \frac{E[X_C^{(d)} X_{C'}^{(d)}]}{E[X_C^{(d)}] E[X_{C'}^{(d)}]} = \frac{1 - (2kd - d^{2} + o(1))/n}{(1 - (kd + o(1))/n)^{2}} \left( \prod_{j = 0}^{k - 1} \frac{(n - 2d - j)(n - j)}{(n - d - j)^{2}} \right)^{m - 2} \exp(O(m/n^{k})) = 1 + O(1/n), $$

两步化简：前因子 $= 1 + (d^{2} + o(1))/n$；乘积内每因子 $= 1 - (1 + o(1)) d^{2}/n^{2}$，共 $k$ 个、外幂 $m - 2 = O(n)$，净效应 $\exp(O(1/n))$ 级。于是 $\operatorname{Cov}(X_C^{(d)}, X_{C'}^{(d)}) = O(1/n)$（`sqrt.tex:742`），方差

$$ \operatorname{Var}\left[ \sum_C X_C^{(d)} \right] = m(m - 1) O(1/n) + m \operatorname{Var}(X_C^{(d)}) = O(m) $$

（`sqrt.tex:744-747`），切比雪夫不等式给出：$d$-free 实际个数高概率落在期望 $m \exp[-(1 + o(1)) d k m/n]$ 的 $O(\sqrt{m})$ 邻域内（`sqrt.tex:748`）。

容斥收尾（`sqrt.tex:750-767`）：partially-free 即"至少一个位置自由"，写 $X_C^{+} = 1 - \sum_{S \subseteq \{1, \ldots, k\}} (-1)^{\# S} X_C^{S}$（$X_C^{j_1, \ldots, j_d}$ 记在位置集 $S$ 上自由），求和 $\sum_C X_C^{+} = m - \sum_{S} (-1)^{\# S} \sum_C X_C^{S}$。$k$ 固定故 $S$ 仅 $2^{k} = O(1)$ 个，每个 $\sum_C X_C^{S}$ 只依赖 $\# S = d$，各自有 $O(\sqrt{m})$ 高概率误差，合并：

$$ \sum_C X_C^{+} = m(1 + o(1)) \left[ 1 - \sum_{d = 0}^{k} \binom{k}{d} (-1)^{d} e^{-dkm/n} \right] = m(1 + o(1)) \left[ 1 - [1 - e^{-km/n}]^{k} \right]. $$

申报一处素材笔误：`sqrt.tex:766` 该行印作 $\binom{n}{k}$，按上下文与二项定理闭合式应为 $\binom{k}{d}$，本稿展示式已按 $\binom{k}{d}$ 读；判断依据是该式求和后须等于 $(1 - e^{-km/n})^{k}$，$\binom{n}{k}$ 形使等式不可能成立。引理 3 证毕（`sqrt.tex:767` 行末 `\qedhere`）。

## 6 数值汇总：猜想与严格界的对照、被注释的备用论证

素材表格（`sqrt.tex:141-178`）把 SAT-to-UNSAT 转变宽度的"$\nu$"逐 $k$ 对照，猜想列对严格列：$k = 2$：$2.6 \pm 0.2$、$2.8$、$3$（猜想侧）对 $3$（严格，Bollobás-Borgs-Chayes-Kim-Wilson）；$k = 3$：$1.5 \pm 0.1$、$1.5$ 对 $\ge 2$（本文）；$k = 4$：$1.25 \pm 0.05$、$1.25$ 对 $\ge 2$；$k = 5$：$1.10 \pm 0.05$ 对 $\ge 2$；$k = 6$：$1.05 \pm 0.05$ 对 $\ge 2$；$k \to \infty$：$\to 1$ 对 $\ge 2$。表脚注指明猜想值出处为 Kirkpatrick-Selman、Kirkpatrick-Gyorgyi-Tishby-Troyansky、Monasson-Zecchina-Kirkpatrick-Selman-Troyansky（页 428 与页 135）、Monasson-Zecchina、Gent-Walsh（页 109）、Bollobás-Borgs-Chayes-Kim，严格 $\ge 2$ 一列全部标注"This article"（`sqrt.tex:153-175`）。解读：实验拟合若可信，转变宽度应随 $k$ 增大而快于 $\sqrt n$ 收敛，本文严格排除之；两列的落差即论文标题所指的 critical exponents 问题核心。

方法适用面的申报数值再汇点：$3$-SAT 常数 $0.0015$ 的来源核验（`sqrt.tex:491`，取 $t = 0.3$、$\check c_3 = 3.42$、$\hat c_3 = 4.571$、$k = 3$ 代入定理 1 右端并乘 $(p_1 - p_2)$）；$\gamma$ 在 $c = \hat c_3 + t = 4.871$ 处取值 $1 - [1 - e^{-3 \times 4.871}]^{3}$ 极接近 $1 - e^{-3c} \approx 1$，瓶颈在 $\sqrt{\gamma \beta (1 - \beta)/(1 - \gamma)}$ 的 $\beta = t/(c + t) \approx 0.058$ 一侧，故常数为千分位量级属预期。$q$-core 侧的已知数：$c_3 \approx 3.35$、$c_4 \approx 5.14$、$c_5 \approx 6.81$、$c_q = q + \sqrt{q \log q} + O(\log q)$（素材记 $c_k$ 于 `sqrt.tex:496-498`，其 $k$ 位对应这里的 $q$）；宽度下界同为 $\Theta(\sqrt n)$。$q$-可着色侧：$2.01 \le c_3 \le 2.495$、$c_q \sim q \log q$（`sqrt.tex:520-523`）。

被整段注释的备用论证（`sqrt.tex:532-576`）：素材在推论 6 后留有一段注释掉的文字与引理，处理性质"子句 $I = x_1 \vee \cdots \vee x_j$（$j < k$）是素蕴含式"的宽度界定。其中申报的要点：totally-free bystander 规则（clause $T$ 的 $k$ 对 literal 都不出现在其它 clause 中）对该性质是合法 bystander 规则，论证经双向核查：删 $T$ 后 $(f \setminus T) \wedge x_1 \wedge \cdots \wedge x_j$ 的不可满足性与 $f$ 的一致（利用 $T$ 中未现变量可任意赋值），并指明该性质非单调（`sqrt.tex:576` 注释行）。此段在交付版中未启用，登记存在与结论走向，不计入正文定理。

遗留与边界的自述：$\nu$ 的良定义性（不随 $n$ 缓振、不依赖 $\varepsilon$）在本文中始终未证，全部下界陈述都带"if the exponent is well-defined"条件（`sqrt.tex:64-66`、`sqrt.tex:132-135`）；$k$ 固定假设贯穿引理 3 及其推论，$k$ 随 $n$ 增长未处理（`sqrt.tex:675-679`）；$\mathcal F_{n,p}$ 侧的 $\nu \ge 2$ 论证独立且初等，靠 clause 数方差 $\Theta(m)$ 与宽度 telescoping（`sqrt.tex:188-193`）。

## 7 与本语料的接缝

本稿不读语料稿，接缝按派单原样登记：引用本文的语料稿为 D458（bib key `Wilson2002`）与 D729（bib key `Wilson`），两稿用不同键；键 `Wilson2002` 的年份提示对应本文的正式刊出版（预印本为 2000-05-13），本素材仅含该预印本，两版内容差异未核验，登记为待查；语料稿侧回引具体行位由本体侧统一执行。

被引内容在 C 稿中的读法约定：语料稿若以该文献指"$\nu \ge 2$ 下设定理"，读作本文定理 1（`sqrt.tex:319-332`）与推论 4（`sqrt.tex:453-464`），核心式为 $|m_1 - m_2| \ge (|p_1 - p_2| - \varepsilon) \sqrt{2\pi m} \sqrt{\gamma \beta (1 - \beta)/(1 - \gamma)} (1 - o(1))$ 与 $m_2 - m_1 \ge (0.0015 + o(1)) (p_1 - p_2) \sqrt n$；若指"转变宽度指数定义"，读作 $\Delta = \Theta(n^{1 - 1/\nu})$（`sqrt.tex:115-117`），注意素材自述该 $\nu$ 与统计力学指数的换算 $\nu_{\text{统计}} \leftrightarrow 2 - \alpha$ 位（`sqrt.tex:117-123`）；若指 bystander 方法或 partially-free 规则，读作定义（`sqrt.tex:287-310`）；若指 $q$-core 或 $q$-可着色宽度，读作推论 5、6（`sqrt.tex:494-530`）。记号对齐：本文 $n$ 为变量数、$m$ 为 clause/边数、$M = 2^{k} \binom{n}{k}$ 或 $\binom{n}{2}$ 为可能 item 总数，语料稿转引时留意 $m$ 与 $M$ 的区分；$\mathcal F_{n,m}$、$\mathcal F_{n,p}$ 记号按第 0 节换算表读。方法输出给语料稿的可能是"用一阶矩/二阶矩加单峰峰高界排除过锐转变"这一通用模板，其最小闭环即第 3-5 节三段。
