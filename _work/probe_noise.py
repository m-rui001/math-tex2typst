"""Prevalence of the LaTeX constructs behind pandoc's refused formulas."""
import collections
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]

PATTERNS = [
    ('accsupp', r'\\BeginAccSupp'),
    ('pdfliteral', r'\\pdfliteral'),
    ('begingroup', r'\\begingroup'),
    ('csname', r'\\csname'),
    ('mathchoice', r'\\mathchoice'),
    ('tikzcd', r'\\begin\{tikzcd\}'),
    ('bf-nospace', r'\{\\bf[A-Za-z0-9]'),
    ('FK-macro', r'\\FK\b'),
    ('renew-mapsto', r'\\renewcommand\{\\mapsto\}'),
    ('MathActualText', r'\\MathActualText'),
]

counts = collections.Counter()
files = collections.Counter()
for path in sorted((ROOT / '_work' / 'flat').glob('*.tex')):
    text = path.read_text(encoding='utf-8', errors='replace')
    for label, rx in PATTERNS:
        n = len(re.findall(rx, text))
        if n:
            counts[label] += n
            files[label] += 1

for label, _ in PATTERNS:
    print('%8d in %3d files  %s' % (counts[label], files[label], label))

print('\n-- context around \\FK{ in the conformal-limits paper --')
target = ROOT / '_work/flat/Canonical-conformal-limits-of-subcritical-FK-planar-maps-September-24-2026.tex'
text = target.read_text(encoding='utf-8', errors='replace')
for m in list(re.finditer(re.escape('\\FK'), text))[:4]:
    print(repr(text[max(0, m.start() - 120):m.start() + 120]))
print('\n-- definitions mentioning FK --')
for m in re.finditer(r'\\(?:newcommand|renewcommand|def|let)[^\n]{0,120}FK[^\n]{0,80}', text):
    print(repr(m.group(0))[:200])
