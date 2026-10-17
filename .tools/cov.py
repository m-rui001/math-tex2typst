import io, os, re

q = io.open(r'E:\math\.tools\lean_queue.txt', encoding='utf-8', errors='replace').read().split('\n')
nd = r"E:\math\研究笔记"
notes = {}
for fn in os.listdir(nd):
    if fn.startswith('D') and fn.endswith('.md'):
        notes[fn] = io.open(os.path.join(nd, fn), encoding='utf-8', errors='replace').read().lower()

stop = set('a an the of and on in for to with without that this its it is as by from new old two three four every all some'.split())
months = set('january february march april may june july august september october november december'.split())

res = []
for i, line in enumerate(q, 1):
    d = line.strip()
    if not d:
        continue
    head = d.replace('\\', '/').split('/')[0]
    toks = [t for t in re.split(r'[^A-Za-z]+', head)
            if len(t) >= 5 and t.lower() not in stop and t.lower() not in months]
    best = None
    bestscore = 0
    for fn, txt in notes.items():
        s = sum(1 for t in toks if t.lower() in txt)
        if s > bestscore:
            bestscore = s
            best = fn
    need = max(min(3, len(toks)), (2 * len(toks) + 2) // 3)
    res.append((i, len(toks), bestscore, need, best, head))

cov = [r for r in res if r[2] >= r[3]]
op = [r for r in res if r[2] < r[3]]
out = io.open(os.path.join(nd, '覆盖映射.md'), 'w', encoding='utf-8', newline='')
out.write("# 覆盖映射（162 篇 Lean 队列 → 笔记）\n\n")
out.write("生成：2026-10-08 18:08，脚本 /tmp/cov.py。方法：从 preprints 目录名切出长度 >=5 的非停用词 token，统计每篇笔记命中的 token 数，阈值 max(3, 2/3·token 数)；不足即 OPEN。口径提示：**D## 是派遣序号，不等于队列行号**（行 18=D28、行 24=D35、行 42=D53、行 51=D57、行 53=D58、行 56=D56、行 60=D54）。OPEN 里可能含刚派出、正文还没引用目录名的篇目，派单前务必先 ls 查同名文件。\n\n")
out.write("统计：COVERED %d / OPEN %d\n\n" % (len(cov), len(op)))
out.write("## 已覆盖（行号 | 命中/token | 笔记）\n\n")
for r in cov:
    out.write("%3d | %d/%d | %s\n" % (r[0], r[2], r[1], r[4]))
out.write("\n## 未覆盖（行号 | token 数 | 目录名）\n\n")
for r in op:
    out.write("%3d | tok %d best:%d (%s) | %s\n" % (r[0], r[1], r[2], r[4], r[5]))
out.close()
print("covered", len(cov), "open", len(op))
