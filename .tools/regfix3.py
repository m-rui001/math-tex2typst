# -*- coding: utf-8 -*-
# 按"笔记 §0 自报的 preprints 目录"反查队列行号，只补登记行号，不动题名映射。
# 用法: python .tools/regfix3.py [--apply]
import io, re, glob, os, sys

APPLY = '--apply' in sys.argv
queue = [l.strip() for l in io.open(u'.tools/lean_queue.txt', encoding='utf-8').read().split('\n') if l.strip()]
qdirs = [x.split('/')[0] for x in queue]
stem2line = {}
for i, d in enumerate(qdirs):
    stem2line.setdefault(re.sub(r'-September-\d+-20\d\d$', '', d), []).append(i + 1)

srcpat = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._\-]*)')
post = re.compile(u'\u961f\u5217[^\n]{0,8}?\u884c\u53f7?[^0-9\n]{0,4}(\\d{1,3})')
pre = re.compile(u'\u961f\u5217[^0-9\n]{0,6}(\\d{1,3})[^0-9\n]{0,2}\u884c')
H0 = re.compile(u'^## (\u00a7)?0[ .\u3000\u4e00-\u9fff]')
ONLY = sys.argv[1:] if len(sys.argv) > 1 and not sys.argv[1].startswith('--') else None

todo = []
for p in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md'):
    b = os.path.basename(p)
    key = b.split(u'-')[0]
    if ONLY and key not in ONLY:
        continue
    t = io.open(p, encoding='utf-8', errors='strict').read()
    head = t[:6000]
    lines = []
    for m in srcpat.findall(head):
        st = re.sub(r'-September-\d+-20\d\d$', '', m)
        hit = stem2line.get(st, [])
        if len(hit) == 1:
            lines.append((hit[0], m))
    if not lines:
        print('NODIR %s' % key)
        continue
    nums = {n for n, _ in lines}
    if len(nums) > 1:
        print('AMBIGDIR %s %s' % (key, sorted(nums)))
        continue
    n, d = lines[0]
    stated = {int(x) for x in post.findall(t)} | {int(x) for x in pre.findall(t)}
    already = (u'\u672c\u884c\u53ea\u8865\u767b\u8bb0\uff1a' in t
               or u'\u672c\u7b14\u6ce8\u53d9\u4e8b\u5bf9\u5e94\u7684\u8bba\u6587\u76ee\u5f55\u4e3a' in t)
    if n in stated or already:
        print('HAS %s L%d' % (key, n))
        continue
    todo.append((key, p, t, n, d))

for key, p, t, n, d in sorted(todo):
    lines = t.split('\n')
    h0 = [i for i, l in enumerate(lines) if H0.match(l)]
    h1 = [i for i, l in enumerate(lines) if l.startswith(u'# ')]
    anchor = h0[0] if h0 else (h1[0] if h1 else 0)
    end = anchor + 1
    while end < len(lines) and not lines[end].startswith(u'## '):
        end += 1
    ins = end - 1
    while ins > anchor and not lines[ins].strip():
        ins -= 1
    note = (u'\u672c\u884c\u53ea\u8865\u767b\u8bb0\uff1a\u672c\u7b14\u8bbd\u4e8b\u7684\u8bba\u6587\u76ee\u5f55\u4e3a preprints/%s'
            u'\uff0c\u5728 .tools/lean_queue.txt \u961f\u5217\u7b2c %d \u884c\u53f7'
            u'\uff08\u76ee\u5f55\u540d\u7531\u672c\u7b14\u81ea\u5df1\u5728 \u00a70 \u5199\u660e\uff0c\u672c\u884c\u4e0d\u6539\u524d\u6587\uff09\u3002') % (d, n)
    print('REG %s L%-3d' % (key, n))
    if APPLY:
        before = len(t.encode('utf-8'))
        io.open(p, 'w', encoding='utf-8', newline='\n').write(
            '\n'.join(lines[:ins + 1] + [u'', note] + lines[ins + 1:]))
        a = io.open(p, encoding='utf-8', errors='strict').read()
        if len(a.encode('utf-8')) - before != 2 + len(note.encode('utf-8')) or a.count(note) != 1:
            print('VERIFY-FAIL %s' % key)
