# -*- coding: utf-8 -*-
# 定点修补三处（收稿侧，写手已交回、不在飞）：
#   C36 L281 一枚闭合反引号误打成 `$`（行内代码闭合符误写族），改回反引号后 dollar/btick 同归偶；
#   C35 的位置串 `main.tex:171-186` 在本篇素材里根本没有（素材只有 quasimonomial-20191115.tex），
#        按同一行的自述改成真文件名，并把那句自述去掉；素材 L171/186 实测存在（985 行，L171 正是 weak version of Conjecture B）；
#   C16 的禁词 `需要指出` 一枚（写手侧转述词），换成不点名的起句。
import io, os, re, sys, glob

sys.stdout.reconfigure(encoding='utf-8')

def edit(cid, pairs, must=None):
    p = glob.glob(u'被引笔记/%s-*.md' % cid)[0]
    raw = io.open(p, 'rb').read()
    assert b'\r' not in raw, '%s 盘上带 CR' % cid
    text = raw.decode('utf-8')
    for old, new in pairs:
        n = text.count(old)
        assert n == 1, '%s 锚点命中 %d 枚：%s' % (cid, n, old[:40])
        text = text.replace(old, new)
    data = text.encode('utf-8')
    if must:
        assert not re.search(must, re.sub(r'`[^`\n]*`', '', text)), '%s 修后仍有 %s' % (cid, must)
    io.open(p, 'wb').write(data)
    print('%s %s -> %s bytes=%d delta=%+d' % (
        cid, os.path.basename(p)[:28], 'OK', len(data), len(data) - len(raw)))

edit(u'C36', [(u'\\mathrm{mult}(\\mathfrak{b}_{\\bullet,t})$，则',
               u'\\mathrm{mult}(\\mathfrak{b}_{\\bullet,t})`，则')])
edit(u'C35', [(u'`main.tex:171-186`（按本 C 稿重新定位指 `quasimonomial-20191115.tex:171`）指出：',
               u'`quasimonomial-20191115.tex:171-186` 指出：')])
edit(u'C16', [(u'需要指出，', u'顺这条链看，')], must=u'需要指出')
