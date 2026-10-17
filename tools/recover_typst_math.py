"""Recover supported legacy/aligned math from explicit LaTeX fallbacks.

Only commit each paper's replacements when the complete document compiles.
"""
import concurrent.futures
import json
from pathlib import Path
import subprocess
import sys
import re

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'tools'))
from t2t.mathconv import convert_formulas


def literals(text):
    inside = False
    i = 0
    found = []
    while i < len(text):
        if text[i] == '\\':
            i += 2
            continue
        if text[i] == '$':
            inside = not inside
        elif text[i] == '"':
            start = i
            i += 1
            while i < len(text):
                if text[i] == '\\':
                    i += 2
                    continue
                if text[i] == '"':
                    break
                i += 1
            if inside:
                try:
                    value = json.loads(text[start:i+1])
                    if '\\' in value and re.match(r'\s*\$', text[i+1:]):
                        found.append((start, i+1, value))
                except ValueError:
                    pass
        i += 1
    return found


def main():
    entries = []
    formulas = set()
    for report_path in sorted((ROOT / 'typst').glob('*/report.json')):
        report = json.loads(report_path.read_text(encoding='utf-8'))
        if not report.get('compile_ok') or not report.get('math_failed'):
            continue
        path = report_path.parent / 'main.typ'
        text = path.read_text(encoding='utf-8')
        spans = literals(text)
        entries.append((report_path, report, path, text, spans))
        formulas.update(value for _, _, value in spans)
    formulas = sorted(formulas)
    def convert_chunk(chunk):
        converted, _, _ = convert_formulas(chunk)
        return {chunk[i]: value[1:-1].strip() for i, value in converted.items()}
    replacements = {}
    chunks = [formulas[i:i+256] for i in range(0, len(formulas), 256)]
    with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:
        for result in pool.map(convert_chunk, chunks):
            replacements.update(result)
    print('fallbacks', len(formulas), 'recoverable', len(replacements), flush=True)

    def apply(entry):
        report_path, report, path, original, spans = entry
        updated = original
        recovered = set()
        for start, stop, value in reversed(spans):
            if value in replacements:
                updated = updated[:start] + replacements[value] + updated[stop:]
                recovered.add(value)
        if not recovered:
            return 0
        path.write_text(updated, encoding='utf-8')
        comp = subprocess.run(['typst', 'compile', str(path), str(path.parent / 'main.pdf')], capture_output=True, text=True, encoding='utf-8', timeout=900)
        if comp.returncode:
            path.write_text(original, encoding='utf-8')
            comp = subprocess.run(['typst', 'compile', str(path), str(path.parent / 'main.pdf')], capture_output=True, text=True, encoding='utf-8', timeout=900)
            if comp.returncode:
                raise RuntimeError('Failed to restore compiled source: ' + str(path))
            return 0
        report['math_recovered'] = len(recovered)
        report['math_failed'] = max(0, report['math_failed'] - len(recovered))
        report['typ_lines'] = updated.count('\n')
        report['final_source_verified'] = True
        report_path.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding='utf-8')
        return len(recovered)

    with concurrent.futures.ThreadPoolExecutor(max_workers=8) as pool:
        recovered = sum(pool.map(apply, entries))
    print('recovered', recovered, flush=True)


if __name__ == '__main__':
    main()
