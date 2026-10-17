# -*- coding: utf-8 -*-
# 主线2 在飞稿的采样器：按间隔打印 size / mtime 静止秒数，用于抓"写完探针就收手"的早退写手。
#   python .tools/fleet_watch.py D621 D617 D627 --every 150 --times 4
import io, os, glob, sys, time

NOTE = u'\u7814\u7a76\u7b14\u8bb0'
args = [a for a in sys.argv[1:] if not a.startswith('--')]
every, times = 150, 4
for a in sys.argv[1:]:
    if a.startswith('--every'):
        every = int(a.split('=')[1])
    if a.startswith('--times'):
        times = int(a.split('=')[1])

first = {}
for n in range(times):
    line = []
    for i in args:
        fs = [x for x in glob.glob(os.path.join(NOTE, i + '-*.md')) if x.endswith('.md')]
        if not fs:
            line.append('%s:NOFILE' % i)
            continue
        s = os.path.getsize(fs[0])
        if i not in first:
            first[i] = s
        line.append('%s:+%d/%ds' % (i, s - first[i], int(time.time() - os.path.getmtime(fs[0]))))
    print(time.strftime('%H:%M:%S') + ' ' + ' '.join(line))
    sys.stdout.flush()
    if n + 1 < times:
        time.sleep(every)
