# -*- coding: utf-8 -*-
"""改法两问：
1) house 形：全库笔记写 smallmatrix 时带不带定界符（`\left(`/`\bigl(`/裸）——12 站改成哪一形要跟主流一致；
2) D49:116 那个矩阵素材到底怎么写（`\mathbf 1` 的反斜杠是丢了，还是素材就有 \mathbf）。
"""
import glob
import io
import json
import os
import re

T = json.load(io.open(u'_work/preamble_tables.json', encoding='utf-8'))

# 1) house 形
pat = re.compile(r'\\begin\{smallmatrix\}')
forms = {}
files_hit = set()
for p in sorted(glob.glob(os.path.join(u'研究笔记', u'D*.md'))):
    t = io.open(p, encoding='utf-8', errors='replace').read()
    for m in pat.finditer(t):
        pre = t[max(0, m.start() - 12):m.start()]
        if re.search(r'\\(left|bigl|Bigl|biggl|Biggl)\(\s*$', pre):
            k = u'LEFT('
        elif re.search(r'[({\[]\s*$', pre):
            k = u'PLAIN-PAREN'
        else:
            k = u'BARE'
        forms[k] = forms.get(k, 0) + 1
        files_hit.add(os.path.basename(p)[:4])
print(u'### smallmatrix 前驱形: %s  files=%d' % (json.dumps(forms, ensure_ascii=False), len(files_hit)))

# 反过来的写法分布：`\left(\begin{smallmatrix}` 总次数
txt_all = 0
for p in glob.glob(os.path.join(u'研究笔记', u'D*.md')):
    s = io.open(p, encoding='utf-8', errors='replace').read()
    txt_all += len(re.findall(r'\\left\(\\begin\{smallmatrix\}', s))
print(u'### \\left(\\begin{smallmatrix} 直连形 = %d' % txt_all)

# 2) D49 素材
for cid in [u'D49', u'D24', u'D47', u'D214']:
    v = T.get(cid)
    if not v:
        print(u'   no preamble row for %s' % cid)
        continue
    d = os.path.join(u'preprints', v[u'dir'])
    print(u'\n### %s  %s' % (cid, v[u'dir'][:70]))
    for root, dirs, files in os.walk(d):
        if u'typst' in root:
            continue
        for fn in sorted(files):
            if not fn.endswith(u'.tex'):
                continue
            fp = os.path.join(root, fn)
            for i, l in enumerate(io.open(fp, encoding='utf-8', errors='replace').read().split(u'\n'), 1):
                if u'smallmatrix' in l or u'mathbf 1' in l or u'mathbf{1}' in l:
                    print(u'   %s:%d  %s' % (fn, i, l.strip()[:170]))
