# -*- coding: utf-8 -*-
"""After expansion, which refused commands have no definition anywhere?

Those are the ones the corpus cannot legally rewrite: the shorthand was invented by the
note's own hand, not copied from the material preamble. Print the corpus-wide frequency
and, for the top ones, whether ANY of the 700 preambles defines them (a name defined in
some other paper is still undefined here).
"""
from __future__ import unicode_literals
import io, os, json
from collections import Counter

WORK = u'E:/math/_work'
BS = chr(92)
undef = json.loads(io.open(os.path.join(WORK, u'katexundef.json'), encoding='utf-8').read())
tables = json.loads(io.open(os.path.join(WORK, u'preamble_tables.json'), encoding='utf-8').read())

defined_somewhere = set()
for id_, t in tables.items():
    defined_somewhere.update(t[u'defs'].keys())
    defined_somewhere.update(t[u'unresolved'])

u = undef[u'undef'] if isinstance(undef, dict) and u'undef' in undef else undef
rows = []
for cmd, n in sorted(u.items(), key=lambda kv: -kv[1]):
    rows.append((cmd, n, cmd in defined_somewhere))
tot = sum(r[1] for r in rows)
nowhere = [(c, n) for c, n, d in rows if not d]
here = [(c, n) for c, n, d in rows if d]
io.open(os.path.join(WORK, u'undef_register_report.txt'), 'w', encoding='utf-8').write(
    u'distinct=%d occurrences=%d defined_in_some_preamble=%d/%d never_defined=%d/%d\n'
    % (len(rows), tot, len(here), len(rows), len(nowhere), sum(n for _, n in nowhere)) +
    u'--- never defined by any preamble (top 60)\n' +
    u'\n'.join(u'%-16s %6d' % (c, n) for c, n in nowhere[:60]) +
    u'\n--- defined somewhere but still refused here (top 40)\n' +
    u'\n'.join(u'%-16s %6d' % (c, n) for c, n in here[:40]) + u'\n')
print(io.open(os.path.join(WORK, u'undef_register_report.txt'), encoding='utf-8').read()[:1400])
