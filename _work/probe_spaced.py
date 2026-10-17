import json
import subprocess
import sys

sys.path.insert(0, 'tools')
from t2t import mathconv
from t2t.convert import formula_list

fixed = '_work/flat/_work_tex/A-pointwise-2-converse-for-elliptic-curves-with-rational-two-torsion-September-24-2026.tex'
proc = subprocess.run(['pandoc', fixed, '-f', 'latex', '-t', 'json', '--wrap=none'],
                      capture_output=True, text=True, encoding='utf-8')
ast = json.loads(proc.stdout)
formulas = formula_list(ast)
hit = [t for t in formulas if 'theta-sum' in t or ('Q(x)=n' in t.replace(' ', ''))]
print('candidates:', len(hit))
for t in hit[:2]:
    print('LATEX:', repr(t[:200]))
    batch, sk = mathconv.build_batch([t])
    seg = batch[batch.find('$'):batch.rfind('$') + 1]
    print('CHUNK:', repr(seg[:200]))
    res, fb, err = mathconv.convert_formulas([t])
    print('OUT  :', (res.get(0) or fb.get(0))[:200])
