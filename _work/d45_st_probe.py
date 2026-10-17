import io, sys, glob
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
B = chr(92)
TICK = chr(96)
DOL = chr(36)

p = glob.glob(u'研究笔记/D45-*.md')[0]
ls = io.open(p, encoding='utf-8', errors='replace').read().split(chr(10))

def classify(line):
    # returns list of (pos, state) for each occurrence of \stHom / \stEnd
    states = []
    in_code = False
    in_math = False
    i = 0
    n = len(line)
    while i < n:
        c = line[i]
        if c == TICK:
            in_code = not in_code
            i += 1
            continue
        if c == DOL and not in_code:
            if line[i:i+2] == DOL + DOL:
                in_math = not in_math
                i += 2
                continue
            in_math = not in_math
            i += 1
            continue
        if not in_code and line.startswith(B + u'stHom', i):
            states.append((i, u'MATH' if in_math else u'TEXT', u'stHom'))
            i += 6
            continue
        if not in_code and line.startswith(B + u'stEnd', i):
            states.append((i, u'MATH' if in_math else u'TEXT', u'stEnd'))
            i += 6
            continue
        if not in_code and line.startswith(B + u'st', i) and not line.startswith(B + u'stHom', i) and not line.startswith(B + u'stEnd', i):
            tok = line[i:i+8]
            states.append((i, u'MATH' if in_math else u'TEXT', tok))
            i += 3
            continue
        i += 1
    return states

rows = []
for idx, l in enumerate(ls, 1):
    if B + u'st' in l:
        for pos, st, tok in classify(l):
            rows.append((idx, st, tok, l[max(0, pos-45):pos+55]))

print('total occurrences', len(rows))
for idx, st, tok, ctx in rows:
    print('%4d %-5s %-22s | %s' % (idx, st, tok, ctx))
