# -*- coding: utf-8 -*-
# C 稿收稿侧第二道纯语法式：跨行行内式并入。
# 判据与尺子同一条（ccheck 的 odd_lines＝逐行 `$` 枚数为奇，且与普查一样剥行内代码），成因是写手把长公式排到下一行：
# C53 L92-93 `$\operatorname{Pic}_X(A)\cong\operatorname{Pic}_{X/S}(A)` + 换行 + `\cong\operatorname{Pic}_{(X/S)_{\text{Zar}}}(A)$；`
# 一行内不成对，规格 §3「一行内 `$` 必须成对」就不允许（半形错位会级联，定界符那一式的教训）。
# 做法：从奇数行起把后续行以**一个空格**并入（并点必在未闭合跨度内部，KaTeX 的数学空格不要钱），
# 直到本行成对。遇空行、`## ` 标题、表格行 `|`、引用行 `>`、围栏 ``` 就收手，原样保留并报绑不上。
# 用法：python -X utf8 _work/c_line_merge.py [--apply] C53 C54 …
import io, os, re, sys, glob

sys.stdout.reconfigure(encoding='utf-8')
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from c_code_mask import dollars
APPLY = '--apply' in sys.argv
cids = [a.upper() for a in sys.argv[1:] if not a.startswith('--')]
assert cids, '给一个以上 C 稿号'

STOP = re.compile(u'^(\\s*$|## |\\||>|```|~~~|[-*+] |\\d+[.)] )')


def fence_idx(lines):
    """围栏代码块内部的行号集合（``` 开关逐行推进；整篇数奇偶会把嵌套壳读反，量具教训）。"""
    inside, open_ = set(), False
    for i, l in enumerate(lines):
        if l.startswith(u'```') or l.startswith(u'~~~'):
            open_ = not open_
            continue
        if open_:
            inside.add(i)
    return inside


def merge(lines):
    """返回 (新行表, 并入处数, 消掉的行数, 绑不上处数)。一处并入可以吃掉两行以上。"""
    inside = fence_idx(lines)
    out, i, did, cut, stuck = [], 0, 0, 0, 0
    while i < len(lines):
        cur = lines[i]
        if i in inside or dollars(cur) % 2 == 0:
            out.append(cur)
            i += 1
            continue
        buf, par, j, closed = cur, dollars(cur) % 2, i + 1, False
        while j < len(lines):
            nxt = lines[j]
            if j in inside or STOP.match(nxt):
                break
            buf = buf.rstrip() + u' ' + nxt.lstrip()
            # 逐行各剥各的行内代码再数，绝不在并好的串上数：反引号不成对时跨行配对会把真定界符掩掉。
            par = (par + dollars(nxt)) % 2
            j += 1
            if par == 0:
                closed = True
                break
        if closed:
            # 吃进去的是 lines[i..j-1]（j 已经是下一未处理行），产出一行 ⇒ 消掉 j-1-i 行
            out.append(buf)
            cut += j - 1 - i
            did += 1
            i = j
        else:
            out.append(cur)
            i += 1
            stuck += 1
    return out, did, cut, stuck


tot = 0
for cid in cids:
    hits = glob.glob(u'被引笔记/%s-*.md' % cid)
    if len(hits) != 1:
        print('%s 跳过（命中 %d 份）' % (cid, len(hits)))
        continue
    path = hits[0]
    raw = io.open(path, 'rb').read()
    assert b'\r' not in raw, '盘上带 CR，先查上一笔'
    text = raw.decode('utf-8')
    lines = text.split(u'\n')
    ins = fence_idx(lines)
    odd0 = sum(1 for k, l in enumerate(lines) if k not in ins and dollars(l) % 2)
    new, did, cut, stuck = merge(lines)
    odd1 = sum(1 for k, l in enumerate(new) if k not in fence_idx(new) and dollars(l) % 2)
    body = u'\n'.join(new)
    assert len(new) == len(lines) - cut, '行数减量与并入吃掉的行数对不上'
    # 硬不变量：除了空白（换行换成的空格），一个字的正文都不许动。
    # 这一条是踩出来的：并入侧曾把 j 当「最后吃进去的行」用 i=j+1 续扫，每处并印悄悄吞掉一行正文。
    assert re.sub(u'\\s+', u'', text) == re.sub(u'\\s+', u'', body), '正文被改动（丢字或多字）'
    assert body.count(u'$') == text.count(u'$'), '美元枚数被改动'
    assert body.count(u'`') == text.count(u'`'), '反引号枚数被改动'
    assert u'\r' not in body
    if not did and not stuck:
        print('%s 无跨行行内式（奇数行=%d）' % (cid, odd0))
        continue
    print('%s 奇数行=%d -> 并入后本行成对，处数=%d，绑不上=%d，bytes %d -> %d' % (
        cid, odd0, did, stuck, len(text.encode('utf-8')), len(body.encode('utf-8'))))
    if stuck:
        print('   绑不上=%d 处（原样保留，交人工或散文重述）' % stuck)
    tot += did
    if APPLY:
        io.open(u'_work/%s.pre-merge.md' % cid, 'wb').write(raw)
        io.open(path, 'wb').write(body.encode('utf-8'))
        print('   APPLIED 备份=_work/%s.pre-merge.md' % cid)
print('%s TOTAL 并入=%d 处' % ('APPLIED' if APPLY else 'DRY', tot))
