# -*- coding: utf-8 -*-
# 只读：C29 里 \red / \Exc 的确切形，以及逐个候选展开在 KaTeX 上渲不渲得过。
import io, glob, sys, re, json, subprocess
sys.stdout.reconfigure(encoding='utf-8')

t = io.open(glob.glob('被引笔记/C29-*.md')[0], encoding='utf-8').read()
for pat in (r'\\red(?![A-Za-z])', r'\\Exc(?![A-Za-z])'):
    ms = [m for m in re.finditer(pat, t)]
    print(pat, '枚=%d' % len(ms))
    for m in ms[:4]:
        ln = t[:m.start()].count('\n') + 1
        print('   L%d %s' % (ln, t.split('\n')[ln - 1][max(0, m.start() - t.rfind('\n', 0, m.start()) - 40):][:120]))
defs = json.load(io.open('_work/macro_defs.json', encoding='utf-8'))['C29']
print('凭据 red=%r Exc=%r' % (defs.get('red'), defs.get('Exc')))
