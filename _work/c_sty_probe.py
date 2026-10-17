# -*- coding: utf-8 -*-
# 只读：素材目录里除主 tex 之外（.sty/.cls/.def/辅助 .tex）还有多少宏定义，
# 以及无凭据残留的那些名字（C27 \cB 族、C32 \A \bc、C33 \wt、C16 \rfdown、C29 \red）能不能在那里找到。
import io, os, re, sys, json, glob
sys.stdout.reconfigure(encoding='utf-8')

plan = {x['cid']: x for x in json.load(io.open('_work/cited_plan.json', encoding='utf-8'))}
DEFS = json.load(io.open('_work/macro_defs.json', encoding='utf-8'))
CMD = re.compile(r'(?:newcommand|renewcommand|providecommand|DeclareMathOperator|\def)\s*\{?\\([A-Za-z]+)\}?')
WANT = {'C27': ('cB', 'cG', 'cL', 'cV', 'cX', 'cU'), 'C32': ('A', 'bc'),
        'C33': ('wt',), 'C16': ('rfdown',), 'C29': ('red',), 'C41': ('Cond', 'dgraph')}

for cid, names in sorted(WANT.items()):
    arx = plan[cid]['arxiv']
    d = '被引素材/' + re.sub(r'[/-]', '_', arx)
    listed = set(t['path'].split('/')[-1] for t in plan[cid]['texs'])
    allf = [f for f in glob.glob(d + '/*') if f.endswith(('.tex', '.sty', '.cls', '.def', '.txt'))]
    extra = [f for f in allf if os.path.basename(f) not in listed]
    defs_extra = {}
    for f in extra:
        for m in CMD.finditer(io.open(f, encoding='utf-8', errors='replace').read()):
            defs_extra.setdefault(m.group(1), os.path.basename(f))
    print('%s 主tex=%d 其他=%d %s' % (cid, len(listed), len(extra), [os.path.basename(x) for x in extra][:6]))
    for nm in names:
        print('    \\%-8s 已抽=%s  其他文件里=%s' % (nm, nm in DEFS.get(cid, {}), defs_extra.get(nm, '-')))
