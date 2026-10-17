# -*- coding: utf-8 -*-
# 全库收口轮：对「已交稿」的 C 稿反复「普查 → 逐篇 c_macro_fix --apply」直到残留不再下降。
# 在飞那几篇（--skip 传的）一律不进链，避免与写手抢同一行。
# 用法：python -X utf8 _work/c_sweep_rounds.py C41 C42 C45 C46   （cwd=E:\math）
import io, os, sys, json, glob, re, subprocess
sys.stdout.reconfigure(encoding='utf-8')
SKIP = set(a.upper() for a in sys.argv[1:])
# ONLY=C33,C40 时只碰点名的这几篇（全库那一档要用户明示，默认按篇收）
ONLY = set((os.environ.get('ONLY') or '').upper().split(',')) - {u''}
MAXR = int(os.environ.get('MAXR', '6'))


def census():
    p = subprocess.run(['node', 'katex_census.js', '--root=E:/math/被引笔记', '--prefix=C',
                        '--out=_c.json', '--sites=_c_sites.jsonl'],
                       cwd='_work', capture_output=True, text=True, encoding='utf-8')
    d = json.load(io.open('_work/_c.json', encoding='utf-8'))
    rows = [json.loads(l) for l in io.open('_work/_c_sites.jsonl', encoding='utf-8') if l.strip()]
    mine = [r for r in rows if r['file'].split('-')[0] not in SKIP]
    return d['refused'], sum(d['other'].values()), rows


prev = None
for k in range(MAXR):
    refused, other, rows = census()
    mine = [r for r in rows if r['file'].split('-')[0] not in SKIP]
    print('round %d 全库 refused=%d other=%d｜非在飞站点=%d' % (k, refused, other, len(mine)))
    if prev is not None and refused + other >= prev:
        print('残留不再下降，停'); break
    prev = refused + other
    cids = sorted(set(r['file'].split('-')[0] for r in rows) - SKIP)
    if ONLY:
        cids = [c for c in cids if c in ONLY]
    hit = 0
    for cid in cids:
        if not glob.glob(u'被引笔记/%s-*.md' % cid):
            continue
        p = subprocess.run([sys.executable, '-X', 'utf8', '_work/c_macro_fix.py', cid, '--apply'],
                           capture_output=True, text=True, encoding='utf-8')
        out = (p.stdout or '') + (p.stderr or '')
        if 'APPLIED' in out:
            hit += 1
            for l in out.split('\n'):
                if l.startswith(cid) or '下标位凭据' in l:
                    print('   ', l.strip()[:150])
        elif p.returncode != 0:
            print('   !!', cid, out.strip()[-300:])
    print('   本轮落盘篇数=%d' % hit)
    if not hit:
        print('   无站点可改，停'); break
