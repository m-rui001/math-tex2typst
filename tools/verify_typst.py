"""Retry failures, apply the final theorem style, and compile every delivered source."""
import concurrent.futures
import json
from pathlib import Path
import re
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'tools'))
from t2t.convert import convert_paper


def verify(path):
    report = json.loads(path.read_text(encoding='utf-8'))
    out = path.parent
    if not report.get('compile_ok'):
        source = ROOT / '_work/flat' / (report['paper'] + '.tex')
        try:
            report = convert_paper(str(source), str(out), report['paper'])
            report['source'] = str(source)
        except Exception as exc:
            report['error'] = repr(exc)
    typ = out / 'main.typ'
    if typ.exists():
        text = typ.read_text(encoding='utf-8')
        text = text.replace('[#strong(head) #emph(body)]', '[#strong(head) #body]')
        text = re.sub(r'(?m)(#(?:thm|prodef)\([^\n]*\)\[\n\s*)\.\s+', r'\1', text)
        typ.write_text(text, encoding='utf-8')
        comp = subprocess.run(['typst', 'compile', str(typ), str(out / 'main.pdf')], capture_output=True, text=True, encoding='utf-8', timeout=900)
        report['compile_ok'] = comp.returncode == 0
        report['compile_err_full'] = comp.stderr[:4000]
        report['compile_errors'] = len(re.findall(r'^error:', comp.stderr, re.M))
        report['compile_warnings'] = len(re.findall(r'^warning:', comp.stderr, re.M))
        report['final_source_verified'] = True
        report['typ_lines'] = text.count('\n')
        report.setdefault('stats', {})['formulas'] = report.get('formulas', 0)
    path.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding='utf-8')
    return report


if __name__ == '__main__':
    paths = sorted((ROOT / 'typst').glob('*/report.json'))
    results = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=8) as pool:
        for result in pool.map(verify, paths):
            results.append(result)
            if len(results) % 100 == 0:
                print('verified', len(results), 'compiled', sum(bool(r.get('compile_ok')) for r in results), flush=True)
    print('DONE', len(results), 'compiled', sum(bool(r.get('compile_ok')) for r in results), flush=True)
    for report in results:
        if not report.get('compile_ok'):
            print(report['paper'], report.get('compile_err_full', report.get('error', '')), flush=True)
