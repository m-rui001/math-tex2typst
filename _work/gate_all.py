# -*- coding: utf-8 -*-
import glob, os, sys
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '.tools'))
import gate
files = sorted(glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md'))
bad = []
for p in files:
    r = gate.chk(p, quiet=True)
    if r['problems']:
        bad.append((os.path.basename(p), r['size'], r['problems']))
print('total=%d bad=%d' % (len(files), len(bad)))
for name, size, probs in bad:
    print('%-55s %7d  %s' % (name[:55], size, ' '.join(probs)))
