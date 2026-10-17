import io, glob

D = chr(36)
BT = chr(96)
ROOT = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
CLS = {'quote': 0, 'table': 0, 'list': 0, 'head': 0, 'prose': 0}
prose_rows = []

for p in sorted(glob.glob(ROOT + '/D*.md')):
    L = io.open(p, encoding='utf-8').read().split('\n')
    infence = False
    insp = False
    for i, line in enumerate(L):
        if line.lstrip().startswith(BT * 3):
            infence = not infence
            insp = False
            continue
        if infence:
            continue
        cnt, j = 0, 0
        while j < len(line):
            c = line[j]
            if c == '\\':
                j += 2
                continue
            if c == BT:
                insp = not insp
            elif c == D and not insp:
                cnt += 1
            j += 1
        if cnt % 2 == 0:
            continue
        s = line.lstrip()
        if s.startswith('>'):
            k = 'quote'
        elif s.startswith('|'):
            k = 'table'
        elif s.startswith('#'):
            k = 'head'
        elif s.startswith('- ') or s.startswith('* '):
            k = 'list'
        else:
            k = 'prose'
        CLS[k] += 1
        if k == 'prose':
            prose_rows.append((p.split('\\')[-1].split('-')[0], i + 1, line[:120]))

out = io.open('_work/odd_class.txt', 'w', encoding='utf-8')
out.write('lines=%s\n' % CLS)
out.write('prose_rows=%d\n' % len(prose_rows))
for r in prose_rows:
    out.write('%s|%d|%s\n' % r)
out.close()
print('lines', sum(CLS.values()))
