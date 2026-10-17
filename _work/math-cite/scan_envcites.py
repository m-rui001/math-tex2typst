import sys, re, glob, os
sys.path.insert(0, r"E:/math/_work/math-cite")
from t2t import mathconv

CITE = re.compile(r"\\(?:citep|citet|cite|nocite|autocite|parencite|textcite|smartcite"
                  r"|citeauthor|citeyear|citetitle)(?![a-zA-Z])((?:\s*\[[^\]]*\])*)\s*\{([^{}]*)\}")

for pre in ["Kadisons", "The-Restricted-Geometric", "Uniform-indices"]:
    p = glob.glob(os.path.join(r"E:/math/_work/flat", pre + "*.tex"))[0]
    src = open(p, encoding="utf-8").read()
    print("=====", os.path.basename(p))
    for em in re.finditer(r"\\begin\{(equation|align|alignat|gather|multline|eqnarray|displaymath)\*?\}(.*?)\\end\{\1\*?\}", src, re.S):
        block = em.group(2)
        for cm in CITE.finditer(block):
            print("   ENV=", em.group(1), "brackets=", repr(cm.group(1)), "keys=", repr(cm.group(2)), "cmd=", cm.group(0)[:60])
