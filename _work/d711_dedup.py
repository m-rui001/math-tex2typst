# -*- coding: utf-8 -*-
"""D711：删除追加批整块重复落盘的第二份 §21 至 §23，并把第二份里唯一一条
第一份没有的可核对式子登记进文末新的一节。"""
import io, os, re, sys
sys.stdout.reconfigure(encoding='utf-8')

BASE = u'研究笔记'
ID = u'D711'
S2, E2 = 1605, 1825          # 第二份的行段（1-based，E2 是下一节标题所在行）
S1 = 1113                    # 第一份起始行，仅用于核对
f = [x for x in os.listdir(BASE) if x.startswith(ID + u'-') and x.endswith(u'.md')][0]
p = os.path.join(BASE, f)
raw = io.open(p, encoding='utf-8', newline='').read()
L = raw.split('\n')
assert L[S2 - 1].startswith(u'## \u00a721'), L[S2 - 1][:40]
assert L[S1 - 1].startswith(u'## \u00a721'), L[S1 - 1][:40]
B = L[S2 - 1:E2 - 1]
assert L[E2 - 1].startswith(u'## \u00a729'), L[E2 - 1][:40]
uniq = [l for l in B if u'\\kappa_{q}\\|\\varphi\\|_{L^{1}}' in l]
print('unique_math_lines_from_B', len(uniq))
print('del_bytes', len('\n'.join(B).encode('utf-8')))

tail_num = max(int(m.group(1)) for l in L for m in [re.match(u'^## *\u00a7(\\d+)', l) if l.startswith(u'## ') else None] if m)
new_sec = tail_num + 1
reg = [u'',
       u'## \u00a7%d 重复块差异登记' % new_sec,
       u'',
       u'追加批在第 28 节与第 29 节之间，把第 21 至 23 节整块重复落盘了一遍。两份相差 5 字节，逐行比对只有 8 处措辞差异，其中 7 处是同义改写，剩下 1 处在第 23 节末段给了一个与保留稿不同的标量形式。收稿侧按写手自己的申报把后一份整块删除，保留的是第 21 至 23 节在原位的那一份。后一份里唯一一条保留稿没有、且值得复核的式子原样抄录如下，登记位置是删除前的第 1822 行。',
       u'',
       u'> ' + (uniq[0].strip() if uniq else u'（未能定位，登记缺失）'),
       u'',
       u'这条抄录只是差异登记，不代表本体侧判定它比保留稿的写法更对；两处措辞不同的地方一律以保留稿为准，本节不重复抄写其余 7 处。',
       u'']
out_lines = L[:S2 - 1] + L[E2 - 1:-1] + reg + [L[-1] if not L[-1].strip() else u'']
out = '\n'.join(out_lines)
io.open(os.path.join('_work', 'reorder-bak', ID + '.predel.md'), 'w', encoding='utf-8', newline='').write(raw)
io.open(p, 'w', encoding='utf-8', newline='').write(out)
print('old_size', len(raw.encode('utf-8')), 'new_size', len(out.encode('utf-8')))
n = [int(m.group(1)) for l in out.split('\n') for m in [re.match(u'^## *\u00a7(\\d+)', l) if l.startswith(u'## ') else None] if m]
print('headings', len(n), 'seq_ok', n == list(range(len(n))), 'dup', [x for x in set(n) if n.count(x) > 1])
