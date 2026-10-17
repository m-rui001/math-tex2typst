import io

D106 = 'E:/math/研究笔记/D106-五次Lienard系统的两个极限环：model-fitting-arcs三段论证的反推笔记.md'
D26 = 'E:/math/研究笔记/D26-加倍Hilbert子集无双Lipschitz有限维嵌入.md'
t = io.open(D106, encoding='utf-8').read()
t26 = io.open(D26, encoding='utf-8').read()
out = io.open('E:/math/_work/probe_plaincount.txt', 'w', encoding='utf-8')
for s in ['\\root', '\\mathtt{root}', '\\mathtt', '\\sqrt', '\\two', 'mathtt{root}',
          '(\\root h)', '(\\root T)', '$\\root h$', '\\text{third }', '\\text{curvature }',
          '\\text{slope }', '\\text{root }']:
    out.write('D106 plain count %-18s %d\n' % (s, t.count(s)))
for s in ['\\norm', '\\inner', '\\langle', '\\rangle', '\\|', '\\left\\langle']:
    out.write('D26  plain count %-18s %d\n' % (s, t26.count(s)))
out.write('\n-- D106 every line index containing \\mathtt{root} with per-line count --\n')
for i, l in enumerate(t.split('\n'), 1):
    c = l.count('\\mathtt{root}')
    if c:
        out.write('  L%-5d count=%d | %s\n' % (i, c, l[:150]))
out.write('\n-- D106 every line index containing \\root (plain) --\n')
for i, l in enumerate(t.split('\n'), 1):
    c = l.count('\\root')
    if c:
        out.write('  L%-5d count=%d | %s\n' % (i, c, l[:150]))
out.write('\n-- D26 every line with \\norm outside ``` fences? list lines+counts --\n')
L = t26.split('\n')
fence = False
inside = 0
outside = 0
for i, l in enumerate(L, 1):
    if l.lstrip().startswith('```'):
        fence = not fence
        continue
    c = l.count('\\norm')
    if c:
        if fence:
            inside += c
        else:
            outside += c
            out.write('  NON-FENCE L%-5d count=%d | %s\n' % (i, c, l[:200]))
out.write('\nD26 \\norm: in-fence=%d  outside-fence=%d  sum=%d  plain-total=%d\n'
          % (inside, outside, inside + outside, t26.count('\\norm')))
out.close()
print('ok')
