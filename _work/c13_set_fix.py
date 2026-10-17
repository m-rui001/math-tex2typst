# -*- coding: utf-8 -*-
# C13 的 \Set：素材 1805.11558/main.tex:98 定义 \newcommand{\Set}{\mathbf{Set}}，
# 而 KaTeX 自带的 \Set 是带参宏（报错「Unexpected end of input in a macro argument」），
# 普查把这类站点记成 tok=null，回改链看不见。此处按素材凭据展开，代码跨度内原样保留。
import io, re, sys
sys.stdout.reconfigure(encoding='utf-8')
p = u'E:\\math\\被引笔记\\C13-约化群的Białynicki-Birula分解.md'
raw = io.open(p, encoding='utf-8', newline='').read()
segs = re.split(r'(`[^`\n]*`)', raw)
pat = re.compile(u'\\\\Set(?![A-Za-z])')
n = 0
for i, s in enumerate(segs):
    if i % 2:
        continue
    c = len(pat.findall(s))
    if c:
        segs[i] = pat.sub(u'\\\\mathbf{Set}', s)
        n += c
out = u''.join(segs)
assert u'\r' not in out
assert out.count(u'$') == raw.count(u'$')
assert out.count(u'`') == raw.count(u'`')
assert out.count(u'\n') == raw.count(u'\n')
io.open(p, 'w', encoding='utf-8', newline='').write(out)
print('Set expanded %d sites, bytes %d' % (n, len(out.encode('utf-8'))))
