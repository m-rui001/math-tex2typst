import io, re, glob, os

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
NOTES = os.path.join(ROOT, '研究笔记')
q = [l.strip() for l in io.open(os.path.join(ROOT, '.tools', 'lean_queue.txt'), encoding='utf-8') if l.strip()]
notes = [(os.path.basename(f), io.open(f, encoding='utf-8').read().lower())
         for f in glob.glob(os.path.join(NOTES, 'D*.md'))]
cov = io.open(os.path.join(NOTES, '覆盖映射.md'), encoding='utf-8').read()
opens = [int(m.group(1)) for m in re.finditer(r'(?m)^\s*(\d{1,3})\s*\|\s*tok', cov)]

lines = []
for n in opens:
    d = re.search(r'([A-Za-z0-9][\w\-\.]*)\s*$', q[n - 1])
    d = d.group(1) if d else q[n - 1]
    toks = [t for t in re.split(r'[^a-z]+', d.lower()) if len(t) >= 5][:4]
    hits = [f[:4] for f, t in notes if len(toks) >= 2 and all(x in t for x in toks[:2])]
    sizes = ','.join('%s:%d' % (f[:4], os.path.getsize(os.path.join(NOTES, f))) for f in notes if f[:4] in hits)
    lines.append('%s|%s|%s|%s' % (n, 'TAKEN:' + ','.join(hits) if hits else 'unfired', sizes, d[:52]))

out = '\n'.join(lines) + '\n'
io.open(os.path.join(ROOT, '.tools', 'open_unfired.txt'), 'w', encoding='utf-8').write(out)
print('%d open, %d unfired' % (len(lines), out.count('|unfired|')))
