"""Where does the residual PDF plumbing live after strip_pdf_noise?"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'tools'))
from t2t import prep  # noqa: E402

NOISE = re.compile(r'\\(?:pdfliteral|BeginAccSupp|EndAccSupp|csname|expandafter'
                   r'|ActualText|begingroup)')

NAMES = ['Sharp-integral-fillings', 'The-canonical-massive-continuum-limit',
         'Generic-C1-Future-Inextendibility', 'standalone-mezard-parisi']

for stem in NAMES:
    path = next(iter(sorted((ROOT / '_work' / 'flat').glob(stem + '*.tex'))), None)
    if path is None:
        print('MISSING', stem)
        continue
    text = path.read_text(encoding='utf-8', errors='replace')
    pre, body = prep.split_document(text)
    out = prep.strip_pdf_noise(pre)
    hits = list(NOISE.finditer(out))
    print('\n=== %s: pre noise %d -> %d ; body noise %d' %
          (path.name[:48], len(NOISE.findall(pre)), len(hits), len(NOISE.findall(body))))
    shown = 0
    for m in hits:
        line_start = out.rfind('\n', 0, m.start()) + 1
        line = out[line_start:out.find('\n', m.start())]
        # what statement encloses it?
        head = out.rfind('\n', 0, max(0, m.start() - 300)) + 1
        print('   %s' % line.strip()[:150])
        shown += 1
        if shown >= 6:
            break
