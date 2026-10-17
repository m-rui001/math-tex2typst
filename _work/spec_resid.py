# -*- coding: utf-8 -*-
r"""「旧形残差」的唯一定义，供落盘前后的两把尺共用（`_work/fix_verify.py`、`_work/delim_probe.py`）。

有一族修法是**往旧串里插入字符**（old 是 new 的子串），例如
`\begin{pmatrix}0&b_j^\top\\ -b_j&0` → 同一串后面接 `\end{pmatrix}`。
这种单落盘之后「旧形计数归零」这条断言天然失效——新形自己就含着旧形。
判据只能是**残差**：旧形命中数减去每一处新形自带的那几枚（`new.count(old)`）。
不插字符的修法 `new.count(old)`＝0，同一公式退化成「旧形命中数」，所以不必分叉。
"""


def residual(text, old, new):
    return text.count(old) - text.count(new) * new.count(old)
