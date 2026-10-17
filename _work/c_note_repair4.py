# -*- coding: utf-8 -*-
# 定点修补四形（普查里 tok=null 的 parse error，逐形都在 c_opside_probe/c_fix_probe 里复现过）：
#   C07  `\mathbb{Q` 少了闭括号（6 枚，一记未闭使其后跨度错位，按上游一记收）
#   C34  `\mathbb\mathbb{C}^r` 展开时重复了一枚 `\mathbb`
#   C30  `$\Cal$ 已统一改写为 $\mathcal$` 这种「讲符号移植」的句子：`\mathcal` 单独不成式 ⇒ 引源用代码跨度
#   C16  作者原文引用 `Theorem $\ref{t_cox}_n$`：`\ref` 不是式，原样进代码跨度
# 用法：python -X utf8 _work/c_note_repair4.py [--apply]   （cwd=E:\math）
import io, os, re, sys, glob, json
sys.stdout.reconfigure(encoding='utf-8')
APPLY = '--apply' in sys.argv


def load(cid):
    p = glob.glob(u'被引笔记/%s-*.md' % cid)[0]
    raw = io.open(p, 'rb').read()
    assert b'\r' not in raw, cid
    return p, raw, raw.decode('utf-8')


def save(cid, p, raw, text, **_):
    data = text.encode('utf-8')
    # 这三条形不变量管得住「改坏」：定界符成对、行不少、不带 CR；引号↔代码跨度的互换本来就会动枚数。
    assert data.count(b'$') % 2 == 0 and data.count(b'`') % 2 == 0, '%s 定界符变奇' % cid
    assert data.count(b'\n') == raw.count(b'\n'), '%s 行数变了' % cid
    assert b'\r' not in data
    print('%s bytes %d -> %d（%+d）' % (cid, len(raw), len(data), len(data) - len(raw)))
    if APPLY:
        io.open(u'_work/%s.pre-repair4.md' % cid, 'wb').write(raw)
        io.open(p, 'wb').write(data)
        print('   APPLIED 备份=_work/%s.pre-repair4.md' % cid)


# C07：`X\mathbb{Q` 后面不接 `}` 的那些，补闭括号。逐枚打印原句给人过目。
p, raw, t = load('C07')
PAT = re.compile(u'\\\\mathbb\\{Q(?![}])')
sites = [m.group(0) for m in PAT.finditer(t)]
new, n = PAT.subn(u'\\\\mathbb{Q}', t)
print('C07 站点=%d 形=%s' % (n, set(sites)))
for m in PAT.finditer(t):
    ln = t[:m.start()].count('\n') + 1
    print('   L%-4d %s' % (ln, t.split('\n')[ln - 1][:110]))
save('C07', p, raw, new)

# C34 / C30 / C16：逐字锚点，一处一断言
for cid, pairs, ddb, dds in (
    ('C34', [(u'$U\\subset\\mathbb\\mathbb{C}^r$', u'$U\\subset\\mathbb{C}^r$')], 0, 0),
    ('C30', [(u'$\\Cal$ 已统一改写为 $\\mathcal$', u'`\\Cal` 已统一改写为 `\\mathcal`'),
             (u'$\\bP$ 已统一改写为 $\\mathbb P$', u'`\\bP` 已统一改写为 `\\mathbb P`')], 8, -8),
    ('C16', [(u'"Theorem $\\ref{t_cox}_n$"', u'"Theorem `\\ref{t_cox}_n`"')], 2, -2),
):
    p, raw, t = load(cid)
    for old, newx in pairs:
        if t.count(old) == 0:
            assert t.count(newx) == 1, '%s 锚点既无原形也无形：\n  %s' % (cid, old[:60])
            print('%s 该形已改过：%s' % (cid, newx[:40]))
            continue
        assert t.count(old) == 1, '%s 锚点命中 %d 次：%s' % (cid, t.count(old), old[:50])
        t = t.replace(old, newx)
    save(cid, p, raw, t, ddb=ddb, dds=dds)
