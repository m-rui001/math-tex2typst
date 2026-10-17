# -*- coding: utf-8 -*-
"""Append the numbering re-measurement item to 队列台账.md, keeping CRLF endings."""
from __future__ import unicode_literals
import io, os

P = u'E:/math/' + u'研究笔记/' + u'队列台账.md'
ITEM = [
    u'9. 整理序号复量（2026-10-14，宏族通改之后再量一次）。坐标族：`_work/selfref_census2.py` 读数 '
    u'与通改前**逐字相同**（`src=1169 selfword=249 bare_in=3692 bare_eof=544 files_with_bare_eof=206`），'
    u'这不是巧合——每一刀的护门都要求行数与 `$` 数不变，跨度几何因此恒等，故 491 篇改写挪不动任何一枚 '
    u'「第 N 行」。节号族：`_work/gap_census2.py` 报 `files=734 with_gaps=5`，五份逐份读原文后四份是'
    u'**作者自己申报过的缺号，按律不搬正**——D244 第 191 行写着「小节物理顺序为 0,1,2,3,4,7,8,5,6,9,10,13,…,21」'
    u'并把 11、12 明让；D569 第 267、289 行自陈「原 §27（勘误附录，三笔补记）连同其标题在本会话倒数第二次'
    u'追加中被我误删」与第二起误删（§14），属正文真丢、要补写而非补号；D643 第 416 行「唯一缺号是 §9，成因…」；'
    u'D227 的 §27–§30 是作者用 §61–§64 四节「本节补回曾缺失的 §27」重排补回，旧号故意留空。'
    u'**只剩 D351 的 §15 一处是真缺陷**：§14（第 136 行「pencil 的剩余部分与本节阅读缺口」）之后直接 §16'
    u'（第 142 行），既无孤块落错位置，也无任何申报，属四族里「正文真丢才派单」那一族，'
    u'待写手侧补一节 §15，不能由本体侧造标题。',
]

raw = io.open(P, 'rb').read()
text = raw.decode('utf-8')
lines = text.split(u'\r\n')
tail = len(lines)
while tail > 0 and not lines[tail - 1].strip():
    tail -= 1
out = u'\r\n'.join(lines[:tail] + ITEM + lines[tail:]).encode('utf-8')
io.open(P, 'wb').write(out)
again = io.open(P, 'rb').read()
print(u'size=%d crlf=%d lone_cr=%d item9=%d'
      % (os.path.getsize(P), again.count(b'\r\n'),
         again.count(b'\r') - again.count(b'\r\n'),
         again.decode('utf-8').count(u'9. 整理序号复量（2026-10-14')))
