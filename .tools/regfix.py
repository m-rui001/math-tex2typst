# -*- coding: utf-8 -*-
# 补 §0 登记：只在 §0 末尾追加一行，不改动任何已落盘句子。
# 用法: python .tools/regfix.py [--apply]
import io, re, glob, os, sys
H0P = re.compile(u'^## ('+u'\u00a7'+u')?0')

APPLY = '--apply' in sys.argv
q = [l.strip() for l in io.open(u'.tools/lean_queue.txt', encoding='utf-8').read().split('\n') if l.strip()]
qdirs = [x.split('/')[0] for x in q]
stem = lambda s: re.sub(r'-September-\d+-20\d\d$', '', s)
qstems = [stem(d) for d in qdirs]
idx = {}
for i, d in enumerate(qdirs, 1):
    idx.setdefault(d, i)

srcpat = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._\-]*)')
declpat = re.compile(u'\u961f\u5217[^\n]{0,8}?\u884c\u53f7[^\\d]{0,4}(\\d{1,3})')
# 队列第 NN 行号 / 队列行号 NN / 队列第 NN 行
declpat = re.compile(u'\u961f\u5217[^\n]{0,8}?\u884c[^\u53f7]{0,2}\u53f7?[^\d]{0,4}(\\d{1,3})')

def words(s):
    return set(w for w in re.split(r'[^A-Za-z0-9]+', stem(s).lower()) if len(w) > 3)

for p in sorted(glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md')):
    b = os.path.basename(p)
    k = re.match(r'D\d+', b).group(0)
    t = io.open(p, encoding='utf-8', errors='replace').read()
    dirs = sorted(set(srcpat.findall(t)))
    decls = sorted({int(m) for m in declpat.findall(t[:6000])})
    has_dir = bool(dirs)
    has_q = bool(decls)
    if has_dir and has_q:
        continue
    lines = t.split('\n')
    h0 = [i for i, l in enumerate(lines) if re.match(u'^## (\u00a7)?0[ .\u4e00-\u9fff]', l)]
    if not h0:
        print(k, 'SKIP no §0')
        continue
    end = h0[0] + 1
    while end < len(lines) and not lines[end].startswith(u'## '):
        end += 1
    ins = end - 1
    while ins > h0[0] and not lines[ins].strip():
        ins -= 1
    cand = [x for x in dirs if x in idx]
    if len(set(cand)) == 1:
        n = idx[cand[0]]
        d = qdirs[n - 1]
        note = u'\u672c\u7b14\u6ce8\u53d9\u4e8b\u5bf9\u5e94\u7684\u8bba\u6587\u76ee\u5f55\u4e3a preprints/%s\uff0c\u5728 .tools/lean_queue.txt \u961f\u5217\u7b2c %d \u884c\u53f7\u3002' % (d, n)
    elif len(decls) == 1 and 1 <= decls[0] <= len(qdirs):
        n = decls[0]
        d = qdirs[n - 1]
        ov = len(words(d) & words(t[:4000]))
        if ov < 2:
            print(k, 'SKIP weak title overlap for L%d %s' % (n, d[:40]))
            continue
        note = u'\u672c\u7b14\u6ce8\u53d9\u4e8b\u5bf9\u5e94\u7684\u8bba\u6587\u76ee\u5f55\u4e3a preprints/%s\uff0c\u5373\u961f\u5217\u7b2c %d \u884c\u53f7\u3002' % (d, n)
    else:
        print(k, 'SKIP ambiguous dirs=%s decls=%s' % (dirs[:2], decls[:2]))
        continue
    print(k, 'L%-3d %s' % (n, d[:60]))
    if APPLY:
        new = lines[:ins + 1] + [u'', note] + lines[ins + 1:]
        io.open(p, 'w', encoding='utf-8', newline='\n').write('\n'.join(new))
