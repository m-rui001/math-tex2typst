# -*- coding: utf-8 -*-
# D476 收稿就地修补：新段（231 行起）里作者申报的 4 枚裸英文词、2 枚术语误选、2 枚前向节号。
# 全部是同一行内的等行替换：行数不变、`$` 数不变、反引号数不变、CR 恒为 0。
import io, glob

P = glob.glob(u'研究笔记/D476-*.md')[0]
raw = io.open(P, 'rb').read()
assert b'\r' not in raw
t = raw.decode('utf-8')
L = t.split('\n')

# (行号 1-based, 旧串, 新串) —— 逐条按行定位，绝不做全文 replace
EDITS = [
    (235, u'（对偶、半正数据与偏差）', u'（对、半正数据与偏差）'),          # 术语误选一：pair 不是 dual
    (245, u'广义对偶的一切双有理操作', u'广义对的一切双有理操作'),          # 术语误选二
    (245, u'b-除子 datum 本身', u'b-除子数据本身'),                        # 裸英文词：本篇同句已写「半正数据」
    (255, u'解释 §8 整屏障里', u'解释 §9 整屏障里'),                      # 前向节号错置一（作者给出准确出处 §9）
    (259, u'我首读 §8 时把这条的符号记反过', u'我首读 §9 时把这条的符号记反过'),  # 前向节号错置二
    (259, u'一维空间_identification_之后', u'一维空间识别之后'),            # 裸英文词（斜体形）：本篇旧段用「识别」
    (263, u'钉死 locality：', u'钉死局部性：'),                            # 裸英文词
]

for ln, old, new in EDITS:
    i = ln - 1
    assert L[i].count(old) == 1, (u'MISS/DUP', ln, old, L[i].count(old))
    assert ln >= 231, (u'NOT-IN-NEW-REGION', ln)

before = {'dollar': t.count(u'$'), 'tick': t.count(u'`'), 'lines': len(L)}
out = list(L)
for ln, old, new in EDITS:
    out[ln - 1] = out[ln - 1].replace(old, new)

new_t = u'\n'.join(out)
after = {'dollar': new_t.count(u'$'), 'tick': new_t.count(u'`'), 'lines': len(out)}
assert before == after, (before, after)
pre = {w: t.count(w) for w in [u'datum', u'identification', u'locality', u'广义对偶']}
post = {w: new_t.count(w) for w in pre}
# 申报段（§20 第 277 行）会逐字引用错形，那一处必须留着；正文里的四处必须清零
EXPECT = {u'datum': -1, u'identification': -1, u'locality': -1, u'广义对偶': -1}
for w, d in EXPECT.items():
    assert post[w] - pre[w] == d, (u'COUNT', w, pre[w], post[w])
left = [(i + 1, w) for w in pre for i, l in enumerate(out) if w in l]
assert all(ln >= 273 for ln, w in left), left
b = new_t.encode('utf-8')
assert b'\r' not in b
io.open(P, 'wb').write(b)
back = io.open(P, 'rb').read()
assert back == b
print('bytes %d -> %d (%+d)  lines %d  dollar %d  tick %d  edits %d' % (
    len(raw), len(back), len(back) - len(raw), after['lines'], after['dollar'], after['tick'], len(EDITS)))
