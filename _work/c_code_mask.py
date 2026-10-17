# -*- coding: utf-8 -*-
"""行内代码剥掩：把一行里成对反引号包住的片段换成空格。

判据与 `katex_census.js` 的 fenceMask 同一条正则（/`+[^`\\n]*`+/g），三把尺共用这一式，
免得「普查认为成对、ccheck 认为奇数」两套口径各说各话。素材里那些
`` `main.tex:406-414$` `` 一形把行末的字号原样抄进代码段，`$` 不是定界符。
"""
import re

BT_RUN = re.compile(u'`+[^`\\n]*`+')


def mask(line):
    """行内代码段 → 等长空格，其余逐字保留（长度不变，行号与列位不动）。"""
    return BT_RUN.sub(lambda m: u' ' * len(m.group(0)), line)


def dollars(line):
    """这一行里真正算定界符的 `$` 枚数（代码段内的不算）。"""
    return mask(line).count(u'$')
