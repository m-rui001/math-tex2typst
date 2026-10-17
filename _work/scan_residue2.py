"""Census of LaTeX residue left in the emitted Typst sources."""
import collections
import json
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]

PATTERNS = {
    'raw_backslash_macro': re.compile(r'\\[a-zA-Z]{2,}'),
    'unconverted_block': re.compile(r'#unconverted\('),
    'latex_begin_env': re.compile(r'\\begin\{'),
    'sentinel_leftover': re.compile(r'ZQT2T|ZQFX'),
    'raw_dollar_string': re.compile(r'\$\s*"'),
    'display_raw': re.compile(r'^\s*\$\s*\\'),
}

macro_counts = collections.Counter()
totals = collections.Counter()
files_hit = collections.Counter()
samples = collections.defaultdict(list)

for typ in sorted((ROOT / 'typst').glob('*/main.typ')):
    text = typ.read_text(encoding='utf-8', errors='replace')
    for label, rx in PATTERNS.items():
        hits = rx.findall(text)
        if hits:
            totals[label] += len(hits)
            files_hit[label] += 1
            if len(samples[label]) < 4:
                samples[label].append((typ.parent.name, str(hits[:3])[:120]))
    for m in re.finditer(r'\\([a-zA-Z]{2,})', text):
        macro_counts[m.group(1)] += 1

print('-- residue classes --')
for label, n in totals.most_common():
    print('%7d occurrences in %4d files  %s' % (n, files_hit[label], label))
    for name, s in samples[label][:2]:
        print('        %s: %s' % (name[:50], s))

print('\n-- top backslash macros --')
for name, n in macro_counts.most_common(30):
    print('%7d  \\%s' % (n, name))

print('\n-- unconverted math samples from reports --')
unconv = collections.Counter()
for rp in (ROOT / 'typst').glob('*/report.json'):
    r = json.loads(rp.read_text(encoding='utf-8'))
    for s in (r.get('samples') or {}).get('math_unconverted', []) or []:
        unconv[s[:60]] += 1
for s, n in unconv.most_common(25):
    print('%4d  %s' % (n, s))
print('distinct sampled:', len(unconv))
