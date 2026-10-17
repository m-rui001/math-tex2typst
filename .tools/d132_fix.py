import io, glob, re
p = [x for x in glob.glob('研究笔记/D132-*') if x.endswith('.md')][0]
t = io.open(p, encoding='utf-8').read()
HDR = '| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |'
BT, DL = chr(96), chr(36)
before = len(t.encode())

# 1. em dash pairs -> comma
t = re.sub(chr(9572)*2 + r'\s*', '，', t)
t = t.replace('，，', '，')

# 2/3. contrast constructions
R = [
 ('上界不是关于期望的不等式，而是关于**每个 outcome 的精确集合等式**。',
  '上界的形状是关于**每个 outcome 的精确集合等式**，对期望取平均的那类不等式在这里给不出任何东西。'),
 ('于是 tip 高度不是 $H_e$ 而是两个端点高度的平均值以外之物',
  '于是 tip 高度偏离 $H_e$，落到两个端点高度的平均值之外'),
 ('即一个 ball 而不是一个 layer。', '即一个 ball。'),
 ('若阈值集合取成闭区间而不是半开区间', '若阈值集合取成闭区间，把半开区间'),
 (r'$\{-1,1\}^{\N}$ 而不是单枚硬币', r'$\{-1,1\}^{\N}$，单枚硬币不够'),
 ('第三版把 $K$ 当定理去证而不是预留，导致', '第三版把 $K$ 当定理去证、没有预留成参数，导致'),
  (r'，把半开区间 $[\theta+nD,\theta+(n+1)D)$，层之间出', r'，把半开区间 $[\theta+nD,\theta+(n+1)D)$ 换成它，层之间出'),
 # 4. mixed language
 ('常数 $C$ 就不universal了', '常数 $C$ 就不再是通用常数'),
 ('的"相邻叶互Identify全部副本"变成"部分副本漏Identify"',
  '的"相邻叶的副本被同一条前缀链认成同一列"变成"部分副本漏认"'),
 ('"公共前缀链把相邻叶的副本全部 Identifying"', '"公共前缀链把相邻叶的副本全部认同"'),
 ('锥图 $=\) 在盘的补里', '锥图 $=$ 在盘的补里'),
 ('main-packing.tex:479', 'main-packing.tex:478'),
]
for old, new in R:
    c = t.count(old)
    if c != 1:
        print('SKIP/HIT', c, old[:34])
    if c:
        t = t.replace(old, new)

# 5. ledger cells: unwrap math from code spans
L = t.split('\n')
h = [i for i, l in enumerate(L) if l == HDR][0]
unwrap = 0
for i in range(h + 1, len(L)):
    if not L[i].startswith('|'):
        break
    new = L[i].replace(BT + DL, DL).replace(DL + BT, DL)
    unwrap += len(L[i]) - len(new)
    L[i] = new
t = '\n'.join(L)

# 6. body math spans: | -> \lvert \rvert, || -> \lVert \rVert
def fix_span(m):
    s = m.group()
    V = chr(92) + chr(124)
    s = s.replace(V, '\x01')
    cnt = s.count(chr(124))
    if cnt % 2:
        return s.replace('\x01', V)
    out, k = [], 0
    for ch in s:
        if ch == chr(124):
            out.append(chr(92) + ('lvert' if k % 2 == 0 else 'rvert')); k += 1
        else:
            out.append(ch)
    s2 = ''.join(out)
    c2 = s2.count('\x01')
    if c2 % 2:
        return s2.replace('\x01', V)
    out, k = [], 0
    for ch in s2:
        if ch == '\x01':
            out.append(chr(92) + ('lVert' if k % 2 == 0 else 'rVert')); k += 1
        else:
            out.append(ch)
    return ''.join(out)

lines = t.split('\n')
changed = 0
for i, l in enumerate(lines):
    if l.startswith('|') or l.startswith('```'):
        continue
    parts = l.split(BT)
    for j in range(0, len(parts), 2):
        if parts[j].count(DL) % 2 == 0:
            new = re.sub(r'\$[^$]+\$', fix_span, parts[j])
            if new != parts[j]:
                parts[j] = new; changed += 1
        else:
            print('ODD-DOLLAR line skipped', i + 1)
    lines[i] = BT.join(parts)
t = '\n'.join(lines)

print('spans_lines_changed', changed, 'ledger_unwrap', unwrap)
print('em', t.count(chr(9572)), 'ershi', t.count('而是'), 'bc', t.count('而不是'),
      'rp', t.count(chr(92) + ')'), 'size', before, '->', len(t.encode()))
io.open(p, 'w', encoding='utf-8', newline='').write(t)
