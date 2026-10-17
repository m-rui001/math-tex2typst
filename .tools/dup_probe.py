import glob, sys, os

ids = sys.argv[1:]
for i in ids:
    hits = []
    for p in glob.glob(os.path.join('E:\\math', '*', i + '-*.md')):
        txt = open(p, encoding='utf-8').read()
        lines = txt.split('\n')
        seen = {}
        for n, l in enumerate(lines):
            s = l.strip()
            if len(s) < 60 or s.startswith('#') or s.startswith('|') or s.startswith('>'):
                continue
            seen.setdefault(s, []).append(n + 1)
        for s, ns in seen.items():
            if len(ns) > 1:
                hits.append((ns, s[:70].encode('unicode_escape').decode()))
    print(i, 'dup_lines=%d' % len(hits))
    for ns, s in hits:
        print('   ', ns, s)
