# -*- coding: utf-8 -*-
# despace_preview.py — print the +/-30 char window of every scheduled whitespace repair,
# before and after, so the bill can be read before anything is written.
#   python -X utf8 _work/despace_preview.py [N]
import io, json, sys
from collections import defaultdict
sys.stdout.reconfigure(encoding='utf-8')

rows = [json.loads(l) for l in io.open('_work/dollarmath_flip_tiers.jsonl', encoding='utf-8') if l.strip()]
ed = defaultdict(list)
for r in rows:
    if r['crosses'] or not r['wsClear']:
        continue
    win = [c for c in r['wsClear'] if r['cands'][c]['spans'] == 1] or r['wsClear']
    nm = win[0]
    ed[r['file']].append((int(nm.split('@')[1]), nm.split('@')[0], r['line'], r['cands'][nm]['spans']))

n = int(sys.argv[1]) if len(sys.argv) > 1 else 10
shown = 0
for f in sorted(ed):
    for off, kind, line, spans in sorted(ed[f], reverse=True):
        raw = io.open(u'研究笔记/' + f, encoding='utf-8').read()
        if kind == 'DESPACE':
            b = raw[off - 31:off + 20]
            a = raw[off - 31:off - 1] + raw[off:off + 20]
        else:
            b = raw[off - 30:off + 21]
            a = raw[off - 30:off + 1] + ' ' + raw[off + 1:off + 22]
        print(u'%s:%d %s spans=%+d' % (f[:26], line, kind, spans))
        print(u'   - %s' % b.replace(u'\n', u'\\n'))
        print(u'   + %s' % a.replace(u'\n', u'\\n'))
        shown += 1
        if shown >= n:
            sys.exit(0)
