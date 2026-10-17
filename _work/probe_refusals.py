"""For each paper: which formulas does pandoc still refuse, and why?"""
import collections
import json
import pathlib
import re
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'tools'))
from t2t import convert as conv  # noqa: E402
from t2t import mathconv, prep  # noqa: E402

CONSTRUCTS = [
    ('pdfliteral', r'\\pdfliteral'),
    ('accsupp', r'\\(?:Begin|End)AccSupp'),
    ('begingroup-let', r'\\begingroup'),
    ('mathchoice', r'\\mathchoice'),
    ('mkern', r'\\mkern'),
    ('mathop-nolimits', r'\\nolimits|\\mathop'),
    ('tikzcd', r'\\begin\{tikzcd\}'),
    ('align-env', r'\\begin\{align'),
    ('cases-env', r'\\begin\{cases\}'),
    ('array-env', r'\\begin\{array\}'),
    ('control-space', r'\\\s'),
    ('custom-macro', r'\\[a-zA-Z]*[A-Z][a-zA-Z]*\b'),
    ('substack', r'\\substack'),
    ('xrightarrow', r'\\x?\\w*(?:rightarrow|leftarrow|mapsto)\b'),
    ('text-with-math', r'\\text\{[^}]*\$'),
    ('overbrace', r'\\(?:over|under)brace'),
    ('hphantom', r'\\[hv]?phantom'),
    ('mathring-widehat', r'\\(?:widehat|widetilde|overline|underline|hat|tilde|bar)\{'),
]


def formulas_of(name):
    src = ROOT / '_work' / 'flat' / (name + '.tex')
    text = src.read_text(encoding='utf-8', errors='replace')
    pre_text, body = prep.split_document(text)
    p = prep.parse_preamble(pre_text)
    pre_text = re.sub(r'\\begingroup[^\n]*\\catcode[^\n]*\\endgroup', '', pre_text)
    pre_text = prep.strip_pdf_noise(pre_text)
    body = prep.strip_pdf_noise(body)
    body = re.sub(r'\\begin\{(PromptQuote|CoTQuote|tikzpicture)\}(.*?)\\end\{\1\}', '', body, flags=re.S)
    body = prep.expand_macros(body, p.macros)
    body = prep.fix_dialect_prose(body)
    body = prep.strip_dropped(body)
    body = re.sub(r'\\label\[[^\]]*\]', r'\\label', body)
    work = ROOT / '_work' / '_probe'
    work.mkdir(exist_ok=True)
    tex = work / (name + '.tex')
    tex.write_text(pre_text + "\\begin{document}\n" + body, encoding='utf-8')
    js = work / (name + '.json')
    subprocess.run([mathconv.PANDOC_BIN, str(tex), '-f', 'latex', '-t', 'json', '-o', str(js)],
                   capture_output=True, text=True, encoding='utf-8', errors='replace', timeout=900)
    if not js.exists():
        return [], ''
    ast = json.loads(js.read_text(encoding='utf-8'))
    out = conv.formula_list(ast)
    js.unlink()
    tex.unlink()
    return out, ''


def main(names):
    total = refused_total = 0
    kinds = collections.Counter()
    samples = collections.defaultdict(list)
    warnings = collections.Counter()
    for name in names:
        formulas, _ = formulas_of(name)
        if not formulas:
            continue
        converted, fallback, err = mathconv.convert_formulas(formulas)
        missing = [i for i in range(len(formulas)) if i not in converted]
        total += len(formulas)
        refused_total += len(missing)
        for m in re.finditer(r'Could not convert TeX math ([^,]{0,120})', err or ''):
            warnings[m.group(1)[:40]] += 1
        for i in missing:
            f = formulas[i]
            for label, rx in CONSTRUCTS:
                if re.search(rx, f):
                    kinds[label] += 1
                    if len(samples[label]) < 3:
                        samples[label].append((name[:40], f[:200]))
                    break
            else:
                kinds['other'] += 1
                if len(samples['other']) < 6:
                    samples['other'].append((name[:40], f[:200]))
        print('%-52s formulas %5d refused %4d' % (name[:52], len(formulas), len(missing)), flush=True)
    print('\nTOTAL formulas %d refused %d (%.2f%%)' % (total, refused_total, 100.0 * refused_total / max(total, 1)))
    print('\n-- refusal classes --')
    for k, v in kinds.most_common():
        print('%5d  %s' % (v, k))
        for name, f in samples[k][:2]:
            print('        %s: %s' % (name, f.replace('\n', ' ')[:170]))


if __name__ == '__main__':
    if len(sys.argv) > 1:
        names = sys.argv[1:]
    else:
        reports = json.loads((ROOT / 'typst/batch-report.json').read_text(encoding='utf-8'))
        names = [r['paper'] for r in sorted(reports, key=lambda r: -(r.get('math_failed') or 0))][:40]
    main(names)
