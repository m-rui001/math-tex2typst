# -*- coding: utf-8 -*-
r"""`Expected 'EOF', got '\right'` 族规格：5 单／4 篇（台账 6 行），生成 `_work/right_fix.json`。

同一条报错名下是四种不同的病，前四单是 body 形、最后一单是 delim 形（尺不同，规格里用 `level` 标）：

**一、孤儿 `\right)`——式被拆成两半，后半只剩闭符**（D139:228，body）
笔记把素材
`preprints/A-single-lattice-covering-bound-of-order-n-log-n-September-23-2026/build/blocks.tex:158-164`
那一整条展示式拆成「行内代码前半＋`$…$` 后半」：前半起头是 `\Prob\left(\left|\log F_b-b\mu_b\right|>`，
落到式内的只剩 `\frac12 b^{0.56}\right)`。**并跨方案已否证**：`\Prob` 在 KaTeX 宏表里未定义
（`node _work/one_render.js` 实测 `ERR Undefined control sequence: \Prob`），并跨等于新造一站拒渲，
所以代码跨度是故意的、不许并入。就地改法＝式内 `\right)` → `)`（字节 −6）。

**二、`\Big(` 配 `\right)`**（D155:403，body）
素材 `…/build/sections/exponential.tex:68` 逐字
`\ge c(K)\left(\frac t3\norm{y}-\frac1K\norm{u}\right)`，
笔记抄成 `\Big(…\right)`——大小档位手打、把配对拆散了。按素材回改 `\Big(` → `\left(`（字节 +3）。

**三、`\frac` 的两参被 `\right)` 切碎**（D302:59 与 D302:154，body，同一处缺陷两种抄写）
笔记两处都作 `3\log_{1/\epsilon}\!\left(\frac\right)1{1-q_\epsilon}`；
素材 `…/build/sections/10-packet-composition.tex:66-73` 逐字 `+3\logeps{\frac1{1-q_\eps}}`，
而 `\logeps{#1}` 展开＝`\log_{1/\epsilon}\!\left(#1\right)` ⇒ 展开后应为
`\log_{1/\epsilon}\!\left(\frac{1}{1-q_\epsilon}\right)`。两站各 +4 字节。
**这两单的 `old` 必须用整段 body**：第 59 行作 `\mathcal{R}`／`C_{\mathcal{B}}`、第 154 行作
`\mathcal R`／`C_{\mathcal B}`，坏形子串在两行都出现，用短形整篇会命中 2、第二单在 DRY 里看见 0
（假象），整段 body 才各自唯一。

**四、作者勘误申报句里的定界符字面**（D191:860，delim，一站两行报错）
这一行是作者的申报正文「另有一处公式排错：§11 里 `$\nu_i$` 的 `$\left\lceil$` 与 `$\right\rvert$`
误配，已改为配对形式；」——`$…$` 包的是**被引述的定界符本身**，不是数学，按「登记引文进代码跨度」
的口径整跨度换成反引号：`$` 差 −4、反引号差 +4、字节 +0。`$\nu_i$` 是真数学，不动。
本篇 `left\lceil` 3 处、`\lceil` 16 处，申报段属已知固定假阳形态。
"""
import io
import json

BSL = chr(92)
D302_A = (u'\\mathcal{R}=C_{\\mathcal{B}}(\\eta+\\xi+\\log_{1/\\epsilon}\\!\\left(S_\\epsilon\\right))'
          u'+C_{\\mathcal{B},\\eta,\\xi,A}\\frac{1+\\log(2+\\ell)}{\\ell}'
          u'+3\\log_{1/\\epsilon}\\!\\left(\\frac\\right)1{1-q_\\epsilon}+\\omega_{\\mathcal{B}}(\\epsilon)')
D302_B = D302_A.replace(u'\\mathcal{R}', u'\\mathcal R').replace(u'C_{\\mathcal{B}}', u'C_{\\mathcal B}') \
              .replace(u'C_{\\mathcal{B},\\eta,\\xi,A}', u'C_{\\mathcal B,\\eta,\\xi,A}') \
              .replace(u'\\omega_{\\mathcal{B}}', u'\\omega_{\\mathcal B}')


def fix_frac(s):
    return s.replace(u'\\left(\\frac\\right)1{1-q_\\epsilon}',
                     u'\\left(\\frac{1}{1-q_\\epsilon}\\right)')


UNITS = [
    (u'D139', 228,
     BSL + u'frac12 b^{0.56}' + BSL + u'right)',
     BSL + u'frac12 b^{0.56})',
     1, 0, 0, u'body',
     u'blocks.tex:158-164：整条展示式的前半（含 \\Prob\\left(\\left|\\log F_b-b\\mu_b\\right|>）'
     u'故意留在行内代码跨度里，式内只剩孤儿 \\right)；并跨会新造拒渲（\\Prob 未定义）'),
    (u'D155', 403,
     u'\\ge c(K)' + BSL + u'Big(' + BSL + u'frac t3' + BSL + u'lVert y' + BSL + u'rVert_1-'
     + BSL + u'frac1K' + BSL + u'lVert u' + BSL + u'rVert_1' + BSL + u'right)',
     u'\\ge c(K)' + BSL + u'left(' + BSL + u'frac t3' + BSL + u'lVert y' + BSL + u'rVert_1-'
     + BSL + u'frac1K' + BSL + u'lVert u' + BSL + u'rVert_1' + BSL + u'right)',
     1, 0, 0, u'body',
     u'exponential.tex:68 逐字 \\ge c(K)\\left(\\frac t3\\norm{y}-\\frac1K\\norm{u}\\right)，'
     u'笔记把 \\left 手打成 \\Big 与 \\right 拆配'),
    (u'D302', 59, D302_A, fix_frac(D302_A), 1, 0, 0, u'body',
     u'10-packet-composition.tex:66-73 逐字 +3\\logeps{\\frac1{1-q_\\eps}}，'
     u'\\logeps{#1}=\\log_{1/\\epsilon}\\!\\left(#1\\right)'),
    (u'D302', 154, D302_B, fix_frac(D302_B), 1, 0, 0, u'body',
     u'同上一处的第二种抄写（本篇 \\mathcal R 不带组），凭据同上'),
    (u'D191', 860,
     u'$' + BSL + u'left' + BSL + u'lceil$ 与 $' + BSL + u'right' + BSL + u'rvert$ 误配',
     u'`' + BSL + u'left' + BSL + u'lceil` 与 `' + BSL + u'right' + BSL + u'rvert` 误配',
     1, -4, 4, u'delim',
     u'作者勘误申报句：$…$ 包的是被引述的定界符本身，进代码跨度不改史；$\\nu_i$ 是真数学不动'),
]

out = []
for cid, line, old, new, expect, dollars, ticks, level, cred in UNITS:
    out.append({u'cid': cid, u'line': line, u'old': old, u'new': new,
                u'expect': expect, u'dollars': dollars, u'ticks': ticks,
                u'parity': True, u'level': level, u'cred': cred})
io.open(u'_work/right_fix.json', u'w', encoding=u'utf-8').write(
    json.dumps(out, ensure_ascii=False, indent=1))
print(u'单数=%d body=%d delim=%d' % (
    len(out), sum(1 for u in out if u[u'level'] == u'body'),
    sum(1 for u in out if u[u'level'] == u'delim')))
