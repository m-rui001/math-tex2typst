# -*- coding: utf-8 -*-
# 主线2 口径审计：证明"每篇论文"=this 722 个目录，且冻结队列与 Lean 队列恰好不重不漏地覆盖它们。
# 为什么要有这个脚本：完成判据是"每个论文目录都有专篇"，若两条队列本身漏目录或互相重叠，
#   remaining=0 也只代表队列清空，不代表语料写完。
#   python .tools/scope_audit.py
import io, os, re

srcpat = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._\-]*)')


def texbytes(d):
    n = 0
    for root, _dirs, fs in os.walk(os.path.join('preprints', d, 'build')):
        for f in fs:
            if f.endswith('.tex'):
                n += os.path.getsize(os.path.join(root, f))
    return n


corpus = set(d for d in os.listdir('preprints')
             if os.path.isdir(os.path.join('preprints', d)) and texbytes(d) > 0)


def qdirs(path, mode):
    s = set()
    for l in io.open(path, encoding='utf-8').read().split('\n'):
        if not l.strip():
            continue
        p = l.split()
        # lean_queue 每行是目录名，也可能是 `<dir>/<dir>.pdf`；有目录本身就以 `L1-` 开头，
        # 所以只在"原样不在语料"时才剥前缀。
        name = p[0] if mode == 'lean' else p[1]
        if mode == 'lean' and name not in corpus:
            name = re.sub(r'^L\d+-', '', name).split('/')[0]
        s.add(name)
    return s


lean = qdirs('.tools/lean_queue.txt', 'lean')
other = qdirs('.tools/other_queue.txt', 'other')
out = []
out.append(u'corpus=%d lean=%d other=%d' % (len(corpus), len(lean), len(other)))
out.append(u'overlap(lean&other)=%d' % len(lean & other))
out.append(u'in-queue-not-in-corpus=%d' % len((lean | other) - corpus))
miss = corpus - lean - other
out.append(u'corpus-not-in-any-queue=%d' % len(miss))
for d in sorted(miss)[:20]:
    out.append(u'  MISS %s' % d)
# 队列行号唯一性：行号是 §0 登记的坐标系，重复行号会让覆盖判定失真
rows = []
for l in io.open('.tools/other_queue.txt', encoding='utf-8').read().split('\n'):
    if l.strip():
        rows.append(int(l.split()[0]))
dup = [r for r in set(rows) if rows.count(r) > 1]
out.append(u'other-rows=%d unique=%d dup=%s dir-unique=%s'
           % (len(rows), len(set(rows)), dup or u'-',
              len(set(qdirs('.tools/other_queue.txt', 'other'))) == len(rows)))
io.open('.tools/scope_audit.txt', 'w', encoding='utf-8').write(u'\n'.join(out) + u'\n')
import sys
sys.stdout.buffer.write((u'\n'.join(out) + u'\n').encode('utf-8'))
