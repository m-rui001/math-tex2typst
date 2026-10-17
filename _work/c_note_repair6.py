# -*- coding: utf-8 -*-
"""定点修补第六批：三族「无凭据残留」里今天有凭据可走的那些站点。

凭据（`_work/c_name_witness.py` 实测，全库素材 preamble）：
- `\\rfdown`：C16 **自己**的素材就定义 `\\lfloor{#1}\\rfloor~.`（界定符是句点，实参在正文里跟不成组，
  所以链上绑定失败）。C16 正文两处站点都写 `\\rfdown\\Upsilon_\\mu`，实参明摆着是 `\\Upsilon_\\mu`
  ⇒ 按本篇凭据展成 `\\lfloor\\Upsilon_\\mu\\rfloor`，字母一个不动。
- `\\A`：全库八篇四制（`\\mathbb A`／`\\mathbf A`／`\\alpha`／`{\\cal A}`）⇒ 前缀式一律不认。
  但 C32 这五枚站点全是 `\\A^1` 这一形，且同一跨度里写 `\\A^1=\\C`（`\\C` 在全局 KaTeX 表里就是
  `\\mathbb C`，普查不报它）＝「一条仿射直线」⇒ 只有 `\\mathbb{A}^1` 读得通，逐站点定向，不做成规则。
- `\\wt`：五篇见证（C17 `\\operatorname{wt}`、C25/C32 `{\\rm wt}`、C35/C40 `\\mathrm{wt}`）＝同一个正体词 `wt`，
  只是外壳三制；C33 本篇没有定义，它那枚站点 `\\wt_\\xi` 落在一句**拿 C31/C32 的记号作比较**的话里，
  所以取 C25/C32 那一制 `\\rm`，并给它补组（`{\\rm wt}_\\xi`，下标落在组上才渲得过）。
用法：python -X utf8 _work/c_note_repair6.py [--apply]
"""
import glob
import io
import re
import sys

APPLY = '--apply' in sys.argv

JOBS = [
    (u'C16', [(re.compile(r'\\rfdown\\Upsilon_\\mu'), u'\\lfloor\\Upsilon_\\mu\\rfloor', 2)]),
    (u'C32', [(re.compile(r'\\A\^1'), u'\\mathbb{A}^1', 5)]),
    (u'C33', [(re.compile(r'\\wt_\\xi'), u'{\\rm wt}_\\xi', 1)]),
]

for cid, subs in JOBS:
    fs = glob.glob(u'被引笔记/%s-*.md' % cid)
    assert len(fs) == 1, cid
    raw = io.open(fs[0], 'rb').read()
    assert b'\r' not in raw, '%s 盘上带 CR' % cid
    text = raw.decode('utf-8')
    lines0 = text.count(u'\n')
    d0 = text.count(u'$')
    for rx, new, want in subs:
        hits = rx.findall(text)
        assert len(hits) == want, u'%s %s 命中 %d 处，预期 %d' % (cid, rx.pattern, len(hits), want)
        # new 只当字面串用：替换模板里 `\l`、`\m` 会被 re 当转义位读坏。
        text = rx.sub(lambda m, s=new: s, text)
        print(u'%s %s -> %s  %d 处' % (cid, rx.pattern[:26], new[:22], want))
    assert text.count(u'\n') == lines0, u'%s 行数被改动' % cid
    assert text.count(u'$') == d0, u'%s 美元枚数被改动' % cid
    assert u'\r' not in text
    if APPLY:
        io.open(u'_work/%s.pre-repair6.md' % cid, 'wb').write(raw)
        io.open(fs[0], 'wb').write(text.encode('utf-8'))
        print(u'%s APPLIED bytes=%d 备份=_work/%s.pre-repair6.md' % (cid, len(text.encode('utf-8')), cid))
print(u'%s 第六批 done' % ('APPLIED' if APPLY else 'DRY'))
