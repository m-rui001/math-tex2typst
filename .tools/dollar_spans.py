import io, glob, sys
ID = sys.argv[1]
p = [x for x in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/' + ID + '*') if x.endswith('.md')][0]
t = io.open(p, encoding='utf-8').read()
idx = [i for i, c in enumerate(t) if c == u'$']
bad = 0
for a, b in zip(idx[::2], idx[1::2]):
    seg = t[a:b + 1]
    if u'\n\n' in seg or len(seg) > 400:
        bad += 1
        ln = t[:a].count(u'\n') + 1
        print('SPAN', ln, len(seg), t[max(0, a - 30):a + 34].encode('unicode_escape').decode()[:150])
print('odd_tokens', len(idx) % 2, 'cross_para_spans', bad)
