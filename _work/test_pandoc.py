import re, glob, os, sys, json, subprocess, tempfile, collections
sys.path.insert(0, r'E:/math/tools')

# Reuse the scan into a set of unique literals
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
print('unique literals:', len(uniq))

# Build a batch and test pandoc conversion success
from t2t.mathconv import BATCH_PREAMBLE, BATCH_EPILOG, MARK, SENTINEL_RX

def normalize(latex):
    # strip BeginAccSupp noise which pandoc chokes on
    latex = re.sub(r'\\BeginAccSupp\{[^}]*\}', '', latex)
    latex = re.sub(r'\\EndAccSupp\{[^}]*\}', '', latex)
    latex = re.sub(r'\\Original(Mapsto|Longmapsto|Mapsfrom)\b', r'\\longrightarrow', latex)
    latex = re.sub(r'\\KSOriginalMapsto\b', r'\\longrightarrow', latex)
    return latex

chunks = [uniq[i:i+200] for i in range(0, len(uniq), 200)]
ok = 0; fail = 0
failkeys = collections.Counter()
for ci, chunk in enumerate(chunks):
    norm = [normalize(c) for c in chunk]
    parts = []
    for i, c in enumerate(norm):
        parts.append('%s%06d $ %s $ %s%06d' % (MARK, ci*200+i, c, MARK, ci*200+i))
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
        if value.startswith('$') and value.endswith('$'):
            local[int(tok[len(MARK):])] = value
    for i in range(len(chunk)):
        idx = ci*200 + i
        if idx in local and local[idx] != '$ $' :
            ok += 1
        else:
            fail += 1
            # record first marker
            m = re.search(r'\\[A-Za-z]+(\{[^}]*\})?', uniq[idx])
            failkeys[m.group(0) if m else '(other)'] += 1
    for p in (src, dst):
        try: os.remove(p)
        except OSError: pass
print('pandoc OK:', ok, ' FAIL:', fail, ' rate=%.1f%%' % (100*ok/(ok+fail)))
print()
print('=== fail 的原因（前 30）===')
for k,c in failkeys.most_common(30):
    print(f'{c:5d}  {k}')
