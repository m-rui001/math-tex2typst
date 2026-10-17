# -*- coding: utf-8 -*-
# 收紧版邻近候选：(1) 盘上成对坏形；(2) 紧接引号的重述提示词。只读。
import io, re, glob, os

NS = u'研究笔记'
BS = u'本体侧'
DEFV = [u'残片', u'残句', u'残缺', u'截断', u'截在', u'截成', u'粘连', u'缺主语', u'词序', u'语序',
        u'量词', u'单位', u'错字', u'笔误', u'潦草', u'混排', u'夹了', u'夹杂', u'漏抄', u'误夹',
        u'多字', u'漏字', u'误写', u'误作', u'错位', u'重复', u'吞掉', u'被删']
# 重述提示词（必须紧邻引号）
PROMPT = [u'应作', u'应为', u'应写作', u'应读作', u'改作', u'改为', u'期望作', u'期望替换', u'正确表述',
          u'正确读法', u'正确写法', u'正确记法', u'本意', u'宜作', u'宜改', u'应直接', u'读法分别',
          u'逐字文本', u'照抄如下', u'期望回填', u'应换成', u'应使用', u'精确形态', u'应读']
Q = u'“”「」"\u201c\u201d'

def spans(l):
    out = []
    for a, b in [(u'“', u'”'), (u'「', u'」')]:
        for m in re.finditer(re.escape(a) + u'(.*?)' + re.escape(b), l):
            if m.group(1):
                out.append(m.group(1))
    parts = l.split(u'"')
    for k in range(0, len(parts) - 1, 2):
        if parts[k + 1]:
            out.append(parts[k + 1])
    return out

rows = []
for p in sorted(glob.glob(NS + '/D*.md')):
    m = re.match(r'D(\d+)', os.path.basename(p))
    if not m:
        continue
    n = int(m.group(1))
    if not (400 <= n <= 734):
        continue
    d = 'D%03d' % n
    t = io.open(p, encoding='utf-8', errors='replace').read()
    lines = t.split(u'\n')
    for i, l in enumerate(lines):
        if BS not in l:
            continue
        ln = i + 1
        paired = []
        for s in spans(l):
            occ = [j + 1 for j, x in enumerate(lines) if s in x]
            if t.count(s) == 2 and len(occ) == 2 and ln in occ:
                paired.append((s, [x for x in occ if x != ln][0]))
        tight = []
        for w in PROMPT:
            for m2 in re.finditer(re.escape(w), l):
                tail = l[m2.end():m2.end() + 8]
                if any(c in tail for c in u'“「"') or any(c in tail[:2] for c in u'“「"'):
                    tight.append(w)
                    break
        if not (paired or tight):
            continue
        dv = [w for w in DEFV if w in l]
        rows.append(u'%s L%d PAIRED=%s TIGHT=%s DEFV=%s' % (
            d, ln,
            u';'.join(u'%s@L%d' % x for x in paired) or u'-',
            u','.join(sorted(set(tight))) or u'-',
            u','.join(dv) or u'-'))

io.open('_work/bodyside_upper_near2.txt', 'wb').write((u'\n'.join(rows)).encode('utf-8'))
print('near2=%d' % len(rows))
