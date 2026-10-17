import sys

sys.path.insert(0, 'tools/t2t')
import mathconv
from emit import unescape_math

tex = ('-\\Delta_g h-\\lambda B\n \\frac{\\langle\\mathrm d\\phi_R,\\mathrm d h\\rangle_g}\n'
       '      {\\sqrt{|\\mathrm d\\phi_R|_g^2+a_0^2}},\n \\qquad \\partial_\\nu h=0,\\quad h|_{S_R}=0.')
tex2 = r'\binom{n,k} + \frac{a}{b} + f(x,y)'
res, fb, err = mathconv.convert_formulas([tex, tex2])
for i in (0, 1):
    raw = res.get(i) or fb.get(i)
    final = unescape_math(raw)
    print(i, 'RAW  ', raw)
    print(i, 'FINAL', final)
open('_work/frac_check.typ', 'w', encoding='utf-8').write(
    '$ ' + unescape_math(res[0])[1:-1].strip() + ' $\n$ ' + unescape_math(res[1])[1:-1].strip() + ' $\n')
