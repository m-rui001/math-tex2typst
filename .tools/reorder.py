import glob, os, re, sys

HEAD = re.compile('^##\\s*(?:\xa7)?\\s*(\\d+)')

ids = [a for a in sys.argv[1:] if not a.startswith('--')]
apply = '--apply' in sys.argv
for i in ids:
    p = glob.glob('E:\\math\\*\\%s-*.md' % i)[0]
    raw = open(p, encoding='utf-8').read()
    L = raw.split('\n')
    cuts = [n for n, l in enumerate(L) if HEAD.match(l)]
    if not cuts or cuts[0] != 2:
        print('%s SKIP preamble-not-line3 first_cut=%s' % (i, cuts[:2]))
        continue
    pre = L[:cuts[0]]
    secs = []
    for k, c in enumerate(cuts):
        end = cuts[k + 1] if k + 1 < len(cuts) else len(L)
        secs.append((int(HEAD.match(L[c]).group(1)), L[c:end]))
    order = [s[0] for s in secs]
    print('%s lines=%d bytes=%d order=%s sorted=%s' % (i, len(L), len(raw.encode()), order, sorted(order)))
    if apply and order != sorted(order):
        new = pre + [l for _, blk in sorted(secs, key=lambda x: x[0]) for l in blk]
        out = '\n'.join(new)
        assert len(new) == len(L), (len(new), len(L))
        assert sorted(out) == sorted('\n'.join(L))
        open(p, 'w', encoding='utf-8', newline='').write(out)
        print('   APPLIED lines=%d bytes=%d' % (len(new), len(out.encode())))
