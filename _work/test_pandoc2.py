import re, glob, os, sys, json, subprocess, tempfile, collections
sys.path.insert(0, r'E:/math/tools')
from t2t.mathconv import BATCH_PREAMBLE, BATCH_EPILOG, MARK, SENTINEL_RX

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
                        found.append(value)
                except ValueError:
                    pass
        i += 1
    return found

ROOT = r'E:/math/typst'
uniq = set()
for f in sorted(glob.glob(os.path.join(ROOT, '*/main.typ'))):
    text = open(f, encoding='utf-8', errors='replace').read()
    for v in literals(text):
        uniq.add(v)
uniq = sorted(uniq)

# Strong normalizer
def strip_env(latex):
    # Strip BeginAccSupp noise
    latex = re.sub(r'\\BeginAccSupp\{[^}]*\}', '', latex)
    latex = re.sub(r'\\EndAccSupp\{[^}]*\}', '', latex)
    latex = re.sub(r'\\Original(Mapsto|Longmapsto|Mapsfrom|To)\b', r'\\longrightarrow', latex)
    latex = re.sub(r'\\KSOriginalMapsto\b', r'\\longrightarrow', latex)
    # remove the whole equation-like environment wrapper, keep inner content
    for env in ['equation', 'equation*', 'align', 'align*', 'gather', 'gather*',
                'multline', 'flalign', 'eqnarray', 'displaymath', 'split',
                'aligned', 'alignat', 'array', 'cases', 'bmatrix', 'pmatrix',
                'smallmatrix', 'psmallmatrix', 'matrix', 'tikzcd']:
        latex = re.sub(r'\\begin\{' + env + r'\}(\{\d+\})?', r'\\begin{aligned}', latex)
        latex = re.sub(r'\\end\{' + env + r'\}', r'\\end{aligned}', latex)
    # strip labels/tags/refs
    latex = re.sub(r'\\(label|tag|notag|nonumber|ref|eqref|label\*?)\*?\{[^}]*\}', '', latex)
    latex = re.sub(r'\\(vspace|hspace|smallskip|medskip|bigskip)\*?\{[^}]*\}', '', latex)
    # convert rm/bf to mathrm/mathbf (common in rewrite)
    for old, new in [('\\rm', '\\mathrm'), ('\\bf', '\\mathbf'), ('\\it', '\\mathit'),
                     ('\\sf', '\\mathsf'), ('\\tt', '\\mathtt'), ('\\cal', '\\mathcal')]:
        latex = re.sub(r'(?<![A-Za-z])' + old + r'\s+', new + ' ', latex)
        latex = re.sub(r'\{\\' + old[1:] + r'\s+([^{}]*)\}', r'\\' + new[1:] + r'{\1}', latex)
    # textup -> text
    latex = re.sub(r'\\textup', '\\text', latex)
    # mathrel -> (remove, use \rel or spacing)
    latex = re.sub(r'\\mathrel\{', '', latex)
    # varprojlim etc.
    latex = re.sub(r'\\varprojlim', r'\\lim', latex)
    latex = re.sub(r'\\varinjlim', r'\\lim', latex)
    latex = re.sub(r'\\textup', '\\text', latex)
    # Remove \left/\right (pandoc handles but can mis-size)
    return latex

ok = 0; fail = 0
failkeys = collections.Counter()
samples_fail = {}
for ci in range(0, len(uniq), 200):
    chunk = uniq[ci:ci+200]
    parts = []
    for i, c in enumerate(chunk):
        parts.append('%s%06d $ %s $ %s%06d' % (MARK, ci+i, strip_env(c), MARK, ci+i))
    batch = BATCH_PREAMBLE + '\n\n'.join(parts) + BATCH_EPILOG
    with tempfile.NamedTemporaryFile('w', suffix='.tex', delete=False, encoding='utf-8') as fh:
        fh.write(batch); src = fh.name
    dst = src[:-4] + '.out'
    proc = subprocess.run(['pandoc', src, '-f', 'latex', '-t', 'typst', '-o', dst, '--wrap=none'],
                          capture_output=True, text=True, encoding='utf-8', timeout=900)
    out = ''
    if os.path.exists(dst):
        out = open(dst, encoding='utf-8').read()
    spans = [(m.group(0), m.start(), m.end()) for m in SENTINEL_RX.finditer(out)]
    local = {}
    for (tok, _s0, e0), (_t2, s1, _e1) in zip(spans[0::2], spans[1::2]):
        value = out[e0:s1].strip()
        if value.startswith('$') and value.endswith('$') and value != '$ $':
            local[int(tok[len(MARK):])] = value
    for i in range(len(chunk)):
        idx = ci + i
        if idx in local:
            ok += 1
        else:
            fail += 1
            m = re.search(r'\\[A-Za-z]+(\{[^}]*\})?', uniq[idx])
            k = m.group(0) if m else '(other)'
            failkeys[k] += 1
            if k not in samples_fail:
                samples_fail[k] = uniq[idx][:120]
    for p in (src, dst):
        try: os.remove(p)
        except OSError: pass
print('OK:', ok, ' FAIL:', fail, ' rate=%.1f%%' % (100*ok/(ok+fail)))
print()
print('=== fail 原因 top 30 ===')
for k, c in failkeys.most_common(30):
    print(f'{c:5d}  {k}   <- {repr(samples_fail.get(k,""))[:60]}')
