import io, re

D26 = 'E:/math/研究笔记/D26-加倍Hilbert子集无双Lipschitz有限维嵌入.md'
D106 = 'E:/math/研究笔记/D106-五次Lienard系统的两个极限环：model-fitting-arcs三段论证的反推笔记.md'
D30 = 'E:/math/研究笔记/D30-负pinched三维Kähler流形无有界全纯坐标.md'
D77 = 'E:/math/研究笔记/D77-特征二下的五边形退化与Deligne--Drinfeld猜想证明反推.md'
D238 = 'E:/math/研究笔记/D238-平方差自由集的固定幂节省.md'


def regions(line):
    res, i, n = [], 0, len(line)
    while i < n:
        if line[i] == '`':
            j = i
            while j < n and line[j] == '`':
                j += 1
            run = j - i
            k = line.find('`' * run, j)
            if k == -1:
                res.append((i, j, 'text')); i = j
            else:
                res.append((i, k + run, 'code')); i = k + run
        else:
            j = i
            while j < n and line[j] != '`':
                j += 1
            res.append((i, j, 'text')); i = j
    return res


def classify(path, pats):
    t = io.open(path, encoding='utf-8').read()
    lines = t.split('\n')
    fence = False
    res = {k: {'math': 0, 'code': 0, 'fenced': 0, 'text_outside_math': 0} for k in pats}
    rx_math = []
    for ln, line in enumerate(lines, 1):
        s = line.lstrip()
        if s.startswith('```') or s.startswith('~~~'):
            fence = not fence
            continue
        regs = regions(line)
        # dollar spans on non-fence lines
        ms, i, st = [], 0, None
        while i < len(line):
            if line[i] == '\\':
                i += 2; continue
            if line[i] == '$':
                dbl = i + 1 < len(line) and line[i + 1] == '$'
                if st is None:
                    st = i + (2 if dbl else 1); i += (2 if dbl else 1)
                else:
                    ms.append((st, i)); st = None; i += (2 if dbl else 1)
                continue
            i += 1
        if st is not None:
            ms.append((st, len(line)))
        for k, pat in pats.items():
            for m in re.finditer(pat, line):
                pos = m.start()
                reg = 'text'
                for a, b, kk in regs:
                    if a <= pos < b:
                        reg = kk; break
                if fence:
                    res[k]['fenced'] += 1
                elif reg == 'code':
                    res[k]['code'] += 1
                elif any(a <= pos < b for a, b in ms):
                    res[k]['math'] += 1
                else:
                    res[k]['text_outside_math'] += 1
    return res


out = io.open('E:/math/_work/probe_family2.txt', 'w', encoding='utf-8')
JOBS = [
 (D26, {'norm': r'\\norm', 'inner': r'\\inner', 'bare_math': r'\\math(?![A-Za-z])',
        'av': r'\\av(?![A-Za-z])', 'R_macro': r'(?<![a-zA-Z])\\R(?![A-Za-z])',
        'N_macro': r'(?<![a-zA-Z])\\N(?![A-Za-z])', 'diam': r'\\diam(?![A-Za-z])'}),
 (D106, {'root': r'\\root(?![A-Za-z])', 'bare_math': r'\\math(?![A-Za-z])',
         'two': r'\\two(?![A-Za-z])', 'mathtt_root': r'\\mathtt\{root\}'}),
 (D30, {'bare_math': r'\\math(?![A-Za-z])'}),
 (D77, {'two': r'\\two(?![A-Za-z])', 'bare_math': r'\\math(?![A-Za-z])'}),
 (D238, {'bare_math': r'\\math(?![A-Za-z])'}),
]
grand_nonrender = 0
grand_math = 0
for p, pats in JOBS:
    r = classify(p, pats)
    out.write('==== %s\n' % p.split('/')[-1])
    for k, v in sorted(r.items()):
        tot = sum(v.values())
        out.write('   %-16s total=%-4d math=%-3d code=%-3d fenced=%-3d text_outside_math=%d\n'
                  % (k, tot, v['math'], v['code'], v['fenced'], v['text_outside_math']))
        if k in ('inner', 'root', 'two', 'bare_math'):
            grand_math += v['math']
            grand_nonrender += v['code'] + v['fenced']
out.write('\nGRAND: flagged-family math-span occurrences=%d ; non-render (code+fenced) occurrences=%d\n'
          % (grand_math, grand_nonrender))
out.close()
print('ok')
