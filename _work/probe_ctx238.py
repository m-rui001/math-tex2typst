import io, re, glob, os

D238 = 'E:/math/研究笔记/D238-平方差自由集的固定幂节省.md'
MAT = glob.glob('E:/math/研究笔记/素材/*pinched*素材*.md') + glob.glob('E:/math/研究笔记/素材/Kähler*素材*.md')

out = io.open('E:/math/_work/probe_ctx238.txt', 'w', encoding='utf-8')
t = io.open(D238, encoding='utf-8').read()
L = t.split('\n')
out.write('==== D238 headings ====\n')
for i, l in enumerate(L, 1):
    if re.match(r'^#{1,3} ', l):
        out.write('  L%-4d| %s\n' % (i, l[:110]))
out.write('\n==== context L735-760 ====\n')
for i in range(734, 761):
    out.write('  L%-4d| %s\n' % (i + 1, L[i][:260]))
out.write('\n==== context L290-302 ====\n')
for i in range(289, 302):
    out.write('  L%-4d| %s\n' % (i + 1, L[i][:260]))

# find the note's section 7 first paragraph mentioning mathcal Z
out.write('\n==== D238 lines with \\mathcal Z ====\n')
for i, l in enumerate(L, 1):
    if '\\mathcal Z' in l or '\\mathcal{Z}' in l:
        out.write('  L%-4d| %s\n' % (i, l[:230]))

out.write('\n==== D30 material file check ====\n')
out.write('material files matched: %s\n' % MAT)
for m in MAT:
    txt = io.open(m, encoding='utf-8', errors='replace').read()
    out.write('--- %s (%d chars)\n' % (os.path.basename(m), len(txt)))
    for pat in [r'E:\\math\\lean\\OAI\\Geometry\\Kahler', r'108 个', r'18,?688']:
        hits = [mm.start() for mm in re.finditer(pat, txt)]
        out.write('   %-40s %d\n' % (pat, len(hits)))
    for mm in list(re.finditer(r'108 个', txt))[:4]:
        s = max(0, mm.start() - 150); e = mm.start() + 120
        out.write('   ctx: %s\n' % txt[s:e].replace('\n', ' / '))
    for mm in list(re.finditer(r'\$E:[^$]*\$', txt))[:6]:
        out.write('   dollar-path: %s\n' % mm.group(0)[:120])
out.close()
print('ok')
