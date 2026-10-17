# -*- coding: utf-8 -*-
"""恢复被吞掉的小标题：把无题孤块整块搬回它该在的节位，并补回一行节标题。
用法: python -X utf8 _work/orphan_restore.py [--apply] [ID ...]
只做两件事——纯块移动（不增删正文行）+ 插入一行标题，全部用 Counter 断言。
"""
import io
import os
import re
import sys
import glob
import shutil
from collections import Counter

BASE = u"研究笔记"
BACKUP = os.path.join(u"_work", u"reorder-bak")

# (ID, 孤块首行, 孤块末行, 补回的节号, 插在哪个节号之前, 标题串, 吸掉的空行 0/1/2)
CASES = [
    (u"D290", 413, 427, 15, 16, u"## \u00a715 \u7b97\u5b50\u4fa7\u7684\u5165\u53e3\u662f\u5206\u89e3", 1),
    (u"D560", 143, 155, 9, 10, u"## 9. \u5f00\u6838\u81ea\u5df1\u7ba1\u4e0d\u4f4f\u6709\u754c\u8def\u5f84\u5230\u8fbe\u7684\u5206\u652f", 0),
    (u"D758", 161, 180, 4, 5, u"## \u00a74 \u63d2\u503c\u5b9a\u7406", 1),
    (u"D561", 151, 163, 9, 10, u"## \u00a79 \u77ed\u884c\u91c7\u6837", 1),
]

# 纯段搬正：错位的散文段（不补标题）搬到某个节号之前，用段首逐字串定位
MOVE_CASES = [
    (u"D561", u"\u4e92\u53cd\u6838\u5fc3\u4e0e\u78b0\u649e\u7535\u8377\uff0804-marking.tex:401-538", 8, 1),
]

H = re.compile(u"^## *(?:\\u00a7)? *(\\d+)(?:\\.(?=\\s)|(?![0-9.]))")
APPLY = u"--apply" in sys.argv
only = [a for a in sys.argv[1:] if not a.startswith(u"--")]


def hnum(l):
    if l.startswith(u"###"):
        return None
    m = H.match(l)
    return int(m.group(1)) if m else None


def find_head(L, n):
    for i, l in enumerate(L):
        if hnum(l) == n:
            return i
    assert False, u"no heading %d" % n


def maxblanks(L):
    run = best = 0
    for l in L:
        run = run + 1 if l == u"" else 0
        best = max(best, run)
    return best


def check(cid, L, new, extra):
    old_nb = [l for l in L if l.strip()]
    new_nb = [l for l in new if l.strip()]
    assert Counter(new_nb) == Counter(old_nb) + Counter(extra), u"%s content not pure" % cid
    assert maxblanks(new) <= maxblanks(L), u"%s blank run grew" % cid
    nums = [hnum(l) for l in new if hnum(l) is not None]
    assert nums == list(range(len(nums))), u"%s not contiguous: %s" % (cid, nums)
    for e in extra:
        assert sum(1 for l in new if l == e) == 1, u"%s dup heading" % cid


def commit(cid, path, new, L):
    print(u"%s lines %d->%d bytes %d->%d" % (cid, len(L), len(new),
          len(u"\n".join(L)), len(u"\n".join(new))))
    if APPLY:
        if not os.path.isdir(BACKUP):
            os.makedirs(BACKUP)
        shutil.copyfile(path, os.path.join(BACKUP, cid + u".pre-orphan.md"))
        io.open(path, u"w", encoding=u"utf-8", newline=u"").write(u"\n".join(new))
        print(u"   APPLIED")


def load(cid):
    path = glob.glob(os.path.join(BASE, cid + u"-*.md"))[0]
    return path, io.open(path, encoding=u"utf-8").read().split(u"\n")


def take(L, i0, i1, absorb):
    """摘掉 [i0,i1) 这段，并按 absorb 方向连带摘掉相邻空行。"""
    blk = L[i0:i1]
    a, b = i0, i1
    if absorb == 1:
        assert L[a - 1] == u"", u"no blank before"
        a -= 1
    elif absorb == 2:
        assert L[b] == u"", u"no blank after"
        b += 1
    return blk, L[:a] + L[b:], (a, b)


for case in CASES:
    cid, a, b, num, before, title, absorb = case
    if only and cid not in only:
        continue
    path, L = load(cid)
    assert not any(hnum(l) == num for l in L), u"%s heading %d already exists" % (cid, num)
    blk, rest, _ = take(L, a - 1, b, absorb)
    assert not any(l.startswith(u"#") for l in blk), u"%s heading inside block" % cid
    assert not any(l.startswith(u"| ") for l in blk), u"%s ledger rows inside block" % cid
    assert blk[0].strip() and blk[-1].strip(), u"%s block edge blank" % cid
    jj = find_head(rest, before)
    assert rest[jj - 1] == u"", u"%s target not preceded by blank" % cid
    new = rest[:jj] + [title, u""] + blk + [u""] + rest[jj:]
    check(cid, L, new, [title])
    print(u"%s restore S%d before S%d moved=%d lines, heading=%r" % (cid, num, before, len(blk), title))
    commit(cid, path, new, L)

for case in MOVE_CASES:
    cid, prefix, before, absorb = case
    if only and cid not in only:
        continue
    path, L = load(cid)
    hit = [i for i, l in enumerate(L) if l.startswith(prefix)]
    assert len(hit) == 1, u"%s prefix hits %d" % (cid, len(hit))
    blk, rest, _ = take(L, hit[0], hit[0] + 1, absorb)
    assert not any(l.startswith(u"#") for l in blk), u"%s heading inside para" % cid
    jj = find_head(rest, before)
    assert rest[jj - 1] == u"", u"%s target not preceded by blank" % cid
    new = rest[:jj] + blk + [u""] + rest[jj:]
    check(cid, L, new, [])
    print(u"%s para@%d moved before S%d (%d lines)" % (cid, hit[0] + 1, before, len(blk)))
    commit(cid, path, new, L)
