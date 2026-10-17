# -*- coding: utf-8 -*-
"""定点修补第七批：C32 的 `\\bc` 三枚——凭据不是 preamble 的 `\\def`，是素材**字面写法**。

素材 `被引素材/1707.05561/main.tex` 根本没有 `\\bc` 这个宏，它自己就写 `${\\rm bc}(\\Pi_\\xi)$`
（1189 行那个等式、1191 行「where ${\\rm bc}(\\Pi_\\xi)$ is the Euclidean barycenter…」、1222 行
`u_0={\\rm bc}(\\Pi_{\\xi_0})`）。写手把它抄成了缩写形 `\\bc`，于是 KaTeX 不认。
⇒ 回改成素材的字面形 `{\\rm bc}`：字母逐字保留、外壳是作者原文那一层，不算发明。
登记表 `_work/c_macro_unresolved.txt` 那一行原本写「无 preamble 定义、无宏包凭据」＝判据只看了 `\\def`，
漏了「素材正文里有没有这个字的字面形」这一问。这一族今天全库只有这三枚活站点（普查 `\\bc`×3），
所以按定点收、**不给 `c_macro_fix.py` 加一条没有第二枚样本可验的新 pass**；下次再命中同形就先查素材字面形。

用法：python -X utf8 _work/c_note_repair7.py [--apply]
"""
import glob
import io
import re
import sys

APPLY = '--apply' in sys.argv
JOBS = [(u'C32', re.compile(r'(?<![A-Za-z])\\bc\('), u'{\\rm bc}(')]

for cid, rx, new in JOBS:
    fs = glob.glob(u'被引笔记/%s-*.md' % cid)
    assert len(fs) == 1, cid
    raw = io.open(fs[0], 'rb').read()
    assert b'\r' not in raw, u'%s 盘上带 CR' % cid
    text = raw.decode('utf-8')
    lines0, d0, bt0 = text.count(u'\n'), text.count(u'$'), text.count(u'`')
    hits = rx.findall(text)
    assert len(hits) == 3, u'%s 命中 %d 处，预期 3' % (cid, len(hits))
    text = rx.sub(lambda m, s=new: s, text)
    assert text.count(u'\n') == lines0 and text.count(u'$') == d0 and text.count(u'`') == bt0, u'%s 不变量被破坏' % cid
    assert u'\r' not in text
    print(u'%s %s -> %s  %d 处' % (cid, rx.pattern, new, len(hits)))
    if APPLY:
        io.open(u'_work/%s.pre-repair7.md' % cid, 'wb').write(raw)
        io.open(fs[0], 'wb').write(text.encode('utf-8'))
        print(u'%s APPLIED bytes=%d 备份=_work/%s.pre-repair7.md' % (cid, len(text.encode('utf-8')), cid))
print(u'%s 第七批 done' % ('APPLIED' if APPLY else 'DRY'))
