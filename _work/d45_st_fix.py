import io, sys, glob, subprocess
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
B = chr(92)
NL = chr(10)

# Credential: preprints/An-explicit-counterexample-to-the-Auslander-Reiten-conjecture-
# September-23-2026/build/main.tex
#   \DeclareMathOperator{\End}{End}
#   \newcommand{\stEnd}[2]{\underline{\End}_{#1}(#2)}
#   \newcommand{\stHom}[3]{\underline{\Hom}_{#1}(#2,#3)}
# KaTeX has no \DeclareMathOperator; this note's prevailing upright-operator form is
# \operatorname{...} (271 occurrences), so the expansion keeps the note's own shape.
SITES = [
    (388, B + u'stEnd', B + u'underline{' + B + u'operatorname{End}}', 24),
    (422, B + u'stHom', B + u'underline{' + B + u'operatorname{Hom}}', 24),
]

p = glob.glob(u'研究笔记/D45-*.md')[0]
raw = io.open(p, 'rb').read()
b0 = len(raw)
ls = raw.decode('utf-8').split(NL)
print('note', p, 'bytes', b0, 'cr', raw.count(chr(13).encode()), 'lines', len(ls))

for ln, bad, good, delta in SITES:
    l = ls[ln - 1]
    assert l.count(bad) == 1, (ln, 'expected exactly one ' + bad, l.count(bad))
    assert B + u'st' + u'Hom' not in good and B + u'st' + u'End' not in good
    nl = l.replace(bad, good)
    assert nl.count(bad) == 0
    assert nl.count(chr(36)) % 2 == 0 and nl.count(chr(96)) % 2 == 0, (ln, 'parity')
    assert len(nl.encode('utf-8')) - len(l.encode('utf-8')) == delta, (ln, delta, len(nl.encode('utf-8')) - len(l.encode('utf-8')))
    ls[ln - 1] = nl

out = (NL.join(ls)).encode('utf-8')
assert len(out) - b0 == sum(d for _, _, _, d in SITES), (len(out) - b0)
assert out.count(NL.encode()) == raw.count(NL.encode())
assert out.count(chr(13).encode()) == 0
t2 = out.decode('utf-8')
assert t2.count(B + u'stEnd') == 0, 'stEnd residue'
# residue of \stHom must be exactly the 14 quoted/copy-block occurrences elsewhere
print('stHom residue file-wide', t2.count(B + u'stHom'))

if '--apply' in sys.argv:
    io.open(p, 'wb').write(out)
    print('APPLIED bytes', b0, '->', len(out))
    for cmd in (['python', '_work/gate_one.py', 'D45'], ['python', '.tools/sweep.py', 'D45']):
        r = subprocess.run(cmd, capture_output=True, text=True, errors='replace')
        print(r.stdout.strip()[:300])
    r = subprocess.run(['python', '_work/gate_one.py', 'D45'], capture_output=True, text=True, errors='replace')
    print('post-gate', r.stdout.strip()[:220])
else:
    print('DRY-RUN ok, delta', len(out) - b0)
