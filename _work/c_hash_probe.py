# -*- coding: utf-8 -*-
# 只读探针：把「正文里裸 #N」的站点连整行上下文打出来，看实参相对模板占位符的位置形。
# 用法：python -X utf8 _work/c_hash_probe.py C16 C17 C32 C33
import io, re, sys, glob

sys.stdout.reconfigure(encoding='utf-8')
B = chr(92)
CODE = re.compile(r'`[^`\n]*`')
HASH = re.compile(u'(?<!' + B + B + u')#\\d')

for cid in [a.upper() for a in sys.argv[1:]]:
    f = glob.glob(u'被引笔记/%s-*.md' % cid)
    if not f:
        print(cid, 'NOFILE')
        continue
    lines = io.open(f[0], encoding='utf-8').read().split(u'\n')
    n = 0
    for i, ln in enumerate(lines, 1):
        hits = list(HASH.finditer(CODE.sub(u'', ln)))
        if not hits:
            continue
        n += len(hits)
        print(u'  L%-4d %s' % (i, ln.strip()[:170]))
    print(u'== %s 行数=%d 裸 #N 站点=%d' % (cid, len(lines), n))
