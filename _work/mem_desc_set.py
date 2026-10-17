# -*- coding: utf-8 -*-
# 记忆 frontmatter 的 description 一次性重写（不是追加从句——追加会把一行长成小几百字）：
# 用法：python _work/mem_desc_set.py <记忆文件名>=<新 description 正文的 UTF-8 文件> ...
# 正文走文件不走 argv：Windows 控制台是 GBK，argv 里的中文进来就碎。
import io
import os
import sys

BASE = os.path.expanduser(u"~/.qoder-cn/projects/E--math/memory/")
for arg in sys.argv[1:]:
    name, src = arg.split(u"=", 1)
    body = io.open(src, encoding=u"utf-8").read().strip()
    p = os.path.join(BASE, name)
    raw = io.open(p, "rb").read()
    lines = raw.decode(u"utf-8").split(u"\n")
    for i, l in enumerate(lines):
        if l.startswith(u"description:"):
            lines[i] = u"description: " + body
            break
    else:
        raise AssertionError(u"no description in " + name)
    new = u"\n".join(lines).encode(u"utf-8")
    assert b"\r" not in new, name
    io.open(p, "wb").write(new)
    print(u"%s %d -> %d  desc_len=%d" % (name, len(raw), len(new), len(body.encode(u"utf-8"))))
