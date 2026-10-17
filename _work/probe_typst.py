"""Does pandoc's own line-break form compile inside Typst math?"""
import pathlib
import subprocess

CANDS = [
    ('$a & = b\\\nc & = d$', 'pandoc aligned break'),
    ('$a #linebreak() b$', 'explicit linebreak'),
    ('$cases(delim: "{", a & x, 0 & b)$', 'cases comma rows'),
    ('$cases(delim: "{", a & x; 0 & b)$', 'cases semicolon rows'),
    ('$upright(d e f)_k$', 'bare letter run'),
    ('$upright("a, b")$', 'quoted prose'),
    ('$upright("ab")$', 'merged'),
    ('$upright(bold(1))_(x)$', 'nested call'),
    ('$frac({chevron.l a \\, b chevron.r}, {c})$', 'braced frac'),
]

for src, label in CANDS:
    path = pathlib.Path('_work/cand.typ')
    path.write_text(src + '\n', encoding='utf-8')
    proc = subprocess.run(['typst', 'compile', str(path), '_work/cand.pdf'],
                          capture_output=True, text=True, encoding='utf-8',
                          errors='replace', timeout=120)
    errs = [l for l in (proc.stderr or '').split('\n') if l.startswith('error')]
    print('%-4s %-22s %s %s' % ('OK' if not errs else 'FAIL', label,
                                 src.replace('\n', '\\n')[:52], errs[0][:60] if errs else ''))
