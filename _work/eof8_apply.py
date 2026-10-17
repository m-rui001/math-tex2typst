# -*- coding: utf-8 -*-
r"""`Expected '}', got 'EOF'` 8 站／7 篇的定点修补驱动。每一枚都只补（或只换）一界定符，
字母一个不删；素材凭据在注释里逐条给出，候选形全部经 `_work/eof8_probe.js` 验过 RENDERS。

- D16:303 「把 $\sup_{h\in\R}$ 换成 $\sup_{h\in$ 紧区间$\}$」：上一腿 F3 那一族的另一形——
  中文夹在两个半跨之间，前半断在 `\in` 上。合回一整跨、中文进 `\text{}`（带前置空格保视觉间隙；
  `\operatorname{紧区间}` 也让它渲染但触发三条 strict 警告，不取）。素材无凭据（这是 `[推测]` 段）。`$` 少两枚。
- D335:244 正文「再抬 $Z_*e^{-1.2D$ 去掉限制」缺右花括号；素材 `04-continuum.tex:744` 写作 `\(Z_*e^{-1.2D}\)`，
  而同一枚坏形在 304 行的作者登记句里是**留档的引文**（「漏了一个右定界符，应为 $Z_*e^{-1.2D}$」），
  所以 244 那一条 OLD 要带上下文「，再抬…去掉限制，得」才不连引文一起抹平；
  引文那处按既有律改成代码跨度（登记句里引用定界符字面必须进代码跨度）。
- D402:169 `x_{ij(byb^{-1})` → `x_{ij}(byb^{-1})`，素材 `kernel.tex:219` 逐字如此（根子群 `{ij}` 与参数括号各关各的）。
- D490:139 `s^{A-1))` → `s^{A-1})`，素材 `06-early.tex:136-137` 是 `\left(\frac{C_2}{s+s_N}Z(s)+C_{A,\delta}s^{A-1}\right)\dd s`。
- D500:326 `$B^{-1-c_{*}/2)$` → `$B^{-1-c_{*}/2}$`，素材 `localization.tex:74` 写作 `$B^{-1-c_*/2}$`。
- D762:493 表格格内 `$n^{-5/6+15m$` → 补 `}`，素材 `fluctuations.tex:125` `=n^{-5/6+15m}`。
- D765:385 `(P_j^{\mathrm{eu})^{-1}` → `(P_j^{\mathrm{eu}})^{-1}`，素材 `model.tex:484` 同形，
  而且**同一行的前半**就写作正确的 `(P_j^{\mathrm{eu}})^{-1}`（凭据在本篇自身）。
"""
import glob
import io
import os
import subprocess
import sys

PAIRS = [
    ('D16', r'$\sup_{h\in$ 紧区间$\}$', r'$\sup_{h\in\text{ 紧区间}}$', 1, -2, 0),
    ('D335', r'，再抬 $Z_*e^{-1.2D$ 去掉限制，得', r'，再抬 $Z_*e^{-1.2D}$ 去掉限制，得', 1, 0, 0),
    ('D335', r'再抬 $Z_*e^{-1.2D$ 去掉限制"漏', r'再抬 `$Z_*e^{-1.2D$` 去掉限制"漏', 1, 0, 2),
    ('D402', r'Dx_{ij}(y)D^{-1}=x_{ij(byb^{-1})', r'Dx_{ij}(y)D^{-1}=x_{ij}(byb^{-1})', 1, 0, 0),
    ('D490', r's^{A-1))\,\mathrm ds', r's^{A-1})\,\mathrm ds', 1, 0, 0),
    ('D500', r'$B^{-1-c_{*}/2)$', r'$B^{-1-c_{*}/2}$', 1, 0, 0),
    ('D762', r'$n^{-5/6+15m$ 对', r'$n^{-5/6+15m}$ 对', 1, 0, 0),
    ('D765', r'(P_j^{\mathrm{eu})^{-1}\mathcal L_Q(b)', r'(P_j^{\mathrm{eu}})^{-1}\mathcal L_Q(b)', 1, 0, 0),
]

APPLY = '--apply' in sys.argv
bad = 0
sim = {}
for cid, old, new, expect, dd, dt in PAIRS:
    f = glob.glob(os.path.join(u'研究笔记', cid + u'-*.md'))[0]
    if cid not in sim:
        sim[cid] = io.open(f, encoding='utf-8').read()
    here = sim[cid].count(old)
    sim[cid] = sim[cid].replace(old, new)
    cmd = [sys.executable, os.path.join(u'_work', u'c_note_fix.py'), cid,
           u'--old', old, u'--new', new, u'--dollars', str(dd), u'--ticks', str(dt)]
    if APPLY:
        cmd.append(u'--apply')
    r = subprocess.run(cmd, capture_output=True, text=True, encoding='utf-8')
    out = ((r.stdout or u'') + (r.stderr or u'')).rstrip()
    tail = out.split(u'\n')[-2:]
    flag = u'' if here == expect else u'  <== 预数不符'
    print(u'%s 预数=%d 期望=%d $=%+d 反引号=%+d  %s%s' % (
        cid, here, expect, dd, dt, u' / '.join(tail), flag))
    if r.returncode != 0 or u'零命中' in out or here != expect:
        bad += 1
print(u'%s 单数=%d 覆盖站=%d 异常=%d' % (
    u'APPLY' if APPLY else u'DRY', len(PAIRS), sum(p[3] for p in PAIRS), bad))
