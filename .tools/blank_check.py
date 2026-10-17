import glob, os, re, sys

HEAD = re.compile('^##\\s*(?:\xa7)?\\s*(\\d+)')
for i in sys.argv[1:]:
    p = glob.glob('E:\\math\\*\\%s-*.md' % i)[0]
    raw = open(p, encoding='utf-8').read()
    L = raw.split('\n')
    bad_pre = [n + 1 for n, l in enumerate(L) if HEAD.match(l) and n > 2 and L[n - 1].strip() != '']
    bad_post = [n + 1 for n, l in enumerate(L) if HEAD.match(l) and n + 1 < len(L) and L[n + 1].strip() != '']
    trip = raw.count('\n\n\n')
    print('%s bytes=%d heads=%d head_no_blank_before=%s head_no_blank_after=%s triple_nl=%d' % (
        i, os.path.getsize(p), sum(1 for l in L if HEAD.match(l)), bad_pre, bad_post, trip))
