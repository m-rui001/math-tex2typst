"""Build the pass-2 re-run list: papers whose output still shows math symptoms
plus papers whose pass-1 run died on a transient lock/exception."""
import json
import os
import re

SIG = '$ "' + chr(92)
SPACED = re.compile(r'm a t h (b b|f f|c a l|f r a k|s c r|r m|s f|t t|i t)|b o l d s y m b o l')

wanted = [l.strip() for l in open('_work/rerun_list.txt', encoding='utf-8') if l.strip()]
status = {}
for line in open('_work/rerun_report.jsonl', encoding='utf-8', errors='replace'):
    r = json.loads(line)
    status[r['paper']] = r

names = []
for n in wanted:
    rep = status.get(n)
    if rep is None or not rep.get('compile_ok'):
        names.append(n)
        continue
    p = 'preprints/%s/typst/main.typ' % n
    if not os.path.exists(p):
        names.append(n)
        continue
    s = open(p, encoding='utf-8', errors='replace').read()
    if SIG in s or SPACED.search(s):
        names.append(n)

with open('_work/rerun_list2.txt', 'w', encoding='utf-8') as fh:
    fh.write('\n'.join(names) + '\n')
print('pass-2 papers:', len(names))
