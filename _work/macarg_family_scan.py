# -*- coding: utf-8 -*-
r"""`Unexpected end of input in a macro argument` 四族的**全库面**扫描。
不能只按拒渲数排产：同一族缺陷的另一半在尺上隐身（label-as-control-word-family 的教训）。
每族给出命中站数、篇数、逐站 文件:行 与现场片段。
"""
import glob
import io
import os
import re

FILES = sorted(glob.glob(os.path.join(u'研究笔记', u'D*.md')))

FAMS = [
    # 光杆控制字独占一枚行内跨度（报名字／与 KaTeX 内置 arity 冲突）
    (u'bare-cs-span', re.compile(r'\$\s*\\(eqref|ref|label|red|Set|mathrm|mathfrak|text|operatorname)\s*\$')),
    # \mathrm 一类紧跟 \operatorname＝宏展开拼接残伤（D351 那一形）
    (u'splice-opname', re.compile(r'\\(mathrm|mathbb|mathbf|mathcal|mathit|mathsf)\s*\\operatorname')),
    # 花括号里只剩一个光杆宏名（字母被吃掉／参数缺失）
    (u'cs-alone-in-brace', re.compile(r'\{\s*\\(mathfrak|mathrm|mathbb|mathbf|mathcal|operatorname|text)\s*\}')),
    # \text{…} 里再开 $…$：shipped 语法会在内层那枚 $ 关段
    (u'text-nested-dollar', re.compile(r'\\text\{[^{}]*\$[^{}]*\}')),
]

tot = {}
for path in FILES:
    name = os.path.basename(path)
    txt = io.open(path, encoding='utf-8').read()
    for li, line in enumerate(txt.split(u'\n'), 1):
        for fam, rx in FAMS:
            for m in rx.finditer(line):
                tot.setdefault(fam, []).append((name, li, m.start(), m.group(0)))

for fam, hits in sorted(tot.items()):
    files = sorted(set(h[0] for h in hits))
    print(u'### %s  站点=%d  篇=%d' % (fam, len(hits), len(files)))
    for h in hits[:60]:
        print(u'   %s:%d  %s' % (h[0][:26], h[1], repr(h[3][:100])))
    if len(hits) > 60:
        print(u'   ... 余 %d 站' % (len(hits) - 60))
    print(u'   files: ' + u' '.join(f[:6] for f in files))
