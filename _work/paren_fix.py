# -*- coding: utf-8 -*-
r"""`Can't use function '\(' in math mode` 族规格：6 站／5 篇，生成 `_work/paren_fix.json`。

这一族的两形（各配一把尺，规格里用 `level` 标明）：

**body 形（4 站）**＝作者已经用 `$…$` 起跨，式内又抄了一遍 LaTeX 的 `\\(`/`\\)` 定界符，
KaTeX 在 math 模式里拒收 `\\(`。删掉式内那一对（或一枚落单的）`\\(`/`\\)`，`$` 与反引号计数都不动。
- D36:354  `$\\(Q+[0,w])/(d-1)!$`：只有开符没有闭符，落单。素材 03-zonotope 的 (eq:zonotope) 一带，
  平移量并入后体积因子就是 $(Q+[0,w])/(d-1)!$，`\\(` 是抄 LaTeX 时多带的。
- D62:523  `$t'=\\(1-\\gamma)(1-q)+\\gamma(1-\\nu)=1-t$`：同样落单。素材 `special:40-49` 与
  `eq:channel` 核对的就是这条 `t'=(1-\\gamma)(1-q)+\\gamma(1-\\nu)`。
- D420:79  `$\\((\\sum wF)(\\sum wG)\\le(\\sum w)(\\sum wFG)\\)$`：成对多余。素材 `02-discrete.tex:208--232`
  那一行的蕴涵式形如 $(\\sum f)(\\sum g)\\le(\\sum u)(\\sum v)$，闭式写法与它同形。
- D569:113 `$\\(\\cdot\\)_+$`：成对多余。素材 `07-simultaneous.tex:20-45` 的正部记号就是 `x_+=\\max(x,0)`，
  这里要的只是 $\\cdot_+$。

**delim 形（2 站，都在 D108）**＝逐字引文里把闭符 `\\)` 误打成了 `$`，于是全篇唯一的这一枚把后面的正文拖进式内。
素材 `build/main.tex` 逐字是 `\\(\\sigma_{we}z_e\\)`（317-327）与 `\\(\\deg A\\le N-1\\)`（372-378），
按「正文坏形按素材回改」就地改回 `\\)`：每站 `$` 差 −1、反引号差 0、字节 +1。
引文里其余的 `\\[ \\] \\( \\)` 都是逐字留档，不动。
"""
import io
import json

BSL = chr(92)

UNITS = [
    (u'D36', 354,
     BSL + u'(Q+[0,w])/(d-1)!',
     u'(Q+[0,w])/(d-1)!',
     1, 0, 0, u'body',
     u'03-zonotope (eq:zonotope)：平移量并入后体积因子 $(Q+[0,w])/(d-1)!$，式内落单的 ' + BSL + u'( 是抄 LaTeX 带的'),
    (u'D62', 523,
     u"t'=" + BSL + u'(1-' + BSL + u'gamma)(1-q)+' + BSL + u'gamma(1-' + BSL + u'nu)=1-t',
     u"t'=(1-" + BSL + u'gamma)(1-q)+' + BSL + u'gamma(1-' + BSL + u'nu)=1-t',
     1, 0, 0, u'body',
     u'special:40-49 与 eq:channel：核的就是 t' + BSL + "'=(1-" + BSL + u'gamma)(1-q)+' + BSL + u'gamma(1-' + BSL + u'nu)'),
    (u'D420', 79,
     BSL + u'(' + u'(\\sum wF)(\\sum wG)\\le(\\sum w)(\\sum wFG)' + BSL + u')',
     u'(\\sum wF)(\\sum wG)\\le(\\sum w)(\\sum wFG)',
     1, 0, 0, u'body',
     u'02-discrete.tex:208--232 的蕴涵式 $(\\sum f)(\\sum g)\\le(\\sum u)(\\sum v)$ 同形，闭式外不再套 ' + BSL + u'('),
    (u'D569', 113,
     BSL + u'(' + BSL + u'cdot' + BSL + u')_+',
     BSL + u'cdot_+',
     1, 0, 0, u'body',
     u'07-simultaneous.tex:20-45 的正部记号 x_+=\\max(x,0)，这里只要 $' + BSL + u'cdot_+$'),
    (u'D108', 104,
     u'spoke ' + BSL + u'(e' + BSL + u') is ' + BSL + u'(\\sigma_{we}z_e$: an incoming',
     u'spoke ' + BSL + u'(e' + BSL + u') is ' + BSL + u'(\\sigma_{we}z_e' + BSL + u'): an incoming',
     1, -1, 0, u'delim',
     u'build/main.tex:317-327 逐字 ' + BSL + u'(\\sigma_{we}z_e' + BSL + u')，闭符被误打成 $'),
    (u'D108', 130,
     u'holds for ' + BSL + u'(\\deg A\\le N-1$: both sides',
     u'holds for ' + BSL + u'(\\deg A\\le N-1' + BSL + u'): both sides',
     1, -1, 0, u'delim',
     u'build/main.tex:372-378 逐字 ' + BSL + u'(\\deg A\\le N-1' + BSL + u')，闭符被误打成 $'),
]

out = []
for cid, line, old, new, expect, dollars, ticks, level, cred in UNITS:
    out.append({u'cid': cid, u'line': line, u'old': old, u'new': new,
                u'expect': expect, u'dollars': dollars, u'ticks': ticks,
                u'parity': True, u'level': level, u'cred': cred})
io.open(u'_work/paren_fix.json', u'w', encoding=u'utf-8').write(
    json.dumps(out, ensure_ascii=False, indent=1))
print(u'单数=%d body=%d delim=%d' % (
    len(out), sum(1 for u in out if u[u'level'] == u'body'),
    sum(1 for u in out if u[u'level'] == u'delim')))
