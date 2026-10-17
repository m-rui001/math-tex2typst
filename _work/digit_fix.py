# -*- coding: utf-8 -*-
r"""单反斜杠＋数字族规格：6 单／4 篇，生成 `_work/digit_fix.json`。

根因一把尺量到底（`_work/digit_cs_census.py`：全库 `\`＋数字 21 处／13 篇，只数前面不是反斜杠的那些）：
语料宏表把 `\0`／`\1` 定义成 `\mathbf 0`／`\mathbf 1`（素材 preamble 里的指示函数／零元 house 宏，
`\2` 未定义），所以**任何一处「单反斜杠＋数字」都会被当成控制字展开**。四形：

**一、路径写进 `\tag{…}`（D192:75、D192:144，body，拒渲那 2 站）**
`\tag{02\02_scalar.tex:23-25}`——`\0` 在宏表里＝`\mathbf 0`，而 KaTeX 的 `\tag` 参数是**文本模式**，
于是报 `Can't use function '\mathbf' in text mode`。全库 `\tag{}` 236 处（`_work/tag_census.py` 自证：正则 236＝字面 count 236），
**231 处不含反斜杠**，house 形就是 `paper.tex:N--N`／`02_scalar.tex:23-25`；本篇正文 40 多处凭证也一律写 `02_scalar.tex:NN-NN`，
只有这两枚 tag 多带了目录前缀 `02\`。修法＝删 `02\` **并把 `02_scalar` 里那枚 `_` 逃成 `\_`**（各 −2 字节，`$`／反引号不动）。
第二个动作不是可选：`\tag` 的参数位是文本模式，光删前缀后 `_` 自己就成了新拒渲点
（`Expected '}', got '_'`，`_work/fix_probe.js` 实测）；`_work/one_render.js '\tag{02\_scalar.tex:23-25}' display` 渲染通过、墨就是 `02_scalar.tex:23-25`。
全库另外 231 处 tag 无一含下划线（`_work/tag_census.py _` 只捞出这两站），所以 `\`＋`_` 是这个槽位上的**唯一忠实形**、无平行先例。
素材凭据：`build/sections/02_scalar.tex:23-25` 正是 `M(N-l)\leq\lambda^{-l}M(N)\qquad(0\leq l\leq N).`（eq:records），
`294-296` 正是 `\Delta^2\leq C M(N-l)\sum...\rho_q^2.`（eq:annular）——行号对，错的只有那个反斜杠。

**二、路径写进 `$…$`（D200:227、D200:253，delim，不拒渲而发错墨）**
`$00\00_introduction.tex:187$`、`$04\04_analysis.tex:171$`。数学模式里 `\mathbf 0` 合法，所以**这条不报错**，
但墨是 `0000i​ntroduction.tex:187`（`_work/one_render.js` 实测：`\0`→`\mathbf 0`、紧跟的 `0` 被 `_` 拖成下标）。
同一行另有三处凭证写作行内代码 `` `00_introduction.tex:175` ``、`` `05_geometry.tex:93` ``、`` `04_analysis.tex:314` ``＝本篇 house 形，
照 house 形翻成反引号：`$` 差 −2、反引号差 +2、字节 −4。
素材凭据：`sections/00_introduction.tex:185-188` 逐字含 `contains the commuting pair $(z,x)$ used for the final torus`（笔记 227 行就在讲这一句），
`sections/04_analysis.tex:169-172` 逐字含 `If \(p\) is the nearest integer to \(n\alpha\)`（笔记 253 行讲的是 Diophantine 分离）。

**三、逐字引文里 `\\` 少打一枚（D133:1087，code）**
按原文排成的源引文 `` `$\begin{pmatrix}1&0\1&1\end{pmatrix}:$` ``——素材 `sections/03b-count.tex:80` 逐字是
`\begin{pmatrix}1&0\\1&1\end{pmatrix}:`，笔记把行分隔 `\\` 打成单 `\`，剩下的 `1` 被 `\1`＝`\mathbf 1` 吃掉。
这一处坐在代码跨度里（该行 `` $=4 ``、`` `=8 ``，`_work/marks.py` 读数），尺子全看不见；
同一篇 1105 行的同一个矩阵写成数学 `$\begin{pmatrix}1&0\\1&1\end{pmatrix}=P$` 是**对的**，可作本篇内凭据。
修法＝补回那一枚反斜杠（+1 字节，`$`／反引号不动）。

**四、多打一枚反斜杠（D114:790，code）**
一次项写作 `` `\2\E` ``：素材 `build/03-sampling.tex:305-311` 的展开是 `(1+\beta(q_C-1))^2-1`＝`2\beta(q_C-1)+\beta^2(q_C-1)^2`，
一次项是 `2\E` 那部分（`\E q_C=1` 故为 0），`\2` 既不是宏表里的控制字（宏表只有 `\0`、`\1`）也不是作者要说的东西。
修法＝删那枚反斜杠（−1 字节，`$`／反引号不动）。

**不动的那 15 处**：`\1_A`／`\1_{\{\}}` 型指示函数（D135:86,238,482、D38:238,281、D132:313 共 7 处）＝宏表本义，合法；
Windows 路径写在正文／代码跨度（D28:5、D30:4、D31:1121、D62:5、D82:415 两处、D96:3 共 8 处）＝不进数学跨、不发错墨。
"""
import io
import json

BS = chr(92)

UNITS = [
    (u'D192', 75,
     BS + u'tag{02' + BS + u'02_scalar.tex:23-25}',
     BS + u'tag{02' + BS + u'_scalar.tex:23-25}',
     1, 0, 0, u'body',
     u'02_scalar.tex:23-25＝eq:records；全库 236 处 ' + BS + u'tag{} 仅 5 处含反斜杠'),
    (u'D192', 144,
     BS + u'tag{02' + BS + u'02_scalar.tex:294-296}',
     BS + u'tag{02' + BS + u'_scalar.tex:294-296}',
     1, 0, 0, u'body',
     u'02_scalar.tex:294-296＝eq:annular；同上一单'),
    (u'D200', 227,
     u'$00' + BS + u'00_introduction.tex:187$',
     u'`00_introduction.tex:187`',
     1, -2, 2, u'delim',
     u'00_introduction.tex:185-188 逐字 commuting pair (z,x)；本篇同行三处凭证都是行内代码'),
    (u'D200', 253,
     u'$04' + BS + u'04_analysis.tex:171$',
     u'`04_analysis.tex:171`',
     1, -2, 2, u'delim',
     u'04_analysis.tex:169-172 逐字 nearest integer to n' + BS + u'alpha'),
    (u'D133', 1087,
     u'$' + BS + u'begin{pmatrix}1&0' + BS + u'1&1' + BS + u'end{pmatrix}:$',
     u'$' + BS + u'begin{pmatrix}1&0' + BS + BS + u'1&1' + BS + u'end{pmatrix}:$',
     1, 0, 0, u'code',
     u'03b-count.tex:80 逐字 1&0' + BS + BS + u'1&1；本篇 1105 行同矩阵的正确形'),
    (u'D114', 790,
     u'`' + BS + u'2' + BS + u'E`',
     u'`2' + BS + u'E`',
     1, 0, 0, u'code',
     u'03-sampling.tex:305-311 展开的一次项＝2' + BS + u'(q_C-1)，宏表无 ' + BS + u'2'),
]

out = []
for cid, line, old, new, expect, dollars, ticks, level, cred in UNITS:
    out.append({u'cid': cid, u'line': line, u'old': old, u'new': new,
                u'expect': expect, u'dollars': dollars, u'ticks': ticks,
                u'parity': True, u'level': level, u'cred': cred})
io.open(u'_work/digit_fix.json', u'w', encoding='utf-8').write(
    json.dumps(out, ensure_ascii=False, indent=1))
print(u'单数=%d ' % len(out) + u' '.join(
    u'%s=%d' % (k, sum(1 for u in out if u[u'level'] == k))
    for k in (u'body', u'delim', u'code', u'grammar')))
