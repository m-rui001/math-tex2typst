import io, re, sys, glob, os

HDR = '| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |'
BAN = ['值得注意的是', '需要指出的是', '换句说', '综上', '总体而言']


def chk(path):
    t = io.open(path, encoding='utf-8', errors='replace').read()
    lines = t.split('\n')
    secs = [l[3:].split()[0] for l in lines if l.startswith('## ')]
    rows = [l for l in lines if l.startswith('| ')]
    problems = []
    if t.count(HDR) != 1:
        problems.append('hdr=%d' % t.count(HDR))
    hdr_i = None
    for i, l in enumerate(lines):
        if l == HDR:
            hdr_i = i
    ledger = []
    if hdr_i is not None:
        j = hdr_i + 2
        while j < len(lines) and lines[j].startswith('| '):
            ledger.append(lines[j]); j += 1
    bad = [i for i, l in enumerate(ledger) if l.count('|') != 6]
    if bad:
        problems.append('badLedgerRows=%s' % bad[:6])
    empt = [i for i, l in enumerate(ledger) if l.rstrip().endswith('| |') or ' |  | ' in l]
    if empt:
        problems.append('emptyCells=%s' % empt[:6])
    if len(ledger) < 28:
        problems.append('ledgerRows=%d' % len(ledger))
    for label, val in (('emDash', t.count('—')), ('bareHRule', len(re.findall(r'(?m)^---$', t))),
                       ('ershi', t.count('而是')), ('bc', t.count('而不是')), ('contrast', len(re.findall(r'不是[^。\n]{0,40}而不是?', t)))):
        if val:
            problems.append('%s=%d' % (label, val))
    for w in BAN:
        if t.count(w):
            problems.append('ban[%s]=%d' % (w, t.count(w)))
    math = t.count('\\(') + t.count('$')
    if math < 1000:
        problems.append('math=%d' % math)
    if len(t.encode('utf-8')) < 70000:
        problems.append('size=%d' % len(t.encode('utf-8')))
    nums = [re.match(r'(\d+)', s).group(1) for s in secs if re.match(r'\d+', s)]
    order = ','.join(nums)
    contig = all(int(b) - int(a) == 1 for a, b in zip(nums, nums[1:]))
    print('%-58s size=%7d secs=%2d contig=%s [%s]' % (os.path.basename(path)[:58], len(t.encode()), len(secs), contig, order[:60]))
    print('    math=%d rows=%d  %s' % (math, len(rows) - 1, ' '.join(problems) if problems else 'CLEAN'))


for pat in sys.argv[1:]:
    hits = glob.glob('研究笔记/' + pat + '*')
    if not hits:
        print(pat, 'NO FILE')
    for h in hits:
        if os.path.isfile(h):
            chk(h)
