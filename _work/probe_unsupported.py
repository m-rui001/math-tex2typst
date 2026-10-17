"""What exactly triggers each UNSUPPORTED match?"""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'tools'))
from t2t import cetz  # noqa: E402

PICTURE = re.compile(r'\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}', re.S)
FOREACH_HEAD = re.compile(r'\\foreach[^{]{0,80}\{')
hits = collections.Counter()
ctx = collections.defaultdict(list)
foreach_heads = collections.Counter()

for tex in sorted((ROOT / '_work' / 'flat').glob('*.tex')):
    text = tex.read_text(encoding='utf-8', errors='replace')
    for pic in PICTURE.findall(text):
        m = re.match(r'\\begin\{tikzpicture\}', pic)
        body = pic[m.end():].lstrip()
        if body[:1] == '[':
            body = body[cetz.bracketed(body, 0)[1]:]
        body = body[:body.rfind('\\end{tikzpicture}')]
        expanded = cetz.expand_foreach(body)
        if expanded is None:
            hits['foreach-expand-failed'] += 1
            for h in FOREACH_HEAD.findall(body)[:2]:
                foreach_heads[re.sub(r'\s+', ' ', h)[:70]] += 1
            continue
        hit = cetz.UNSUPPORTED.search(expanded)
        if hit:
            key = hit.group(0).strip('\\ ')
            hits['unsupported:' + key] += 1
            if len(ctx[key]) < 3:
                s = max(0, hit.start() - 45)
                ctx[key].append(re.sub(r'\s+', ' ', expanded[s:hit.end() + 45]))
            if key == 'foreach':
                for h in FOREACH_HEAD.findall(expanded)[:2]:
                    foreach_heads[re.sub(r'\s+', ' ', h)[:70]] += 1
        elif expanded.count('\\foreach'):
            hits['foreach-leftover'] += 1
            for h in FOREACH_HEAD.findall(expanded)[:2]:
                foreach_heads[re.sub(r'\s+', ' ', h)[:70]] += 1

for k, v in hits.most_common():
    print('%5d  %s' % (v, k))
    for c in ctx[k.split(':', 1)[-1]]:
        print('        ...%s...' % c)
print('\n-- foreach head forms --')
for k, v in foreach_heads.most_common(18):
    print('%5d  %s' % (v, k))
