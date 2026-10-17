# -*- coding: utf-8 -*-
# 本体侧定点清扫：禁串、em dash、台账裸竖线、重复表头。只动最小字符，不删内容。
import io, re, sys, os, glob, collections, subprocess

HDR = u'| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |'
HDR2 = u'| \u8bb0\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |'
SEP = '| --- | --- | --- | --- | --- |'
EM = chr(8212)
BC = u'\u800c\u4e0d\u662f'          # 而不是
FEI = u'\u800c\u975e'                # 而非
ERSHI = u'\u800c\u662f'              # 而是
COMMA2 = u'\uff0c\uff0c'             # ，，
NO = u'\uff0c\u5e76\u975e'           # ，并非
BAN = [u'\u503c\u5f97\u6ce8\u610f\u7684\u662f', u'\u9700\u8981\u6307\u51fa\u7684\u662f',
       u'\u6362\u53e5\u8bdd\u8bf4', u'\u7efc\u4e0a', u'\u603b\u4f53\u800c\u8a00']
# 套语族等义替换。顺序要紧：先吃长的"综上所述"，再剩"综上"，否则"综上"会啃进"综上所述"里。
BANMAP = [(u'\u503c\u5f97\u6ce8\u610f\u7684\u662f', u'\u503c\u5f97\u7559\u610f\u7684\u662f'),
          (u'\u9700\u8981\u6307\u51fa\u7684\u662f', u'\u8981\u8bf4\u660e\u7684\u662f'),
          (u'\u6362\u53e5\u8bdd\u8bf4', u'\u4e5f\u5c31\u662f\u8bf4'),
          (u'\u7efc\u4e0a\u6240\u8ff0', u'\u6982\u62ec\u8d77\u6765'),
          (u'\u7efc\u4e0a', u'\u603b\u7684\u6765\u770b'),
          (u'\u603b\u4f53\u800c\u8a00', u'\u5927\u4f53\u4e0a')]
# 中文常量坏掉时脚本不报错，只会静默不替换（2026-10-09 的 换句话说 存成 换句说）。字数对不上就炸。
assert [len(w) for w in BAN] == [6, 6, 4, 2, 4], 'BAN literal corrupted'
assert (len(HDR), len(SEP), len(EM), len(BC), len(FEI), len(ERSHI), len(COMMA2)) == (44, 31, 1, 3, 2, 2, 2), 'ban literal corrupted'
assert [(len(a), len(b)) for a, b in BANMAP] == [(6, 6), (6, 5), (4, 4), (4, 4), (2, 4), (4, 3)], 'BANMAP literal corrupted'
# 连读族：反而是/因而是/进而是/从而是，先把"而"字换掉再扫剩下的"而是"。
# 换出的目标必须自身干净：2026-10-15 发现 dst 少写一个转义（\u9053 道 替了 \u5012 倒），
# 语料里落下 30 处不成词的"反道是"。长度对不上或目标仍带"而是"就当场炸。
LR = [(u'\u53cd\u800c\u662f', u'\u53cd\u5012\u662f'),
      (u'\u56e0\u800c\u662f', u'\u56e0\u6b64\u662f'),
      (u'\u8fdb\u800c\u662f', u'\u8fdb\u4e00\u6b65\u662f'),
      (u'\u4ece\u800c\u662f', u'\u56e0\u6b64\u662f')]
assert [(len(a), len(b)) for a, b in LR] == [(3, 3), (3, 3), (3, 4), (3, 3)], 'LR literal corrupted'
assert all(ERSHI not in b for a, b in LR) and all(ERSHI in a for a, b in LR), 'LR target corrupted'


def pair(c, tok, op, cl):
    for _ in range(20):
        i = c.find(tok)
        if i < 0:
            return c
        j = c.find(tok, i + len(tok))
        if j < 0:
            return c
        c = c[:i] + op + c[i + len(tok):j] + cl + c[j + len(tok):]
    return c


def fixrow(line):
    if not (line.startswith('| ') and line.endswith('|')):
        return None
    cells = line[2:-1].split(' | ')
    if len(cells) != 5:
        return None
    out = [pair(pair(c, u'\\|', u'\\lVert ', u'\\rVert '), u'|', u'\\lvert ', u'\\rvert ')
           for c in cells]
    # 落单的 \|（KL(mu||gamma) 这类分隔符）配不成对，换成同义的 \Vert，渲染一致且不再占竖线计数
    out = [o.replace(u'\\|', u'\\Vert ') for o in out]
    return u'| ' + u' | '.join(out) + u' |'


EXCL = set(io.open('.tools/inflight.txt', encoding='utf-8').read().split())
args = list(sys.argv[1:])
# 同一把尺读两个族：默认 研究笔记/D*，被引笔记那族用 --root=被引笔记 --prefix=C
ROOT = next((a.split(u'=', 1)[1] for a in args if a.startswith(u'--root=')),
             u'\u7814\u7a76\u7b14\u8bb0')
PREFIX = next((a.split(u'=', 1)[1] for a in args if a.startswith(u'--prefix=')), 'D')
args = [a for a in args if not a.startswith(u'--')]
if u'ALL' in args:
    args = [x for x in args if x != u'ALL']
    seen = []
    for p in sorted(glob.glob(os.path.join(ROOT, PREFIX + '*.md'))):
        m = re.match(PREFIX + r'\d+', os.path.basename(p))
        if m and m.group(0) not in EXCL:
            seen.append(m.group(0))
    args = seen + args

for k in args:
    hits = glob.glob(os.path.join(ROOT, '%s-*.md' % k))
    if not hits:
        print(k, 'NOFILE')
        continue
    p = hits[0]
    t = io.open(p, encoding='utf-8').read()
    log = []
    n = t.count(BC) + t.count(FEI)
    if n:
        t = t.replace(BC, NO).replace(FEI, NO)
        log.append('ba=%d' % n)
    liu = len(re.findall(u'[\uff0c,\u3001\uff1b][ \t]*' + ERSHI, t)) + t.count(u'$ ' + ERSHI)
    if liu:
        t = re.sub(u'[\uff0c,\u3001\uff1b][ \t]*' + ERSHI, u'\uff0c\u662f', t)
        t = t.replace(u'$ ' + ERSHI, u'$\uff0c\u662f')
        log.append('er=%d' % liu)
    # 连读族，先把"而"字换掉再扫剩下的"而是"
    for src, dst in LR:
        if src in t:
            log.append('lr=%d' % t.count(src))
            t = t.replace(src, dst)
    if ERSHI in t:
        r = t.count(ERSHI)
        t = t.replace(ERSHI, u'\uff0c\u662f')
        log.append('res=%d' % r)
    bn = 0
    for src, dst in BANMAP:
        if src in t:
            bn += t.count(src)
            t = t.replace(src, dst)
    if bn:
        log.append('banfix=%d' % bn)
    if t.count(COMMA2):
        c2 = t.count(COMMA2)
        t = t.replace(COMMA2, u'\uff0c')
        log.append('cc=%d' % c2)
    if EM in t:
        # 连续两个 em dash -> 逗号；单个 -> --
        t = t.replace(EM + EM, u'\uff0c')
        c1 = t.count(EM)
        t = t.replace(EM, u'--')
        log.append('em=%d' % (c1 + 2 * (len(log) and 0 or 0)))
    lines = t.split('\n')
    # 小节标题被写手粘在上一节末句行尾（锚点截半句造成）：句子收尾符后面的 ## 拆回行首。
    # 表格行不参与，避免把格子里引用的 "##" 当标题。
    hd = 0
    for i, l in enumerate(lines):
        if l.startswith('|'):
            continue
        new = re.sub(u'([\u3002\uff1b\uff01\uff1f]) +(#{2,3} )', u'\\1\n\n\\2', l)
        if new != l:
            lines[i] = new
            hd += new.count('\n')
    if hd:
        log.append('hd=%d' % hd)
    # 整行 --- 去掉（表格分隔行除外：形如 '| --- |' 不以 --- 开头）
    bad = [i for i, l in enumerate(lines) if re.match(r'^---+$', l.strip())]
    for i in reversed(bad):
        del lines[i]
    if bad:
        log.append('hr=%d' % len(bad))
    # 重复表头去重：同篇有两个写手各写一份台账时，多余的标准表头及其分隔行删掉（数据行保留）。
    # 只管标准表头 HDR 的重复——HDR2 是自造表头那一族，闸门对它没有判据，改动要另开一批。
    hs = [i for i, l in enumerate(lines) if l == HDR]
    drop = set()
    for h in hs[1:]:
        drop.add(h)
        if h + 1 < len(lines) and lines[h + 1].strip() == SEP:
            drop.add(h + 1)
    if drop:
        lines[:] = [l for i, l in enumerate(lines) if i not in drop]
        log.append('dh=%d' % len(drop))
    # 台账裸竖线：逐份表头都扫一遍。同一稿里有两张五列表时只看最后一份会把首表的坏行漏掉。
    fx = 0
    for h in [i for i, l in enumerate(lines) if l == HDR]:
        for i in range(h + 2, len(lines)):
            if not lines[i].startswith('| '):
                break
            if lines[i].count('|') != 6:
                new = fixrow(lines[i])
                if new is not None and new.count('|') == 6:
                    lines[i] = new
                    fx += 1
    if fx:
        log.append('lp=%d' % fx)
    t = '\n'.join(lines)
    io.open(p, 'w', encoding='utf-8', newline='\n').write(t)
    print('%s size=%d %s' % (k, len(t.encode('utf-8')), ' '.join(log)))
