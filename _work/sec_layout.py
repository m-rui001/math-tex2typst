# -*- coding: utf-8 -*-
import io, os, re, sys, collections
sys.stdout.reconfigure(encoding='utf-8')

SEC = re.compile(u'^## *' + u'\u00a7' + r'(\d+)')
REF = re.compile(u'\u00a7\\s*(\\d+)')
IDS = [l.split()[0] for l in io.open('_work/dupsec_census.txt', encoding='utf-8')
       if re.match(r'^D\d+', l)]
base = u'研究笔记'
files = {f.split('-')[0]: f for f in os.listdir(base) if re.match(r'^D\d+-.+\.md$', f)}

for i in IDS:
    f = files.get(i)
    if not f:
        print(i, 'NOFILE')
        continue
    lines = io.open(os.path.join(base, f), encoding='utf-8').read().split('\n')
    nums = [int(m.group(1)) for l in lines for m in [SEC.match(l)] if m]
    refs = collections.Counter()
    for l in lines:
        if SEC.match(l):
            continue
        for m in REF.findall(l):
            refs[int(m)] += 1
    # physical positions of headings (1-based line)
    pos = [(k + 1, int(m.group(1))) for k, l in enumerate(lines) for m in [SEC.match(l)] if m]
    # longest increasing subsequence length -> minimal set of headings to renumber
    seq = [n for _, n in pos]
    ins = sorted(seq)
    moved = len(seq) - len(collections.Counter(seq)) if len(set(seq)) != len(seq) else 0
    # tail block detection: how many trailing headings are out of place
    bad = [idx for idx in range(1, len(seq)) if seq[idx] < seq[idx - 1]]
    print('%s n=%d refs_outside_headings=%d descents=%s seq=%s' % (
        i, len(seq), sum(refs.values()), bad, seq))
