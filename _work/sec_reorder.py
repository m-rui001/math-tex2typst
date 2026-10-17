# -*- coding: utf-8 -*-
"""按 § 编号把整节块排回物理顺序。只做整块置换，不改一个字节的内容。
用法:  python _work/sec_reorder.py [--apply] ID [ID ...]
"""
import io, os, re, sys

SEC = re.compile(u'^## *' + u'\u00a7' + r'(\d+)')
H2 = re.compile(u'^## +(?!' + u'\u00a7' + r')(.*)$')
TAIL_KEYS = (u'台账', u'勘误', u'交付', u'补录', u'登记')

BASE = u'研究笔记'


def find_file(i):
    for f in os.listdir(BASE):
        if f.startswith(i + u'-') and f.endswith(u'.md'):
            return os.path.join(BASE, f)
    return None


def plan(path):
    raw = io.open(path, encoding='utf-8', newline='').read()
    lines = raw.split('\n')
    sec = [(k, int(m.group(1))) for k, l in enumerate(lines) for m in [SEC.match(l)] if m]
    if not sec:
        return None
    # tail = first non-§ H2 whose title mentions 台账/勘误/... and which sits after the last § heading's start
    last = sec[-1][0]
    tail_at = None
    for k in range(sec[0][0] + 1, len(lines)):
        m = H2.match(lines[k])
        if m and any(x in m.group(1) for x in TAIL_KEYS):
            tail_at = k
            break
    blocks = []
    for idx, (start, num) in enumerate(sec):
        stop = len(lines) if idx + 1 == len(sec) else sec[idx + 1][0]
        if tail_at is not None and start < tail_at < stop:
            stop = tail_at
        blocks.append((num, start, stop))
    pre_end = sec[0][0]
    tail = lines[tail_at:] if tail_at is not None else []
    if tail_at is not None:
        blocks = [(n, s, min(e, tail_at)) for (n, s, e) in blocks if s < tail_at]
    mid = lines[pre_end:tail_at] if tail_at is not None else lines[pre_end:]
    order = [b[0] for b in blocks]
    return dict(lines=lines, raw=raw, pre=lines[:pre_end], mid=mid, blocks=blocks,
                order=order, tail=tail, tail_at=tail_at)


def main():
    args = [a for a in sys.argv[1:] if a != '--apply']
    apply = '--apply' in sys.argv[1:]
    for i in args:
        p = find_file(i)
        if not p:
            print(i, 'NOFILE')
            continue
        pl = plan(p)
        lines, blocks = pl['lines'], pl['blocks']
        moved = []
        for num, s, e in blocks:
            if num != sorted(x[0] for x in blocks)[[b[0] for b in blocks].index(num)]:
                pass
        new_blocks = sorted(blocks, key=lambda b: b[0])
        seg = lambda b: lines[b[1]:b[2]]
        changed = [b[0] for a, b in zip(blocks, new_blocks) if a[1] != b[1]]
        rebuilt = pl['pre'] + [l for b in new_blocks for l in seg(b)] + pl['tail']
        out = '\n'.join(rebuilt)
        same_size = len(out.encode('utf-8')) == len(pl['raw'].encode('utf-8'))
        n2 = [int(m.group(1)) for l in rebuilt for m in [SEC.match(l)] if m]
        mono = all(n2[k + 1] - n2[k] == 1 for k in range(len(n2) - 1))
        contig = n2 == sorted(n2) and len(set(n2)) == len(n2)
        print('%s size=%d moves=%d blocks=%d bytes_same=%s mono_after=%s contig_after=%s tail=%s seq=%s'
              % (i, len(pl['raw'].encode('utf-8')), len(changed), len(blocks), same_size, contig,
                 mono, pl['tail_at'], n2))
        if apply:
            assert same_size, 'size changed -> refuse'
            assert sorted(lines) == sorted(rebuilt), 'line multiset changed -> refuse'
            assert contig, 'not contig after rebuild -> refuse'
            bak = os.path.join('_work', 'reorder-bak', i + '.md.bak')
            if not os.path.isdir(os.path.join('_work', 'reorder-bak')):
                os.makedirs(os.path.join('_work', 'reorder-bak'))
            if not os.path.exists(bak):
                io.open(bak, 'w', encoding='utf-8', newline='').write(pl['raw'])
            io.open(p, 'w', encoding='utf-8', newline='').write(out)
            print(i, 'APPLIED backup=' + bak)


main()
