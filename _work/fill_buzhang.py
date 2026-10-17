# -*- coding: utf-8 -*-
# 补台账批填空值：把 ID 的实测 path/size/节数/行号/美元符数打成一行 paste-ready。
# 不用 regex（heredoc 与 JSON 双层转义会吃反斜杠），纯 str 方法。
import io, os, glob, sys


def out(line):
    # 控制台是 GBK，直接 print 中文路径会糊成一串赝品字节（我 19:45 就是这么误读探针的）
    sys.stdout.buffer.write((line + u'\n').encode('utf-8'))


ROW = u'其他队列第'
for k in io.open(u'.tools/inflight.txt', encoding='utf-8').read().split():
    h = glob.glob(u'研究笔记/%s-*.md' % k)
    if not h:
        out(k + ' NOFILE')
        continue
    p = h[0].replace(os.sep, '/')
    t = io.open(h[0], encoding='utf-8').read()
    secs = [l[3:].split()[0] for l in t.split(u'\n') if l.startswith(u'## ')]
    i = t.find(ROW)
    row = u'NO-DECL'
    if i >= 0:
        j = i + len(ROW)
        # 真实登记串是"其他队列第 414 行号"——「第」与数字之间有空格，跳过才取得到号
        while j < len(t) and t[j] in u' \u3000':
            j += 1
        dig = u''
        while j < len(t) and t[j].isdigit():
            dig += t[j]
            j += 1
        row = dig or u'?'
    out(u'%s|PATH=%s|size=%d|secs=%d|last=%s|dollars=%d|row=%s'
        % (k, p, os.path.getsize(h[0]), len(secs), secs[-1] if secs else u'-',
           t.count(u'$'), row))
