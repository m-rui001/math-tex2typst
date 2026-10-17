import sys, re, glob, os
sys.path.insert(0, r"E:/math/_work/math-cite")
from t2t import mathconv

CITE = re.compile(r"\\(?:citep|citet|cite|nocite|autocite|parencite|textcite|smartcite"
                  r"|citeauthor|citeyear|citetitle)(?![a-zA-Z])((?:\s*\[[^\]]*\])*)\s*\{([^{}]*)\}")

for pre in ["Kadisons", "The-Restricted-Geometric", "Uniform-indices"]:
    p = glob.glob(os.path.join(r"E:/math/_work/flat", pre + "*.tex"))[0]
    src = open(p, encoding="utf-8").read()
    print("=====", os.path.basename(p))
    # every \text{...} (balanced via mathconv.take_group) that contains a cite
    i = 0
    while True:
        j = src.find("\\text", i)
        if j == -1:
            break
        body, end = mathconv.take_group(src, j + len("\\text"))
        if body is None:
            i = j + 5
            continue
        for cm in CITE.finditer(body):
            print("   TEXTBODY=", repr(body[:80]))
            print("     brackets=", repr(cm.group(1)), "keys=", repr(cm.group(2)))
        i = end
