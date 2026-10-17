# -*- coding: utf-8 -*-
r"""`Expected 'EOF', got '#'` 8 站／7 篇的修法规格（单一来源）。
`python _work/hash8_fix.py` 落 `_work/hash8_fix.json`，
`python _work/delim_probe.py _work/hash8_fix.json` 验「补完这一枚定界符后该行成对」，
`python _work/fix_apply.py _work/hash8_fix.json [--apply]` 执行，
`python _work/fix_verify.py _work/hash8_fix.json` 落盘后逐站复量。

这一族的形状不是式体错，是**定界符本身错**：一枚没在本行闭合的 `$` 把后面的散文、
空白行、Markdown 标题一路拖进式内，KaTeX 撞上 `#` 才报出来，所以旗标行往往不是元凶行。
三形：
- **闭符误打成了反引号**（`$X` Y` 形，本族 5 枚）：D211:227、D211:233、D80:2228、D93:158 各一枚，
  外加 D211:227 那枚虽被旗标在 233、元凶却在 227（上游一枚把下游全部错配）。
  这一形正是 [[note-inline-code-backtick-vs-dollar]] 记过的镜像第二读，就地单字符改回 `$`。
- **落单的开符**（3 枚）：D28:715、D244:14 各一枚无伴 `$`；D244:14 这一枚作者自己在 §17 勘误第 5 条
  申报过（「§0 第三段末尾『$密度恰好为 1』处出现单个定界符、该段行内无与之成对的另一枚，属排版手滑；
  语义应读作不带定界符的短语」）——按申报删符，不补闭符；
  D28:715 同判：同一篇的 (d)〔推测〕批注行一律裸写 Unicode（840、841、888、1174 都写 `2M²η_{ν,t}` 不带 `$`），
  所以那一枚 `$` 是多出来的，删。
- **登记句里把 `$` 当记号引用**（2 枚）：D244:167 的 `"$密度恰好为 1"` 与 D356:929 的 `外加成对 $；`。
  不改史、不删字，按既有律把字面放进行内代码跨度（ticks +2、dollars 0）。

素材凭据：
- D293:57 不是定界符缺陷，是展示式里的裸 `#`：`\#` 的反斜杠被空格挤到了前面（写成 `:\ #(`）。
  素材 `classification.tex:40` 逐字 `\#(W_n(r;d)\cap\mathcal O_u)\geq j(2r)^n`，所以反斜杠归位、
  与之同行前一处的 `:\#\{u` 同形。
- D356:929 那句是作者工单原文（§13 台账第 12 数据行的规范形态），
  素材 `02-packets.tex:227` `rw^2\sum_{\nu,z,I}|c_{\nu,z,I}|^3\le\mathcal A_m(c)^3.`，
  台账行 807 现在已是 `$rw^2\sum\lvert c\rvert^3\le\mathcal A_m(c)^3$`（上一腿已修），
  本篇 210 行同式也是合法形——所以这一站只剩「工单原文里那枚引用的 `$` 要进代码跨度」。
"""
import io
import json

FIXES = [
    (u'D211', 227, r'因为 $\mu(U)=1` 已经登记在', r'因为 $\mu(U)=1$ 已经登记在',
     1, 1, -1, True, u'闭符误打反引号（元凶行，旗标在 233）'),
    (u'D211', 233, r'\eqref{eq:split-measure}` 的各项质量', r'\eqref{eq:split-measure}$ 的各项质量',
     1, 1, -1, True, u'闭符误打反引号，旗标站'),
    (u'D80', 2228, r'n^3)\rfloor`（`07:47`', r'n^3)\rfloor$（`07:47`',
     1, 1, -1, True, u'闭符误打反引号，素材 07:47-48'),
    (u'D93', 158, r'而 $d\ge3` 出现在推论', r'而 $d\ge3$ 出现在推论',
     1, 1, -1, True, r'闭符误打反引号，同段三处合法形 $d\ge3$'),
    (u'D244', 14, r'$密度恰好为 1"这一件事上。', r'密度恰好为 1"这一件事上。',
     1, -1, 0, True, u'作者申报的落单开符，删符（§17 勘误第 5 条）'),
    (u'D244', 167, u'末尾"$密度恰好为 1"处出现单个定界符',
     u'末尾' + chr(96) + u'"$密度恰好为 1"' + chr(96) + u'处出现单个定界符',
     1, 0, 2, True, u'登记句引用的定界符字面进代码跨度'),
    (u'D28', 715, r'$2M²η 不趋 0。', r'2M²η 不趋 0。',
     1, -1, 0, True, u'落单开符，本篇 (d) 批注行裸写 Unicode 为家形'),
    (u'D293', 57, r'^n:\ #(W_n(r;d)', r'^n:\#(W_n(r;d)',
     1, 0, 0, True, r'classification.tex:40 逐字 \#(W_n(r;d)'),
    (u'D356', 929, u' 外加成对 $；', u' 外加成对 ' + chr(96) + u'$' + chr(96) + u'；',
     1, 0, 2, True, u'工单原文里的记号引用进代码跨度'),
]

out = [{u'cid': c, u'line': ln, u'old': o, u'new': n, u'expect': e,
        u'dollars': dd, u'ticks': dt, u'parity': par, u'cred': cr}
       for (c, ln, o, n, e, dd, dt, par, cr) in FIXES]
json.dump(out, io.open(u'_work/hash8_fix.json', u'w', encoding=u'utf-8'),
          ensure_ascii=False, indent=1)
print(u'%d 单 -> _work/hash8_fix.json' % len(out))
