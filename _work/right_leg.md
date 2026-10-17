# `Expected 'EOF', got '\right'` 族腿（2026-10-17）

## 读数
`node _work/dollarmath_census2.js --sites=…`：`katex_refused` **126 → 120**（sites22 → sites23），两遍一致
（`files=734 spans=864970 katex_refused=120 files_hit=78 unclosed_spans=0`，`dollar_family=48` 不动；两遍台账 `diff` 为空）。
`node _work/sites_diff.js …_sites22 …_sites23 _work/right_fix.json`：**REMOVED=6／ADDED=0**，6 行全部落在规格的 5 单上
（D139:228、D155:403、D302:59、D302:154、D191:860＝**5 单／4 篇**，其中 D191:860 一行两跨）。
`.tools/gate.py` 四篇全 CLEAN（`math=3385/2610/2586/2068`）——本族同样不在闸门射程里，gate CLEAN 零信息量。

**diff 的逐篇期望这一栏要会读**：尺报「D191 消 2 期望 1」不是异常——规格的 `expect` 语义是**该行内 old 的命中数**，
而 D191:860 那一行的 `$\left\lceil$` 与 `$\right\rvert$` 是**两个独立跨度**、各记一行台账，所以站点消 2 行、
规格只写 1 单。一站多跨时「消」≥「期望」是设计如此，判据看的是 ADDED=0 与「REMOVED 全部可归到规格篇」＝6/6。

## 四形与素材凭据
同一条报错名下四种不同的病，前三种是 body 形、第四种是 delim 形：

**一、孤儿 `\right)`＝一条展示式被拆成两半**（D139:228）
笔记把素材 `A-single-lattice-covering-bound-of-order-n-log-n-September-23-2026/build/blocks.tex:158-164`
那一整条式子拆成「行内代码前半＋`$…$` 后半」：前半起头 `\Prob\left(\left|\log F_b-b\mu_b\right|>`，
落到式内的只剩 `\frac12 b^{0.56}\right)`。**并跨方案已否证**——
`node _work/one_render.js '\Prob\left(\left|\log F_b-b\mu_b\right|>\frac12 b^{0.56}\right)\le …'`
报 `ERR Undefined control sequence: \Prob`，素材宏 `\Prob` 不在 KaTeX 宏表里，并跨等于新造一站拒渲，
所以那个代码跨度是**故意的**。修法＝式内 `\right)` → `)`（字节 −6）。

**二、`\Big(` 配 `\right)`＝大小档位手打拆配**（D155:403）
素材 `…/build/sections/exponential.tex:68` 逐字 `\ge c(K)\left(\frac t3\norm{y}-\frac1K\norm{u}\right)`，
笔记把 `\left` 打成 `\Big`，与 `\right)` 不成对。按素材回改 `\Big(` → `\left(`（+3）。

**三、`\frac` 的两参被 `\right)` 切碎**（D302:59 与 D302:154，同一处缺陷两种抄写）
两处都作 `3\log_{1/\epsilon}\!\left(\frac\right)1{1-q_\epsilon}`；素材
`…/build/sections/10-packet-composition.tex:66-73` 逐字 `+3\logeps{\frac1{1-q_\eps}}`，
`\logeps{#1}` 展开＝`\log_{1/\epsilon}\!\left(#1\right)` ⇒ 应为 `\log_{1/\epsilon}\!\left(\frac{1}{1-q_\epsilon}\right)`（各 +4）。
**这两单 old 用整段 body**：59 行作 `\mathcal{R}`／`C_{\mathcal{B}}`、154 行作 `\mathcal R`／`C_{\mathcal B}`，
坏形子串在两行都出现——`fix_apply` 的预数是**整篇**命中数，用短形则第一单命中 2、第二单在 DRY 里看见 0（假象），
整段 body 才各自唯一。这一条是本族与「同篇多单串行预数」机制的交点，下族同形可直接照抄。

**四、作者勘误申报句里的定界符字面**（D191:860，delim）
这一行是作者的申报正文：`另有一处公式排错：§11 里 $\nu_i$ 的 $\left\lceil$ 与 $\right\rvert$ 误配，已改为配对形式；`
`$…$` 包的是**被引述的定界符本身**，不是数学。按「登记引文进代码跨度、不改史」整跨度换反引号：
`$` 差 −4、反引号差 +4、字节 +0；`$\nu_i$` 是真数学，不动。
本篇 `left\lceil` 3 处、`\lceil` 16 处——申报段是已知固定假阳形态，改前必须先读那一行确认它是引述位而不是式体。

## 工具链读数
- `_work/right_fix.py` → `_work/right_fix.json`（5 单，每单带 `level`）；生成脚本 docstring 里带全部素材凭据，规格是单一来源。
- `_work/fix_probe.js`（式体级）：判 4 单、跳过 delim 单并申报理由，四单**修前应 ERR、修法 OK 并打墨**，`异常 0`。
- `_work/delim_probe.py`（定界符级）：修前 5 单全 `命中=1/1`，只有 D191:860 的账在动（`单$ 6->2`）；
  落盘后 `--after` 再量：五行的 `单$` 全成偶（56/2/12/12/2）、`$$=0`、`反引号开=0`、旧形 0。
- `fix_apply` DRY 与 APPLY 均 `异常=0`，字节 −6/+1/+2/+2/0（D302 两单串行后 100661→100665）。`fix_verify` 五站「该行新形=1 旧形=0、全篇旧形=0」。
- 规格里的中文凭据串要写成 `\\Prob` 这种成对反斜杠，单斜杠会触发 `SyntaxWarning: invalid escape sequence`
  而 Python 又原样保留，看着无害——警告本身是尺的噪声，一次改到位。

## 残余与下一支
120 枚：`errClass=null` 的未定义控制字族 **60**、`Can't use function '$'` **48**
（44＋`\(` 形 2＋`$` 形 1＋`|` 形 1，[[dollarmath-closer-veto-tiering]] 定性为被邻接律否决的合法闭符，不动）＝93 枚维持判定，
可动的是 **27 枚**：`\mathbf in text mode` 2（D192:75／D192:144，DISPLAY）、
表格环境 `Expected & or \\ or \cr or \end` 2（D442:119、D589:118）、
以及 9 枚单例——`got '\end'`（D101:189）、`got '_'`（D104:155）、`\operatorname@` 无参（D108:424）、
`{equation}` 只能 display（D134:523）、`got '&'`（D142:561）、`{CD}` 只能 display（D376:141）、
pmatrix 配对（D431:77）、`No such environment: tikzcd`（D444:56）。
下一支＝**display-only 环境族**（`{equation}`／`{CD}`／`tikzcd` 三站）：先在素材里判这三处本意是行内还是展示，
再决定是拆跨还是改 house 形；`tikzcd` 那站按 [[typst-refused-tikz-families]] 的先例可能是撤案形，取证时一并定性。
