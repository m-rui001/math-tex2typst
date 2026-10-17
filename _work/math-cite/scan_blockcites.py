import sys, re, glob, os, json

CITE = re.compile(r"\\([a-zA-Z]*cite[a-zA-Z]*)(?![a-zA-Z])((?:\s*\[[^\]]*\]){0,2})\s*\{([^{}]*)\}")

for pre in ["The-Restricted-Geometric", "Uniform-indices"]:
    p = glob.glob(os.path.join(r"E:/math/_work/flat", pre + "*.tex"))[0]
    src = open(p, encoding="utf-8").read()
    print("=====", os.path.basename(p))
    # Find every display equation block and print any cite inside, including inside nested \text
    for em in re.finditer(r"\\begin\{(equation|align|alignat|gather|multline|eqnarray|displaymath)\*?\}(.*?)\\end\{\1\*?\}", src, re.S):
        block = em.group(2)
        if "cite" not in block:
            continue
        for cm in CITE.finditer(block):
            print("   cmd=", cm.group(1), "brackets=", repr(cm.group(2)), "keys=", repr(cm.group(3)))
            print("     in block:", repr(block[max(0,cm.start()-30):cm.end()+5]))
