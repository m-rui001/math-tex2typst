# -*- coding: utf-8 -*-
# Give every headerless ledger block its own continuation header.
# Dry run by default: prints the byte and line delta per file and writes nothing.
#   python _work/hdrless_fix.py D02 D03 ... [--apply]
# Invariants asserted before writing: the standard "符号" header count stays as measured,
# the dollar / backtick / CR counts are identical, the block's own rows are byte-for-byte
# untouched, and exactly two lines (header + separator) are inserted per block.
import io, os, re, sys, glob

STD = u'| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |'
HDR2 = u'| \u8bb0\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |'
SEP = u'| --- | --- | --- | --- | --- |'
SEPRX = re.compile(r'^\|(\s*---\s*\|)+$')


def fence_mask(lines):
    m, inf = [], False
    for l in lines:
        if l.strip().startswith('```'):
            inf = not inf
        m.append(inf)
    return m


def blocks(lines, fm):
    """Line indices at which a headerless run of >=3 six-pipe rows starts."""
    out, i = [], 0
    while i < len(lines):
        if fm[i] or not (lines[i].startswith(u'| ') and lines[i].count(u'|') == 6):
            i += 1
            continue
        j = i
        while j + 1 < len(lines) and not fm[j + 1] and lines[j + 1].startswith(u'| ') \
                and lines[j + 1].count(u'|') == 6:
            j += 1
        if j - i + 1 >= 3:
            headed = (i + 1 <= j and SEPRX.match(lines[i + 1].strip())) or \
                     (i >= 1 and SEPRX.match(lines[i - 1].strip()) and not fm[i - 1])
            if not headed:
                t2 = i - 1
                while t2 >= 0 and lines[t2].startswith(u'|') and not fm[t2] \
                        and not SEPRX.match(lines[t2].strip()):
                    t2 -= 1
                if not (t2 >= 0 and SEPRX.match(lines[t2].strip())):
                    out.append((i, j))
        i = j + 1
    return out


APPLY = u'--apply' in sys.argv
keys = [a for a in sys.argv[1:] if re.match(u'^D[0-9]+$', a)]
tot_files = tot_blocks = tot_bytes = 0
for k in keys:
    hits = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/%s-*.md' % k)
    if len(hits) != 1:
        print(u'%s GLOB=%d' % (k, len(hits)))
        continue
    p = hits[0]
    raw = io.open(p, encoding='utf-8').read()
    ob = raw.encode('utf-8')
    lines = raw.split(u'\n')
    fm = fence_mask(lines)
    bs = blocks(lines, fm)
    if not bs:
        print(u'%s clean' % k)
        continue
    new = list(lines)
    for n, (a, b) in enumerate(bs):
        pos = a + 2 * n
        assert all(new[pos + t].count(u'|') == 6 for t in range(0, b - a + 1))
        new[pos:pos] = [HDR2, SEP]
    nb = u'\n'.join(new).encode('utf-8')
    std_before = raw.count(STD)
    assert nb.count(b'$') == ob.count(b'$'), k
    assert nb.count(b'`') == ob.count(b'`'), k
    assert nb.count(b'\r') == ob.count(b'\r'), k
    assert len(new) == len(lines) + 2 * len(bs), k
    assert u'\n'.join(new).count(STD) == std_before, k
    # the inserted pair must be the only difference: removing it must rebuild the original
    rebuilt = [l for idx, l in enumerate(new) if idx not in
               set(a + 2 * n + t for n, (a, b) in enumerate(bs) for t in (0, 1))]
    assert rebuilt == lines, k
    delta = len(nb) - len(ob)
    print(u'%s blocks=%d rows=%s hdr_std=%d bytes %d->%d (+%d)' % (
        k, len(bs), [u'%d:%d' % (a + 1, b - a + 1) for a, b in bs], std_before,
        len(ob), len(nb), delta))
    tot_files += 1
    tot_blocks += len(bs)
    tot_bytes += delta
    if APPLY:
        io.open(u'_work/%s.pre-hdrless.md' % k, u'w', encoding='utf-8', newline='\n').write(raw)
        io.open(p, 'wb').write(nb)
print(u'FILES=%d BLOCKS=%d BYTES=+%d APPLY=%s' % (tot_files, tot_blocks, tot_bytes, APPLY))
