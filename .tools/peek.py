# -*- coding: utf-8 -*-
# 打印指定笔记的标题、字节数与自报取材目录，用于复核重复归属与无归属笔记。
import io, glob, os, re

srcpat = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._\-]*)')
for k in ['D67', 'D96', 'D19', 'D127', 'D21', 'D126', 'D12', 'D128', 'D08', 'D113', 'D15']:
    ps = glob.glob(os.path.join(u'\u7814\u7a76\u7b14\u8bb0', k + u'-*.md'))
    if not ps:
        print(k, 'NOFILE')
        continue
    t = io.open(ps[0], encoding='utf-8', errors='replace').read()
    ds = sorted({re.sub(r'-September-\d+-20\d\d$', '', m) for m in srcpat.findall(t)})
    h1 = [l for l in t.split('\n') if l.startswith(u'# ')]
    print('%s size=%d dirs=%s' % (k, len(t.encode('utf-8')), ds[:3]))
    print('   %s' % (h1[0][:70].encode('unicode_escape').decode() if h1 else 'NOH1'))
