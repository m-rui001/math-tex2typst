# -*- coding: utf-8 -*-
# 数学区间掩码：给一篇笔记的每一行标出「哪些字符在数学跨度内」。
# 顺序是围栏 → 行内代码 → 数学：围栏行整行不算；行内反引号跨度内不算；\$ 不算定界符。
# 两支跨度分开判：单 $ 必须在本行内闭合（未闭合的一律不算，散文不会被一枚漏写的 $ 拖进式内），
# $$ 展示式可以跨行——它只能由一枚 $$ 打开，所以跨行是安全的。
# 控制字融合体的量具与回改共用这一把尺。
# 用法：from texmask import math_flags -> 每行一个与该行等长的 bool 表
#       from texmask import line_delims -> 单行的定界符账（行内代码不算），判「这行有没有落单的单 $」
BSL = chr(92)
TICK = chr(96)
DOL = chr(36)


def _events(line):
    ev = []
    i = 0
    n = len(line)
    while i < n:
        c = line[i]
        if c == BSL:
            i += 2
            continue
        if c == DOL:
            if i + 1 < n and line[i + 1] == DOL:
                ev.append((u"d", i))
                i += 2
                continue
            ev.append((u"s", i))
        i += 1
    return ev


def _code_mask(line):
    """行内反引号跨度掩码。返回 (code, tick)：code[j] 为真＝该字符在行内代码里；
    tick 为 1＝该行结束时还开着一枚反引号（未闭合，下一行继续）。"""
    n = len(line)
    code = [False] * n
    tick = 0
    j = 0
    while j < n:
        if line[j] == BSL:
            j += 2
            continue
        if line[j] == TICK:
            tick ^= 1
        elif tick:
            code[j] = True
        j += 1
    return code, tick


def math_flags(lines):
    out = []
    infence = False
    disp = False
    for line in lines:
        if line.strip().startswith(TICK * 3):
            infence = not infence
            out.append([False] * len(line))
            continue
        n = len(line)
        if infence:
            out.append([False] * n)
            continue
        code, _ = _code_mask(line)
        flags = [False] * n
        single = False
        pos = 0
        for kind, idx in _events(line):
            inmath = disp or single
            for k in range(pos, idx):
                if inmath and not code[k]:
                    flags[k] = True
            pos = idx + (2 if kind == u"d" else 1)
            if code[idx]:
                continue
            if kind == u"d":
                disp = not disp
            else:
                single = not single
        # 单 $ 未在本行闭合＝不算跨度；展示式的尾巴留到下一行
        if disp:
            for k in range(pos, n):
                if not code[k]:
                    flags[k] = True
        out.append(flags)
    return out


def line_delims(line):
    """单行的定界符账：(单 $ 枚数, $$ 枚数, 行末是否还开着反引号)，一律只数行内代码之外的。
    单 $ 枚数是奇数＝这一行有一枚没在本行闭合，它就是后面整段的元凶；
    `region_check.py` 的 dollar_odd 因为不剥行内代码才把「登记句里引用 $ 字面」报成假阳，
    用这个读数那类假阳自动归零。展示式可以跨行，所以 $$ 的奇偶要全篇累计，不在单行判。
    """
    code, tick = _code_mask(line)
    ev = _events(line)
    return sum(1 for k, i in ev if k == u's' and not code[i]), \
        sum(1 for k, i in ev if k == u'd' and not code[i]), tick

