"""What does pandoc actually emit for multi-row math, through the real batch path?"""
import sys
sys.path.insert(0, 'tools')
from t2t.mathconv import convert_formulas, run_pandoc, BATCH_PREAMBLE, BATCH_EPILOG

FORMULAS = [
    r'\begin{aligned} a &= b \\ c &= d \end{aligned}',
    r'\begin{cases} a & x \\ 0 & \text{otherwise} \end{cases}',
    r'\mathrm{def}_k \quad \text{a, b}',
    r'\frac{\langle a, b\rangle}{c}',
    r'\mathcal{A}//E(Q_0,Q_1)',
    r'X_{/S}^{[r]}',
    r'\left(\frac{1}{2}\right)',
]

raw, _err = run_pandoc(BATCH_PREAMBLE + "\n\n".join(
    "$%s$" % f for f in FORMULAS) + BATCH_EPILOG)
print('--- RAW (no sentinels) ---')
print(repr(raw))
print('--- via convert_formulas ---')
conv, refused, err = convert_formulas(FORMULAS)
for i, f in enumerate(FORMULAS):
    print(i, repr(conv.get(i))[:200])
print('STDERR', err[:200])
