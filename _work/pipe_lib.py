# -*- coding: utf-8 -*-
"""台账格竖线的唯一口径：分格判据、表块切分、行内数学跨度的裸竖线改写。
census（pipe_census2.py）与修法（pipe_fix.py）都从这里取，别各写一把尺。"""
import re

SEP = re.compile(u"^\\|[: \\-|]+\\|$")


def bare(s):
    """参与分格的竖线位置：前面有偶数枚（含 0 枚）反斜杠的那些。"""
    pos = []
    for i, ch in enumerate(s):
        if ch != u"|":
            continue
        k, bs = i - 1, 0
        while k >= 0 and s[k] == u"\\":
            bs += 1
            k -= 1
        if bs % 2 == 0:
            pos.append(i)
    return pos


def code_ranges(line):
    """反引号跨度（1--3 枚定界符）覆盖的闭区间：里面是素材逐字引文，不许改写。"""
    res, i, n = [], 0, len(line)
    while i < n:
        if line[i] != u"`":
            i += 1
            continue
        k = i
        while k < n and line[k] == u"`":
            k += 1
        run = k - i
        if run > 3:
            i = k
            continue
        j, found = k, False
        while j < n:
            if line[j] == u"`":
                e = j
                while e < n and line[e] == u"`":
                    e += 1
                if e - j == run:
                    res.append((i, e - 1))
                    i, found = e, True
                    break
                j = e
            else:
                j += 1
        if not found:
            i = k
    return res


def in_code(pos, ranges):
    return any(a <= pos <= b for a, b in ranges)


def spans(line):
    """行内 $...$ 跨度，返回内容区间 [a, b)。"""
    res, i, n = [], 0, len(line)
    while i < n:
        if line[i] == u"\\":
            i += 2
            continue
        if line[i] != u"$":
            i += 1
            continue
        j = i + 1
        while j < n:
            if line[j] == u"\\":
                j += 2
                continue
            if line[j] == u"$":
                break
            j += 1
        if j >= n:
            break
        res.append((i + 1, j))
        i = j + 1
    return res


def blocks_of(lines):
    """[(行号, 原文, 表块列宽)]：表块＝「| 起始行 + 分隔行」打头的连续行段，围栏外。
    块内再遇到「| 起始行 + 分隔行」且宽度不同就重新锚定，两张紧贴的表不能共用一把宽度。"""
    res, fence, i = [], False, 0
    n = len(lines)
    while i < n:
        s = lines[i].strip()
        if s.startswith(u"```"):
            fence = not fence
            i += 1
            continue
        nxt = lines[i + 1].strip() if i + 1 < n else u""
        if fence or not s.startswith(u"|") or not (nxt.startswith(u"|") and SEP.match(nxt)):
            i += 1
            continue
        start, width = i, len(bare(s))
        while i < n:
            t = lines[i].strip()
            if not t.startswith(u"|") or t.startswith(u"```"):
                break
            after = lines[i + 1].strip() if i + 1 < n else u""
            if i > start and SEP.match(after) and len(bare(t)) != width:
                break
            res.append((i + 1, lines[i], width))
            i += 1
    return res


def fix_line(line):
    """把行内数学跨度里成对的裸竖线换成 \\lvert / \\rvert；返回 (新行, 枚数, 奇数跨度数, 被反引号挡下的枚数)。"""
    if line.count(u"$") % 2 == 1:
        return line, 0, 1, 0
    all_marks = bare(line)
    marks = [i for i in all_marks if not in_code(i, code_ranges(line))]
    masked = len(all_marks) - len(marks)
    edits, skip = [], 0
    for a, b in spans(line):
        hit = [i for i in marks if a <= i < b]      # bare() 已按位置升序，配对顺序不能靠集合遍历
        if not hit:
            continue
        if len(hit) % 2 == 1:
            skip += 1
            continue
        for k, i in enumerate(hit):
            tok = u"\\lvert" if k % 2 == 0 else u"\\rvert"
            if re.match(u"[A-Za-z@]", line[i + 1:i + 2]):   # 控制词紧跟字母会吞出另一条命令
                tok += u" "
            edits.append((i, tok))
    if not edits:
        return line, 0, skip, masked
    out = line
    for i, rep in sorted(edits, reverse=True):
        out = out[:i] + rep + out[i + 1:]
    return out, len(edits), skip, masked
