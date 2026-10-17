"""Enumerate backslash-escape sequences and other TeX residue in generated Typst."""
import pathlib
import re
import collections

ROOT = pathlib.Path(__file__).resolve().parents[1]

c = collections.Counter()
ex = collections.defaultdict(list)
for f in sorted((ROOT / 'typst').glob('*/main.typ')):
    t = f.read_text(encoding='utf-8', errors='replace')
    for m in re.finditer(r'\\[^a-zA-Z]', t):
        c[m.group(0)] += 1
        if len(ex[m.group(0)]) < 2:
            s = max(0, m.start() - 60)
            ex[m.group(0)].append((f.parent.name[:35], t[s:m.end() + 40].replace('\n', '\\n')))

for k, v in c.most_common():
    print(repr(k), v)
print()
for k in [r'\;', r'\!', r'\:', r'\[', r'\]', r'\{', r'\}', r'\&', r'\%']:
    for n, s in ex.get(k, []):
        print(repr(k), '|', n, '|', repr(s))
