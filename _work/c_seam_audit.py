# -*- coding: utf-8 -*-
# 接缝节的内容闸：规格第 4 条要求末节「写明该结论被上面哪些语料稿在什么位置使用」。
# ccheck 只量末节标题（seam=Y），这里量那一节里到底有没有稿号与位置串。只读。
import io, os, re, sys, glob

sys.stdout.reconfigure(encoding='utf-8')
HEAD = re.compile(u'^## ', re.M)
INFLIGHT = set(sys.argv[1].split()) if len(sys.argv) > 1 else set()

rows = []
for p in sorted(glob.glob(u'被引笔记/C*.md')):
    cid = os.path.basename(p).split(u'-')[0]
    text = io.open(p, encoding='utf-8').read()
    hs = list(HEAD.finditer(text))
    if not hs:
        rows.append((cid, 0, 0, 0, u'无二级标题'))
        continue
    seam = text[hs[-1].start():]
    heads_line = seam.split(u'\n')[0][:34]
    ds = len(set(re.findall(u'\\bD\\d{2,3}\\b', seam)))
    pos = len(re.findall(r'[A-Za-z_0-9.\-]+\.tex:\d+|`[^`]*:\d+', seam))
    rows.append((cid, ds, pos, len(seam), heads_line))

thin = [r for r in rows if r[1] == 0 or r[3] < 400]
print(u'份数=%d  末节提到稿号=0 或不足 400 字的份数=%d' % (len(rows), len(thin)))
for cid, ds, pos, nb, hl in thin:
    print(u'   %s 稿号=%d 位置串=%d 末节字节=%d  「%s」%s'
          % (cid, ds, pos, nb, hl, u'（在飞）' if cid in INFLIGHT else u''))
print(u'--- 全量分布（稿号枚数）：%s' % u' '.join(u'%s:%d' % (r[0][-2:], r[1]) for r in rows))
