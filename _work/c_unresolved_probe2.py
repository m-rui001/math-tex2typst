# -*- coding: utf-8 -*-
# 第二把探针：只要求同一行里既有定义关键词、又有 `\宏名`，不约束它的左右形状。
# （第一把要求 `[{|]\名`，漏掉 `\def\Kol{...}` 这种不带花括号的写法。）
import io, os, re, sys, glob, subprocess

sys.stdout.reconfigure(encoding='utf-8')
B = chr(92)
KEY = u'newcommand renewcommand providecommand DeclareMathOperator DeclarePairedDelimiter def let'.split()
WANT = sys.argv[1:] or [u'C16', u'C32', u'C33']

rows = []
for line in io.open(u'_work/c_macro_unresolved.txt', encoding='utf-8'):
    if line.strip():
        f = line.rstrip('\n').split('\t')
        if f[0] in WANT:
            rows.append((f[0], f[1].strip()))

cache = {}
for cid, name in sorted(set(rows)):
    if cid not in cache:
        out = subprocess.run(u'python _work/ccheck.py %s' % cid, shell=True, capture_output=True,
                             text=True, encoding='utf-8', errors='replace')
        m = re.search(r'material=(\S+)', (out.stdout or '') + (out.stderr or ''))
        cache[cid] = m.group(1) if m else None
    d = cache[cid]
    files = sorted(glob.glob(os.path.join(d, '*.tex'))) + sorted(glob.glob(os.path.join(d, '*.sty')))
    # 登记表里的宏名自带反斜杠，别再补一枚（上一版把它当裸词，全库计数假零）
    cw = name if name.startswith(B) else B + name
    hits = []
    for f in files:
        for i, l in enumerate(io.open(f, encoding='utf-8', errors='replace'), 1):
            if cw in l and any(k in l for k in KEY):
                hits.append(u'%s:%d  %s' % (os.path.basename(f), i, l.strip()[:150]))
    n_any = sum(l.count(cw) for f in files for l in io.open(f, encoding='utf-8', errors='replace'))
    print(u'%s %s  素材内出现=%d  定义形=%s' % (cid, name, n_any, hits[0] if hits else u'无'))
