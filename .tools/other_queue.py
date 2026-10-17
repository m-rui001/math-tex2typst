# -*- coding: utf-8 -*-
# 全库排队：preprints/ 下 build 内有 .tex 的论文目录，减去已有专篇笔记的主对象。
# 专篇判据：笔记正文里第一个命中语料的 preprints/<目录> 提及；无提及则退回头部规整题名唯一匹配。
import io, os, re, glob, sys

srcpat = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._\-]*)')


def norm(s):
    return re.sub(r'[^a-z0-9]', '', s.lower())


def texbytes(d):
    n = 0
    for root, dirs, files in os.walk(os.path.join('preprints', d, 'build')):
        for f in files:
            if f.endswith('.tex'):
                n += os.path.getsize(os.path.join(root, f))
    return n


corpus = sorted(d for d in os.listdir('preprints')
                if os.path.isdir(os.path.join('preprints', d)) and texbytes(d) > 0)
corpus_set = set(corpus)

notes = {}
for p in glob.glob(u'研究笔记/*.md'):
    b = os.path.basename(p)
    if not re.match(r'^(D\d+|\d{3})-', b):
        continue
    key = b.split(u'-')[0]
    notes[key] = p

tnorm = dict((d, norm(d.replace('-', ' '))) for d in corpus)
owners = {}
for k in sorted(notes):
    t = io.open(notes[k], encoding='utf-8', errors='replace').read()
    ln = None
    for m in srcpat.findall(t):
        if m in corpus_set:
            ln = m
            break
    if ln is None:
        head = norm(t[:3000])
        cands = [d for d in corpus if tnorm[d] and tnorm[d] in head]
        if len(cands) == 1:
            ln = cands[0]
    owners[k] = ln

covered = set(v for v in owners.values() if v)
gap = [d for d in corpus if d not in covered]
# 行号一旦派单就被笔记 §0 引用，必须冻结：默认不覆盖 other_queue.txt，新差集写 .new 文件。
frozen = os.path.exists('.tools/other_queue.txt') and '--regen' not in sys.argv
target = '.tools/other_queue.new.txt' if frozen else '.tools/other_queue.txt'
out = io.open(target, 'w', encoding='utf-8')
for i, d in enumerate(gap):
    out.write('%-4d %-95s %8d\n' % (i + 1, d, texbytes(d)))
out.close()
stat = ('corpus=%d notes=%d covered=%d gap=%d unowned-notes=%d\n'
        % (len(corpus), len(owners), len(covered), len(gap),
           len([k for k in owners if owners[k] is None])))
io.open('.tools/other_stat.txt', 'w', encoding='utf-8').write(stat)
print(stat.strip())
print('UNOWNED %s' % ','.join(sorted(k for k in owners if owners[k] is None)))
print('dup-owners:')
seen = {}
for k, v in owners.items():
    if v:
        seen.setdefault(v, []).append(k)
for d, ks in sorted(seen.items()):
    if len(ks) > 1:
        print('  %s <- %s' % (d[:60], ','.join(sorted(ks))))
