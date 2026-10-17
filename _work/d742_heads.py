# -*- coding: utf-8 -*-
# 修 D742 的 4 处「标题落进行内、上一节末句被锚点吃掉」缺陷。
# 作者已在 §20 第七类逐字给出被吃掉的四个句子，这里只做插入：
# 在四处行尾的标题串前补回该句，并把标题串切成独立一行。
import io
import re
import sys
import os

sys.stdout.reconfigure(encoding="utf-8")
B = chr(92)
P = u"研究笔记/D742-结构系数能隙与平面XY模型临界关联指数1-4.md"
SEC = B + u"u00a7"

raw = io.open(P, encoding="utf-8").read()
lines = raw.split(u"\n")

decl_idx = None
for i, l in enumerate(lines):
    if l.find(u"第七类，标题落在行内") >= 0:
        decl_idx = i
assert decl_idx is not None
decl = lines[decl_idx]
segs = decl.split(u"逐字为：")
sents = []
for seg in segs[1:]:
    assert seg.startswith(u'"')
    seg = seg[1:]
    cut = seg.find(u'"' + u"第 2")
    sent = seg[:cut] if cut >= 0 else seg[: seg.rfind(u'"')]
    sents.append(sent)
assert len(sents) == 4, len(sents)

# 标题行内位置 -> 应补回的句子
targets = []
for i, l in enumerate(lines):
    if l.startswith(u"## "):
        continue
    m = re.search(u"## (" + SEC + u"? *)(\\d+)", l)
    if m is None:
        continue
    targets.append((i, int(m.group(2)), m.start()))
targets.sort(key=lambda t: t[1])
assert [t[1] for t in targets] == [7, 11, 13, 16], [t[1] for t in targets]
assert len(targets) == 4

out = list(lines)
for (i, num, pos), sent in zip(targets, sents):
    l = out[i]
    assert l[pos:].startswith(u"## ")
    body = l[:pos]
    assert body.endswith(u"。"), repr(body[-8:])
    out[i] = body + sent + u"\n\n" + l[pos:]

new = u"\n".join(out)
final = new.split(u"\n")

# 复验：只做插入，删掉四句并把四行重新并回去必须逐字还原原档
check = list(out)
for (i, num, pos), sent in sorted(zip(targets, sents)):
    l = check[i]
    head = l[: pos + len(sent)]
    assert head.endswith(sent), (num, repr(head[-len(sent) - 8:]))
    rest = l[pos + len(sent):]
    assert rest.startswith(u"\n\n## ")
    check[i] = l[:pos] + rest[2:]
assert u"\n".join(check) == raw, "reversal mismatch"

h2 = [l for l in final if l.startswith(u"## ")]
nums = [int(re.match(u"## " + SEC + u"? *(\\d+)", l).group(1)) for l in h2
        if re.match(u"## " + SEC + u"? *(\\d+)", l)]
assert nums == sorted(nums) == list(range(len(nums))), nums
assert len(set(nums)) == len(nums)

if u"--apply" in sys.argv:
    bak = u"_work/reorder-bak/D742.pre-headsplit.md"
    d = os.path.dirname(bak)
    if d and not os.path.isdir(d):
        os.makedirs(d)
    io.open(bak, "w", encoding="utf-8", newline=u"\n").write(raw)
    io.open(P, "w", encoding="utf-8", newline=u"\n").write(new)
    print("APPLIED size %d -> %d headings=%d" % (len(raw.encode("utf-8")),
          len(new.encode("utf-8")), len(nums)))
else:
    print("DRY size %d -> %d seq=%s" % (len(raw.encode("utf-8")),
          len(new.encode("utf-8")), nums))
