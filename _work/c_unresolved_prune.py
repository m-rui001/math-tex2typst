# -*- coding: utf-8 -*-
# 登记表自清：c_macro_unresolved.txt 只该登「今天盘上还剩着、且机械链给不出形」的站点。
# 判据只看普查（同一把尺）：这个 (稿号, 宏名) 今天在 _c_sites.jsonl 里还有站点就留，一站点都没有就撤。
# 不用「ops_for 有没有规则」当判据——有规则但实参绑不上（C16 \rfdown 那两枚）盘上照旧渲不出，撤了就是假清零。
# 用法：python -X utf8 _work/c_unresolved_prune.py [--apply]
import io, json, sys, collections

sys.stdout.reconfigure(encoding='utf-8')
REG = u'_work/c_macro_unresolved.txt'
SITES = u'_work/_c_sites.jsonl'

live = set()
for l in io.open(SITES, encoding='utf-8'):
    if not l.strip():
        continue        # 全根零站点时普查只落一个空行
    r = json.loads(l)
    if r.get(u'tok'):
        live.add((r[u'file'].split(u'-')[0], r[u'tok']))

lines = [l.rstrip(u'\n') for l in io.open(REG, encoding='utf-8') if l.strip()]
keep, drop = [], []
for l in lines:
    f = l.split(u'\t')
    cid, tok = f[0], f[1]
    (keep if (cid, tok) in live else drop).append(l)
print('在册=%d 盘上仍有站点=%d 撤（普查零站点）=%d' % (len(lines), len(keep), len(drop)))
for l in drop:
    cid, tok = l.split(u'\t')[0], l.split(u'\t')[1]
    print('   撤：%s\t%s' % (cid, tok))
if '--apply' in sys.argv:
    io.open(REG, 'w', encoding='utf-8', newline=u'\n').write(
        u'\n'.join(keep) + (u'\n' if keep else u''))
    print('APPLIED')
else:
    print('DRY（未落盘）')

