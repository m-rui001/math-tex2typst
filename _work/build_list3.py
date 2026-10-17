import os
import re

SIG = '$ "' + chr(92)
SPACED = re.compile(r'm a t h (b b|f f|c a l|f r a k|s c r|r m|s f|t t|i t)|b o l d s y m b o l')
names = []
for d in sorted(os.listdir('preprints')):
    p = 'preprints/%s/typst/main.typ' % d
    if not os.path.isfile(p):
        continue
    s = open(p, encoding='utf-8', errors='replace').read()
    if SIG in s or SPACED.search(s):
        names.append(d)
open('_work/rerun_list3.txt', 'w', encoding='utf-8').write('\n'.join(names) + '\n')
print('pass-3 papers:', len(names))
