# -*- coding: utf-8 -*-
"""节号重整：先删同标题的杂散重复标题，再降十进制二级标题，最后按物理顺序把
`## §N` 重排成连续编号，并用同一映射改写正文里的 `§N` 引用。
用法: python _work/renum.py [--apply] ID [ID ...]
"""
import io, os, re, sys, collections

sys.stdout.reconfigure(encoding='utf-8')
BASE = u'研究笔记'
H2SEC = re.compile(u'^(##+ *)\u00a7(\\d+)((?:\\.\\d+)?)( *)(.*)$')
DEC = re.compile(u'^(##+) *\u00a7(\\d+)\\.(\\d+)( +)(.*)$')
REF = re.compile(u'\u00a7(\\d+)(?![\\.\\d])')

apply = '--apply' in sys.argv
ids = [a for a in sys.argv[1:] if not a.startswith('--')]
log = []

for i in ids:
    fl = [x for x in os.listdir(BASE) if x.startswith(i + u'-') and x.endswith(u'.md')]
    if not fl:
        print(i, 'NOFILE')
        continue
    p = os.path.join(BASE, fl[0])
    raw = io.open(p, encoding='utf-8', newline='').read()
    L = raw.split('\n')
    n_before = len(L)
    nl_before_h2 = sum(1 for l in L if H2SEC.match(l))

    # op2: decimal H2 -> H3
    demoted = []
    for k, l in enumerate(L):
        m = DEC.match(l)
        if m:
            L[k] = m.group(1)[1:] + u'###' + u'\u00a7' + m.group(2) + u'.' + m.group(3) + m.group(4) + m.group(5)
            demoted.append((k + 1, m.group(2) + u'.' + m.group(3)))

    # op1: stray duplicate headings (same number + same stripped title)
    def heads():
        out = []
        for k, l in enumerate(L):
            m = H2SEC.match(l)
            if not m or m.group(3) or len(m.group(1).rstrip()) != 2:
                continue          # 只处理二级、纯整数节号
            out.append((k, int(m.group(2)), m.group(5).strip()))
        return out
    deleted = []
    while True:
        hs = heads()
        grp = collections.defaultdict(list)
        for k, n, t in hs:
            grp[(n, t)].append(k)
        hit = None
        for key, v in grp.items():
            if len(v) > 1:
                hit = v
                break
        if not hit:
            break
        a, b = hit[0], hit[1]
        nxt = [k for k, n, t in heads() if k > a][0] if len(heads()) > 1 else len(L)
        empty_a = not any(x.strip() for x in L[a + 1:b])
        if empty_a:
            rng = range(a, b)                      # 删前一个标题及其后的空行
            why = 'empty-first'
        else:
            rng = [b]                             # 只删后一个标题行
            why = 'merge-up'
        for k in sorted(rng, reverse=True):
            del L[k]
        deleted.append((a + 1, b + 1, why))

    # op3: renumber by physical order + remap in-text refs
    hs = heads()
    olds = [n for _, n, _ in hs]
    mapping = {}
    for pos, (k, n, t) in enumerate(hs):
        mapping.setdefault(n, pos)                 # 重复编号以第一处为准
    for pos, (k, n, t) in enumerate(hs):
        L[k] = re.sub(u'^(##+ *)\u00a7\\d+', lambda m: m.group(1) + u'\u00a7%d' % pos, L[k])
    for pos, (k, n, t) in enumerate(hs):
        olds_pos = pos
    for k, l in enumerate(L):
        if H2SEC.match(l):
            continue
        L[k] = REF.sub(lambda m: u'\u00a7%d' % mapping.get(int(m.group(1)), int(m.group(1))), l)

    new = '\n'.join(L)
    hs2 = []
    for l in new.split('\n'):
        m = H2SEC.match(l)
        if m and not m.group(3) and len(m.group(1).rstrip()) == 2:
            hs2.append(int(m.group(2)))
    contig = hs2 == list(range(len(hs2)))
    print('%s dec_del=%d stray=%d h2_before=%d h2_after=%d contig=%s lines %d->%d size %d->%d'
          % (i, len(demoted), len(deleted), nl_before_h2, len(hs2), contig, n_before, len(L),
             len(raw.encode('utf-8')), len(new.encode('utf-8'))))
    if not contig:
        print(i, 'REFUSED (not contig after renumber)')
        continue
    log.append((i, olds, list(range(len(olds))), demoted, deleted))
    if apply:
        assert len(L) == n_before - sum(x[2] == 'empty-first' and (x[1] - x[0]) or 1 for x in deleted)
        bak = os.path.join('_work', 'reorder-bak', i + u'.pre-renum.md')
        io.open(bak, 'w', encoding='utf-8', newline='').write(raw)
        io.open(p, 'w', encoding='utf-8', newline='').write(new)

if apply:
    with io.open('_work/renum_log.txt', 'w', encoding='utf-8', newline='\n') as o:
        for i, olds, news, dem, dele in log:
            o.write(u'%s old=%s new=%s demoted=%s stray_deleted=%s map=%s\n'
                    % (i, olds, news, dem, dele, dict(zip(olds, news))))
print('applied' if apply else 'preview only', len(log))
