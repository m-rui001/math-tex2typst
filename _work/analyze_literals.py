import re, glob, os, sys, collections, json

ROOT = r'E:/math/typst'

def literals(text):
    inside = False
    i = 0
    found = []
    while i < len(text):
        if text[i] == '\\':
            i += 2
            continue
        if text[i] == '$':
            inside = not inside
        elif text[i] == '"':
            start = i
            i += 1
            while i < len(text):
                if text[i] == '\\':
                    i += 2
                    continue
                if text[i] == '"':
                    break
                i += 1
            if inside:
                try:
                    value = json.loads(text[start:i+1])
                    if '\\' in value:
                        found.append((start, i+1, value))
                except ValueError:
                    pass
        i += 1
    return found

MARKERS = [
    r'\begin{align', r'\begin{equation', r'\begin{aligned', r'\begin{array',
    r'\begin{gather', r'\begin{cases', r'\begin{tikzpicture', r'\begin{matrix',
    r'\begin{smallmatrix', r'\begin{split', r'\begin{CD', r'\begin{enumerate',
    r'\begin{itemize', r'\begin{theorem', r'\begin{proof', r'\text{',
    r'\operatorname', r'\mathrm{', r'\mathbb{', r'\mathcal{', r'\mathbf{',
    r'\frac{', r'\phi', r'\label{', r'\ref{', r'\cite{', r'\left', r'\right',
    r'\sum', r'\int', r'\begin{',
]

freq = collections.Counter()
samples = {}
total = 0
paper_hits = 0
for f in sorted(glob.glob(os.path.join(ROOT, '*/main.typ'))):
    text = open(f, encoding='utf-8', errors='replace').read()
    ls = literals(text)
    if ls:
        paper_hits += 1
    for s, e, v in ls:
        total += 1
        key = None
        for marker in MARKERS:
            if marker in v:
                key = marker
                break
        if key is None:
            m = re.search(r'\\[A-Za-z]+', v)
            key = m.group(0) if m else '(no backslash cmd)'
        freq[key] += 1
        if key not in samples:
            samples[key] = v[:200]

print('论文数(含 literals):', paper_hits)
print('literal 总数:', total)
print()
print('=== 按首个 latex 标记统计 ===')
for k, c in freq.most_common(50):
    print(f'{c:6d}  {k}')
print()
print('=== 样例 ===')
for k in list(freq.keys())[:30]:
    print('---', k, '---')
    print('   ', repr(samples.get(k, ''))[:140])
