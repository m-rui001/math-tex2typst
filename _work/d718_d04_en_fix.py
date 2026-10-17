# -*- coding: utf-8 -*-
# 英文残留就地改（带唯一性断言与形式不变量复量）
import io, glob, sys

REPL = {
    "D718": [
        (u"。 separation 一侧那条", u"。分离一侧那条"),
        (u"， hence ", u"，于是 "),
        (u"， resulting 因子", u"，所得因子"),
        (u"按素材 preamble 的写法原样抄出", u"按素材前言区的写法原样抄出"),
    ],
    "D04": [
        (u"， caption 自己声明了这一点", u"，这一点图注自己声明了"),
        (u"同样 dichotomy", u"同样二分"),
        (u"两块之序于是 agrees", u"两块之序于是相合"),
        (u"所以那句 since 不是装饰", u"所以素材那句「since」不是装饰"),
    ],
}

do_apply = "--apply" in sys.argv
for key, pairs in REPL.items():
    p = glob.glob(u"E:/math/研究笔记/%s-*.md" % key)[0]
    s = io.open(p, encoding=u"utf-8", newline=u"").read()
    b = (len(s.encode(u"utf-8")), s.count(u"\n") + 1, s.count(u"$"), s.count(u"`"), s.count(u"\r"))
    for old, new in pairs:
        n = s.count(old)
        if n != 1:
            print(u"%s FAIL count=%d %r" % (key, n, old[:40]))
            continue
        s = s.replace(old, new)
    a = (len(s.encode(u"utf-8")), s.count(u"\n") + 1, s.count(u"$"), s.count(u"`"), s.count(u"\r"))
    print(u"%s bytes %d->%d lines %d->%d dollars %d->%d backtick %d->%d CR %d->%d" % (
        key, b[0], a[0], b[1], a[1], b[2], a[2], b[3], a[3], b[4], a[4]))
    if do_apply:
        io.open(p, u"w", encoding=u"utf-8", newline=u"").write(s)
        print(u"  written")
