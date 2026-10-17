import io, glob, re
p = glob.glob('研究笔记/D114-*.md')[0]
t = io.open(p, encoding='utf-8').read()
B = chr(92) + ')'
BT = chr(96)
odd_before = sum(1 for l in t.split('\n') if l.count(BT) % 2)
out = []
i = 0
rep_del = rep_bt = 0
while i < len(t):
    if t.startswith(B, i):
        if t[i+2:i+3] == BT:
            rep_del += 1
        else:
            out.append(BT); rep_bt += 1
        i += 2
        continue
    out.append(t[i]); i += 1
t2 = ''.join(out)
old = '换句话说（此处的"换"指路线替换）：常值 gap + 重复放大的路线被'
assert t2.count(old) == 1, t2.count(old)
t2 = t2.replace(old, '于是路线只剩一条：常值 gap + 重复放大的路线被')
odd_after = sum(1 for l in t2.split('\n') if l.count(BT) % 2)
print('del', rep_del, 'backtick', rep_bt, 'oddLines', odd_before, '->', odd_after)
print('check', t2.count(B), t2.count(chr(92)+'('), t2.count('换句话说'), len(t.encode()), len(t2.encode()))
io.open(p, 'w', encoding='utf-8', newline='').write(t2)
