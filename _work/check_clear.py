import json
import os
import re

names = [json.loads(l)['paper'] for l in open('_work/rerun_report.jsonl', encoding='utf-8', errors='replace')]
SIG = '$ "' + chr(92)
fb = sp = 0
for n in names:
    p = 'preprints/%s/typst/main.typ' % n
    if not os.path.exists(p):
        continue
    s = open(p, encoding='utf-8', errors='replace').read()
    if SIG in s:
        fb += 1
    if re.search(r'm a t h (b b|f f|c a l|f r a k|s c r|r m)', s):
        sp += 1
print('of', len(names), 'still-fallback:', fb, 'still-spaced:', sp)
