# -*- coding: utf-8 -*-
# 恢复 C32：编辑侧一次 `io.open(p,'w')` 在写入前就截断了文件（write(bytes) 抛 TypeError），
# 稿子被清成 0 字节。这里用「临时文件写全 → os.replace」的原子法从 _work 备份恢复。
import glob, io, os, sys

sys.stdout.reconfigure(encoding='utf-8')
SRC = u'_work/C32.pre-repair7.md'
dst = glob.glob(u'被引笔记/C32-*.md')[0]
raw = io.open(SRC, 'rb').read()
assert b'\r' not in raw, '备份掺 CR'
assert len(raw) > 20000, '备份低于规格下限'
stale = dst + u'.new'
if os.path.exists(stale):
    os.remove(stale)
tmp = dst + u'.restore'
with io.open(tmp, 'wb') as f:
    f.write(raw)
    f.flush()
    os.fsync(f.fileno())
os.replace(tmp, dst)
print(u'%s 恢复为 %d 字节（源＝%s）' % (os.path.basename(dst), os.path.getsize(dst), SRC))
