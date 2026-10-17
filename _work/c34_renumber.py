# -*- coding: utf-8 -*-
# C34 节号重排（补记改号族）：正文里 3 枚 § 引用全指素材的节（「全文 2 节」是原文的节数、`main.tex:137-140` 那句引原文），
# 本篇没有自指小节号，所以按物理次序把标题行重编就是安全的那一形。
import io, re, sys, glob

sys.stdout.reconfigure(encoding='utf-8')
cid = u'C34'
p = glob.glob(u'被引笔记/%s-*.md' % cid)[0]
raw = io.open(p, 'rb').read()
assert b'\r' not in raw, '盘上带 CR'
text = raw.decode('utf-8')
HEAD = re.compile(u'(?m)^## (\\d+)(?= |$)')
old = [int(m.group(1)) for m in HEAD.finditer(text)]
new = list(range(len(old)))
print(u'重编前 %s' % old)
print(u'重编后 0..%d 共 %d 节' % (len(new) - 1, len(new)))

# 逐处替换：按出现次序给每个命中的位置发一个新号，避免「先改小的把后面的吃掉」
pos = [(m.start(1), m.end(1)) for m in HEAD.finditer(text)]
out, last = [], 0
for i, (a, b) in enumerate(pos):
    out.append(text[last:a])
    out.append(str(new[i]))
    last = b
out.append(text[last:])
res = u''.join(out)

assert res.count(u'$') == text.count(u'$') and res.count(u'`') == text.count(u'`'), '定界符被改动'
assert res.count(u'\n') == text.count(u'\n'), '行数被改动'
after = [int(m.group(1)) for m in HEAD.finditer(res)]
assert after == new, '重排后节号 %s' % after
seam = [l for l in res.split(u'\n') if l.startswith(u'## ')][-1]
assert u'与本语料的接缝' in seam, '末节不是接缝：%s' % seam
if '--apply' in sys.argv:
    io.open(p, 'wb').write(res.encode('utf-8'))
    print(u'APPLIED bytes=%d delta=%+d' % (len(res.encode('utf-8')), len(res.encode('utf-8')) - len(raw)))
else:
    print(u'DRY（未落盘）')
