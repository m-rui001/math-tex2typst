import io, glob, re, sys

p = glob.glob('E:/math/研究笔记/D06-*.md')[0]
L = io.open(p, encoding='utf-8').read().split('\n')
pat = re.compile('\\\\(' + '|'.join(['CC', 'QQ', 'ZZ', 'ii', 'lcm']) + ')(?![A-Za-z])')
out = io.open('E:/math/_work/d06_macro_ctx.txt', 'w', encoding='utf-8', newline='\n')
n = 0
for i, l in enumerate(L, 1):
    if i >= 474 and pat.search(l):
        n += 1
        out.write('%d len=%d code=%s | %s\n' % (i, len(l), str(l.count('`')), l[:240]))
out.write('lines_with_hit=%d\n' % n)
out.close()
print('lines_with_hit', n)
