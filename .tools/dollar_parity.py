import io, glob, sys
p = [x for x in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/' + sys.argv[1] + '*') if x.endswith('.md')][0]
t = io.open(p, encoding='utf-8').read()
fence = 0
odd = []
for i, l in enumerate(t.split('\n'), 1):
    if l.lstrip().startswith('```'):
        fence ^= 1
        continue
    if fence:
        continue
    n = l.count('$')
    if n % 2:
        odd.append((i, n))
print(p.encode('unicode_escape')[:60].decode(), 'total$', t.count('$'), 'odd_lines', len(odd))
for i, n in odd:
    print(i, n)
