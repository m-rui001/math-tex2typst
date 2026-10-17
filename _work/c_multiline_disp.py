# -*- coding: utf-8 -*-
# 多行展示式普查：katex_census 的跨度正则只认单行 $…$，跨行数学块对它是隐形的。
# 这把尺只量形，不改稿。切法＝按定界符 token（`$$` 优先于 `$`）配对，跨度内含换行即报。
import io, os, re, sys, glob

sys.stdout.reconfigure(encoding='utf-8')
ROOT = sys.argv[1] if len(sys.argv) > 1 else u'被引笔记'
FENCE = re.compile(r'^\s*`{3,}')
CODE = re.compile(r'`+[^`\n]*`+')
TOK = re.compile(r'\$\$|\$')


def mask(line):
    return CODE.sub(lambda m: ' ' * len(m.group(0)), line)


rows = []
for p in sorted(glob.glob(os.path.join(ROOT, u'C*.md'))):
    cid = os.path.basename(p).split(u'-')[0]
    lines = io.open(p, encoding='utf-8').read().split(u'\n')
    spans = []                              # (定界符, 起始行, 结束行)
    cur = None
    fence = False
    for i, raw in enumerate(lines):
        if FENCE.match(raw):
            fence = not fence
            continue
        if fence:
            continue
        text = mask(raw)
        pos = 0
        while True:
            m = TOK.search(text, pos)
            if not m:
                break
            pos = m.end()
            if cur is None:
                cur = (m.group(0), i + 1)
                continue
            d0, start = cur
            if d0 == u'$$':
                if m.group(0) == u'$$':
                    spans.append((d0, start, i + 1))
                    cur = None
                # `$$` 开的块不吃单 `$`，继续等下一个 `$$`
            else:
                spans.append((d0, start, i + 1))
                cur = None
    bad = [s for s in spans if s[2] > s[1]]
    if bad:
        rows.append((cid, len(spans), bad))

print(u'含跨行数学块的稿=%d' % len(rows))
tot = 0
for cid, n, bad in rows:
    tot += len(bad)
    print(u'%s 跨度=%d 跨行=%d 位置=%s' % (cid, n, len(bad),
                                          u' '.join(u'L%d-%d' % (b[1], b[2]) for b in bad[:8])))
print(u'跨行块合计=%d' % tot)
