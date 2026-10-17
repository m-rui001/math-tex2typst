# -*- coding: utf-8 -*-
# Runner: corpus shortlist via bodyside_detect.scan_lines, with counts.
import io, os, re, glob, sys
sys.path.insert(0, u'E:/math/_work')
import bodyside_detect as bd

BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
out = []
tot = 0
notes = 0
for p in sorted(glob.glob(os.path.join(BASE, 'D*.md'))):
    m = re.match(u'^D([0-9]+)', os.path.basename(p))
    if not m or not (1 <= int(m.group(1)) <= 399):
        continue
    tag = u'D%03d' % int(m.group(1))
    if tag == u'D374':
        continue
    lines = bd.load(p)
    txt = u'\n'.join(lines)
    hits = bd.scan_lines(lines)
    keep = []
    for h in hits:
        far = [v for v in h['verbatim'] if abs(v - h['decl']) > 25]
        if far:
            continue                      # restatement already on disk elsewhere
        keep.append((h, far))
    if keep:
        notes += 1
        tot += len(keep)
        out.append(u'###### %s %s pairs=%d' % (tag, os.path.basename(p), len(keep)))
        for h, far in keep:
            out.append(u' DECL L%d cited=%s verbatim_in_decl_block=%s' % (
                h['decl'], h['cited'], h['verbatim']))
            out.append(u'  Q(%d): %s' % (len(h['q']), h['q']))
            for ln, t, r, d, off in h['cands']:
                out.append(u'  SITE L%d(cited %d) r=%.3f cnt=%d off=%d dlen=%d qlen=%d : %s' % (
                    ln, t, r, txt.count(d), off, len(d), len(h['q']), d))
io.open(u'E:/math/_work/bodyside_short5.txt', 'wb').write(
    (u'\n'.join(out) or u'none').encode('utf-8'))
print('pairs=%d notes=%d' % (tot, notes))
