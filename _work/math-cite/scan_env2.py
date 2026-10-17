import sys, re, glob, os

CITE = re.compile(r"\\([a-zA-Z]*cite[a-zA-Z]*)(?![a-zA-Z])((?:\s*\[[^\]]*\]){0,2})\s*\{([^{}]*)\}")

for pre in ["The-Restricted-Geometric", "Uniform-indices", "Kadisons"]:
    p = glob.glob(os.path.join(r"E:/math/_work/flat", pre + "*.tex"))[0]
    src = open(p, encoding="utf-8").read()
    print("=====", os.path.basename(p))
    for em in re.finditer(r"\\begin\{(equation|align|alignat|gather|multline|eqnarray|displaymath)\*?\}(.*?)\\end\{\1\*?\}", src, re.S):
        block = em.group(2)
        for cm in CITE.finditer(block):
            print("   cmd=", cm.group(1), "brackets=", repr(cm.group(2)), "keys=", repr(cm.group(3)))
