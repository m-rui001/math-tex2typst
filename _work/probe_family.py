import io, re, os, json

NOTES = 'E:/math/研究笔记/'
FILES = {
 'D26': 'D26-加倍Hilbert子集无双Lipschitz有限维嵌入.md',
 'D30': 'D30-负pinched三维Kähler流形无有界全纯坐标.md',
 'D77': 'D77-特征二下的五边形退化与Deligne--Drinfeld猜想证明反推.md',
 'D106': 'D106-五次Lienard系统的两个极限环：model-fitting-arcs三段论证的反推笔记.md',
 'D238': 'D238-平方差自由集的固定幂节省.md',
}

FAMILIES = {
 'root':      re.compile(r'\\root(?![A-Za-z])'),
 'two':       re.compile(r'\\two(?![A-Za-z])'),
 'math_bare': re.compile(r'\\math(?![A-Za-z])'),
 'mathbbP':   re.compile(r'\\mathbb(?![A-Za-z])'),
 'mathcal_bare': re.compile(r'\\mathcal(?![A-Za-z])'),
 'rangle_glued': re.compile(r'\\rangle[A-Za-z]'),
 'langle_glued': re.compile(r'\\langle[A-Za-z]'),
 'inner':     re.compile(r'\\inner(?![A-Za-z])'),
 'of_glued':  re.compile(r'\\(mathrm|mathbf|operatorname|text|mathbb|mathcal)[A-Za-z]'),
}

# extra counters for D238 point 4
EXTRA = {
 'mathcal P': re.compile(r'\\mathcal\s*P(?![A-Za-z])'),
 'mathcal{P}': re.compile(r'\\mathcal\{P\}'),
 'mathbb P':  re.compile(r'\\mathbb\s*P(?![A-Za-z])'),
 'mathbb{P}': re.compile(r'\\mathbb\{P\}'),
 'bare \\P':  re.compile(r'\\P(?![A-Za-z])'),
 'math P':    re.compile(r'\\math\s+P'),
}


def regions(line):
    """return list of (start,end,kind) over chars: kind in {'code','text'}"""
    res = []
    i = 0
    n = len(line)
    while i < n:
        if line[i] == '`':
            j = i
            while j < n and line[j] == '`':
                j += 1
            run = j - i
            k = line.find('`' * run, j)
            if k == -1:
                res.append((i, j, 'text'))  # unterminated run -> literal
                i = j
            else:
                res.append((i, k + run, 'code'))
                i = k + run
        else:
            j = i
            while j < n and line[j] != '`':
                j += 1
            res.append((i, j, 'text'))
            i = j
    return res


def mathspans(line):
    """char positions inside $...$ (naive parity, skipping escaped \\$)"""
    spans = []
    start = None
    i = 0
    n = len(line)
    while i < n:
        c = line[i]
        if c == '\\':
            i += 2
            continue
        if c == '$':
            dbl = (i + 1 < n and line[i + 1] == '$')
            if start is None:
                start = i + (2 if dbl else 1)
                i += (2 if dbl else 1)
            else:
                spans.append((start, i))
                start = None
                i += (2 if dbl else 1)
            continue
        i += 1
    if start is not None:
        spans.append((start, n))  # unterminated (crosses lines)
    return spans


out = io.open('E:/math/_work/probe_family_report.txt', 'w', encoding='utf-8')
summary = {}
for tag, fn in FILES.items():
    p = os.path.join(NOTES, fn)
    text = io.open(p, encoding='utf-8').read()
    lines = text.split('\n')
    fence = False
    counts = {}
    hits = []
    for ln, line in enumerate(lines, 1):
        stripped = line.lstrip()
        if stripped.startswith('```') or stripped.startswith('~~~'):
            fence = not fence
            continue
        if fence:
            regs = [(0, len(line), 'fenced')]
        else:
            regs = regions(line)
        ms = mathspans(line) if not fence else []
        for fam, rx in FAMILIES.items():
            for m in rx.finditer(line):
                pos = m.start()
                kind = 'text'
                for (a, b, k) in regs:
                    if a <= pos < b:
                        kind = k
                        break
                inm = any(a <= pos < b for a, b in ms)
                if kind == 'fence':
                    kind = 'fenced'
                key = (fam, kind, inm)
                counts[key] = counts.get(key, 0) + 1
                if kind != 'fenced':
                    s = max(0, pos - 70); e = min(len(line), pos + 90)
                    hits.append((tag, fam, ln, pos + 1, kind, inm, line[s:e]))
                else:
                    hits.append((tag, fam, ln, pos + 1, kind, inm, '(fenced block)'))
    summary[tag] = counts
    out.write('=' * 100 + '\n%s  %s  lines=%d\n' % (tag, fn, len(lines)))
    out.write('-- counts by (family, region, in-math-span) --\n')
    for k in sorted(counts, key=lambda x: (x[0], x[1], str(x[2]))):
        out.write('   %-14s %-8s in_math=%-5s  %d\n' % (k[0], k[1], k[2], counts[k]))
    out.write('-- hits --\n')
    for h in hits:
        out.write('   [%s] %-12s L%-5d c%-4d region=%-6s in_math=%-5s | %s\n' %
                  (h[0], h[1], h[2], h[3], h[4], h[5], h[6]))
    if tag == 'D238':
        out.write('-- D238 extra counters (whole file, raw string counts) --\n')
        for name, rx in EXTRA.items():
            out.write('   %-12s %d\n' % (name, len(rx.findall(text))))
        # per-line detail for \math P occurrences
        out.write('-- D238 \\math P occurrences by line --\n')
        for ln, line in enumerate(lines, 1):
            for m in EXTRA['math P'].finditer(line):
                s = max(0, m.start() - 70); e = min(len(line), m.end() + 70)
                out.write('   L%-5d | ...%s...\n' % (ln, line[s:e]))
    out.write('\n')
out.close()
json.dump({k: {'|'.join([a, b, str(c)]): v for (a, b, c), v in vv.items()} for k, vv in summary.items()},
          io.open('E:/math/_work/probe_family_counts.json', 'w', encoding='utf-8'),
          ensure_ascii=False, indent=1)
print('done')
