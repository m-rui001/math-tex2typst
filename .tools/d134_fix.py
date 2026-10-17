import io, glob
p = [x for x in glob.glob('研究笔记/D134-*') if x.endswith('.md')][0]
t = io.open(p, encoding='utf-8').read()
L = t.split('\n')
HDR = '| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |'
h = [i for i, l in enumerate(L) if l == HDR][0]
BT, DL = chr(96), chr(36)
removed = 0
odd_before = odd_after = 0
for i in range(h + 1, len(L)):
    if not L[i].startswith('|'):
        break
    if L[i].count(BT) % 2: odd_before += 1
    new = L[i].replace(BT + DL, DL).replace(DL + BT, DL)
    removed += len(L[i]) - len(new)
    L[i] = new
    if new.count(BT) % 2: odd_after += 1
t2 = '\n'.join(L)
old_h1 = '`$\mathrm{QAC}^0$`'
print('h1hits', t2.count(old_h1))
t2 = t2.replace(old_h1, '$\mathrm{QAC}^0$')
print('removed_backticks', removed, 'oddRows', odd_before, '->', odd_after)
print('size', len(t.encode()), '->', len(t2.encode()), 'bt', t2.count(BT))
io.open(p, 'w', encoding='utf-8', newline='').write(t2)
