"""Static audit of the delivered corpus, independent of the converter.

`tools/verify_typst.py` answers "does this main.typ compile after the final pass?".
This script answers what a reader of the repo can check without upstream sources:
encoding, document size, empty shells, duplicate documents, image references that point at
files not in the repo, and where a document came from.  It writes `MANIFEST.csv`
(one row per document) and prints every count that `QUALITY.md` quotes.

usage: python -X utf8 tools/corpus_audit.py [--json out.json] [--manifest MANIFEST.csv]
"""
import argparse
import collections
import csv
import glob
import hashlib
import json
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, 'typst')
IMG_RE = re.compile(r'image\(\s*"([^"]+)"')


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--json')
    ap.add_argument('--manifest', default=os.path.join(ROOT, 'MANIFEST.csv'))
    args = ap.parse_args()

    reports = [(p, 'ok') for p in sorted(glob.glob(os.path.join(OUT, '*', 'report.json')))]
    quarantine = os.path.join(ROOT, '_quarantine', 'typst')
    reports += [(p, 'quarantined') for p in sorted(glob.glob(os.path.join(quarantine, '*', 'report.json')))]
    rows, problems = [], collections.defaultdict(list)
    by_hash = collections.defaultdict(list)

    for path, quality in reports:
        report = json.load(open(path, encoding='utf-8'))
        folder = os.path.dirname(path)
        name = report['paper']
        typ = os.path.join(folder, 'main.typ')
        text = open(typ, encoding='utf-8').read()
        body = '\n'.join(text.split('\n')[22:])          # preamble is 22 lines in every document
        body_chars = len(re.sub(r'\s+', ' ', body).strip())
        images = IMG_RE.findall(text)
        missing = [i for i in images if not os.path.isfile(os.path.join(folder, i))]
        digest = hashlib.sha1(text.encode('utf-8')).hexdigest()
        by_hash[digest].append(name)
        if text.startswith('\ufeff'):
            problems['bom'].append(name)
        if '\ufffd' in text:
            problems['replacement_char'].append(name)
        if body_chars == 0:
            problems['empty_shell'].append(name)
        elif body_chars < 400:
            problems['ultra_short'].append(name)
        if missing:
            problems['missing_images'].append(name)
        source = report.get('source', '')
        title_match = re.search(r'#text\(size: 16pt, weight: "bold"\)\[(.*?)\]', text)
        rows.append({
            'paper': name,
            'quality': quality,
            'defect': ','.join(k for k in ('missing_images', 'empty_shell') if name in problems[k]),
            'typ': os.path.relpath(typ, ROOT).replace('\\', '/'),
            'title': title_match.group(1) if title_match else '',
            'lines': text.count('\n') + 1,
            'chars': len(text),
            'body_chars': body_chars,
            'formulas': report.get('formulas', 0),
            'math_failed': report.get('math_failed', 0),
            'figures': report.get('figures', 0),
            'images': len(images),
            'images_missing': len(missing),
            'compile_ok': bool(report.get('compile_ok')),
            'warnings': report.get('compile_warnings', 0) or 0,
            'source': os.path.basename(source),
            'source_present': bool(source) and os.path.isfile(os.path.join(ROOT, '_work', 'flat', os.path.basename(source))),
            'sha1': digest[:16],
        })

    dups = [g for g in by_hash.values() if len(g) > 1]
    for group in dups:
        for name in group[1:]:
            problems['duplicate'].append(name)

    with open(args.manifest, 'w', encoding='utf-8', newline='') as fh:
        writer = csv.DictWriter(fh, fieldnames=list(rows[0].keys()))
        writer.writeheader()
        writer.writerows(rows)

    summary = {
        'documents': len(rows),
        'documents_ok': sum(1 for r in rows if r['quality'] == 'ok'),
        'quarantined': sum(1 for r in rows if r['quality'] == 'quarantined'),
        'compiled': sum(r['compile_ok'] for r in rows),
        'failed': [r['paper'] for r in rows if not r['compile_ok']],
        'lines': sum(r['lines'] for r in rows),
        'chars': sum(r['chars'] for r in rows),
        'body_chars': sum(r['body_chars'] for r in rows),
        'formulas': sum(r['formulas'] for r in rows),
        'math_failed': sum(r['math_failed'] for r in rows),
        'warnings': sum(r['warnings'] for r in rows),
        'images': sum(r['images'] for r in rows),
        'images_missing': sum(r['images_missing'] for r in rows),
        'docs_missing_images': len(problems['missing_images']),
        'empty_shell': len(problems['empty_shell']),
        'ultra_short': len(problems['ultra_short']),
        'bom': len(problems['bom']),
        'replacement_char': len(problems['replacement_char']),
        'duplicate_groups': len(dups),
        'source_recorded': sum(1 for r in rows if r['source']),
        'source_present': sum(1 for r in rows if r['source_present']),
    }
    print(json.dumps(summary, indent=1, ensure_ascii=False))
    for key in ('bom', 'replacement_char', 'empty_shell', 'ultra_short', 'missing_images', 'duplicate'):
        if problems[key]:
            print('\n%s (%d):' % (key, len(problems[key])))
            for name in problems[key][:40]:
                print('  ' + name)
    if args.json:
        json.dump({'summary': summary, 'problems': problems}, open(args.json, 'w', encoding='utf-8'),
                  ensure_ascii=False, indent=1)
    return 0


if __name__ == '__main__':
    sys.exit(main())
