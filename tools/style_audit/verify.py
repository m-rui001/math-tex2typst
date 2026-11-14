"""Compile every paper, record page count and a normalized text fingerprint.

Usage:
  python -X utf8 tools/style_audit/verify.py --out D:/mxrlib/_audit/style_baseline.json [--limit N]

The fingerprint is the NFKC/whitespace-normalised text extracted from the PDF, so
any change to the printed content (a dropped digit, a lost formula) shows up as a
hash mismatch even when the document still compiles.
"""
import argparse
import concurrent.futures
import hashlib
import json
import re
import subprocess
import sys
import tempfile
import unicodedata
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]


def norm(text):
    text = unicodedata.normalize('NFKC', text)
    text = text.replace('\u00a0', ' ').replace('\u2019', "'").replace('\u2018', "'")
    return re.sub(r'\s+', ' ', text).strip()


def page_count(pdf):
    data = pdf.read_bytes()
    n = len(re.findall(rb'/Type\s*/Page[^s]', data))
    return n


def text_of(pdf):
    exe = subprocess.run(['pdftotext', str(pdf), '-'], capture_output=True)
    if exe.returncode == 0:
        return exe.stdout.decode('utf-8', 'replace')
    try:
        import fitz
        doc = fitz.open(str(pdf))
        return '\n'.join(p.get_text() for p in doc)
    except Exception:
        return ''


def verify(typ, tmp):
    out = Path(tmp) / (typ.parent.name + '.pdf')
    comp = subprocess.run(['typst', 'compile', '--format', 'pdf', str(typ), str(out)],
                          capture_output=True, text=True, encoding='utf-8', errors='replace',
                          timeout=900)
    rec = {'ok': comp.returncode == 0,
           'errors': len(re.findall(r'^error:', comp.stderr, re.M)),
           'warnings': len(re.findall(r'^warning:', comp.stderr, re.M))}
    if not rec['ok']:
        rec['err'] = comp.stderr[:1500]
        return rec
    rec['pages'] = page_count(out)
    txt = norm(text_of(out))
    rec['chars'] = len(txt)
    rec['sha'] = hashlib.sha256(txt.encode('utf-8')).hexdigest()[:16]
    out.unlink(missing_ok=True)
    return rec


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--out', required=True)
    ap.add_argument('--limit', type=int, default=0)
    ap.add_argument('--only', default='')
    a = ap.parse_args()
    files = sorted((ROOT / 'typst').glob('*/main.typ'))
    if a.only:
        files = [f for f in files if a.only in f.parent.name]
    if a.limit:
        files = files[:a.limit]
    res = {}
    bad = []
    tmp = tempfile.mkdtemp(prefix='typstverify')
    with concurrent.futures.ThreadPoolExecutor(max_workers=8) as pool:
        futs = {pool.submit(verify, f, tmp): f for f in files}
        for i, fut in enumerate(concurrent.futures.as_completed(futs), 1):
            f = futs[fut]
            try:
                res[f.parent.name] = fut.result()
            except Exception as exc:  # noqa: BLE001
                res[f.parent.name] = {'ok': False, 'err': repr(exc), 'errors': 1}
            if not res[f.parent.name]['ok']:
                bad.append(f.parent.name)
            if i % 100 == 0:
                print('verified', i, 'failed', len(bad), flush=True)
    Path(a.out).parent.mkdir(parents=True, exist_ok=True)
    merged = {}
    if Path(a.out).exists():
        try:
            merged = json.loads(Path(a.out).read_text(encoding='utf-8'))
        except Exception:
            merged = {}
    merged.update(res)
    Path(a.out).write_text(json.dumps(merged, indent=0, sort_keys=True), encoding='utf-8')
    ok = sum(1 for r in res.values() if r['ok'])
    print('files', len(res), 'compiled', ok, 'failed', len(bad))
    print('pages', sum(r.get('pages', 0) for r in res.values()))
    for b in bad[:20]:
        print('FAIL', b, res[b].get('err', '')[:200].replace('\n', ' '))
    return 0 if not bad else 1


if __name__ == '__main__':
    sys.exit(main())
