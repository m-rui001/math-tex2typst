# -*- coding: utf-8 -*-
# Intake re-measure for one freshly landed append batch: byte and line counts from disk,
# CR bytes, section numbering (form, count, contiguity), the pipe histogram of the appended
# region, ledger header and separator counts, per-line odd-$ lines, and the fused-control-
# word check restricted to the delimiter family (a macro followed by a letter is read by TeX
# as one longer, undefined word; digits after \ge or \le are legal, so they don't count).
import re, sys, os, io, glob, collections

B = chr(92)
arg = sys.argv[1]
if not os.path.exists(arg):
    cand = glob.glob(os.path.join(u'研究笔记', arg.split('-')[0] + u'-*.md'))
    if len(cand) != 1:
        raise SystemExit(u'glob ambiguity: ' + repr(cand))
    p = cand[0]
else:
    p = arg
raw = open(p, 'rb').read()
t = raw.decode('utf-8')
lines = t.split('\n')
print('bytes', len(raw), 'lines', len(lines), 'CR', raw.count(b'\r'))
H = [(i + 1, l) for i, l in enumerate(lines) if l.startswith(u'## ')]
nums = []
for i, l in H:
    m = re.match(u'## ' + B + u'S?([0-9]+)', l)
    m2 = re.match(u'## (?:' + chr(0xa7) + u')?([0-9]+)', l)
    nums.append(int(m2.group(1)) if m2 else -1)
print('hdr', len(H), 'nums', nums)
print('contig', nums == sorted(nums) and len(set(nums)) == len(nums))
print('forms', sorted(set(l[:6] for i, l in H)))
last = H[-1][0]
newsec = [i for i, l in H if l.startswith(u'## ') and nums[H.index((i, l))] == nums[-1]]
print('headings', H[0][1][:30], '|', H[-2][1][:30] if len(H) > 1 else '', '|', H[-1][1][:30])
# appended region = everything from the second-to-last heading on (the new section)
if len(H) > 1:
    start = H[-1][0]
    seg = '\n'.join(lines[start - 1:])
    hist = collections.Counter(l.count('|') for l in seg.split('\n') if l.startswith('| '))
    print('newsec line', start, 'appended pipe hist', dict(hist),
          'rows', sum(hist.values()))
whist = collections.Counter(l.count('|') for l in lines if l.startswith('| '))
print('whole pipe hist', dict(whist))
print('odd-$ lines', [i + 1 for i, l in enumerate(lines) if l.count(u'$') % 2][:12])
print('HDR-ish lines', [i + 1 for i, l in enumerate(lines)
                       if l.startswith(u'| ') and u'符号' in l and u'被谁消费' in l])
print('sep lines', [i + 1 for i, l in enumerate(lines)
                    if re.match(u'^\\|( ?:?-+:?\\|)+ ?:?-+:?\\|?$', l.strip())][:8])
fused = re.compile(B * 2 + u'(?:lvert|rvert|lVert|rVert|upharpoonright|middle|mathcal|mathbb|mathrm|operatorname)[A-Za-z]')
hits = [(m.start(), t[:m.start()].count('\n') + 1, t[max(0, m.start() - 45):m.start() + 25])
        for m in fused.finditer(t)]
print('fused sites', len(hits))
for h in hits[:8]:
    print(h[1], repr(h[2]))
print('dollar total', t.count(u'$'), 'backticks', t.count(u'`'))
