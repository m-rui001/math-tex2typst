# -*- coding: utf-8 -*-
import io, json, os, re, glob

plan = json.load(io.open('_work/cited_plan.json', encoding='utf-8'))
notes = {r['cid']: [n if isinstance(n, str) else n.get('dn') for n in r['notes']] for r in plan}
written = {os.path.basename(p)[:3]: os.path.basename(p)
           for p in glob.glob(u'被引笔记/C*-*.md')}
HEAD = re.compile(u'^## (?:§)?\\d+ 被引文献笔记对照\\s*$', re.M)

cache = {}
def dtext(d):
    if d not in cache:
        fs = glob.glob(u'研究笔记/' + d + u'-*.md')
        cache[d] = io.open(fs[0], encoding='utf-8').read() if fs else None
    return cache[d]

def section(t):
    m = HEAD.search(t)
    if not m:
        return u''
    nxt = re.compile(u'^## ', re.M).search(t, m.end())
    return t[m.start():nxt.start() if nxt else len(t)]

pairs = miss_sec = miss_row = 0
misses = []
bad_path, no_sec_files, no_link = [], set(), set()
for cid, ds in sorted(notes.items()):
    if cid not in written:
        continue
    linked = False
    for d in ds:
        pairs += 1
        t = dtext(d)
        sec = section(t)
        if not sec:
            no_sec_files.add(d); continue
        if cid not in sec:
            miss_row += 1; misses.append((cid, d)); continue
        linked = True
    for d in ds:
        t = dtext(d)
        for m in re.finditer(r'(C\d\d-[^\s|`\)]*?\.md)', section(t or u'')):
            if not os.path.exists(u'被引笔记/' + m.group(1)):
                bad_path.append((d, m.group(1)))
    if not linked:
        no_link.add(cid)

files = [d for d in cache if cache[d] is not None]
have_sec = sum(1 for d in files if section(cache[d]))
print('pairs=%d  已写 C=%d  涉及 D 稿=%d 其中带对照节=%d' % (pairs, len(written), len(files), have_sec))
print('D 稿缺档=%d' % sum(1 for d in cache if cache[d] is None))
print('有节却缺该 C 行=%d %s' % (miss_row, misses))
print('对照行路径盘面无=%d %s' % (len(bad_path), sorted(set(bad_path))[:6]))
print('已写却无 D 稿挂行=%d %s' % (len(no_link), sorted(no_link)))
