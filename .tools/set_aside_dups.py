import glob, os, re, shutil, sys, time

# Set aside the abandoned drafts left by a dispatch wave whose agents died, so
# that --collect measures the single live note per queue row. A draft counts as
# abandoned when it is a duplicate id, has no five-column ledger header, and has
# not been touched since the wave restart cutoff given on the command line
# (HH:MM local). Usage: set_aside_dups.py 18:30 [apply]
cutoff_hhmm = sys.argv[1] if len(sys.argv) > 1 else '18:30'
apply = 'apply' in sys.argv[2:]
now = time.localtime()
smaller = cutoff_hhmm == 'smaller'
if not smaller:
    hh, mm = (int(x) for x in cutoff_hhmm.split(':'))
    cutoff = time.mktime((now.tm_year, now.tm_mon, now.tm_mday, hh, mm, 0, 0, 0, -1))
HDR = '| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 |'

by_id = {}
for path in glob.glob('E:\\math\\\u7814\u7a76\u7b14\u8bb0\\D*.md'):
    m = re.match(r'D(\d{3})-', os.path.basename(path))
    if m:
        by_id.setdefault(m.group(1), []).append(path)

dest = 'E:\\math\\_work\\dup-abandoned-2026-10-10'
if apply:
    os.makedirs(dest, exist_ok=True)

moved = 0
for k in sorted(by_id, key=int):
    ps = by_id[k]
    if len(ps) < 2:
        continue
    if smaller:
        ranked = sorted(ps, key=lambda q: -os.path.getsize(q))
        keep, gone = ranked[:1], ranked[1:]
    else:
        keep = [p for p in ps if os.path.getmtime(p) > cutoff]
        gone = [p for p in ps if os.path.getmtime(p) <= cutoff]
    if not keep or len(gone) + len(keep) != len(ps):
        print('SKIP D%s ambiguous keep=%d old=%d' % (k, len(keep), len(gone)))
        continue
    for p in gone:
        t = open(p, encoding='utf-8', errors='replace').read()
        if t.count(HDR):
            print('SKIP D%s old file has ledger: %s' % (k, os.path.basename(p)[:40].encode('unicode_escape').decode()))
            continue
        print('D%s move %8d %s   keep %s' % (k, os.path.getsize(p), os.path.basename(p)[:38].encode('unicode_escape').decode(), os.path.basename(keep[0])[:38].encode('unicode_escape').decode()))
        if apply:
            shutil.move(p, os.path.join(dest, os.path.basename(p)))
        moved += 1
print('cutoff=%s moved=%d applied=%s' % (cutoff_hhmm, moved, apply))
