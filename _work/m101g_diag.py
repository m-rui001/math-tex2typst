import sys, inspect
sys.path.insert(0, 'tools')
from t2t import cetz
print(inspect.getsource(cetz._text_width))
for t in [r"$-1\le y\le1$", "uncapped band", r"progress $-x_1$", r"$a=b_f$", "return bridge"]:
    print(repr(t), "->", cetz._text_width(t))
