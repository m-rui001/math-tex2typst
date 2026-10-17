# -*- coding: utf-8 -*-
# Runner: self-test on the synthetic pre-repair D374, then the corpus scan.
import io, os, re, glob, sys
sys.path.insert(0, u'E:/math/_work')
import bodyside_detect as bd

BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'


def report(path, tag, out):
    lines = bd.load(path)
    txt = u'\n'.join(lines)
    hits = bd.scan_lines(lines)
    kept = 0
    for h in hits:
        q = h['q']
        # restatement must be absent from the note except inside the declaration
        # block itself (within 25 lines of the declaring line).
        far = [v for v in h['verbatim'] if abs(v - h['decl']) > 25]
        row = []
        row.append(u'#### %s DECL L%d cited=%s verbatim_far=%s' % (
            tag, h['decl'], h['cited'], far))
        row.append(u'  Q(%d): %s' % (len(q), q))
        for ln, t, r, d, off in h['cands']:
            row.append(u'  SITE L%d(cited %d) r=%.3f cnt=%d off=%d dlen=%d qminus=%d : %s' % (
                ln, t, r, txt.count(d), off, len(d), len(q) - len(d), d))
        out.extend(row)
        kept += 1
    return kept


out = []
n1 = 0
for p in sorted(glob.glob(u'E:/math/_work/bodyside_selftest/D374-*.md')):
    n1 += report(p, 'SELFTEST', out)
head = list(out)
out = []
tot = 0
notes = 0
for p in sorted(glob.glob(os.path.join(BASE, 'D*.md'))):
    m = re.match(u'^D([0-9]+)', os.path.basename(p))
    if not m or not (1 <= int(m.group(1)) <= 399):
        continue
    before = len(out)
    k = report(p, u'D%03d' % int(m.group(1)), out)
    if k:
        notes += 1
    tot += k
io.open(u'E:/math/_work/bodyside_self_hits.txt', 'wb').write(
    (u'\n'.join(head) or u'none').encode('utf-8'))
io.open(u'E:/math/_work/bodyside_short5.txt', 'wb').write(
    (u'\n'.join(out) or u'none').encode('utf-8'))
print('selftest_hits=%d corpus_pairs=%d corpus_notes=%d' % (n1, tot, notes))
