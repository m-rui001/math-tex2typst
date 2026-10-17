import io, sys, glob, os, time
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
NL = chr(10)

rank = io.open(u'_work/nextwave_rank.txt', encoding='utf-8', errors='replace').read().split(NL)
print('rank top lines:')
print(NL.join(rank[:5]))

rerun = u'_work/deep_params_0626.txt'
if os.path.exists(rerun):
    d = io.open(rerun, encoding='utf-8', errors='replace').read()
    print('rerun bytes', len(d.encode('utf-8')), 'blocks', d.count('D'))
    print(NL.join(d.split(NL)[:5]))
else:
    print('no rerun file')

for nid in ['D463', 'D529', 'D769', 'D84', 'D233', 'D66', 'D278']:
    c = glob.glob(u'研究笔记/' + nid + u'-*.md')
    if not c:
        print(nid, 'NOFILE')
        continue
    raw = io.open(c[0], 'rb').read()
    heads = raw.count(NL.encode() + b'## ')
    lf = raw.count(NL.encode())
    cr = raw.count(chr(13).encode())
    print('%s bytes=%d lines=%d cr=%d heads=%d mtime=%s' % (
        nid, len(raw), lf, cr, heads,
        time.strftime('%H:%M', time.localtime(os.path.getmtime(c[0])))))
