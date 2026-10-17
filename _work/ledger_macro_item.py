# -*- coding: utf-8 -*-
"""Append the macro-leg closing item to 队列台账.md, keeping the file's CRLF endings."""
from __future__ import unicode_literals
import io, os

P = u'E:/math/' + u'研究笔记/' + u'队列台账.md'
ITEM = [
    u'8. 宏族腿（2026-10-14 结案，凭据＝本地 KaTeX 0.19，`throwOnError:true, strict:false`；'
    u'pandoc 3.8.3 不是凭据，它把 `\\tr`、`\\rank` 原样透传成 Math InlineMath）。'
    u'基线 28,271 处被渲染器拒的数学跨度／556 篇，收到现在 **3,841 处／323 篇**。'
    u'三刀：一，`_work/preamble_table.py`＋`_work/katex_fix.js` 把简写**按本篇素材自己的 preamble** '
    u'展开（491 篇 31,180 处；口径抄 `tools/t2t/macros.py:278`——`\\DeclareMathOperator` 那族裹成 '
    u'`\\operatorname{…}`，以字母开头的 body 落在控制字后面补一枚空格，防 `\\to\\Sel` 并成 `\\toSel`；'
    u'素材目录按「全篇提及次数最多」取，两枚并列就弃，`with_dir` 由 686/734 升到 718/734）；'
    u'二，`_work/fuse_fix.js` 拆 48 处「命令名吃掉下一个词」（`\\lverth(v)`→`\\lvert h(v)`），'
    u'只在 KaTeX 对那枚融合串报 Undefined 时才拆，否则 `\\middle|` 会被误拆成 `\\mid dle`；'
    u'三，`_work/ensuremath_fix.js` 把数学跨度内的 94 处 `\\ensuremath{X}` 还原成 `X`（数学模式里它本就是恒等）。'
    u'护门四件套每篇都验：`$` 数、反引号数、行数、CR 全部不变，且 refused 严格下降，'
    u'备份 `\\_work\\*.pre-macro.md`／`.pre-fuse.md`／`.pre-emath.md`／`.pre-crlf.md`。'
    u'**残余的 3,841 处按用户口径登记不重写**：291 枚未定义命令里 173 枚（约 2,957 处）在别的论文 '
    u'preamble 里有定义、本篇素材却没有——那是跨篇记号串味；另 118 枚（538 处）任何 preamble 都没定义，'
    u'其中 `\\eqref` 188、`\\*` 25、`\\calP` 15、`\\BE` 14、`\\lem` 13、`\\cite` 12、`\\bigrvert` 10。'
    u'这一族要动的是引用记号本身（`\\eqref` 一类是逐字引素材英文句造成的 `$` 配对外溢），不是宏展开能修的，'
    u'留给下一轮定向。复量：`gate_all total=734 bad=0`；wrap 账面一字未动（展开既不增删 `$` 也不动行数，'
    u'跨度几何恒等）；CRLF 实测全库只剩 1 篇（此前记的 4 篇是旧账），D168 已归零，现 `D*.md` 无 CR。',
]

raw = io.open(P, 'rb').read()
assert b'\r\n' in raw
text = raw.decode('utf-8')
lines = text.split(u'\r\n')
# 追加在文件末尾的空行之前，保持原有 CRLF 口径
tail = len(lines) - 1
while tail > 0 and not lines[tail - 1].strip():
    tail -= 1
new = lines[:tail] + ITEM + lines[tail:]
out = u'\r\n'.join(new).encode('utf-8')
io.open(P, 'wb').write(out)
size = os.path.getsize(P)
again = io.open(P, 'rb').read()
print(u'size=%d crlf=%d lone_cr=%d lines=%d item8=%d'
      % (size, again.count(b'\r\n'), again.count(b'\r') - again.count(b'\r\n'),
         again.count(b'\n'), again.decode('utf-8').count(u'8. 宏族腿（2026-10-14')))
