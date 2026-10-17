# -*- coding: utf-8 -*-
r"""`Undefined control sequence` 一族的人口尺：`python _work/undef_census.py <sites.jsonl>`。

台账里 `errClass=null` 的那 60 站全是这一条报错（`err_face.js "Undefined"` 筛出 60 站／37 篇），
而量具把**未定义的那个控制字**记在 `tok` 格里。本尺按控制字分组计数，报「这个名字值几站几篇」，
再按名字能否归进四类定性：
- **素材宏未进宏表**（Lean 风格 `\closedball`／`\ball`，或论文 preamble 的 `\newcommand`）⇒ 按素材逐字展开（腿 #12 那条链）；
- **笔记自造缩写**（`\Ec`＝`\mathbb E c`，同一行就有合法形）⇒ 回改合法形；
- **控制字丢尾字母**（`\per` 少一枚 `p`，宏表里 `\per` 另有定义＝报错名是红鲱鱼，腿 #60 的 D108 那一形）；
- **词法粘连**（`\tabalign` 这种两个名字缝在一起，见 [[note-control-word-letter-fusions]]）。
分组只是**候选定性**，每一组仍要逐站读素材；本尺不判对错，只报人口。
"""
import collections
import io
import json
import sys

rows = [json.loads(s) for s in io.open(sys.argv[1], encoding=u'utf-8').read().split(u'\n') if s.strip()]
nulls = [r for r in rows if r[u'errClass'] is None]
byname = collections.defaultdict(list)
for r in nulls:
    byname[r[u'tok']].append(r)
print(u'台账行=%d  errClass=null=%d  名字种数=%d' % (len(rows), len(nulls), len(byname)))
for name, rs in sorted(byname.items(), key=lambda kv: (-len(kv[1]), kv[0])):
    files = sorted(set(r[u'file'][:4] for r in rs))
    print(u'%-22s 站=%-3d 篇=%-3d %s' % (name, len(rs), len(files), u' '.join(files)[:78]))
