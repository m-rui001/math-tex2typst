import io, os, re, glob

SRC = {
 'D26': 'E:/math/preprints/A-doubling-Hilbert-subset-with-no-finite-dimensional-bi-Lipschitz-embedding-September-25-2026/build',
 'D30': 'E:/math/preprints/A-negatively-pinched-Kahler-threefold-without-bounded-holomorphic-coordinates-September-25-2026/build',
 'D77': 'E:/math/preprints/The-Deligne-Drinfeld-conjecture-September-23-2026/build',
 'D106': 'E:/math/preprints/two-limit-cycles-for-quintic-lienard-systems-September-24-2026/build',
 'D238': 'E:/math/preprints/A-power-saving-for-square-difference-free-sets-September-24-2026/build',
}

PATTERNS = {
 'def_inner': re.compile(r'\\(newcommand|renewcommand|providecommand|def)\s*\{?\s*\\inner\b'),
 'def_root': re.compile(r'\\(newcommand|renewcommand|providecommand|def)\s*\{?\s*\\root\b'),
 'def_two': re.compile(r'\\(newcommand|renewcommand|providecommand|def)\s*\{?\s*\\two\b'),
 'def_math_bare': re.compile(r'\\(newcommand|renewcommand|providecommand|def)\s*\{?\s*\\math\b'),
 'use_root': re.compile(r'\\root(?![A-Za-z])'),
 'use_two': re.compile(r'\\two(?![A-Za-z])'),
 'use_math_bare': re.compile(r'\\math(?![A-Za-z])'),
 'use_inner': re.compile(r'\\inner(?![A-Za-z])'),
 'use_bare_P': re.compile(r'\\P(?![A-Za-z])'),
 'use_mathcalZ_mathP': re.compile(r'\\mathcal\s*\{?Z\}?_\{?\\math\s'),
 'def_P': re.compile(r'\\(re)?newcommand\s*\{?\\P\}?'),
}

RANGES = {
 'D238': [('sections/functional.tex', 28, 60)],
 'D26': [('main.tex', 14, 24), ('main.tex', 196, 208)],
 'D106': [('sections/model.tex', 1, 40)],
}

out = io.open('E:/math/_work/probe_source.txt', 'w', encoding='utf-8')
for tag, d in SRC.items():
    texs = sorted(glob.glob(os.path.join(d, '**', '*.tex'), recursive=True))
    out.write('=' * 100 + '\n%s  %s  (%d .tex under build/)\n' % (tag, d, len(texs)))
    for name, rx in PATTERNS.items():
        n = 0
        locs = []
        for t in texs:
            txt = io.open(t, encoding='utf-8', errors='replace').read()
            for i, line in enumerate(txt.split('\n'), 1):
                for m in rx.finditer(line):
                    n += 1
                    if len(locs) < 14:
                        locs.append('    %s:%d | %s' % (os.path.relpath(t, d).replace('\\', '/'), i, line.strip()[:170]))
        out.write('  %-22s total=%d\n' % (name, n))
        for l in locs:
            out.write(l + '\n')
    out.write('\n')

for tag, rs in RANGES.items():
    out.write('#' * 100 + '\nVERBATIM RANGES for %s\n' % tag)
    for rel, a, b in rs:
        p = os.path.join(SRC[tag], rel.replace('\\', '/').replace('/', os.sep))
        lines = io.open(p, encoding='utf-8', errors='replace').read().split('\n')
        out.write('--- %s lines %d-%d ---\n' % (rel, a, b))
        for i in range(a, min(b, len(lines)) + 1):
            out.write('%5d| %s\n' % (i, lines[i - 1]))
out.close()
print('ok')
