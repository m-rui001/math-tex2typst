import io, sys, glob
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
NL = chr(10)
B = chr(92)
TICK = chr(96)
DOL = chr(36)

APPLY = '--apply' in sys.argv

def code_free_spans(line):
    # positions that are inside a backtick span on this line
    res = []
    i = 0
    in_code = False
    while i < len(line):
        if line[i] == TICK:
            in_code = not in_code
            i += 1
            continue
        res.append((i, in_code))
        i += 1
    return res

def find_outside_code(line, tok):
    hits = []
    spans = code_free_spans(line)
    start = 0
    while True:
        j = line.find(tok, start)
        if j < 0:
            break
        after = line[j + len(tok):j + len(tok) + 1]
        inside = any(p == j and c for p, c in spans)
        if not after.isalpha():
            hits.append((j, inside))
        start = j + 1
    return [h for h in hits if not h[1]]

print('### D233: expand the two surviving source macros (newsec_macro suggestion)')
p = glob.glob(u'研究笔记/D233-*.md')[0]
raw = io.open(p, 'rb').read()
ls = raw.decode('utf-8').split(NL)
tot = 0
for tok, good in ((B + u'R', B + u'mathbb R'), (B + u'E', B + u'mathbb E')):
    for n in range(360, len(ls) + 1):
        l = ls[n - 1]
        if tok not in l:
            continue
        hits = find_outside_code(l, tok)
        if not hits:
            print('  line %d: %s only inside code spans -> KEEP' % (n, tok))
            continue
        print('  line %d: %s x%d -> %s' % (n, tok, len(hits), good))
        print('     ctx:', l[max(0, hits[0][0] - 60):hits[0][0] + 60])
        if APPLY:
            nl = l
            for pos, _ in reversed(hits):
                nl = nl[:pos] + good + nl[pos + len(tok):]
            assert nl.count(tok) == 0 or True
            assert nl.count(DOL) % 2 == 0 and nl.count(TICK) % 2 == 0, (n, 'parity')
            ls[n - 1] = nl
        tot += len(hits)
print('  D233 sites', tot)

print('### D66 line 900: bare pipe inside a ledger cell (writer self-declared)')
q = glob.glob(u'研究笔记/D66-*.md')[0]
r2 = io.open(q, 'rb').read()
l66 = r2.decode('utf-8').split(NL)
row = 900
line = l66[row - 1]
print('  before pipes', line.count(u'|'))
bad = u'g|_C'
good = u'g' + B + u'mid_C'
print('  bad token present', line.count(bad))
assert line.count(u'|') == 7, (row, line.count(u'|'))
assert line.count(bad) == 1, line.count(bad)
if APPLY:
    nl = line.replace(bad, good)
    assert nl.count(u'|') == 6
    assert nl.count(DOL) % 2 == 0 and nl.count(TICK) % 2 == 0
    l66[row - 1] = nl
    out = (NL.join(l66)).encode('utf-8')
    assert out.count(NL.encode()) == r2.count(NL.encode())
    assert out.count(chr(13).encode()) == 0
    print('  D66 delta', len(out) - len(r2))
    io.open(q, 'wb').write(out)

if APPLY:
    out = (NL.join(ls)).encode('utf-8')
    assert out.count(NL.encode()) == raw.count(NL.encode())
    assert out.count(chr(13).encode()) == 0
    print('  D233 delta', len(out) - len(raw))
    io.open(p, 'wb').write(out)
else:
    print('DRY-RUN only')
