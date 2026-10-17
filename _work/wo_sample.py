# -*- coding: utf-8 -*-
# Print a review sample of the literal src->dst pairs with surrounding note context,
# keeping only unambiguous (single-occurrence, >=6 chars) pairs.
import io, os, csv, random, collections

B = chr(92)
ROOT = os.path.join('E:' + B + B, 'math', u'\u7814\u7a76\u7b14\u8bb0')
names = {f.split('-')[0]: f for f in os.listdir(ROOT) if f.endswith('.md') and f.startswith('D')}
rows = list(csv.reader(io.open(os.path.join('E:' + B + B, 'math', '_work', 'wo_literal.tsv'), encoding='utf-8'), delimiter='\t'))
cache = {}
def T(n):
    if n not in cache:
        cache[n] = io.open(os.path.join(ROOT, names[n]), encoding='utf-8', errors='replace').read()
    return cache[n]

keep = []
for nid, wid, fam, cnt, src, dst in rows:
    t = T(nid)
    if len(src) >= 6 and t.count(src) == 1:
        keep.append((nid, fam, src, dst, t))
random.seed(7)
samp = random.sample(keep, min(22, len(keep)))
out = ['candidate(unambiguous,len>=6)=%d of %d' % (len(keep), len(rows)), '']
for nid, fam, src, dst, t in samp:
    i = t.index(src)
    ln = t[:i].count('\n') + 1
    ctx = t[max(0, i - 70): i + len(src) + 70].replace('\n', ' / ')
    out.append('== %s %s  L%d  fam=%s' % (nid, names[nid][:18], ln, fam))
    out.append('   SRC: ' + src)
    out.append('   DST: ' + dst)
    out.append('   CTX: ' + ctx)
io.open(os.path.join('E:' + B + B, 'math', '_work', 'wo_sample.txt'), 'wb').write(('\n'.join(out) + '\n').encode('utf-8'))
print('kept=%d' % len(keep))
