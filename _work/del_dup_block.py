# -*- coding: utf-8 -*-
"""删除整块重复落盘：先逐字节比对两段，相等才删第二段。
用法: python _work/del_dup_block.py ID START1 END1 START2 END2 --apply   (行号为 1-based，含端点前一行的下一行=不含)
"""
import io, os, sys

BASE = u'研究笔记'
args = [a for a in sys.argv[1:] if a != '--apply']
apply = '--apply' in sys.argv
i, s1, e1, s2, e2 = args[0], int(args[1]), int(args[2]), int(args[3]), int(args[4])
f = [x for x in os.listdir(BASE) if x.startswith(i + u'-') and x.endswith(u'.md')][0]
p = os.path.join(BASE, f)
raw = io.open(p, encoding='utf-8', newline='').read()
L = raw.split('\n')
a = L[s1 - 1:e1 - 1]
b = L[s2 - 1:e2 - 1]
ba = '\n'.join(a).encode('utf-8')
bb = '\n'.join(b).encode('utf-8')
print(i, 'A=%d..%d %dB' % (s1, e1, len(ba)), 'B=%d..%d %dB' % (s2, e2, len(bb)), 'identical=%s' % (ba == bb))
if ba != bb:
    # 打印第一处差异
    for k in range(min(len(a), len(b))):
        if a[k] != b[k]:
            print('first diff at +%d lines:' % k, repr(a[k][:60]), '||', repr(b[k][:60]))
            break
    sys.exit(1)
if apply:
    bak = os.path.join('_work', 'reorder-bak', i + '.predel.md')
    io.open(bak, 'w', encoding='utf-8', newline='').write(raw)
    new = L[:s2 - 1] + L[e2 - 1:]
    out = '\n'.join(new)
    io.open(p, 'w', encoding='utf-8', newline='').write(out)
    print('DELETED %dB -> new size %d, backup=%s' % (len(bb), len(out.encode('utf-8')), bak))
