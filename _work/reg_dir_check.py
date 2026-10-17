# -*- coding: utf-8 -*-
# 派单前查重：这些笔记各自 §0 登记的是哪个 preprints 目录。
import glob
import io
import re
import sys

sys.stdout.reconfigure(encoding="utf-8")
PAT = re.compile(u"preprints[/\\\\]+([A-Za-z0-9][A-Za-z0-9._\\-]*)")
for k in sys.argv[1:]:
    for p in glob.glob(u"研究笔记/%s-*.md" % k):
        t = io.open(p, encoding="utf-8", errors="replace").read()
        head = sorted(set(PAT.findall(t[:3000])))
        print(k, "head:", [d[:62] for d in head])
