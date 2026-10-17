# -*- coding: utf-8 -*-
# 主线2 派单前的单一读数：还差几个位、下一批参数是否可用。
#   python .tools/refill.py                       # 档位 3（2026-10-12 从 8 降下），按 inflight 全算在飞
#   python .tools/refill.py --done D485 D494 ...  # 把已交稿（收到完成通知）的号剔除后再算空位
# 只读：不改 dispatched.txt / inflight.txt（记账仍由 pick.py --take 做）。
import io, os, re, sys, glob, time

args = sys.argv[1:]
LEVEL = 3
if args and re.match(r'^\d+$', args[0]):
    LEVEL = int(args[0]); args = args[1:]
done = set()
if '--done' in args:
    done = set(x for x in args[args.index('--done') + 1:] if re.match(r'^D\d+$', x))

Q = '.tools/other_queue.txt'
D = '.tools/dispatched.txt'
F = '.tools/inflight.txt'
NOTE = u'\u7814\u7a76\u7b14\u8bb0'

inflight = sorted(set(io.open(F, encoding='utf-8').read().split()))
busy = [t for t in inflight if t not in done]
taken = set()
if os.path.exists(D):
    for l in io.open(D, encoding='utf-8').read().split('\n'):
        if l.strip():
            taken.add(l.split('\t')[1])

rows = [l.split() for l in io.open(Q, encoding='utf-8').read().split('\n') if l.strip()]
cands = [r for r in rows if r[0] not in taken][:max(0, LEVEL - len(busy))]

reg = {}
pat = re.compile(u'(\\s*\\u5176\\u4ed6)?\\s*\\u961f\\u5217\\u7b2c\\s*(\\d+)\\s*\\u884c\\u53f7')
for p in glob.glob(os.path.join(NOTE, 'D*.md')):
    m = re.match(r'^D\d+', os.path.basename(p))
    if not m:
        continue
    for mm in pat.finditer(io.open(p, encoding='utf-8', errors='ignore').read()):
        reg.setdefault(int(mm.group(2)), m.group(0))

print('level=%d inflight=%d done_declared=%d busy=%d slots=%d'
      % (LEVEL, len(inflight), len(done), len(busy), len(cands)))
for r in cands:
    row, d, b = r[0], r[1], int(r[2])
    clash = reg.get(int(row))
    flag = 'OK' if os.path.isdir(os.path.join('preprints', d)) and not clash \
        else ('NO_DIR' if not os.path.isdir(os.path.join('preprints', d)) else 'ROW_CLASH_' + clash)
    print('  row=%-4s bytes=%-8d %s  [%s]' % (row, b, d, flag))
ids = [int(x[1:]) for x in inflight]
ids += [int(m.group(1)) for l in io.open(D, encoding='utf-8').read().split('\n')
        for m in [re.match(r'^D(\d+)\b', l)] if m]
print('next-id=%d' % (max(ids) + 1))
if done:
    ages = []
    for t in sorted(done):
        fs = [x for x in glob.glob(os.path.join(NOTE, t + '-*.md')) if x.endswith('.md')]
        ages.append('%s:%s' % (t, 'NOFILE' if not fs else '%ds' % (time.time() - os.path.getmtime(fs[0]))))
    print('  已交稿号静止时长:', ' '.join(ages))
