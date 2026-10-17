"""Where does the LaTeX residue live: inside verbatim quote blocks or in real output?"""
import collections
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
MACRO = re.compile(r'\\[a-zA-Z]{2,}')
RAWBLOCK = re.compile(r'#raw\(block: true, "(?:[^"\\]|\\.)*"\)', re.S)

inside = collections.Counter()
outside = collections.Counter()
ctx = collections.defaultdict(list)
per_file = collections.Counter()

for typ in sorted((ROOT / 'typst').glob('*/main.typ')):
    text = typ.read_text(encoding='utf-8', errors='replace')
    spans = [m.span() for m in RAWBLOCK.finditer(text)]
    masked = list(text)
    for a, b in spans:
        for m in MACRO.finditer(text, a, b):
            inside[m.group(0)] += 1
        masked[a:b] = [' '] * (b - a)
    rest = ''.join(masked)
    n = 0
    for m in MACRO.finditer(rest):
        outside[m.group(0)] += 1
        n += 1
    if n:
        per_file[typ.parent.name] = n
        for m in list(MACRO.finditer(rest))[:2]:
            if len(ctx[typ.parent.name]) < 2:
                ctx[typ.parent.name].append(rest[max(0, m.start() - 90):m.start() + 110].replace('\n', ' | '))

print('raw-quote blocks: %d macro occurrences inside' % sum(inside.values()))
print('real output:      %d macro occurrences outside, in %d files' % (sum(outside.values()), len(per_file)))
print('\n-- top macros outside raw blocks --')
for k, v in outside.most_common(25):
    print('%6d  %s' % (v, k))
print('\n-- worst files --')
for name, n in per_file.most_common(12):
    print('%6d  %s' % (n, name[:70]))
    for c in ctx[name][:1]:
        print('        ', c[:200])
