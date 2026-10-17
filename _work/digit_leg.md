# 单反斜杠＋数字族腿（2026-10-17）

## 读数
`node _work/dollarmath_census2.js --sites=…`：`katex_refused` **117 → 115**（sites24 → sites25），两遍 sha256 相同
（`files=734 spans=864968 katex_refused=115 files_hit=75 unclosed_spans=0`，`dollar_family=48` 不动）。
`node _work/sites_diff.js … _work/digit_fix.json` → **REMOVED=2／ADDED=0**，2 站＝规格的 D192:75、D192:144。
逐篇旗标「D200 消 0 期望 2／D133 消 0 期望 1／D114 消 0 期望 1」是**预期**：这三篇的四站本来就不在拒渲台账上
（不报错、只发错墨），集合差对它们零信息＝见下「量的不是同一格」。
`.tools/gate.py` 四篇全 CLEAN（`math=2504/1724/4090/1631`，size 86065/84544/145091/241089 与 apply 后字节逐一吻合＝落盘两次量到同一值）。

## 一把尺先量人口
新尺 `_work/digit_cs_census.py`：全库「单反斜杠＋数字」**21 处／13 篇**（只数前面不是反斜杠的那些——`\\0` 是矩阵换行＋列首数字，合法，
否则 276 处里全是假阳）。成因：语料宏表把 `\0`／`\1` 定义成 `\mathbf 0`／`\mathbf 1`（素材 preamble 的零元／指示函数 house 宏，`\2` 未定义），
**任何一处 `\<digit>` 都会被当成控制字展开**。21 处三分：
- **合法 7 处**＝指示函数 `\1_A`／`\1_{\{\}}`（D135:86,238,482、D38:238,281、D132:313），宏表本义，不动。
- **合法 8 处**＝Windows 路径写在正文／代码跨度（D28:5、D30:4、D31:1121、D62:5、D82:415×2、D96:3），不进数学跨、不发错墨，不动。
- **真缺陷 6 处／4 篇**＝本腿落地，四形见下。修后复跑尺子＝**15 处／10 篇**，正好少 6。

## 四形与素材凭据
**一、路径写进 `\tag{…}`（D192:75、D192:144，body，唯一拒渲那 2 站）**
`\tag{02\02_scalar.tex:23-25}`：`\0`→`\mathbf 0`，而 KaTeX 的 `\tag` 参数位是**文本模式** ⇒ `Can't use function '\mathbf' in text mode`。
`_work/tag_census.py`（自证：正则 236＝字面 count(`\tag{`) 236）量出全库 236 处 tag 里**只有 5 处含反斜杠**，231 处 house 形是 `paper.tex:N--N`；
本篇正文 40 多处凭证也一律写 `02_scalar.tex:NN-NN`，只有这两枚 tag 多带了目录前缀 `02\`。
**修法两步，少一步就还在拒渲**：删 `02\` 之后 `_` 自己成了新拒渲点（`Expected '}', got '_'`，`fix_probe` 当场逮到），
所以还要逃成 `\_`——最终形 `\tag{02\_scalar.tex:23-25}`，`one_render` 墨＝`(02_scalar.tex:23-25)`。全库其余 231 处 tag 无一含下划线
（`tag_census.py _` 只捞出这两站），所以 `\`＋`_` 是这个槽位的唯一忠实形、无平行先例。每站 −2 字节，`$`／反引号不动。
凭据：`build/sections/02_scalar.tex:23-25` 正是 `M(N-l)\leq\lambda^{-l}M(N)\qquad(0\leq l\leq N).`（eq:records），
`294-296` 正是 `\Delta^2\leq C M(N-l)\sum\ldots\rho_q^2.`（eq:annular）——**行号对，错的只有那个反斜杠**。

**二、路径写进 `$…$`（D200:227、D200:253，delim，不拒渲而发错墨）**
`$00\00_introduction.tex:187$`、`$04\04_analysis.tex:171$`。数学模式里 `\mathbf 0` 合法 ⇒ **这条不报错**，
墨却是 `0000introduction.tex:187`（`\0`→`\mathbf 0`、紧跟的 `0` 被 `_` 拖成下标；`one_render` 实测）。
翻成本篇自己的 house 形＝行内代码：同一行另有三处 `` `00_introduction.tex:175` ``、`` `05_geometry.tex:93` ``、`` `04_analysis.tex:314` ``。
`$` −2、反引号 +2、字节 −3／站。凭据：`sections/00_introduction.tex:185-188` 逐字 `contains the commuting pair $(z,x)$ used for the final torus`、
`sections/04_analysis.tex:169-172` 逐字 `If \(p\) is the nearest integer to \(n\alpha\)`——两处行号也都对。

**三、逐字引文里 `\\` 少打一枚（D133:1087，code）**
「按原文排成」的源引文 `` `$\begin{pmatrix}1&0\1&1\end{pmatrix}:$` ``：素材 `sections/03b-count.tex:80` 逐字是 `1&0\\1&1`，
笔记打成单 `\` 后那个 `1` 被 `\1`＝`\mathbf 1` 吃掉——**矩阵从 2×2 变成一行四格**（`one_render` 墨 `(1011)`）。
这一处坐在代码跨度里（`marks.py`：该行 `$=4`、`` `=8 ``，第 40/77 位的 `$` 夹在 39/78 的反引号之间），两把渲染尺全看不见。
补回一枚反斜杠（+1 字节）。本篇内凭据＝同一篇 1105 行的同一个矩阵 `$\begin{pmatrix}1&0\\1&1\end{pmatrix}=P$` 写对了。

**四、多打一枚反斜杠（D114:790，code）**
一次项写作 `` `\2\E` ``：素材 `build/03-sampling.tex:305-311` 的展开是 `(1+\beta(q_C-1))^2-1`＝`2\beta(q_C-1)+\beta^2(q_C-1)^2`，
「一次项＝`2\E` 那部分为 0 因为 `\E q_C=1`」；`\2` 既不在宏表（宏表只有 `\0`、`\1`）也不是作者要说的事。删那枚反斜杠（−1 字节）。

## 量的不是同一格：delim／code 形的验真分工
- 规格 `_work/digit_fix.py` → `_work/digit_fix.json`，6 单带 `level`（body 2／delim 2／code 2），**`code` 是本腿新立的第四值**：
  改的是代码跨度里的字面串，`fix_probe` 无跨可喂、`delim_probe` 只证定界符没动，**凭据只能是素材原文逐字对照**；
  `fix_probe.js` 的跳过消息与头注释一并写成三把尺＋素材对照四路，不再逐族加 `if`。
- 修前：`fix_probe` 判 2／跳过 4／异常 0（两单修法打墨 `(02_scalar.tex:23-25)`）；`delim_probe` 6/6 命中、异常 0（D200 单$ 20→18、10→8 仍成偶）；
  **错墨两站靠 `_work/one_render.js` 的墨读判真**（修前 `0000i​ntroduction…`／`(1011)`，修后不发数学＝代码跨度原样印）。
- 落盘：`fix_apply` DRY／APPLY 异常 0（D133 报「命中新形=2」＝本篇 1105 行早就写着正确形，不是异常）；
  `fix_verify` 6/6「该行新形=1 旧形=0 全篇旧形=0」；`delim_probe --after` 6/6 异常 0；gate 四篇 CLEAN。
- `digit_cs_census.py` 是本族的**人口尺**：拒渲台账只能看见 2 站，这把尺看见 21 处，其中 4 处是不报错的错墨。
  下一族若还怀疑「宏表展开把字面串吃掉」，先跑它做集合差，别按报错名排队。

## 残余与下一支
115 枚：`errClass=null` 的未定义控制字族 60、`Can't use function '$'` 48（[[dollarmath-closer-veto-tiering]] 定性为被邻接律否决的合法闭符，不动）、
表格环境 `Expected & or \\ or \cr or \end` 2（D442:119、D589:118）、余 5 枚单例（D101:189 `got '\end'`、D104:155 `got '_'`、
D108:424 `\operatorname@` 无参、D142:561 `got '&'`、D431:77 pmatrix 配对＝`\mathbf in text mode` 那 2 站已随本腿收掉）。
下一支＝表格环境那 2 站。
