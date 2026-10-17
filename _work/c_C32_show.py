# -*- coding: utf-8 -*-
import io

ls = io.open(u'被引素材/1707.05561/main.tex', encoding='utf-8').read().split(u'\n')


def show(a, b, tag):
    print(u'==== %s (%d-%d) ====' % (tag, a, b))
    for i in range(a, b + 1):
        print(u'%5d %s' % (i, ls[i - 1][:165]))


show(1338, 1358, u'笔记三处 1340-1355 所指')
show(321, 340, u'outline 头')
show(2303, 2312, u'Part II / sec-DS')
show(2411, 2422, u'Theorem 5.5 区')
show(676, 700, u'Lemma 2.18 区')
