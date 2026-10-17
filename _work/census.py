"""Corpus checkpoint: compile status per paper (latest report wins) + symptom census."""
import json
import os
import re

SIG = '$ "' + chr(92)
SPACED = re.compile(r'm a t h (b b|f f|c a l|f r a k|s c r|r m|s f|t t|i t)|b o l d s y m b o l')

status = {}
for rep in ('_work/batch_report.jsonl', '_work/rerun_report.jsonl', '_work/rerun2_report.jsonl'):
    if not os.path.exists(rep):
        continue
    for line in open(rep, encoding='utf-8', errors='replace'):
        try:
            r = json.loads(line)
        except Exception:
            continue
        if 'paper' in r and ('compile_ok' in r or r.get('stage')):
            status[r['paper']] = bool(r.get('compile_ok'))

manifest = json.load(open('_work/manifest.json', encoding='utf-8'))
allp = [e['paper'] for e in manifest]
ok = sum(1 for p in allp if status.get(p))
fail = [p for p in allp if p in status and not status[p]]
nostatus = [p for p in allp if p not in status]
print('papers: %d   compile ok: %d   fail: %d   no-status: %d' % (len(allp), ok, len(fail), len(nostatus)))
for p in fail:
    print('  FAIL', p)

fb = sp = 0
fb_papers = []
for p in allp:
    path = 'preprints/%s/typst/main.typ' % p
    if not os.path.exists(path):
        continue
    s = open(path, encoding='utf-8', errors='replace').read()
    n = s.count(SIG)
    if n:
        fb += 1
        fb_papers.append((n, p))
    if SPACED.search(s):
        sp += 1
fb_papers.sort(reverse=True)
print('papers with raw-latex fallback: %d   papers with spaced font cmds: %d' % (fb, sp))
print('total fallback formulas:', sum(n for n, _ in fb_papers))
print('worst 5:', fb_papers[:5])
