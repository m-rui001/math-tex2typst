# -*- coding: utf-8 -*-
r"""零星三站规格：3 单／3 篇，生成 `_work/odds3_fix.json`。

这三站是拒渲台账上除了 48 枚 `Can't use function '$'`（判定不动）与 60 枚
`Undefined control sequence`（单独立案）之外**余下的全部**，三枚报错名各不同、彼此不同族，
但都属同一件事：**把不属于行内数学跨的结构符搬进了跨里**。

**一、`\text{}` 的参数位是文本模式（D104:155，body）**
`$P(a,w)=Q(a,w)\cdot\prod_j(\text{w_j 非典范})^2$` 报 `Expected 'EOF', got '_'`——
`\text{}` 里那个裸 `_` 坐在**文本模式**，与 [[note-backslash-digit-macro-collision-family]] 里
`\tag{}` 那一格是同一条律。这一行是笔记自己的 `[推测]`（素材无此式），所以修法按 house 形定：
**CJK 说明留 `\text{}`、变量放回数学**（全库 `\text{含 CJK}` 2977 处／534 篇是现成形）。
两个候选都否掉了：
- `\text{$w_j$ 非典范}`：KaTeX 自己认（`one_render` 墨读 `∏j(wj 非典范)2`），**但本库量具的跨度语法是逐字符扫定界符的**，
  它不剥 `\text{}`，这两枚 `$` 会把这一跨从 `(\text{` 后面切断，切出来的半跨必报错；全库这种嵌套 **0 处**＝无先例。
- `\text{w}_{j}`／`\mathrm{w}_j`／`\mathit{w}_j`：全库各 **0 处**＝也无先例，且 `\text{w}` 把变量排成罗马正体，
  与同一行的 `$Q(a,w)=0$`、`"$w$ 是典范代表"` 的斜体形打架。
`$`／反引号都不动。

**二、控制字丢尾字母（D108:424，body）**
`$\dim W^\per=|\mathbb T|-\dim W$` 报 `Got function '\operatorname@' with no arguments`——
**报错名是红鲱鱼**：语料宏表里 `\per` 有定义（`\operatorname{per}`＝积和式），所以丢掉的那枚 `p`
把「正交补」换成了「permanent」，KaTeX 先撞上宏形。凭据两处齐：素材
`preprints/The-crossing-number-of-complete-graphs-September-23-2026/build/main.tex:679`
逐字 `\(\dim W^\perp=|\TT|-\dim W\)`，而**同一行**前后两处都写 `$W^\perp$`／`$W\subseteq W^\perp$`。
old 必须带尾字符：`\per` 是 `\perp` 的严格前缀，裸 `\dim W^\per` 会命中合法形；带上 `=` 之后整篇命中 1。
`$`／反引号都不动。

**三、逐字引 align 行 ⇒ 数组结构符 `&` 掉进行内跨（D142:561，delim）**
`定稿第 91 行 "$R_{ab}&=R_b\cup B_bR_a(L_bR_a)^*F_b.$" 的正确形状` 报 `Expected 'EOF', got '&'`。
素材 `…/build/sections/diagrams.tex:91` 是 `\begin{aligned}` 里的一行 ` R_{ab}&=R_b\cup B_bR_a(L_bR_a)^*F_b.`，
`&` 是**对齐位**不是内容；**同一篇笔记第 535—543 行已把 85—93 行整段放进围栏代码块**（含这一行逐字）＝本篇内先例。
所以引文照 house 形进行内代码：两枚 `$` 翻成两枚反引号，串内**保留 `&` 逐字**（不改史）。
`$` 差 −2、反引号 +2、字节 +0——与腿 #57 的 D376:141（`$\begin{CD}$`→`` `\begin{CD}` ``）同形。
"""
import io
import json

BS = chr(92)
BT = chr(96)
DQ = chr(34)

UNITS = [
    (u'D104', 155,
     u'(' + BS + u'text{w_j 非典范})^2',
     u'(w_j' + BS + u' ' + BS + u'text{非典范})^2',
     1, 0, 0, u'body',
     u'本行是 [推测] 无素材式；house 形＝CJK 进 ' + BS + u'text{}（2977 处／534 篇）、变量留数学；' +
     BS + u'text{…$…$} 全库 0 处且量具不剥 ' + BS + u'text{}'),
    (u'D108', 424,
     BS + u'dim W^' + BS + u'per=|',
     BS + u'dim W^' + BS + u'perp=|',
     1, 0, 0, u'body',
     u'main.tex:679 逐字 ' + BS + u'(dim W' + BS + u'^' + BS + u'perp=|' + BS + u'{TT|-' + BS +
     u'dim W' + BS + u')；同一行两处 W^' + BS + u'perp；宏表 ' + BS + u'per=' + BS +
     u'operatorname{per} ⇒ 报错名是红鲱鱼'),
    (u'D142', 561,
     DQ + u'$R_{ab}&=R_b' + BS + u'cup B_bR_a(L_bR_a)^*F_b.$' + DQ,
     DQ + BT + u'R_{ab}&=R_b' + BS + u'cup B_bR_a(L_bR_a)^*F_b.' + BT + DQ,
     1, -2, 2, u'delim',
     u'diagrams.tex:91 的 aligned 行，' + BS + u'& 是对齐位；本篇 535-543 行已把整段放围栏代码块＝先例'),
]

out = []
for cid, line, old, new, expect, dollars, ticks, level, cred in UNITS:
    out.append({u'cid': cid, u'line': line, u'old': old, u'new': new,
                u'expect': expect, u'dollars': dollars, u'ticks': ticks,
                u'parity': True, u'level': level, u'cred': cred})
io.open(u'_work/odds3_fix.json', u'w', encoding=u'utf-8').write(
    json.dumps(out, ensure_ascii=False, indent=1))
print(u'单数=%d ' % len(out) + u' '.join(
    u'%s=%d' % (k, sum(1 for u in out if u[u'level'] == k))
    for k in (u'body', u'delim', u'grammar', u'code')))
