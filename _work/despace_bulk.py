# -*- coding: utf-8 -*-
# despace_bulk.py — apply the T1-WS-SPLIT repairs found by _work/dollarmath_flip_search.js.
#
# T1 is the tier where a ONE-CHARACTER WHITESPACE edit restores the author's own pairing:
#   DESPACE@q   delete the ' ' immediately before a closer that was vetoed by whitespace
#   INSERTSP@q  put one ' ' between a closer and the digit that vetoed it
# Both leave every '$' a delimiter, so the delimiter counts must not move: that is the
# assertion that separates this tier from the FLIP/ESC/DEL probes, which silence the gauge
# by destroying a delimiter.
#
# What actually runs here is the narrower, INVISIBLE subset: DESPACE on a row whose edit
# splits the refused span (spans==+1). Then the deleted space was the last character
# INSIDE the first half, i.e. trailing whitespace in math, which TeX drops anyway. The
# other whitespace rows are not run: spans==0 rows delete a space that separates two words
# of a verbatim quote ("property of $\Phi$" -> "property of$\Phi$"), and INSERTSP puts a
# visible space between a closer and the number after it ("$\S$2.4" -> "$\S$ 2.4").
# Both are listed in the report instead.
#
# Safety: dry-run by default; --apply writes a _work/<K>.pre-despace.md backup first.
# Per file we assert bytes delta = (+1 per INSERTSP, -1 per DESPACE), '$' and '`' counts
# unchanged, CR count unchanged, line count unchanged, and no two edits overlap.
# The KaTeX re-measure is a separate pass: run _work/dollarmath_census2.js afterwards and
# compare the family count.
#   python -X utf8 _work/despace_bulk.py [--apply]
import io, json, os, re, sys, glob
from collections import defaultdict
sys.stdout.reconfigure(encoding='utf-8')

APPLY = '--apply' in sys.argv
SRC = '_work/dollarmath_flip_tiers.jsonl'
FLIGHT = set(a for a in sys.argv[1:] if re.match(u'^D[0-9]+$', a))

sites = defaultdict(list)          # file -> [(offset, kind)]
for l in io.open(SRC, encoding='utf-8'):
    if not l.strip():
        continue
    r = json.loads(l)
    # whitespace-only repair, and the refused span lives on one line: the cross-line rows
    # belong to the 跨多行行内式 family, whose repair is 并线, not a despace.
    if r['crosses'] or not r['wsClear']:
        continue
    k = r['file'][1:r['file'].find(u'-')]
    if k in FLIGHT:
        continue
    win = [c for c in r['wsClear'] if c.startswith('DESPACE') and r['cands'][c]['spans'] == 1]
    if not win:
        continue
    nm = win[0]
    off = int(nm.split('@')[1])
    # the deleted space must be inside the refused span, which is what makes it invisible
    assert r['a'] < off - 1 < r['b'], (r['file'], r['line'], off)
    sites[r['file']].append((off, nm.split('@')[0]))

tot_files = tot_edits = 0
for f in sorted(sites):
    p = u'研究笔记/' + f
    raw = io.open(p, encoding='utf-8').read()
    ed = sorted(set(sites[f]), reverse=True)
    for i in range(len(ed) - 1):
        assert ed[i][0] - ed[i + 1][0] > 2, (f, ed[i], ed[i + 1])
    text = raw
    des = ins = 0
    for off, kind in ed:
        if kind == 'DESPACE':
            assert text[off - 1] == u' ', (f, off, repr(text[off - 8:off + 8]))
            text = text[:off - 1] + text[off:]
            des += 1
        else:
            assert text[off] == u'$', (f, off, repr(text[off - 8:off + 8]))
            text = text[:off + 1] + u' ' + text[off + 1:]
            ins += 1
    ob, nb = raw.encode('utf-8'), text.encode('utf-8')
    assert nb.count(b'$') == ob.count(b'$'), f
    assert nb.count(b'`') == ob.count(b'`'), f
    assert nb.count(b'\r') == ob.count(b'\r'), f
    assert len(nb.split(b'\n')) == len(ob.split(b'\n')), f
    assert len(nb) - len(ob) == ins - des, (f, len(nb) - len(ob), ins, des)
    print(u'%s edits=%d despace=%d insertsp=%d bytes=%d->%d' % (
        f[:40], len(ed), des, ins, len(ob), len(nb)))
    tot_files += 1
    tot_edits += len(ed)
    if APPLY:
        k = f[1:f.find(u'-')]
        io.open(u'_work/%s.pre-despace.md' % k, 'w', encoding='utf-8').write(raw)
        io.open(p, 'wb').write(nb)
print(u'FILES=%d EDITS=%d APPLY=%s' % (tot_files, tot_edits, APPLY))
