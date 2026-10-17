import json
import re
import sys

sys.path.insert(0, 'tools')
from t2t import mathconv

paper = 'Weak-pure-infiniteness-and-O-infinity-absorption-September-25-2026'
s = open('preprints/%s/typst/main.typ' % paper, encoding='utf-8', errors='replace').read()
SIG = '$ "' + chr(92)
lines = [l for l in s.split('\n') if SIG in l]
print('fallback lines:', len(lines))


def unescape_lit(line):
    m = re.search(re.escape(SIG) + '(.*?)" \\$', line)
    body = m.group(1)
    return body.replace('\\\\', chr(1)).replace('\\n', '\n').replace(chr(1), '\\\\').replace('\\"', '"')


for line in lines[:6]:
    tex = unescape_lit(line)
    res, fb, err = mathconv.convert_formulas([tex])
    print('REFUSED' if 0 not in res else 'OK     ', tex[:110].replace('\n', ' '))
