# -*- coding: utf-8 -*-
# C 稿规格 2.2：末节必须是「与本语料的接缝」。写手先写接缝、后面又追加深度的那批（C26）就把接缝
# 留在了中间。这里是定点机械式：把接缝整块挪到文末，其后各节按物理顺序重排编号（接缝自己顶到最后一号）。
# 硬前提：正文里不许有任何指向「被下移那一段」的节号引用（§5 以上／第 5 节以上），命中就 NO-SITE 不落盘。
# 用法：python -X utf8 _work/c_seam_to_end.py [--apply] C26
import io, re, sys, glob

sys.stdout.reconfigure(encoding='utf-8')
APPLY = '--apply' in sys.argv
HEAD = re.compile(r'^## (\d+) (.*)$')


def run(cid):
    path = glob.glob(u'被引笔记/%s-*.md' % cid)[0]
    raw = io.open(path, 'rb').read()
    assert b'\r' not in raw
    text = raw.decode('utf-8')
    lines = text.split(u'\n')
    heads = [(i, int(m.group(1)), m.group(2))
             for i, l in enumerate(lines) for m in [HEAD.match(l)] if m]
    seam = [h for h in heads if h[2].endswith(u'与本语料的接缝')]
    if not seam:
        # 没有接缝节是写手侧的缺内容（ccheck 另有 SEAM_NOT_FINAL 旗标），不是本式的站点：链上别为它崩。
        print('%s 无接缝节（%d 个头），不动' % (cid, len(heads)))
        return 0
    assert len(seam) == 1, heads
    si, sn, _ = seam[0]
    if si == heads[-1][0]:
        print('%s 接缝已在末节（## %d），无站点' % (cid, sn))
        return 0
    nxt = [h for h in heads if h[0] > si]
    last = nxt[0][0] if len(nxt) > 1 else len(lines)
    block = lines[si:last]
    # 被下移的旧编号 sn+1..max：正文（标题行之外）里指向它们的引用一枚都不许有
    moved = set(range(sn + 1, heads[-1][1] + 1))
    body = u'\n'.join(l for k, l in enumerate(lines) if not HEAD.match(l))
    refs = set(int(x) for x in re.findall(r'(?:§\s*|第\s*)(\d+)(?:\s*节)?', body))
    clash = sorted(moved & refs)
    if clash:
        print('%s NO-SITE 正文引用了指向被下移段的节号 %s，要人工改句' % (cid, clash))
        return 0
    tail = lines[last:]
    new = lines[:si] + tail + block
    # 挪完之后号位是「物理顺序的一排列」（0,1,2,3,5..14,4），要按物理顺序重排成 0..K-1
    got = [int(HEAD.match(l).group(1)) for l in new if HEAD.match(l)]
    assert sorted(got) == list(range(len(heads))), got
    k = 0
    for i, l in enumerate(new):
        m = HEAD.match(l)
        if m:
            new[i] = u'## %d %s' % (k, m.group(2))
            k += 1
    bodytxt = u'\n'.join(new)
    assert bodytxt.count(u'$') == text.count(u'$') and bodytxt.count(u'`') == text.count(u'`')
    assert len(bodytxt.encode('utf-8')) == len(text.encode('utf-8'))
    print('%s 接缝 ## %d -> 末节 ## %d；旧 %d..%d 各下移一号；正文节号引用=%s' % (
        cid, sn, len(heads) - 1, sn + 1, heads[-1][1], sorted(refs) or '无'))
    if APPLY:
        io.open(u'_work/%s.pre-seam.md' % cid, 'wb').write(raw)
        io.open(path, 'wb').write(bodytxt.encode('utf-8'))
        print('   APPLIED 备份=_work/%s.pre-seam.md' % cid)
    return 1


n = sum(run(c.upper()) for c in sys.argv[1:] if not c.startswith('--'))
print('%s 动了 %d 份' % ('APPLIED' if APPLY else 'DRY', n))
