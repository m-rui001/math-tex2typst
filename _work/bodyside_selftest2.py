# -*- coding: utf-8 -*-
# Self-test v2: build a synthetic PRE-REPAIR D374 (site line carrying the
# damaged form quoted by the declaration) and confirm the detector finds it.
import io, glob, os, sys
sys.path.insert(0, u'E:/math/_work')
import bodyside_detect as bd

BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
RESTATED = u'\u8fd9\u4e2a\u987a\u5e8f\u672c\u8eab\u5c31\u662f\u8bba\u6587\u6700\u6df1\u7684\u8bbe\u8ba1\u58f0\u660e\u3002'
DAMAGED = u'\u8fd9\u672c\u8eab\u662f\u8bba\u6587\u6700\u6df1\u7684\u7684\u8bbe\u8ba1\u58f0\u660e\u3002'
src = glob.glob(os.path.join(BASE, 'D374-*.md'))[0]
lines = bd.load(src)
site = [k for k, l in enumerate(lines) if u'\u8bba\u6587\u6700\u6df1' in l and k != 269]
info = [u'site_candidates=%s' % [s + 1 for s in site],
        u'restated_count=%d damaged_count=%d' % (u'\n'.join(lines).count(RESTATED),
                                                u'\n'.join(lines).count(DAMAGED))]
for s in site:
    info.append(u'SITE_LINE_TEXT_TAIL: ' + lines[s][-60:])
CUR = u'\u8fd9\u4e2a\u987a\u5e8f\u672c\u8eab\u662f\u8bba\u6587\u6700\u6df1\u7684\u8bbe\u8ba1\u58f0\u660e\u3002'
info.append(u'cur_present_at_site=%d' % lines[site[0]].count(CUR))
lines[site[0]] = lines[site[0]].replace(CUR, DAMAGED)
txt = u'\n'.join(lines)
info.append(u'after_synth: restated=%d damaged=%d' % (txt.count(RESTATED), txt.count(DAMAGED)))
os.makedirs(u'E:/math/_work/bodyside_selftest', exist_ok=True)
for f in glob.glob(u'E:/math/_work/bodyside_selftest/*'):
    os.remove(f)
io.open(u'E:/math/_work/bodyside_selftest/D374-pre.md', 'wb').write(txt.encode('utf-8'))
hits = bd.scan_lines(lines)
for h in hits:
    info.append(u'DECL L%d cited=%s verbatim=%s Q(%d): %s' % (
        h['decl'], h['cited'], h['verbatim'], len(h['q']), h['q']))
    for ln, t, r, d, off in h['cands']:
        info.append(u'  SITE L%d r=%.3f cnt=%d off=%d : %s' % (ln, r, txt.count(d), off, d))
io.open(u'E:/math/_work/bodyside_self_hits.txt', 'wb').write(u'\n'.join(info).encode('utf-8'))
print('selftest decl_hits=%d' % len(hits))
