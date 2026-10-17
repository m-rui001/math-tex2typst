# -*- coding: utf-8 -*-
"""把行内式的「开符后空格」剥掉：`$ x$` 这一形在 KaTeX 侧的定界符读法里不算开符
（`katex_census.js` spans()：开符后紧跟空白就跳过、闭符前必须是紧字符），
于是一枚半形使其后所有跨度成对错位，普查报成 "Can't use function '$' in math mode"。
用法：python -X utf8 _work/c_dollar_tighten.py [--apply] [--skip=C40,C41,…] [C13 C48 …]
（不给号就全族；`--skip=` 用在飞的稿。在飞稿一律不碰。）
不变量：`$` 总数不变（只挪空格）、行数不变、无 CR。
"""
import io, os, sys, glob, re

APPLY = '--apply' in sys.argv
ONLY = set(a for a in sys.argv if re.match(r'^C\d\d$', a))
SKIP = set((next((a.split('=', 1)[1] for a in sys.argv if a.startswith('--skip=')), u'')).split(u',')) - {u''}
SPACE = u' \t'


def tighten(text):
    r"""按普查同一套词法走一遍：`$$` 整对跳过、代码跨度跳过、反斜杠逃逸一个字符。"""
    out = []
    n = len(text)
    i = 0
    in_math = False
    fence = False
    fixed = 0
    while i < n:
        c = text[i]
        if c == u'\n':
            in_math = False
            if text[i:i + 3] == u'```':
                fence = not fence
                out.append(u'```')
                i += 3
                continue
            out.append(c)
            i += 1
            continue
        if fence:
            out.append(c)
            i += 1
            continue
        if c == u'`':
            j = text.find(u'`', i + 1)
            if j < 0:
                out.append(c)
                i += 1
                continue
            out.append(text[i:j + 1])
            i = j + 1
            continue
        if c == u'\\':
            out.append(text[i:i + 2])
            i += 2
            continue
        if c == u'$':
            if text[i:i + 2] == u'$$':
                out.append(u'$$')
                i += 2
                continue
            if not in_math:
                # 开符位：后面是空白就把空白吃掉（下一个非空字符就是内容）
                j = i + 1
                while j < n and text[j] in SPACE:
                    j += 1
                if j > i + 1 and text[j:j + 1] not in (u'$', u'\n', u''):
                    out.append(u'$')
                    fixed += j - (i + 1)
                    i = j
                    in_math = True
                    continue
                in_math = True
                out.append(c)
                i += 1
                continue
            in_math = False
            # 闭符位：普查要求闭符前是紧字符，`… $` 这种带空格的闭符同样不算闭符，一样错位。
            if out and out[-1] and out[-1][-1:] in SPACE and not fence:
                k = len(out) - 1
                while k >= 0 and out[k] and out[k][-1:] in SPACE:
                    out[k] = out[k][:-1]
                    fixed += 1
                    k -= 1
            out.append(c)
            i += 1
            continue
        out.append(c)
        i += 1
    return u''.join(out), fixed


files = sorted(glob.glob(u'被引笔记/C*-*.md'))
if ONLY:
    files = [p for p in files if os.path.basename(p)[:3] in ONLY]
files = [p for p in files if os.path.basename(p)[:3] not in SKIP]
tot = 0
for p in files:
    raw = io.open(p, 'rb').read()
    assert b'\r' not in raw, p
    text = raw.decode('utf-8')
    new, fixed = tighten(text)
    if not fixed:
        continue
    tot += fixed
    print('%s 剥开符后空格=%d 增量=%+dB' % (os.path.basename(p)[:3], fixed,
          len(new.encode('utf-8')) - len(raw)))
    if APPLY:
        data = new.encode('utf-8')
        assert data.count(b'$') == raw.count(b'$'), 'dollar 枚数变了'
        assert data.count(b'`') == raw.count(b'`'), '反引号枚数变了'
        assert data.count(b'\n') == raw.count(b'\n'), '行数变了'
        io.open(p, 'wb').write(data)
print('%s TOTAL=%d' % ('APPLIED' if APPLY else 'DRY', tot))
