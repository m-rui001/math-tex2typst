import io, glob, re

p = glob.glob('E:/math/研究笔记/D06-*.md')[0]
raw = io.open(p, encoding='utf-8').read()
L = raw.split('\n')

MAP = {
    'CC': '\\mathbb C',
    'QQ': '\\mathbb Q',
    'ZZ': '\\mathbb Z',
    'ii': '\\mathrm i',
    'lcm': '\\operatorname{lcm}',
}
pat = re.compile('\\\\(' + '|'.join(MAP.keys()) + ')(?![A-Za-z])')

counts = {}
skipped = []
dol_before = raw.count('$')
bt_before = raw.count('`')
for i in range(473, len(L)):
    l = L[i]
    if not pat.search(l):
        continue
    if '`' in l:
        skipped.append((i + 1, l[:80]))
        continue
    def rep(m):
        k = m.group(1)
        counts[k] = counts.get(k, 0) + 1
        return MAP[k]
    L[i] = pat.sub(rep, l)

new = '\n'.join(L)
io.open(p, 'w', encoding='utf-8', newline='\n').write(new)
out = io.open('E:/math/_work/d06_macro_fix.txt', 'w', encoding='utf-8', newline='\n')
out.write('bytes %d -> %d delta=%d\n' % (len(raw.encode('utf-8')), len(new.encode('utf-8')),
        len(new.encode('utf-8')) - len(raw.encode('utf-8'))))
out.write('expand %s\n' % sorted(counts.items()))
out.write('dollar %d -> %d\n' % (dol_before, new.count('$')))
out.write('backtick %d -> %d\n' % (bt_before, new.count('`')))
out.write('CR %d\n' % new.count('\r'))
out.write('lines_with_hit=%d skipped=%d\n' % (sum(counts.values()), len(skipped)))
for s in skipped:
    out.write('SKIP %d %s\n' % s)
rem = pat.search(new)
out.write('residual_after=%s\n' % str(bool(rem)))
out.close()
print(open('E:/math/_work/d06_macro_fix.txt', encoding='utf-8').read().encode('unicode_escape').decode()[:800])
