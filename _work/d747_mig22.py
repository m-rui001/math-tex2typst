# -*- coding: utf-8 -*-
# D747：补回被锚点吞掉的 "## §22 勘误补登" 标题行，并把孤身正文段搬回 §23 之前。
# 标题串与块次序由该稿 §24 逐字申报；此处只做插入与整块搬移，不删任何字节。
import glob
import io
import re
import sys

sys.stdout.reconfigure(encoding="utf-8")
path = glob.glob(u"研究笔记/D747-*.md")[0]
raw = io.open(path, encoding="utf-8").read()
L = raw.split(u"\n")

H = u"## \u00a722 \u52d8\u8bef\u8865\u767b"          # ## §22 勘误补登
i23 = L.index(u"## \u00a723 \u7ec8\u8bb0")            # ## §23 终记
body22 = L[i23 + 4]                                     # 孤身正文段（原第 313 行）
assert L[i23 + 3] == u"" and L[i23 + 5] == u""
assert body22.startswith(u"两笔补登"), body22[:20]
assert L[i23 + 6].startswith(u"## \u00a724"), L[i23 + 6][:20]

new = L[:i23] + [H, u"", body22, u""] + L[i23:i23 + 4] + L[i23 + 6:]

from collections import Counter
assert Counter(new) == Counter(L) + Counter({H: 1, u"": 1}), (
    Counter(new) - Counter(L), Counter(L) - Counter(new))
txt = u"\n".join(new)
assert u"\n\n\n" not in txt and not txt.endswith(u"\n\n")

heads = [l for l in txt.split(u"\n") if l.startswith(u"## ")]
nums = [int(re.match(u"## \u00a7? *(\\d+)", l).group(1)) for l in heads
        if re.match(u"## \u00a7? *(\\d+)", l)]
assert nums == list(range(len(nums))), nums

if u"--apply" in sys.argv:
    io.open(u"_work/D747.pre-mig22.md", "w", encoding="utf-8",
            newline=u"\n").write(raw)
    io.open(path, "w", encoding="utf-8", newline=u"\n").write(txt)
    print("APPLIED %s %d -> %d heads=%d" % (path, len(raw.encode("utf-8")),
          len(txt.encode("utf-8")), len(heads)))
else:
    print("DRY %s %d -> %d seq=%s" % (path, len(raw.encode("utf-8")),
          len(txt.encode("utf-8")), nums))
