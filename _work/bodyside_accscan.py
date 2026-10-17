# -*- coding: utf-8 -*-
# Broad scan D001-D399: any note with an anchor-accident self-audit section,
# with or without 本体侧 nearby. Dumps the accident section text.
import io, os, re, glob

BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
ACC = u'\u4e8b\u6545'          # 事故
ANC = u'\u951a\u70b9'          # 锚点
HEAD = re.compile(u'^#{2,4}\\s')

def idnum(name):
    m = re.match(u'^D([0-9]+)', name)
    return int(m.group(1)) if m else None

out = []
cnt = 0
for p in sorted(glob.glob(os.path.join(BASE, 'D*.md'))):
    n = idnum(os.path.basename(p))
    if n is None or n < 1 or n > 399:
        continue
    lines = io.open(p, 'rb').read().decode('utf-8').split(u'\n')
    starts = [i for i, l in enumerate(lines) if HEAD.match(l) and (ACC in l or ANC in l)]
    hits = [i for i, l in enumerate(lines) if ACC in l or ANC in l]
    if not starts and not hits:
        continue
    cnt += 1
    out.append(u'###### D%03d %s head_starts=%s any_lines=%s' % (
        n, os.path.basename(p), starts, hits[:40]))
io.open(u'E:/math/_work/bodyside_acc_notes.txt', 'wb').write(u'\n'.join(out).encode('utf-8'))
print('notes_with_acc_or_anc=%d' % cnt)
