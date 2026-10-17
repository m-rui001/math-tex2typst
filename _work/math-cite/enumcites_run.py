import sys, re, glob, os
sys.path.insert(0, r"E:/math/_work/math-cite")
from t2t import mathconv
CITE = re.compile(r"\(?:citep|citet|cite|nocite|autocite|parencite|textcite"
                  r"|citeauthor|citeyear|citetitle)(?![a-zA-Z])((?:\[[^\]]*\])*)\s*\{([^{}]*)\}")
for pre in ["Kadisons", "The-Restricted-Geometric", "Uniform-indices"]:
    p = glob.glob(os.path.join(r"E:/math/_work/flat", pre + "*.tex"))[0]
    print("=====", os.path.basename(p))
    for m in CITE.finditer(open(p, encoding="utf-8").read()):
        print("  BRACKETS=", repr(m.group(1)), "KEYS=", repr(m.group(2)))
