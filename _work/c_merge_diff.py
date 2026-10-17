# -*- coding: utf-8 -*-
# 只读：c_line_merge 的美元枚数为何对不上——把并入前后的行表逐行对账，找出丢/多的行。
import io, sys, importlib.util

sys.stdout.reconfigure(encoding='utf-8')
spec = importlib.util.spec_from_file_location('m', '_work/c_line_merge.py')
# 不导入执行侧，直接抄函数：用文本切片 exec 头部到主流程之前
src = io.open('_work/c_line_merge.py', encoding='utf-8').read()
head = src.split(u"tot = 0")[0].replace(u"assert cids, '给一个以上 C 稿号'", u'')
ns = {}
exec(compile(head, 'c_line_merge_head', 'exec'), ns)
merge, fence_idx = ns['merge'], ns['fence_idx']

for cid in sys.argv[1:] or [u'C53']:
    import glob
    path = glob.glob(u'被引笔记/%s-*.md' % cid)[0]
    text = io.open(path, encoding='utf-8').read()
    lines = text.split(u'\n')
    new, did, cut, stuck = merge(lines)
    body = u'\n'.join(new)
    print('%s 原 $=%d 新 $=%d 原行=%d 新行=%d did=%d cut=%d stuck=%d' % (
        cid, text.count(u'$'), body.count(u'$'), len(lines), len(new), did, cut, stuck))
    a = u''.join(lines).replace(u'\n', u'')
    b = u''.join(new).replace(u'\n', u'')
    print('   去换行后逐字符比对：%s' % (u'相同' if a == b else u'不同'))
    # 逐处并印：把每一处 (吃进去的原始行, 产出的新行) 打出来，看丢在哪
    ins = fence_idx(lines)
    i = 0
    k = 0
    while i < len(lines):
        cur = lines[i]
        if i in ins or cur.count(u'$') % 2 == 0:
            i += 1
            continue
        buf, j, closed = cur, i + 1, False
        while j < len(lines):
            nxt = lines[j]
            if j in ins or ns['STOP'].match(nxt):
                break
            buf = buf.rstrip() + u' ' + nxt.lstrip()
            j += 1
            if buf.count(u'$') % 2 == 0:
                closed = True
                break
        if closed:
            seg = lines[i:j + 1]
            print('   #%d 原%dB/%d$ 吃%d行 -> 新%dB/%d$  %r' % (
                k, sum(len(x) for x in seg), sum(x.count(u'$') for x in seg),
                len(seg), len(buf), buf.count(u'$'), buf[:70]))
            k += 1
            i = j + 1
        else:
            print('   #%d 绑不上 @L%d %r' % (k, i + 1, cur[:60]))
            i += 1
            k += 1
    if a != b:
        for x in range(min(len(a), len(b))):
            if a[x] != b[x]:
                print('   首个差异 @%d: 原=%r 新=%r' % (x, a[x:x + 40], b[x:x + 40]))
                break
        print('   长度 原=%d 新=%d' % (len(a), len(b)))

