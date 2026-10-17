# -*- coding: utf-8 -*-
"""节号缺陷的机械修法集合。preview 默认只打印决策，--apply 才写盘。
   op1 stray      : 同标题的重复 `## 节` 标题行（块为空则删前一个，否则删后一个标题行）
   op2 demote     : `## 节X.Y 标题` 这类十进制小节误用二级标题 -> 降为三级
   op3 tail_renum : 文末多出来的 `## 节0 补记` -> 改成接续编号
   op4 move       : 打印需要整块回位的节（人工确认后再单独做）
"""
import io, os, re, sys
sys.stdout.reconfigure(encoding='utf-8')

SEC = re.compile(u'^## *\u00a7(\\d+)([^\\d\\n]*)\\s(.*)$')
DEC = re.compile(u'^## +\u00a7(\\d+)\\.(\\d+)\\s*(.*)$')
BASE = u'研究笔记'
IDS = [l.split()[0] for l in io.open('_work/dupsec_census.txt', encoding='utf-8') if re.match(r'^D\d+', l)]
apply = '--apply' in sys.argv


def load(i):
    f = [x for x in os.listdir(BASE) if x.startswith(i + u'-') and x.endswith(u'.md')]
    if not f:
        return None, None, None
    p = os.path.join(BASE, f[0])
    return p, f[0], io.open(p, encoding='utf-8', newline='').read()


def headings(L):
    out = []
    for k, l in enumerate(L):
        m = SEC.match(l)
        if m:
            out.append((k + 1, int(m.group(1)), m.group(2).strip(), m.group(3)))
    return out


for i in IDS:
    p, name, raw = load(i)
    if not p:
        continue
    L = raw.split('\n')
    h = headings(L)
    nums = [x[1] for x in h]
    acts = []
    # op1: identical (num,title) pairs
    seen = {}
    for k, n, pre, t in h:
        seen.setdefault((n, t), []).append(k)
    for key, v in sorted(seen.items()):
        if len(v) < 2:
            continue
        for a, b in zip(v, v[1:]):
            between = [x for x in L[a:b - 1] if x.strip()]
            acts.append(('stray', a, b, len(between)))
    # op2: decimal headings at H2
    for k, l in enumerate(L):
        m = DEC.match(l)
        if m:
            acts.append(('demote', k + 1, m.group(1) + '.' + m.group(2), m.group(3)[:34]))
    # op3: trailing '补记' style heading whose number is <= max of the rest
    mx = max(nums)
    for k, n, pre, t in h:
        if k == h[-1][0] and n < mx:
            acts.append(('tail_renum', k, n, mx + 1, t[:30]))
    # op4: out-of-order unique headings
    if len(set(nums)) == len(nums) and nums != sorted(nums):
        acts.append(('move', nums, '', ''))
    if acts:
        print('---- %s %s' % (i, name[:40]))
        for a in acts:
            print('   ', a)
