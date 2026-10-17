# -*- coding: utf-8 -*-
# Resolve the four tail notes whose first 6,000 chars register no preprints dir:
# search the whole file for a directory name that actually exists on disk, and show
# how the note words its material source.
import io, os, re

B = chr(92)
SL = chr(47)
ROOT = os.path.join('E:' + B + B, 'math', u'\u7814\u7a76\u7b14\u8bb0')
PRE = os.path.join('E:' + B + B, 'math', 'preprints')
NAME = u'[A-Za-z0-9._' + B + B + u'-]{8,}'
DIRRE = re.compile(u'preprints[' + SL + B + B + B + B + ']*(' + NAME + u')')
KW = (u'\u53d6\u6750', u'\u7d20\u6750', u'\u767b\u8bb0')
out = []
for nid in ('D90', 'D92', 'D86', 'D12'):
    fn = [f for f in os.listdir(ROOT) if f.startswith(nid + '-')][0]
    t = io.open(os.path.join(ROOT, fn), encoding='utf-8').read()
    found, order = set(), []
    for m in DIRRE.finditer(t):
        d = m.group(1)
        if os.path.isdir(os.path.join(PRE, d)) and d not in found:
            found.add(d)
            order.append(d)
    anyname = [m.group(1) for m in DIRRE.finditer(t)][:4]
    out.append('== %s %s' % (nid, fn[:44]))
    out.append('   verified-dirs=%s' % [d[:62] for d in order[:3]])
    out.append('   raw-names-seen=%s' % [d[:44] for d in anyname])
    for kw in KW:
        i = t.find(kw)
        if i >= 0:
            out.append('   ctx[%s]: %s' % (kw, t[i:i + 200].replace('\n', ' / ')))
            break
io.open(os.path.join('E:' + B + B, 'math', '_work', 'dir_none.txt'), 'wb').write(('\n'.join(out) + '\n').encode('utf-8'))
print('ok lines=%d' % len(out))
