# -*- coding: utf-8 -*-
r"""环境边界切断族规格：4 单／4 篇，生成 `_work/envcut_fix.json`。

四站都坐在**数学跨与环境边界的接缝**上，报错名各不同（`Expected & or \\ or \cr or \end` 两枚、
`Mismatch: \begin{pmatrix} matched by \end{pm}` 一枚、`Expected 'EOF', got '\end'` 一枚），
实质都是「环境没关上就遇到了边界」：

**一、行内闭符把 pmatrix 拦腰切断（D442:119）**
`$B_j=\begin{pmatrix}0&b_j^\top\\ -b_j&0$，拼成`——闭符 `$` 打在第二行元素之后，`\end{pmatrix}` 整个丢了。
素材 `Hyperbolicity-Cones-Without-Semidefinite-Lifts-October-5-2026/build/source/02-cone.tex:32` 逐字
`B_j=\begin{pmatrix}0&b_j^\top\\-b_j&0\end{pmatrix},`；同一篇 109／110 行的两个 pmatrix 都写得完整，
行分隔也用 `\\`，本篇内凭据齐。`$` 与反引号都不动。

**二、被切断的那一跨本来是**逐字引文**（D589:118，delim，本腿唯一改判的一站）**
原文：`其 Gram 矩阵减恒等有分块形 $\begin{pmatrix}0&O_{S,T}\\ O_{S,T}^{*}&0$ 型` 的写法要谨慎,
原文在 `strong-ulam-stability.tex:480` 至 `:483` 给出 $\begin{pmatrix}0&O_{S,T}\\ O_{S,T}^{*}&0\end{pmatrix}$`。
量具在这一行报的**反引号开=1**（`delim_probe` 修前那格）说的是同一件事：该行反引号共 **17 枚＝奇数**，
`型` 后面那一枚是**只有闭符、没有开符**的半对。两形对照：
- 补 `\end{pmatrix}` 再删 `型` 后那枚反引号＝把引文当式体写，结果是同一个矩阵在这一句里印两遍，
  而这一句讲的正事是「这种写法要谨慎」——句子当场自相矛盾。
- 在 `$\begin{pmatrix}` 之前补**开符**＝承认它是留档引文（逐字引那个截断的坏形），
  后半句给完整形，正是笔记要说的事；反引号 17→18 成偶，该行下游那 8 枚引文码跨度一起归位。
取后者。素材 `…/build/strong-ulam-stability.tex:480-483` 的 display 逐字
`\begin{pmatrix}0&O_{S,T}\\O_{S,T}^*&0\end{pmatrix}.`（笔记引在 `:480`／`:483` 两句之间＝行号对得上）。
`$` 差 0、反引号 **+1**、字节 +1。**这条也是「消旗标≠修笔记」的一格**：删掉那枚反引号能把旗标消得更彻底，
但它改的是作者的引文意图，不是这一站的缺陷所在。

**三、`\end{pmatrix}` 只打了一半（D431:77，body）**
`$M_\theta=\begin{pmatrix}0&\theta\\Q_\theta\cdot&T_\theta\end{pm}$`——坏形是 `\end{pm}`（**带闭括号**），
KaTeX 报 `Mismatch: \begin{pmatrix} matched by \end{pm}`，所以修法是在 `}` **之前**补 `atrix`，
不是往 `}` 后面接 `atrix}`（后者仍是 `\end{pm}`＋一串散字符，同一处报错一字不变——第一版规格就是这样写的，
`fix_probe` 的「修法 仍 ERR」把它逮住了）。
素材 `Global-Uniqueness-for-the-Smooth-Isotropic-Elasticity-Inverse-Problem-September-24-2026/build/sections/transport-matching.tex:22-26`
的 eq:transport-matrix 是 `M_\theta= \begin{pmatrix} 0&\theta\\ Q_\theta\cdot&T_\theta \end{pmatrix}`。
**old 不能写成裸 `\end{pm}`**：整篇 `str.replace` 命中的是本篇所有 `\end{pm}` 开头的形（本篇实测只 1 次＝运气，
不是量具），律要写进报告。所以 old 用**整段 body**。

**四、逐字引文少一枚闭符 ⇒ 跨度吃掉下游正文（D101:189，delim）**
第 183—190 行是**四空格缩进的引用块**（逐字引素材的 lemma 排版），块里把素材的 `\(` `\)` 一律重写成 `$`：
`is $L^2$ of a factor ... on $C$` / `for the representation of $E_{\rm disc}.`。最后一行的闭符漏了 ⇒ 该块内 `$` 成奇数，
跨度从 189 行一路吃到下游正文里下一个合法闭符，报错名却挂在 `\end{lemma}` 上（`Expected 'EOF', got '\end'`）。
素材 `The-Euclidean-plane-is-not-five-colorable-September-23-2026/build/sections/transfer.tex:35` 逐字
`for the representation of \(E_{\rm disc}\).`——**闭符在素材里存在**，是笔记漏搬。补一枚 `$`（+1 字节、`$` +1、反引号 0）。
量具侧一条：`_work/dm_lib.js` 的掩码剥围栏 ` ``` ` 与行内反引号，**不剥四空格缩进代码块**，所以块内的 `$` 照样参与配对。
这一站是真缺陷（引文自己不平衡），不是假阳；但同一机制会让「块内成对的 `$`」在台账里以别的形状出现，读账时要记得这一格。

**四站 `$` 差＝0／0／0／+1，反引号差＝0／+1／0／0**；除 D101 补回它本该有的那一枚闭符，改动全不增减 `$`。
"""
import io
import json

BS = chr(92)
BT = chr(96)

D442_OLD = BS + u'begin{pmatrix}0&b_j^' + BS + u'top' + BS + BS + u' -b_j&0'
D589_MID = BS + u'begin{pmatrix}0&O_{S,T}' + BS + BS + u' O_{S,T}^{*}&0'
D589_OLD = u'有分块形 $' + D589_MID + u'$ 型' + BT
D589_NEW = u'有分块形 ' + BT + u'$' + D589_MID + u'$ 型' + BT
D431_HEAD = (BS + u'begin{pmatrix}0&' + BS + u'theta' + BS + BS + u'Q_' + BS + u'theta' +
             BS + u'cdot&T_' + BS + u'theta')
D431_OLD = D431_HEAD + BS + u'end{pm}'
D431_NEW = D431_HEAD + BS + u'end{pmatrix}'
D101_OLD = u'of $E_{' + BS + u'rm disc}.'

UNITS = [
    (u'D442', 119, D442_OLD, D442_OLD + BS + u'end{pmatrix}', 1, 0, 0, u'body',
     u'02-cone.tex:32 逐字 ' + BS + u'end{pmatrix}；本篇 109/110 行同环境完整'),
    (u'D431', 77, D431_OLD, D431_NEW, 1, 0, 0, u'body',
     u'transport-matching.tex:22-26 eq:transport-matrix；坏形是 ' + BS + u'end{pm} 带闭括号，atrix 补在 } 之前'),
    (u'D589', 118, D589_OLD, D589_NEW, 1, 0, 1, u'delim',
     u'留档引文：型 后那枚是孤闭符（该行反引号 17＝奇数），补开符成 code 跨度；' +
     u'strong-ulam-stability.tex:480-483 完整形在后半句'),
    (u'D101', 189, D101_OLD, u'of $E_{' + BS + u'rm disc}$.', 1, 1, 0, u'delim',
     u'transfer.tex:35 逐字 ' + BS + u'(E_' + BS + u'{rm disc}' + BS + u')；引用块内重写为 $ 时漏了闭符'),
]

out = []
for cid, line, old, new, expect, dollars, ticks, level, cred in UNITS:
    out.append({u'cid': cid, u'line': line, u'old': old, u'new': new,
                u'expect': expect, u'dollars': dollars, u'ticks': ticks,
                u'parity': True, u'level': level, u'cred': cred})
io.open(u'_work/envcut_fix.json', u'w', encoding=u'utf-8').write(
    json.dumps(out, ensure_ascii=False, indent=1))
print(u'单数=%d ' % len(out) + u' '.join(
    u'%s=%d' % (k, sum(1 for u in out if u[u'level'] == k))
    for k in (u'body', u'delim', u'grammar', u'code')))
