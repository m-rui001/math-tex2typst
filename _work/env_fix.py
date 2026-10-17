# -*- coding: utf-8 -*-
r"""display-only 环境族规格：4 单／3 篇（台账 3 行），生成 `_work/env_fix.json`。

三条报错都叫「环境用错了模式」，实质是三形，`level` 各不同（grammar／delim／body）：

**一、`"$ …$"` 的逐字引文：开符紧跟空格 ⇒ 闭符被当开符，跨度一路跑到后行**（D134:523，grammar，两单）
素材 `preprints/Product-projection-localization-…/build/sections/bootstrap.tex:25-40` 里
`\begin{equation}` 的式体行**行首带一个缩进空格**（` 0\le s<a<u<w<t<b,\qquad u>\frac{a+b}{2}.`），
`\[` 块同样（` P=[M=0],\qquad H=[M\ge N^t],\qquad C=UDU^\dagger,\qquad Q=[C=0]=U[D=0]U^\dagger.`），
笔记把这两条展示式压成行内 `$…$` 时把行首空格一起搬了进去。
量具的跨度语法（`_work/dm_lib.js` 第 182 行）**拒绝以紧跟空白的 `$` 作开符**，于是这两处的
开符被跳过、闭符反倒成了开符，从第 523 行尾一路吃到后面才是合法闭符的 `$`，
把中间 `> "\begin{equation}…\end{equation}"` 的整段逐字引文拖成一个数学跨——报错名才是
`{equation} can be used only in display mode`。
修法＝删这两枚**行首缩进空格**（各 −1 字节，`$` 与反引号计数都不动）。
这与 [[dollarmath-closer-veto-tiering]] 残留工单里 T3-WS-BUT-NOT-A-SPLIT 那 22 处
「删空格会改引文字面」不同：那一族的空格是英文句子里的**词间空格**，这里删的是 LaTeX
环境体的**缩进**，不落在任何词上。
验真不能只按两把旧尺：`fix_probe` 拿的是台账那一跨（改的就是这一跨的边界），`delim_probe`
数枚数（枚数不变），所以这一形由新尺 `_work/span_grammar_probe.js` 判——它用同一套 `dm_lib`
语法在内存里重算全篇跨度。

**二、行文中点名环境名**（D376:141，delim）
`($\begin{CD}$ 环境,第 43 到 50 行)`——作者在这里说的是**那个环境的名字**，不是交换图。
素材 `…/build/sections/04-quotient.tex:44-50` 逐字确是 `\begin{CD}`（`T @>{\text{quotient by }P}>> Z\\ …`），
所以内容不错，错在定界符。全库 house 形是用**行内代码**点名 LaTeX 记号
（`\begin{align}` 在代码跨度里 1 处／`\begin{equation}` 5 处，而 `$\begin{…}$` 只有这一站），
照 house 形翻成反引号：`$` 差 −2、反引号差 +2、字节 +0。

**三、`tikzcd` 交换图被写进 `$$…$$`**（D444:56，body）
素材 `…/build/sections/local.tex:444-454` 的图真是 `\begin{tikzcd}` 配 `\arrow[r,"\cong"]`，
而 KaTeX 没有这个环境（`No such environment: tikzcd`），全库也只有这一处 tikzcd＝无先例可抄。
两个候选里选**同方交换图的 amscd 形**：`{CD}` 是 KaTeX 认识的 display 环境
（实测 `\begin{CD} A @>>> B @VVV @VVV \\ C @>>> D \end{CD}` OK，而 CD 里的 `\arrow`
报 Undefined control sequence），四个对象、两条 `\cong` 横箭、两条 `\mathrm{res}` 竖箭逐条搬过去，
`@>\cong>>`／`@V{\mathrm{res}}VV`／`@>>\cong>`；先例是 psmallmatrix 那族改 house 形（渲染优先于逐字环境名）。
另一候选「整段进代码跨度」＝把图退化成源码，读者看不见交换图，只在无可重编码时才用。
**这一站还有第二处缺陷，报错不会说**：笔记第二条竖箭写的是 `\arrow[d,"\mathrm{res"}]`——
闭引号被花括号吃在 `}` 里侧（素材是 `\arrow[d,"\res"]`），KaTeX 只报环境名那一撞，
这一处要靠把台账 body 逐字抄进规格时才看见；重编码成 `{CD}` 时一并回到正确形。
`$` 与反引号都不动。
"""
import io
import json

BSL = chr(92)
DQ = chr(34)
TIKZ_OLD = (u'\\begin{tikzcd} H_K^j(X,X_-)\\arrow[r,' + DQ + u'\\cong' + DQ +
            u']\\arrow[d,' + DQ + u'\\mathrm{res}' + DQ + u"']" +
            u'\\& H_K^j(N,Q)\\arrow[d,' + DQ + u'\\mathrm{res"' + u'}]\\\\ ' +
            u'H_K^j(X^\\tau,X_-^\\tau)\\arrow[r,' + DQ + u'\\cong' + DQ + u']' +
            u'\\& H_K^j(N^\\tau,Q^\\tau)\\end{tikzcd}')
TIKZ_NEW = (u'\\begin{CD} H_K^j(X,X_-) @>\\cong>> H_K^j(N,Q)\\\\ ' +
            u'@V{\\mathrm{res}}VV @VV{\\mathrm{res}}V\\\\ ' +
            u'H_K^j(X^\\tau,X_-^\\tau) @>>\\cong> H_K^j(N^\\tau,Q^\\tau)\\end{CD}')

UNITS = [
    (u'D134', 523,
     u'estimates: $ 0' + BSL + u'le s<a',
     u'estimates: $0' + BSL + u'le s<a',
     1, 0, 0, u'grammar',
     u'bootstrap.tex:33-36：' + BSL + 'begin{equation} 式体行首的缩进空格被压进 ' + DQ + u'$…$' + DQ +
     u'，开符 $ 紧跟空格被跨度语法否决'),
    (u'D134', 523,
     u'："$ P=[M=0]',
     u'："$P=[M=0]',
     1, 0, 0, u'grammar',
     u'bootstrap.tex:37-40：' + BSL + u'[' + u' 块式体行首缩进同上一单（素材 P=[M=0],' + BSL + u'qquad H=[M' +
     BSL + u'ge N^t],…）'),
    (u'D376', 141,
     u'$' + BSL + u'begin{CD}$ 环境',
     u'`' + BSL + u'begin{CD}` 环境',
     1, -2, 2, u'delim',
     u'04-quotient.tex:44-50 逐字 ' + BSL + u'begin{CD}，这里点名的是环境名不是交换图'),
    (u'D444', 56, TIKZ_OLD, TIKZ_NEW, 1, 0, 0, u'body',
     u'local.tex:444-454 的 ' + BSL + u'begin{tikzcd} 交换图，重编码为 KaTeX 认识的 {CD} 同方正方形'),
]

out = []
for cid, line, old, new, expect, dollars, ticks, level, cred in UNITS:
    out.append({u'cid': cid, u'line': line, u'old': old, u'new': new,
                u'expect': expect, u'dollars': dollars, u'ticks': ticks,
                u'parity': True, u'level': level, u'cred': cred})
io.open(u'_work/env_fix.json', u'w', encoding='utf-8').write(
    json.dumps(out, ensure_ascii=False, indent=1))
print(u'单数=%d ' % len(out) + u' '.join(
    u'%s=%d' % (k, sum(1 for u in out if u[u'level'] == k))
    for k in (u'body', u'delim', u'grammar')))
