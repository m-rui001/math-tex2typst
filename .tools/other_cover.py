# -*- coding: utf-8 -*-
# 主线2 覆盖核对：以冻结的 .tools/other_queue.txt 行号为唯一口径，报告每行是否已有专篇。
# 为什么冻结：笔记 §0 登记写的是"其他队列第 NN 行号"，若每次都重排号，已落盘的登记会集体失效。
#   python .tools/other_cover.py            # 汇总 + 写 .tools/other_cover.txt
#   python .tools/other_cover.py D177 D193  # 只报这些号的登记与主对象是否对得上
#   python .tools/other_cover.py --wave     # 报 inflight.txt 里每个号：结构判据+登记，READY 才可摘号
#   python .tools/other_cover.py --collect  # 在 --wave 之上做两次量测状态机：连续两次 READY 且字节不变就自动摘号
import io, os, re, glob, sys, json, time

srcpat = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._\-()]*)')
qpat = re.compile(u'(\\s*其他)?\\s*队列第\\s*(\\d+)\\s*行号')


def norm(s):
    return re.sub(r'[^a-z0-9]', '', s.lower())


F = '.tools/inflight.txt'
ST = '.tools/collect_state.json'
GAP = 600  # 秒：两次量测的最小间隔
rows = []
for l in io.open('.tools/other_queue.txt', encoding='utf-8').read().split('\n'):
    if l.strip():
        p = l.split()
        rows.append((p[0], p[1], int(p[2])))
# O = 主线2 冻结台账行号，L = 主线1 的 162 行队列号；两者的 §0 登记短语不同但都要核对。
qdir = dict((r[1], ('O', r[0])) for r in rows)
for i, l in enumerate(io.open(u'.tools/lean_queue.txt', encoding='utf-8').read().split('\n')):
    s = l.strip()
    if s:
        qdir.setdefault(re.sub(r'^L\d+-', '', s).split('/')[0], ('L', str(i + 1)))

notes = {}
for p in glob.glob(u'研究笔记/*.md'):
    b = os.path.basename(p)
    m = re.match(r'^(D\d+|\d{3})-', b)
    if m:
        notes[m.group(1)] = p

owner = {}
for k in sorted(notes):
    t = io.open(notes[k], encoding='utf-8', errors='replace').read()
    d = None
    for m in srcpat.findall(t):
        if m in qdir:
            d = m
            break
    decls = [('O' if o else 'L', n) for o, n in qpat.findall(t[:5000])]
    owner[k] = (d, decls, len(t.encode('utf-8')))

byrow = {}
for k, (d, decls, size) in owner.items():
    if d:
        byrow.setdefault(qdir[d], []).append((k, decls, size))

want = sys.argv[1:]
COLLECT = '--collect' in want
if '--wave' in want or COLLECT:
    inf_ids = io.open(F, encoding='utf-8').read().split()
    # --collect 连没落盘的号也要报出来（NOFILE 行），否则刚派出的写手看起来像掉单。
    want = inf_ids if COLLECT else [k for k in inf_ids if k in notes]
out = []
seen = {}
if want:
    sys.argv = ['other_cover']
    import gate
    for k in sorted(set(x.rstrip('-') for x in want)):
        if k not in owner:
            out.append(u'%-5s NOFILE' % k)
            continue
        d, decls, size = owner[k]
        exp = qdir.get(d) if d else None
        match = bool(exp and exp in decls)
        g = gate.chk(notes[k], quiet=True)
        age = int(time.time() - os.path.getmtime(notes[k]))
        seen[k] = (not g['problems'] and match, g['size'])
        out.append(u'%-5s size=%7d math=%5d rows=%3d secs=%2d age=%4ds contig=%s row=%s decl=%s '
                   u'match=%s %s'
                   % (k, g['size'], g['math'], g['rows'], g['secs'], age, g['contig'],
                      '%s%s' % exp if exp else u'-',
                      ','.join('%s%s' % x for x in decls) or u'-',
                      u'YES' if match else u'NO',
                      u' '.join(g['problems']) if g['problems'] else u'READY'))
# --collect：把"两次量测才收稿"这条纪律落到磁盘上，不靠本体记忆。
# 摘号条件 = 上一轮和本轮都 READY(含 §0 登记对得上) 且字节数一模一样（说明写手已停笔、也没被外部回滚）。
if COLLECT and seen:
    st = {}
    if os.path.exists(ST):
        st = json.loads(io.open(ST, encoding='utf-8').read())
    taken = []
    for k in sorted(seen):
        ok, size = seen[k]
        prev = st.get(k) or {}
        # 两次量测必须隔开（默认 600 秒），否则同一分钟里连跑两次 --collect 就等于只量了一次。
        if ok and prev.get('ok') and prev.get('size') == size \
                and time.time() - prev.get('ts', 0) >= GAP:
            taken.append(k)
            st.pop(k, None)
        else:
            # 同一 size 的首次 READY 时间要留住，否则每轮轮询都把 600 秒计时器清零，永远摘不了号。
            same = prev.get('ok') and prev.get('size') == size
            st[k] = {'ok': ok, 'size': size,
                     'ts': prev.get('ts') if same else int(time.time())}
    if taken:
        inf = io.open(F, encoding='utf-8').read().split()
        io.open(F, 'w', encoding='utf-8', newline=u'\n').write(
            ' '.join(x for x in inf if x not in taken) + '\n')
        for k in taken:
            out.append(u'%s TAKEN twice-READY size=%d' % (k, seen[k][1]))
    io.open(ST, 'w', encoding='utf-8', newline=u'\n').write(json.dumps(st))

covered = set(byrow)
ocover = set(r for r in covered if r[0] == 'O')
okdecl = [r for r in ocover if any(decls for (_k, decls, _s) in byrow[r])]
out.append(u'queue=%d covered=%d remaining=%d covered-with-decl=%d lean-covered=%d'
           % (len(rows), len(ocover), len(rows) - len(ocover), len(okdecl),
              len(covered) - len(ocover)))
# 全队列结构合规普查：covered 只说明"有笔记提到了这篇"，收尾审计要的是"覆盖它的那篇笔记本身过闸门"。
# --wave 只量在飞的号，这里补上"已covered但结构不达标"的号，免得把顺带提一句题名的旧稿当成专篇。
if '--audit' in sys.argv:
    sys.argv = ['other_cover']
import gate
ready, weak = 0, []
for r in sorted(covered):
    best = None
    for (k, _decls, _s) in byrow[r]:
        g = gate.chk(notes[k], quiet=True)
        if not g['problems']:
            best = (k, g, None)
            break
        if best is None or g['size'] > best[1]['size']:
            best = (k, g, u' '.join(g['problems']))
    if best[2] is None:
        ready += 1
    else:
        k, g, pb = best
        weak.append(u'  %-5s O=%s row=%s size=%7d math=%5d rows=%3d %s'
                    % (k, r[0], r[1], g['size'], g['math'], g['rows'], pb))
out.append(u'covered-ready=%d covered-weak=%d' % (ready, len(weak)))
out.extend(weak[:40])
sys.stdout.buffer.write((u'\n'.join(out) + u'\n').encode('utf-8'))
io.open('.tools/other_cover.txt', 'w', encoding='utf-8').write(
    '\n'.join(out) + '\n')
