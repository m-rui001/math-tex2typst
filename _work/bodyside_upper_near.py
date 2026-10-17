# -*- coding: utf-8 -*-
# 把最接近可执行的 JUDGMENT 行（成对/带读法/带损坏词）窗口化打印，检查是否漏掉可回填项。只读。
import io, re, glob, os

NS = u'研究笔记'
BS = u'本体侧'
VERB = [u'应作', u'应为', u'应写作', u'应读作', u'读法', u'回填', u'照抄', u'逐字', u'正确', u'期望', u'本意',
        u'实为', u'改为', u'替换', u'恢复', u'重述', u'原文', u'原句', u'表述应']
DEFV = [u'残片', u'残句', u'残缺', u'截断', u'截在', u'截成', u'粘连', u'缺主语', u'词序', u'语序',
        u'量词', u'单位', u'错字', u'笔误', u'潦草', u'混排', u'夹了', u'夹杂', u'漏抄', u'误夹', u'多字', u'漏字']
MOVE = [u'整块', u'搬迁', u'搬回', u'搬正', u'搬移', u'移到', u'挪', u'删除', u'删去', u'删重', u'重印',
        u'重复落盘', u'整段重复', u'重复块', u'补回', u'补录', u'插入', u'归位', u'剪切', u'搬动', u'丢句',
        u'失句', u'丢失', u'被覆盖删除', u'误删', u'吞掉']
BANW = [u'禁串', u'禁令', u'违禁', u'禁用', u'禁用语', u'禁止性', u'禁写', u'被禁', u'长停顿', u'长破折',
        u'双逗号', u'顿逗', u'装饰', u'定界符', u'反引号', u'竖线', u'表头', u'分隔行', u'单元格', u'逆接',
        u'转折对比', u'转折类', u'转折关联', u'转折连词', u'转折搭桥', u'转折短语', u'转折对照', u'替代式转折',
        u'两字转折', u'四字改口', u'对举', u'连词', u'清理通道', u'机械清理', u'机械通道', u'停顿号', u'横线',
        u'破折号', u'违例', u'禁串字形', u'语形', u'禁串形态', u'违禁词族', u'禁串命中', u'违规']
TERM = [u'未译', u'译名', u'术语残留', u'英文残留', u'外文残留', u'残留词', u'音译', u'生造词', u'英文词',
        u'外来词', u'英文片段', u'英文名', u'拉丁', u'英文形容词', u'英文名词', u'英文分词', u'英文占位',
        u'术语不一致', u'未翻', u'残留词形', u'术语']
OVKEY = set()
for l in io.open('_work/bodyside_upper_plan.txt', encoding='utf-8'):
    if l.startswith('#'):
        continue
    p = l.rstrip('\n').split(' ', 3)
    if len(p) == 4 and p[2] == 'REPAIR':
        OVKEY.add((p[0], int(p[1][1:])))

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
        if (d, ln) in OVKEY:
            continue
        if any(k in l for k in MOVE):
            continue
        bn = [w for w in BANW if w in l]
        tm = [w for w in TERM if w in l]
        dv = [w for w in DEFV if w in l]
        vb = [w for w in VERB if w in l]
        paired = []
        for s in spans(l):
            occ = [j + 1 for j, x in enumerate(lines) if s in x]
            if t.count(s) == 2 and len(occ) == 2 and ln in occ:
                paired.append((s, [x for x in occ if x != ln][0]))
        if not (paired or dv or vb):
            continue
        tag = 'PAIRED' if paired else ('DVVB' if (dv and vb) else ('DV' if dv else 'VB'))
        if tag == 'PAIRED' and (bn or tm) and not dv:
            tag = 'PAIRED-ban'
        kws = (dv + vb)[:2] or paired and [paired[0][0]] or []
        pos = -1
        for k in kws:
            pos = l.find(k)
            if pos >= 0:
                break
        a = max(0, pos - 90) if pos >= 0 else 0
        win = l[a:a + 300]
        rows.append(u'%s L%d [%s] paired=%s win: %s' % (
            d, ln, tag, (u'%s@%d' % paired[0] if paired and not bn and not tm else (
                u'%d spans' % len(paired) if paired else u'none')), win))

io.open('_work/bodyside_upper_near.txt', 'wb').write((u'\n'.join(rows)).encode('utf-8'))
print('near=%d' % len(rows))
