# -*- coding: utf-8 -*-
# C 稿收稿链一条命令跑完：宏表重建 -> sweep 两趟 -> 普查 -> 按素材 preamble 回改 -> 复查 ccheck -> 普查复量 -> INDEX 复跑
# 用法：python _work/c_collect.py C02 [C03 ...]
# 判据全部转调既有量具，本脚本不自己数东西，只串次序与读数。
import io, os, re, json, subprocess, sys, glob

sys.stdout.reconfigure(encoding='utf-8')
os.chdir(r'E:\math')
IDS = [a.upper() for a in sys.argv[1:] if re.match(r'^C\d+$', a)]
assert IDS, '用法：python _work/c_collect.py C02 [C03 ...] [--root=被引笔记]'
ROOT = next((a.split('=', 1)[1] for a in sys.argv if a.startswith('--root=')), u'被引笔记')
REAL = ROOT == u'被引笔记'


def run(cmd, cwd=None):
    r = subprocess.run(cmd, cwd=cwd, shell=True, capture_output=True, text=True,
                       encoding='utf-8', errors='replace')
    return (r.stdout or '') + (r.stderr or '')


def size(cid):
    p = glob.glob(u'%s/%s-*.md' % (ROOT, cid))[0]
    raw = io.open(p, 'rb').read()
    return p, len(raw), raw.count(b'\r'), raw.decode('utf-8').count('\n') + 1


def census(tag):
    """量具只有一把：node katex_census.js 跑全根，读数取它自己写下的两份产物，不另数。"""
    run('node katex_census.js --root=E:\\math\\%s --prefix=C --out=_c.json '
        '--sites=_c_sites.jsonl' % ROOT, cwd=r'E:\math\_work')
    g = json.load(io.open(r'E:\math\_work\_c.json', encoding='utf-8'))
    mine = {}
    # 全根零站点时普查只落一个空行：尺子必须能读「零」这个形。
    for l in io.open(r'E:\math\_work\_c_sites.jsonl', encoding='utf-8'):
        if not l.strip():
            continue
        r = json.loads(l)
        cid = r['file'].split(u'-')[0]
        if cid in IDS:
            mine.setdefault(cid, []).append(r.get('tok') or u'(定界符)')
    per = u' / '.join(u'%s %d 枚=%s' % (k, len(v), ' '.join(sorted(set(v)))) for k, v in sorted(mine.items()))
    return u'%s 全根 refused=%d files_hit=%d other=%d｜本单 %s' % (
        tag, g['refused'], g['filesHit'], len(g.get('other') or {}), per or u'零站点')


print(run('python _work/macro_extract.py').strip().split('\n')[0])
for cid in IDS:
    p, b0, cr0, l0 = size(cid)
    print('==== %s 起点 bytes=%d lines=%d CR=%d' % (os.path.basename(p), b0, l0, cr0))
    if cr0:
        # 落盘禁 CR（规格第 26 条）。C02 那 47 枚实测都在行内（前后皆非 LF），删除无损。
        raw = io.open(p, 'rb').read()
        assert raw.count(b'\r\n') == 0, '掺了 CRLF，先分清行末与行内再动'
        stripped = raw.replace(b'\r', b'')
        assert stripped.count(b'\n') == raw.count(b'\n'), '行数被改动'
        assert len(raw) - len(stripped) == cr0, '字节减量与 CR 枚数对不上'
        io.open(p, 'wb').write(stripped)
        print('   CR 归一：删 %d 枚行内 CR，bytes %d -> %d' % (cr0, b0, b0 - cr0))
        b0 = b0 - cr0
    for _ in range(2):
        print('   sweep:', run('python .tools/sweep.py --root=%s %s' % (ROOT, cid)).strip())
    # 定界符贴紧：`$ x$` 这类半形不算跨度，会使该行其后所有配对错位，普查把它报成 parse error
    #（C13 实测 15 枚半形一清，其后才露出 2 枚真 undef 站点并被下一轮回改吃掉）。
    print('   定界符:', run('python -X utf8 _work/c_dollar_tighten.py --apply %s' % cid).strip().split('\n')[-1])
    # 跨行行内式并入：长公式排到下一行，一行内 `$` 就不成对（ccheck 的 odd_lines；C53 实测 30 行、15 处）。
    # 这一族还压着规格 4.1 的尺子——ccheck 的 spans 正则只认单行 `$…$`，跨行的那批没进数学字节比，
    # 并完 C53 share 29.7%->32.8%。并点在未闭合跨度内部，KaTeX 的数学空格不要钱。
    print('   并线:', run('python -X utf8 _work/c_line_merge.py --apply %s' % cid).strip().split('\n')[-2])
    # 接缝挪到末节：写手先写「## k 与本语料的接缝」再往后追加深度的那批（C26 实测接缝停在 §4、后面还有 §5..§14）。
    # 正文里只要引用了被下移那一段的节号就 NO-SITE 不落盘（C26 只引 §2，在接缝之前，安全）。
    print('   接缝:', run('python -X utf8 _work/c_seam_to_end.py --apply %s' % cid).strip().split('\n')[-2])
if REAL:
    # 回改要成环：KaTeX 每个跨度只报第一枚拒渲宏，所以一层展开会露出下一层
    #（C10 实测 123 枚站点三轮收尽：\bP 族 -> \ME/\nnef -> \SME）。每轮「普查 -> 回改」，
    # 直到本单无可回改站点；八轮是余量，超轮就停下来查凭据表。
    for rnd in range(1, 9):
        if rnd > 1:
            for cid in IDS:
                run('python .tools/sweep.py --root=%s %s' % (ROOT, cid))
        print('  ', census(u'普查%d' % rnd))
        fired = False
        for cid in IDS:
            out = run('python _work/c_macro_fix.py %s --apply --root=%s' % (cid, ROOT)).strip()
            print('   macro:', out.replace('\n', ' / '))
            fired = fired or u'APPLIED' in out
        if not fired:
            break
    for cid in IDS:
        print('   ccheck:', run('python _work/ccheck.py %s' % cid).strip().replace('\n', ' | '))
    print('  ', census(u'普查终'))
else:
    print('   macro/ccheck/普查: 探针根不跑（量具只认 被引笔记/）')
for cid in IDS:
    _, b1, cr1, l1 = size(cid)
    print('   %s 收稿后 bytes=%d lines=%d CR=%d' % (cid, b1, l1, cr1))
if REAL:
    print(run('python _work/index_backfill.py --apply').strip().split('\n')[-1])
