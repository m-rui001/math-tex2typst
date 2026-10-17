# -*- coding: utf-8 -*-
# 全库「前缀＋单个字母」字体约定普查：每个前缀在多少篇素材里有 preamble 定义、展开后落在哪些字体命令上。
# 只读，用来定 c_macro_fix.py 那条跨篇凭据的门（唯一族＋见证篇数阈值）。
# c_macro_fix 是脚本形（导入即取 argv），所以只 exec 它的头部到主流程之前。
import io, re, sys, json, collections

sys.stdout.reconfigure(encoding='utf-8')
src = io.open('_work/c_macro_fix.py', encoding='utf-8').read()
head = src.split(u"\ncid = sys.argv[1]")[0]
ns = {'__name__': 'c_macro_fix_head'}
exec(compile(head, '_work/c_macro_fix.py', 'exec'), ns)
DEFS, LADFAM, normalize = ns['DEFS'], ns['LADFAM'], ns['normalize']

W = re.compile(r'^([a-z]{1,3})([A-Za-z])$')
seen = collections.defaultdict(lambda: collections.defaultdict(dict))
for cid, defs in DEFS.items():
    for nm, body in defs.items():
        m = W.match(nm)
        if not m or nm[:-1] != m.group(1):
            continue
        f = LADFAM.match(normalize(body, defs)[0])
        if not f:
            continue
        seen[m.group(1)][f.group(1)][cid] = nm

for pre in sorted(seen):
    byfam = seen[pre]
    fams = {fam: len(ids) for fam, ids in byfam.items()}
    tot = set()
    for ids in byfam.values():
        tot |= set(ids)
    if len(fams) == 1:
        fam, n = list(fams.items())[0]
        flag = '唯一族 \\%s，%d 篇' % (fam, n) + ('  <== 过门' if n >= 3 else '  <== 篇数不足')
    else:
        flag = '两制，不认'
    print('%-8s 篇=%-3d %-34s %s' % (pre, len(tot), json.dumps(fams, ensure_ascii=False), flag))
    if pre in ('c', 'b', 'E', 'V'):
        for fam, ids in byfam.items():
            print('      %s: %s' % (fam, ' '.join(sorted('%s:%s' % (k, v) for k, v in ids.items()))))
