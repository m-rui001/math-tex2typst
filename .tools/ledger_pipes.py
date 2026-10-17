import io, glob, sys
p = [x for x in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/' + sys.argv[1] + '*') if x.endswith('.md')][0]
t = io.open(p, encoding='utf-8').read()
L = t.split('\n')
last = max(i for i, l in enumerate(L) if l.startswith(u'| '))
first = min(i for i, l in enumerate(L) if l.startswith(u'| ') and i >= max(0, last - 120))
for i in range(last - 120, len(L)):
    l = L[i]
    if l.startswith(u'| '):
        n = l.count('|')
        if n != 6:
            print('LINE', i + 1, 'pipes', n)
