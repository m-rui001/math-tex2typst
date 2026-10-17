import json
import subprocess
import sys

sys.path.insert(0, 'tools')
from t2t import mathconv
from t2t.convert import formula_list

fixed = '_work/flat/_work_tex/Giglis-distributional-curvature-characterization-of-Alexandrov-spaces-September-24-2026.tex'
proc = subprocess.run(['pandoc', fixed, '-f', 'latex', '-t', 'json', '--wrap=none'],
                      capture_output=True, text=True, encoding='utf-8')
ast = json.loads(proc.stdout)
formulas = formula_list(ast)
hit = [(i, t) for i, t in enumerate(formulas) if 'Z_\\parallel' in t or 'nabla q' in t and 'frac' in t]
print('candidates:', len(hit))
for i, t in hit[:3]:
    print('LATEX:', repr(t[:220]))
    res, fb, err = mathconv.convert_formulas([t])
    print('OUT  :', (res.get(0) or fb.get(0))[:220])
    print('---')
