# -*- coding: utf-8 -*-
import io, glob, re, os
srcpat = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._\-]*)')
queue = [l.strip() for l in io.open(u'.tools/lean_queue.txt', encoding='utf-8').read().split('\n') if l.strip()]


def norm(s):
    s = s.lower()
    s = re.sub(r'[^a-z0-9 ]+', ' ', s)
    return re.sub(r'\s+', ' ', s).strip()

tgt = ['D143', 'D147', 'D16', 'D20', 'D22', 'D68', 'D85', 'D95']
qdirs = [x.split('/')[0] for x in queue]
qstems = [re.sub(r'-September-\d+-20\d\d$', '', d) for d in qdirs]
qtitles = [norm(s.replace('-', ' ')) for s in qstems]
for b in tgt:
    ps = glob.glob(os.path.join(u'\u7814\u7a76\u7b14\u8bb0', b + u'-*.md'))
    if not ps:
        print(b, 'NOFILE')
        continue
    t = io.open(ps[0], encoding='utf-8', errors='replace').read()
    ds = sorted({re.sub(r'-September-\d+-20\d\d$', '', m) for m in srcpat.findall(t)})
    own = [i + 1 for i, qt in enumerate(qtitles) if len(qt) >= 12 and qt in norm(t)]
    print('%-5s titlematch=%s ownDirs=%s' % (b, own, ds))
