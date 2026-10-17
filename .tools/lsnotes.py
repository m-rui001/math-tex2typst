import glob, os, re, sys, time

root = 'E:\\math\\\u7814\u7a76\u7b14\u8bb0'
pat = sys.argv[1] if len(sys.argv) > 1 else 'D5'
for f in sorted(glob.glob(os.path.join(root, pat + '*.md'))):
    b = os.path.basename(f)
    if not re.match(r'D\d{3}-', b):
        continue
    print('%9d  %s  %s' % (os.path.getsize(f), time.strftime('%m-%d %H:%M', time.localtime(os.path.getmtime(f))), b.encode('unicode_escape').decode()[:96]))
