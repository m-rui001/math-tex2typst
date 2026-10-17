# -*- coding: utf-8 -*-
# 只读：(1) 在飞那几份的字节与静置时长；(2) C29 的 \red、C33 的 \wt 在素材 preamble 里的原文定义。
import io, glob, os, time, sys, re
sys.stdout.reconfigure(encoding='utf-8')

for cid in ('C41', 'C42', 'C46', 'C47', 'C48', 'C49', 'C50', 'C51'):
    g = glob.glob(u'被引笔记/%s-*.md' % cid)
    print(cid, [(os.path.basename(x)[:16], os.path.getsize(x), int(time.time() - os.path.getmtime(x))) for x in g])

print('--- 素材里的定义原文')
CMD = re.compile(r'(?:newcommand|renewcommand|providecommand|DeclareMathOperator|def)\s*\{?\\([A-Za-z]+)\}?')
for arx, want in (('1508.07998', 'red'), ('1803.04756', 'wt'), ('2006.11238', 'wt')):
    for f in sorted(glob.glob(u'被引素材/%s*/*.tex' % arx)):
        t = io.open(f, encoding='utf-8', errors='replace').read()
        for m in CMD.finditer(t):
            if m.group(1) == want:
                ln = t[:m.start()].count('\n') + 1
                print(arx, want, os.path.basename(f)[:26], 'L%d' % ln, '|', t[m.start():m.start() + 90].replace('\n', ' '))
