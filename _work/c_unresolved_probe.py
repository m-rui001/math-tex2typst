# -*- coding: utf-8 -*-
# 未决宏凭据探针：对 _work/c_macro_unresolved.txt 里每个 (稿号, 宏名)，去该稿自己的素材目录找定义行。
# 目的＝分清两族：素材里确有定义（macro_extract 的词法漏了），还是素材根本没有（写手用了宏包，按规格登记不发明）。
import io, os, re, sys, glob, subprocess

sys.stdout.reconfigure(encoding='utf-8')
B = chr(92)
KEY = u'newcommand renewcommand providecommand DeclareMathOperator def let'.split()

rows = []
for line in io.open(u'_work/c_macro_unresolved.txt', encoding='utf-8'):
    if line.strip():
        f = line.rstrip('\n').split('\t')
        rows.append((f[0], f[1].strip()))


def material(cid):
    out = subprocess.run(u'python _work/ccheck.py %s' % cid, shell=True, capture_output=True,
                         text=True, encoding='utf-8', errors='replace')
    m = re.search(r'material=(\S+)', (out.stdout or '') + (out.stderr or ''))
    return m.group(1) if m else None


cache = {}
for cid, name in sorted(set(rows)):
    if cid not in cache:
        cache[cid] = material(cid)
    d = cache[cid]
    if not d or not os.path.isdir(d):
        print(u'%s %s  素材目录未知(%s)' % (cid, name, d))
        continue
    hit = None
    for f in sorted(glob.glob(os.path.join(d, '*.tex'))):
        for i, l in enumerate(io.open(f, encoding='utf-8', errors='replace'), 1):
            if (B + name) not in l:
                continue
            if any(k in l for k in KEY) and re.search(u'[{|]' + B + name + u'\\b', l):
                hit = u'%s:%d  %s' % (os.path.basename(f), i, l.strip()[:170])
                break
        if hit:
            break
    print(u'%s %s  %s' % (cid, name, hit or u'素材无定义'))
