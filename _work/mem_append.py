# -*- coding: utf-8 -*-
import io

MEM = u'C:/Users/hp/.qoder-cn/projects/E--math/memory/body-side-note-gate-fixes.md'
IDX = u'C:/Users/hp/.qoder-cn/projects/E--math/memory/MEMORY.md'

b = io.open(MEM, 'rb').read()
t = b.decode('utf-8')
assert b.count(b'\r') == 0

add = io.open(u'_work/mem_block.md', 'rb').read().decode('utf-8')
assert u'状态机量具' in add

TAIL = u'批量改写后 mtime 不再是在飞判据。'
assert t.count(TAIL) == 1
CLAUSE = (u'闸门计数单位要先 grep 判据表达式（`emDash` 数的是单枚 `—`，成对写两处就报 4）；'
          u'本体侧自己追加的正文也过闸门，落盘前先扫禁串、落盘后立即复量；'
          u'状态机量具的围栏开关必须每行都推进，某族读数为 0 而另一族异常饱满就先怀疑推进；'
          u'`dispatched-without-file` 有两形（撤稿豁免、派单号与落地号错位），先找带「其他」前缀的行号认领者；'
          u'作者申报给出目标形（「建议统一成 §4」）即工单，按锚名映射不按行号。')
t2 = t.replace(TAIL, CLAUSE + TAIL) + add

out = t2.encode('utf-8')
assert out.count(b'\r') == 0
assert out.count(b'\n') >= b.count(b'\n')
io.open(MEM, 'wb').write(out)

i = io.open(IDX, 'rb').read().decode('utf-8')
OLD = u'欠账表要两种引用记法一起数。'
assert i.count(OLD) == 1
i = i.replace(OLD, u'欠账表要两种引用记法一起数；emDash 数单枚；围栏开关要每行推进；号位错位的 NOFILE 是假无档。')
io.open(IDX, 'wb').write(i.encode('utf-8'))
print('mem %d -> %d  idx %d' % (len(b), len(out), len(i.encode('utf-8'))))
