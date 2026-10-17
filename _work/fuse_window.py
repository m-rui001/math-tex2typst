# -*- coding: utf-8 -*-
# 融合体逐处窗口：把 fuse_sites 的 body 落点扩成左右各 45 字的原文窗口，并给出
# 「前缀 + 空格 + 尾巴」的修法与风险旗标（尾巴首字符是 _ ^ 数字时，插空格会改语义）。
# 同时对照 _work/preamble_tables.json：该 token 若是素材里 \newcommand 定义过的宏，
# 就不是融合体而是未展开的素材宏，必须走宏腿而不是补空格。
# 只读不落盘。用法：python _work/fuse_window.py
import glob
import io
import json
import os
import re

TOKS = json.load(io.open(u"_work/fuse_tokens.json", encoding=u"utf-8"))
SEL = [t for t in TOKS if len(t[u"prefix"]) >= 3 and len(t[u"tail"]) <= 3]
PT = json.load(io.open(u"_work/preamble_tables.json", encoding=u"utf-8"))

# 素材宏表：把所有 preamble 里出现过的 \newcommand 名字收成一个集合
macronames = set()
for val in PT.values():
    if isinstance(val, dict):
        for k in val.get(u"unresolved", []) or []:
            macronames.add(k if k.startswith(u"\\") else u"\\" + k)
        for k in (val.get(u"defs", {}) or {}):
            macronames.add(k if k.startswith(u"\\") else u"\\" + k)

out = []
out.append(u"material_macro_tokens=%s" % u" ".join(
    sorted(t[u"tok"] for t in SEL if t[u"tok"] in macronames)))
risk = 0
for f in sorted(glob.glob(u"研究笔记/D*.md")):
    key = os.path.basename(f).split(u"-")[0]
    lines = io.open(f, encoding=u"utf-8", newline=u"\n").read().split(u"\n")
    infence = False
    for i, l in enumerate(lines):
        if l.strip().startswith(u"```"):
            infence = not infence
            continue
        if infence:
            continue
        for t in SEL:
            for m in re.finditer(re.escape(t[u"tok"]) + u"(?![A-Za-z])", l):
                if l[:m.start()].count(u"`") % 2 == 1:
                    continue
                tail = t[u"tail"]
                nxt = l[m.end():m.end() + 1]
                # 尾巴字母带下标：插空格仍成立，但要人看一眼边界判得对不对
                sub = nxt in (u"_", u"^")
                # 落点不在 $…$ 里＝融合体漏在散文行，属于另一族缺陷
                nomath = l[:m.start()].count(u"$") % 2 == 0
                if sub or nomath:
                    risk += 1
                out.append(u"%s:%d %s -> %s %s | %s%s" % (
                    key, i + 1, t[u"tok"], t[u"prefix"], tail,
                    (u"[SUB]" if sub else u""),
                    (u"[NOMATH]" if nomath else u" ") +
                    l[max(0, m.start() - 45):m.end() + 45]))
out.append(u"flagged_sites=%d" % risk)
io.open(u"_work/fuse_windows.txt", u"wb").write(u"\n".join(out).encode(u"utf-8"))
print(u"lines=%d flagged=%d -> _work/fuse_windows.txt" % (len(out) - 2, risk))
