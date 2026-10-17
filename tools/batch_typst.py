"""Convert the paper inventory and standalone TeX documents, with resumable reports."""
import concurrent.futures
import json
import pathlib
import sys
import time
import os

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'tools'))
from t2t.convert import convert_paper
from inventory import flatten


def run(item):
    name, source = item
    out = ROOT / 'typst' / name
    out.mkdir(parents=True, exist_ok=True)
    try:
        report = convert_paper(str(source), str(out), name)
    except Exception as exc:
        report = {'paper': name, 'ok': False, 'compile_ok': False, 'error': repr(exc)}
    report['source'] = str(source)
    (out / 'report.json').write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding='utf-8')
    return report


def publish(reports):
    """Refresh the aggregate report; a reader may still hold the previous one."""
    temp = ROOT / 'typst/batch-report.tmp'
    temp.write_text(json.dumps(reports, ensure_ascii=False, indent=2), encoding='utf-8')
    for _ in range(5):
        try:
            temp.replace(ROOT / 'typst/batch-report.json')
            return
        except PermissionError:
            time.sleep(0.4)
    print('report kept at typst/batch-report.tmp', flush=True)


def main():
    manifest = json.loads((ROOT / '_work/manifest.json').read_text(encoding='utf-8'))
    items = [(e['paper'], ROOT / '_work/flat' / (e['paper'] + '.tex')) for e in manifest if e.get('entry')]
    # Include independent documents outside the preprint inventory; sections are
    # incorporated into their parent document rather than treated as papers.
    for folder in [ROOT, ROOT / 'reasoning_traces', ROOT / '研究笔记']:
        for source in folder.glob('*.tex'):
            text = source.read_text(encoding='utf-8', errors='replace')
            if '\\documentclass' not in text:
                continue
            name = 'standalone-' + source.stem
            dest = ROOT / '_work/flat' / (name + '.tex')
            dest.write_text(flatten(str(source), set(), [], str(source.parent)), encoding='utf-8')
            items.append((name, dest))
    for entry in manifest:
        for i, rel in enumerate(entry.get('extra_docclass', []), 1):
            source = ROOT / 'preprints' / entry['paper'] / rel
            name = entry['paper'] + '-alternate-' + str(i)
            dest = ROOT / '_work/flat' / (name + '.tex')
            dest.write_text(flatten(str(source), set(), [], str(source.parent)), encoding='utf-8')
            items.append((name, dest))
    reports = []
    start = time.time()
    with concurrent.futures.ThreadPoolExecutor(max_workers=min(8, os.cpu_count() or 4)) as pool:
        for report in pool.map(run, items):
            reports.append(report)
            if len(reports) % 20 == 0:
                print(f"{len(reports)}/{len(items)} compiled={sum(r.get('compile_ok', False) for r in reports)} elapsed={time.time()-start:.0f}s", flush=True)
            publish(reports)
    print(f"DONE {len(reports)} compiled={sum(r.get('compile_ok', False) for r in reports)}", flush=True)


if __name__ == '__main__':
    main()
