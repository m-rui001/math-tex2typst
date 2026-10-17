import os, re, glob, io

def norm(s):
    s = s.lower()
    s = re.sub(r'[^a-z0-9 ]+', ' ', s)
    return re.sub(r'\s+', ' ', s).strip()

queue = [l.strip() for l in io.open(r'.tools/lean_queue.txt', encoding='utf-8') if l.strip()]
qdirs = [q.split('/')[0] for q in queue]
qstems = [re.sub(r'-September-\d+-20\d\d$', '', d) for d in qdirs]
qtitles = [norm(s.replace('-', ' ')) for s in qstems]

srcpat = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._\-]*)')
declpat = re.compile(r'队列[^\n]{0,8}?行号[^\d]{0,4}(\d{1,3})')

note_txt, note_src, note_decl = {}, {}, {}
for p in glob.glob(os.path.join('研究笔记', 'D*.md')):
    b = os.path.basename(p)
    t = io.open(p, encoding='utf-8', errors='replace').read()
    note_txt[b] = norm(t)
    ms = srcpat.findall(t)
    note_src[b] = list({re.sub(r'-September-\d+-20\d\d$', '', m) for m in ms})
    note_decl[b] = sorted({int(m) for m in declpat.findall(t[:5000])})

out = io.open('.tools/dir_audit.txt', 'w', encoding='utf-8')
miss = []
for i in range(1, len(queue) + 1):
    idx = i - 1
    ev = {}
    ev['title'] = [b for b, t in note_txt.items() if qtitles[idx] and qtitles[idx] in t]
    ev['dir'] = [b for b, s in note_src.items() if qstems[idx] in s]
    ev['decl'] = [b for b, d in note_decl.items() if i in d]
    allh = sorted(set(ev['title']) | set(ev['dir']) | set(ev['decl']))
    if not allh:
        miss.append(i)
        out.write('MISS %3d | %s\n' % (i, queue[idx]))
    else:
        kinds = '+'.join(k for k in ('title', 'dir', 'decl') if ev[k])
        out.write('OK   %3d | %-70s | %s [%s]\n' % (i, queue[idx][:70], ','.join(allh)[:90], kinds))
out.write('\nOK %d / MISS %d / TOTAL %d / NOTES %d\n' % (len(queue) - len(miss), len(miss), len(queue), len(note_txt)))
out.close()
print('ok=%d miss=%d notes=%d' % (len(queue) - len(miss), len(miss), len(note_txt)))
