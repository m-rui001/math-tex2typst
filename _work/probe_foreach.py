"""Which \foreach forms survive expansion?"""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'tools'))
from t2t import cetz  # noqa: E402

PICTURE = re.compile(r'\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}', re.S)
HEAD = re.compile(r'\\foreach\s+.{0,60}', re.S)

forms = collections.Counter()
examples = {}
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
            forms['EXPAND-RETURNED-NONE'] += 1
            examples.setdefault('EXPAND-RETURNED-NONE', (tex.name, HEAD.findall(body)[:1]))
            continue
        for h in HEAD.findall(expanded):
            key = re.sub(r'\s+', ' ', h)[:58]
            forms[key] += 1
            examples.setdefault(key, (tex.name, key))
print('leftover \\foreach heads:')
for k, v in forms.most_common(25):
    print('%5d  %s' % (v, k))
    print('        %s' % examples[k][0][:60])
