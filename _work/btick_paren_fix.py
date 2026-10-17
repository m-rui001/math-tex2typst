# -*- coding: utf-8 -*-
# 闭合符误写族的第二腿：第一腿 btick_abbrev_fix 只认「本行 $ 为奇」，
# 对 `X$）$` / `X$）` ` ` / `X$` 三种形状是结构性瞎的——误写的 $ 与后随的
# 括号或反引号自己配成了对，行内 $ 计数因此保持偶数。
# 本工具按形状定改法，再用「行内结构oracle」验收：
#   FLIP       `X$` + 普通字符      -> $ 改成反引号（字节中性）
#   FLIP-DROP  `X$` + ）+ $/反引号   -> $ 改成反引号，删掉括号后那枚多余定界符（-1 B）
#   DROP       `X$` + 反引号         -> 删掉 $，后随反引号就是本来就写对的闭合符（-1 B）
# oracle 判据：反引号偶、$ 偶（$$ 先折成占位符），代码跨段内不含中文与 $，
# 数学跨段内不含裸中文（\text{}/\mathrm{} 之类先剥掉）。改完红旗必须为 0 且少于改前。
import glob, io, os, re, sys
sys.stdout.reconfigure(encoding="utf-8")
APPLY = u"--apply" in sys.argv
TICK = chr(96)
DOL = u"$"
LQ = u"＂"
CJK = re.compile(u"[\u4e00-\u9fff\u3000-\u303f\uff01-\uff5e]")
TEXTGRP = re.compile(r"\\(?:text|textrm|textit|textbf|mathrm|mathit|mathbf|operatorname|mathsf|textnormal|mbox)"
                     r"\{[^{}]*\}")
PAREN = set(u"）)")
# 勘误段落会把坏形状逐字引一遍，改了等于毁掉申报：按段（连续非空行）判定。
ERRATA = re.compile(u"勘误|误写|应读作|原文保留|错打|多打|连写|笔误|漏了|补正|反引号|多余")
DECL_LINE = re.compile(u"第\\s*(\\d+)\\s*行")
# 名字段允许为空（D33 的 `:198$ 是同文件续引），行号段允许逗号与 -- 。
PAT = re.compile(TICK + r"([A-Za-z0-9_.\-]*:[0-9][0-9A-Za-z_.,\-]*)([$])")
FENCE = re.compile(r"^\s*```")


def fence_mask(lines):
    m, inf = [], False
    for l in lines:
        if FENCE.match(l):
            inf = not inf
        m.append(inf)
    return m


# 行内结构 oracle：三种红旗都要为零才算改干净。
#  1) 反引号／$ 计数为偶；
#  2) 一枚 `名:行号` 之后紧跟的不是反引号，就是闭合符写错（closer-not-tick）；
#  3) $ 配对出来的数学跨段里含裸中文（说明有误写闭合符自己配成的巨型假跨段）。
BADCLOSE = re.compile(TICK + r"([A-Za-z0-9_.\-]*:[0-9][0-9A-Za-z_.,\-]*)([^\u4e00-\u9fff])")


def flags(line):
    out = []
    if line.count(TICK) % 2:
        out.append(u"ticks-odd")
    if line.replace(u"$$", LQ).count(DOL) % 2:
        out.append(u"dollars-odd")
    for m in BADCLOSE.finditer(line):
        if m.group(2) != TICK:
            out.append(u"closer-not-tick:" + m.group(1)[:20])
    parts = line.split(TICK)
    if len(parts) % 2 == 1:
        for i in range(0, len(parts), 2):
            s = parts[i].replace(u"$$", LQ).split(DOL)
            for j in range(1, len(s) - 1, 2):
                if CJK.search(TEXTGRP.sub(u"", s[j])):
                    out.append(u"cjk-in-math:" + s[j][:20])
    return out


def paragraph_errata(lines, idx):
    a = idx
    while a > 0 and lines[a - 1].strip():
        a -= 1
    b = idx
    while b + 1 < len(lines) and lines[b + 1].strip():
        b += 1
    return bool(ERRATA.search(u"\n".join(lines[a:b + 1])))


def repair(l):
    """返回 (新行, 动作列表) 或 None。从左到右扫，位置按已改写长度平移。"""
    acts, res = [], []
    i = 0
    while True:
        m = PAT.search(l, i)
        if not m:
            res.append(l[i:])
            break
        en = m.end()                       # $ 之后一格
        res.append(l[i:m.start()])
        body = m.group(1)
        nxt = l[en] if en < len(l) else u""
        after = l[en + 1] if en + 1 < len(l) else u""
        if nxt == TICK:
            res.append(TICK + body)          # DROP：删掉 $，保留写对的闭合符
            acts.append((body, u"DROP"))
            i = en
        elif nxt in PAREN and after in (TICK, DOL):
            res.append(TICK + body + TICK + nxt)   # FLIP-DROP：括号后那枚定界符是多余的
            acts.append((body, u"FLIP-DROP"))
            i = en + 2
        else:
            res.append(TICK + body + TICK + nxt)   # FLIP：$ 就是误写的闭合符
            acts.append((body, u"FLIP"))
            i = en + 1
    return u"".join(res), acts


tot = {"FLIP": 0, "FLIP-DROP": 0, "DROP": 0}
notes = {}
skipped = []
prev = []


def declared_lines(lines, fm):
    """作者申报「原文保留」的坏形状：勘误段点名「第 N 行」或逐字引出该位置串的，不再搬正。
    申报的行号会失准（D15 写 390/394/428/459，实际在 370/374/408/439），所以位置串本身
    才是判据：凡勘误段里以 `` `xxx:NN$ `` 形式逐字引出的串，整篇一律避开。"""
    blocked, bodies = set(), set()
    for idx, l in enumerate(lines):
        if fm[idx] or not l.strip():
            continue
        if not (ERRATA.search(l) or paragraph_errata(lines, idx)):
            continue
        for m in DECL_LINE.finditer(l):
            blocked.add(int(m.group(1)))
        for m in re.finditer(TICK + r"([A-Za-z0-9_.\-]*:[0-9][0-9A-Za-z_.,\-]*)[$]", l):
            bodies.add(m.group(1))
    return blocked, bodies


for p in sorted(glob.glob(u"研究笔记/D*.md")):
    k = os.path.basename(p)[:10]
    raw = io.open(p, encoding="utf-8").read()
    lines = raw.split(u"\n")
    fm = fence_mask(lines)
    blocked, bodies = declared_lines(lines, fm)
    changed, bd = 0, 0
    for idx, l in enumerate(lines):
        if fm[idx] or not PAT.search(l):
            continue
        hit_bodies = [m.group(1) for m in PAT.finditer(l)]
        if idx + 1 in blocked or any(b in bodies for b in hit_bodies):
            for b in hit_bodies:
                skipped.append((k, idx + 1, b, u"author-declared"))
            continue
        if ERRATA.search(l) or paragraph_errata(lines, idx):
            for m in PAT.finditer(l):
                skipped.append((k, idx + 1, m.group(1), u"errata"))
            continue
        r = repair(l)
        if not r:
            continue
        new, acts = r
        if not acts:
            continue
        b0, b1 = flags(l), flags(new)
        if b1:
            for m in PAT.finditer(l):
                skipped.append((k, idx + 1, m.group(1), u"oracle-after:" + b1[0][:28]))
            continue
        if len(b1) >= len(b0):
            for m in PAT.finditer(l):
                skipped.append((k, idx + 1, m.group(1), u"no-improve(%d>=%d)" % (len(b1), len(b0))))
            continue
        for a in acts:
            tot[a[1]] = tot.get(a[1], 0) + 1
            j = new.find(TICK + a[0] + TICK)
            prev.append((k, idx + 1, a[1], new[max(0, j - 18):j + len(a[0]) + 22]))
        assert l.count(u"|") == new.count(u"|"), (k, idx + 1)
        assert new.replace(TICK, u"").replace(DOL, u"") == l.replace(TICK, u"").replace(DOL, u""), (k, idx + 1)
        assert u"\r" not in new, (k, idx + 1)
        assert len(acts) == len([1 for _ in PAT.finditer(l)]), (k, idx + 1)
        changed += len(acts)
        bd += len(new.encode("utf-8")) - len(l.encode("utf-8"))
        lines[idx] = new
    if changed:
        notes[k] = (changed, bd)
        if APPLY:
            io.open(u"_work/%s.pre-paren.md" % k.split(u"-")[0], "wb").write(raw.encode("utf-8"))
            io.open(p, "wb").write(u"\n".join(lines).encode("utf-8"))
print(u"APPLY=%s sites=%d FLIP=%d FLIP-DROP=%d DROP=%d skipped=%d notes=%d" % (
    APPLY, sum(v[0] for v in notes.values()), tot["FLIP"], tot["FLIP-DROP"], tot["DROP"],
    len(skipped), len(notes)))
for k, (c, bd) in sorted(notes.items()):
    print(u"  %-12s sites=%d bytes=%+d" % (k, c, bd))
for s in skipped:
    print(u"  SKIP %s:%d %s -> %s" % s)
for v in prev:
    print(u"  FIX  %s:%d %-9s %s" % v)
