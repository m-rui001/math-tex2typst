import glob, os, re, sys

root = 'E:\\math\\\u7814\u7a76\u7b14\u8bb0'
by_id = {}
for path in glob.glob(os.path.join(root, 'D*.md')):
    name = os.path.basename(path)
    m = re.match(r'D(\d{3})-', name)
    if not m:
        continue
    by_id.setdefault(m.group(1), []).append(path)

want = [w.replace('D', '') for w in sys.argv[1:]]
if want:
    # pre-dispatch check: has this id already produced a file on disk?
    for w in sorted(want, key=int):
        ps = by_id.get(w, [])
        if not ps:
            print('D%s NOFILE' % w)
            continue
        for p in ps:
            print('D%s STARTED size=%8d %s' % (w, os.path.getsize(p), os.path.basename(p)[:60].encode('unicode_escape').decode()))
    sys.exit(0)

tot = 0
for k in sorted(by_id, key=int):
    ps = by_id[k]
    if len(ps) < 2:
        continue
    tot += 1
    print('D%s files=%d' % (k, len(ps)))
    for p in sorted(ps, key=lambda q: -os.path.getsize(q)):
        print('   %8d  %s' % (os.path.getsize(p), os.path.basename(p)[:56].encode('unicode_escape').decode()))
print('dup_ids=%d' % tot)
