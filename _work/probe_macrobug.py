"""Inspect the two dominant refusal sources in the flat LaTeX itself."""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'tools'))
from t2t import prep  # noqa: E402

name = 'Thomason-Model-Structures-in-Every-Strict-Higher-Dimension-September-23-2026'
flat = next(iter(sorted((ROOT / '_work' / 'flat').glob(name[:40] + '*.tex'))), None)
print('flat file:', flat.name if flat else None)
text = flat.read_text(encoding='utf-8', errors='replace')
print('=== definitions of \\D and \\N ===')
for m in re.finditer(r'\\(?:newcommand|def|renewcommand)\s*\{?\\(?:D|N|U)\}?(?![a-zA-Z])[^\n]{0,90}', text):
    print(repr(m.group(0))[:140])
print('\n=== raw context of \\otimes\\D ===')
for m in list(re.finditer(re.escape('\\otimes') + r'\\D', text))[:2]:
    print(repr(text[max(0, m.start() - 100):m.start() + 100]))

pre, body = prep.split_document(text)
p = prep.parse_preamble(pre)
print('\n=== macro table entries for D/N/U ===')
for k in ('\\D', '\\N', '\\U'):
    mac = p.macros.get(k)
    print(k, None if mac is None else (mac.kind, mac.nargs, (mac.body or mac.alias or '')[:60]))
print('macros in table:', len(p.macros), ' skipped:', len(p.skipped_defs))
expanded = prep.expand_macros(body, p.macros)
m = re.search(r'.{80}\\otimesD.{40}', expanded)
print('\n=== after expansion ===')
print(repr(m.group(0)) if m else 'no \\otimesD found')

print('\n\n########## accsupp soup source ##########')
name2 = 'Sharp-integral-fillings-in-CAT(0)-spaces-September-23-2026'
flat2 = next(iter(sorted((ROOT / '_work' / 'flat').glob(name2[:30] + '*.tex'))), None)
print('flat file:', flat2.name if flat2 else None)
text2 = flat2.read_text(encoding='utf-8', errors='replace')
m = re.search(r'\\mathrel\{\\begingroup.{0,700}', text2, re.S)
print(repr(m.group(0))[:900] if m else 'not literal in source')
for m in re.finditer(r'\\(?:newcommand|renewcommand|def)[^\n]{0,40}(?:hookrightarrow|PaperOriginal)[^\n]{0,160}', text2):
    print('DEF:', repr(m.group(0))[:220])
