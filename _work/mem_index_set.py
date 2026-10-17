# -*- coding: utf-8 -*-
# 记忆索引 MEMORY.md 的单行钩子改写：只认整行前缀匹配，落盘走二进制，CR 必须为零。
# 用法：python _work/mem_index_set.py <条目链接文件名> <新钩子（UTF-8 文件路径）>
import io
import os
import sys

BASE = os.path.expanduser(u"~/.qoder-cn/projects/E--math/memory/")
name, src = sys.argv[1], sys.argv[2]
hook = io.open(src, encoding=u"utf-8").read().strip()
p = os.path.join(BASE, u"MEMORY.md")
raw = io.open(p, "rb").read()
assert b"\r" not in raw, u"index has CR: fix it first"
lines = raw.decode(u"utf-8").split(u"\n")
needle = u"](" + name + u")"
hit = 0
for i, l in enumerate(lines):
    if l.startswith(u"- ") and needle in l:
        head = l[:l.index(needle) + len(needle)]
        lines[i] = head + u" — " + hook
        hit += 1
assert hit == 1, u"index matches=%d for %s" % (hit, name)
new = u"\n".join(lines).encode(u"utf-8")
assert b"\r" not in new
io.open(p, "wb").write(new)
print(u"MEMORY.md %d -> %d  entries_touched=%d" % (len(raw), len(new), hit))
