import os, re, io, collections

base = r'E:/math/lean/OAI/Analysis/Laughlin'
g = collections.defaultdict(collections.Counter)
pat = re.compile(r'^import\s+OAI\.Analysis\.Laughlin(?:\.([A-Za-z0-9_]+))?', re.M)
for root, dirs, files in os.walk(base):
    for f in files:
        if not f.endswith('.lean'):
            continue
        p = os.path.join(root, f)
        s = io.open(p, encoding='utf-8').read()
        here = os.path.relpath(root, base).replace(os.sep, '/')
        if here == '.':
            here = 'ROOT'
        for m in pat.finditer(s):
            top = m.group(1) or 'ROOT'
            if top != here:
                g[here][top] += 1
for k in sorted(g):
    print(k, '->', dict(g[k]))
