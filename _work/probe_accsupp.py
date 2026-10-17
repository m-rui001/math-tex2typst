"""Are the accessibility definitions in the preamble or the body? Who expands them?"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'tools'))
from t2t import prep, mathconv  # noqa: E402

flat = next(iter(sorted((ROOT / '_work' / 'flat').glob('Sharp-integral-fillings*.tex'))))
text = flat.read_text(encoding='utf-8', errors='replace')
doc = text.find('\\begin{document}')
hits = [m.start() for m in re.finditer(r'\\(?:renewcommand|newcommand|let)[^\n]{0,60}(?:PaperArrowText|hookrightarrow|pdfliteral)', text)]
print('document starts at', doc, 'of', len(text))
for h in hits[:8]:
    print('  def at %7d  %s  %s' % (h, 'PREAMBLE' if h < doc else 'BODY',
                                     repr(text[h:h + 90])[:110]))

pre, body = prep.split_document(text)
p = prep.parse_preamble(pre)
print('\nmacro table has PaperArrowText:', '\\PaperArrowText' in p.macros)
print('hookrightarrow in table:', '\\hookrightarrow' in p.macros)
print('skipped defs mentioning arrow/accsupp:',
      [s[0] for s in p.skipped_defs if 'hook' in s[0] or 'Arrow' in s[0] or 'mapsto' in s[0]][:6])

# does the soup survive into the body after our own expansion?
expanded = prep.expand_macros(body, p.macros)
print('\nour expansion leaves pdfliteral in body:', expanded.count('\\pdfliteral'),
      ' begingroup:', expanded.count('\\begingroup'))

# and what does pandoc do with the cleaned preamble + body?
snippet = re.search(r'\$\([^$]{0,80}\\hookrightarrow[^$]{0,80}\$', expanded)
if snippet:
    out, err = mathconv.run_pandoc(mathconv.BATCH_PREAMBLE + snippet.group(0) + mathconv.BATCH_EPILOG)
    print('\npandoc on a bare \\hookrightarrow formula:', repr(out.strip())[:160])
    print('stderr:', err[:200])
