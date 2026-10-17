# -*- coding: utf-8 -*-
# dollarmath_residual.py — turn the post-repair gauge rows into the executable bill for
# the sites that are NOT a whitespace-only split: one table per tier, with the live
# 60-char window around the character each probe touched, so the next pass can Edit from
# the page instead of re-measuring.
#   python -X utf8 _work/dollarmath_residual.py
import io, json, sys
from collections import defaultdict
sys.stdout.reconfigure(encoding='utf-8')

rows = [json.loads(l) for l in io.open('_work/dollarmath_flip_final.jsonl', encoding='utf-8') if l.strip()]
by = defaultdict(list)
for r in rows:
    by[r['tier']].append(r)

ORDER = ['T1-WS-SPLIT', 'T3-WS-BUT-NOT-A-SPLIT', 'T3-CROSS-LINE', 'T2-ONLY-DELIM-PROBE', 'T4-NO-REPAIR']
NOTE = {
    'T1-WS-SPLIT': u'有可见空白的修法（闭符与数字之间插一个空格），排版判断留给人',
    'T3-WS-BUT-NOT-A-SPLIT': u'删空格能消旗标，但那枚空格是引文里的词间空格，删了改字面',
    'T3-CROSS-LINE': u'拒渲式本身就跨行：缺的是闭符本体，属跨多行行内式族',
    'T2-ONLY-DELIM-PROBE': u'只有破坏定界符（翻成反引号／加反斜杠／删掉）才消旗标，真元凶在上游',
    'T4-NO-REPAIR': u'任何单字符改动都消不掉',
}
out = []
out.append(u'# dollar-in-math 残留工单\n')
out.append(u'读数来自修好之后的第二遍 _work/dollarmath_flip_search.js。'
            u'每行给出：篇:行、判形、被探针碰过的那个字符前后各 30 字符。\n')
for t in ORDER:
    rs = sorted(by.get(t, []), key=lambda r: (r['file'], r['line']))
    if not rs:
        continue
    out.append(u'\n## %s %d 处／%d 篇 — %s' % (t, len(rs), len(set(r['file'] for r in rs)), NOTE[t]))
    for r in rs:
        nm = r['wsClear'][0] if r['wsClear'] else r['verdict']
        win = r['win'].get(nm, u'')
        out.append(u'%s:%d  %s  $=%d `=%d vetoes=%s' % (
            r['file'], r['line'], nm.split('@')[0], r['dollarsOnLine'], r['backticksOnLine'],
            u','.join(r['vetoes'])))
        out.append(u'    %s' % win.replace(u'\n', u'\\n'))
io.open(u'_work/dollarmath_residual.md', 'w', encoding='utf-8').write(u'\n'.join(out) + u'\n')
print(u'sites=%d files=%d tiers=%s' % (len(rows), len(set(r['file'] for r in rows)),
      u' '.join(u'%s=%d' % (t, len(by[t])) for t in ORDER if t in by)))
