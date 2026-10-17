# -*- coding: utf-8 -*-
# 补 §0 登记（严格版）：只有当笔记正文里逐字出现该队列条目的英文题名时才登记，
# 每篇至多在 §0 末尾追加一行，不改动任何已落盘句子。
# 用法: python .tools/regfix2.py [--apply]
import io, re, glob, os, sys

APPLY = '--apply' in sys.argv
queue = [l.strip() for l in io.open(u'.tools/lean_queue.txt', encoding='utf-8').read().split('\n') if l.strip()]


def norm(s):
    s = s.lower()
    s = re.sub(r'[^a-z0-9 ]+', ' ', s)
    return re.sub(r'\s+', ' ', s).strip()


qdirs = [x.split('/')[0] for x in queue]
qstems = [re.sub(r'-September-\d+-20\d\d$', '', d) for d in qdirs]
qtitles = [norm(s.replace('-', ' ')) for s in qstems]
srcpat = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._\-]*)')
declpat = re.compile(u'\u961f\u5217[^\n]{0,8}?\u884c[^\u53f7]{0,2}\u53f7?[^\d]{0,4}(\\d{1,3})')
prepat = re.compile(u'\u961f\u5217[^\n]{0,6}?(\\d{1,3})[^0-9\n]{0,3}\u884c\u53f7')
H0 = re.compile(u'^## (\u00a7)?0[ .\u4e00-\u9fff]')

notes = {}
for p in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md'):
    b = os.path.basename(p)
    try:
        notes[b] = io.open(p, encoding='utf-8', errors='strict').read()
    except (UnicodeDecodeError, ValueError):
        print('BADUTF %s' % b.split(u'-')[0])

hit = {}
nmatch = {}
for i, qt in enumerate(qtitles):
    if len(qt) < 12:
        continue
    cand = sorted(b for b, t in notes.items() if qt in norm(t))
    for c in cand:
        nmatch[c] = nmatch.get(c, 0) + 1
    if len(cand) == 1:
        hit.setdefault(cand[0], (i + 1, qdirs[i]))
    elif len(cand) > 1:
        print('AMBIG %3d %s -> %s' % (i + 1, qstems[i][:45], ','.join(x.split(u'-')[0].encode('ascii','replace').decode() for x in cand)))

todo = []
for b, (n, d) in sorted(hit.items()):
    t = notes[b]
    if nmatch.get(b, 0) > 1:
        print('GUARD multi-title %s' % b.split(u'-')[0])
        continue
    cited = {re.sub(r'-September-\d+-20\d\d$', '', m) for m in srcpat.findall(t)}
    stem_d = re.sub(r'-September-\d+-20\d\d$', '', d)
    if cited and stem_d not in cited:
        print('GUARD other-dir %s (%s)' % (b.split(u'-')[0], sorted(cited)[0][:40]))
        continue
    has_dir = d in srcpat.findall(t)
    has_q = n in ({int(m) for m in declpat.findall(t[:6000])}
                  | {int(m) for m in prepat.findall(t[:6000])})
    regline = (u'\u672c\u7b14\u6ce8\u53d9\u4e8b\u5bf9\u5e94\u7684\u8bba\u6587\u76ee\u5f55\u4e3a preprints/%s'
               u'\uff0c\u5728 .tools/lean_queue.txt \u961f\u5217\u7b2c %d \u884c\u53f7'
               u'\uff08\u6309\u9898\u540d\u9010\u5b57\u5339\u914d\u767b\u8bb0\uff0c\u672c\u884c\u53ea\u8865\u767b\u8bb0\u3001'
               u'\u4e0d\u6539\u524d\u6587\uff09\u3002') % (d, n)
    if regline in t:
        continue
    if has_dir and has_q:
        continue
    todo.append((b, n, d, has_dir, has_q, regline))
print('notes=%d titled-match=%d need-reg=%d' % (len(notes), len(hit), len(todo)))

for b, n, d, has_dir, has_q, note in todo:
    p = os.path.join(u'\u7814\u7a76\u7b14\u8bb0', b)
    lines = notes[b].split('\n')
    h0 = [i for i, l in enumerate(lines) if H0.match(l)]
    if not h0:
        # 无 §0 的笔记只有 D120--D125 这一代产物，登记行落在 H1 与首个 ## 之间
        h1 = [i for i, l in enumerate(lines) if l.startswith(u'# ')]
        h0 = [h1[0] if h1 else 0]
    end = h0[0] + 1
    while end < len(lines) and not lines[end].startswith(u'## '):
        end += 1
    ins = end - 1
    while ins > h0[0] and not lines[ins].strip():
        ins -= 1
    print('REG %s L%-3d dir=%s q=%s' % (b.split(u'-')[0], n, has_dir, has_q))
    if APPLY:
        before = len(notes[b].encode('utf-8'))
        new = lines[:ins + 1] + [u'', note] + lines[ins + 1:]
        io.open(p, 'w', encoding='utf-8', newline='\n').write('\n'.join(new))
        after_txt = io.open(p, encoding='utf-8', errors='strict').read()
        after = len(after_txt.encode('utf-8'))
        ok = (after - before == 2 + len(note.encode('utf-8'))
              and after_txt.count(note) == 1
              and len(after_txt.split('\n')) == len(notes[b].split('\n')) + 2)
        if not ok:
            print('VERIFY-FAIL %s before=%d after=%d' % (b.split(u'-')[0], before, after))
