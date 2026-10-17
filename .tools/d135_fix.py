import io, glob
p = [x for x in glob.glob('研究笔记/D135-*') if x.endswith('.md')][0]
t = io.open(p, encoding='utf-8').read()
R = [
 ('比较器要的不是"证明了下界"，而是 15 个独立断言的合取，其中 5 个是解析引理、6 个是代价刻画、2 个是渐近式、2 个是模型桥接与归约。',
  '比较器要的是 15 个独立断言的合取，"证明了下界"这句话不对应其中任何一格，分工是 5 个解析引理、6 个代价刻画、2 个渐近式、2 个模型桥接与归约。'),
 ('我补的第一件事是"为什么指数是 $(D-k-2)/2$ 而不是 $(D-k)/2-1$"。',
  '我补的第一件事是"为什么指数写成 $(D-k-2)/2$，那个看上去等价的 $(D-k)/2-1$ 里的 $-1$ 该从哪一步领出来"。'),
 (r'$D^{d}$ 而不是 $D$ 作增长常数的理由在',
  r'增长常数取 $D^{d}$（比 $D$ 多出一层 $d$ 次幂）的理由在'),
 (r'$H$ 是被 $\E_H$ 平均掉的，而不是被逐点控制。',
  r'$H$ 是被 $\E_H$ 平均掉的，逐点控制在形式化里没有对应位置。'),
 ('`riesz.tex:161-163`（`introduction.tex` 里也有同调表述）：',
  '`riesz.tex:128-131`（`introduction.tex:161-163` 里也有同调表述）：'),
 ('`riesz.tex:161-163` 的 "$q$ vectors anchored at $z$"',
  '`introduction.tex:161-163` 的 "$q$ vectors anchored at $z$"'),
 ('这个假设在参数表里立刻被推翻，见第 4 节和第 5 节；',
  '这个假设在参数表里立刻被推翻，见第 7 节、第 8 节和第 13 节；'),
 (r'只能取 $\lfloor d/8\rfloor$（第 9、10 节）。',
  r'只能取 $\lfloor d/8\rfloor$（第 12 节和第 13 节）。'),
 ('终端帽的分摊余量 | StoppingKernel.lean:17 |', '终端帽的分摊余量 | StoppingKernel.lean:16 |'),
 ('图模型余量 | Graph.lean:79 |', '图模型余量 | Graph.lean:78 |'),
]
for old, new in R:
    c = t.count(old)
    assert c == 1, (c, old[:40])
    t = t.replace(old, new)
print('ershi', t.count('\u800c\u662f'), 'contrast', t.count('\u800c\u4e0d\u662f'), 'dollar', t.count('$'))
io.open(p, 'w', encoding='utf-8', newline='').write(t)
