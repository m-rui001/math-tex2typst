# -*- coding: utf-8 -*-
# Which locator form does a note use for its material? Counts .tex mentions split by
# shape, plus the per-file mention histogram. Read-only; writes _work/forms_<ID>.txt.
# Usage: python _work/locator_forms.py D463 [D278 ...]
import collections
import io
import os
import re
import sys

SEP = chr(92)
NOTES = u'\u7814\u7a76\u7b14\u8bb0'
PAT = re.compile(u'([A-Za-z0-9_' + SEP + SEP + u'./-]*?\\.tex)' + u':')
for nid in [a for a in sys.argv[1:] if not a.startswith('--')]:
    cand = [f for f in os.listdir(NOTES) if f.startswith(nid + '-')]
    assert len(cand) == 1, cand
    t = io.open(SEP.join([NOTES, cand[0]]), 'rb').read().decode('utf-8')
    forms = collections.Counter()
    files = collections.Counter()
    for m in re.finditer(PAT, t):
        s = m.group(1).replace(SEP, '/')
        if 'build/' in s:
            forms['WITH-BUILD'] += 1
        elif s.count('/') > 1:
            forms['DEEP-PREFIX'] += 1
        elif s.count('/') == 1:
            forms['ONE-PREFIX'] += 1
        else:
            forms['BARE'] += 1
        files[s.split('/')[-1]] += 1
    rows = [u'note=%s' % cand[0],
            u'bytes=%d lines=%d' % (len(t.encode('utf-8')), t.count(chr(10))),
            u'total-tex-mentions=%d' % sum(forms.values())]
    rows += [u'%s=%d' % kv for kv in forms.most_common()]
    rows += [u'sample: ' + u', '.join(u'%s=%d' % kv for kv in files.most_common(8))]
    io.open(u'_work' + SEP + (u'forms_' + nid + u'.txt'), 'wb') \
        .write((u'\n'.join(rows) + u'\n').encode('utf-8'))
    print(nid, sum(forms.values()))
