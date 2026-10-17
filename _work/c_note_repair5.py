# -*- coding: utf-8 -*-
"""定点修补第五批（C41 禁词两枚、C42 取证区间越界两处）。

凭据：
- C41 L455「方向性值得注意」是散文口径条禁词的真命中，改写成两侧不对称这一事实陈述。
- C41 L530 是补记的违例清单，它把禁词本身抄进正文（同 C07 L589 那一族的教训：抄清单＝字面命中），
  改成按规格清单的序号指涉，不复述原语。
- C42 的 `main.tex:435-525` 两处是「取证账」里记自己读过哪一段；素材 main.tex 盘上实长 523 行
  （尾三行是 \\appendix／\\end{document}／\\typeout），按盘上实长夹到 523 才是可核对的区间。
用法：python -X utf8 _work/c_note_repair5.py [--apply]
"""
import glob
import io
import re
import sys

APPLY = '--apply' in sys.argv

JOBS = [
    (u'C41', [
        (u'方向性值得注意：', u'方向性两侧不对称：', 1),
        (None, None, 0),
    ]),
    (u'C42', [(None, None, 0)]),
]

# L530 那一处用正则，避免猜引号形状
RX = [(u'C41', re.compile(u'第 455 行一处[^。]{0,8}。'),
       u'第 455 行一处（规格散文清单第 4 项，此处不复述原语；收稿时该处已就地改成「两侧不对称」陈述）。', 1),
      (u'C42', re.compile(u'main\\.tex:435-525'), u'main.tex:435-523', 2)]

for cid, plain in JOBS:
    fs = glob.glob(u'被引笔记/%s-*.md' % cid)
    assert len(fs) == 1, cid
    path = fs[0]
    raw = io.open(path, 'rb').read()
    assert b'\r' not in raw, '%s 盘上带 CR' % cid
    text = raw.decode('utf-8')
    lines0 = text.count(u'\n')
    for old, new, want in plain:
        if old is None:
            continue
        got = text.count(old)
        assert got == want, '%s 平铺 %r 命中 %d 处，预期 %d' % (cid, old, got, want)
        text = text.replace(old, new)
        print(u'%s 平铺 %d 处 %s -> %s' % (cid, want, old[:14], new[:14]))
    for c2, rx, new, want in RX:
        if c2 != cid:
            continue
        hits = rx.findall(text)
        assert len(hits) == want, '%s 正则命中 %d 处，预期 %d' % (c2, len(hits), want)
        text = rx.sub(new, text)
        print(u'%s 正则 %d 处 -> %s' % (c2, want, new[:22]))
    assert text.count(u'\n') == lines0, '%s 行数被改动' % cid
    assert b'\r' not in text.encode('utf-8')
    if APPLY:
        io.open(u'_work/%s.pre-repair5.md' % cid, 'wb').write(raw)
        io.open(path, 'wb').write(text.encode('utf-8'))
        print(u'%s APPLIED 备份=_work/%s.pre-repair5.md bytes=%d' % (cid, cid, len(text.encode('utf-8'))))
print(u'%s 第五批 done' % ('APPLIED' if APPLY else 'DRY'))
