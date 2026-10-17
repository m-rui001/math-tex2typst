import sys, re, glob, os
sys.path.insert(0, r"E:/math/_work/math-cite")

CITE = re.compile(r"\\(?:citep|citet|cite|nocite|autocite|parencite|textcite|smartcite"
                  r"|citeauthor|citeyear|citetitle)(?![a-zA-Z])((?:\s*\[[^\]]*\])*)\s*\{([^{}]*)\}")

# math regions: inline $...$, \(...\), \[...\]
INLINE = re.compile(r"(?<!\\)\$[^$]*?(?<!\\)\$", re.S)
PAREN = re.compile(r"\\\(.*?\\\)", re.S)
BRACK = re.compile(r"\\\[.*?\\\]", re.S)

for pre in ["Kadisons", "The-Restricted-Geometric", "Uniform-indices"]:
    p = glob.glob(os.path.join(r"E:/math/_work/flat", pre + "*.tex"))[0]
    src = open(p, encoding="utf-8").read()
    print("=====", os.path.basename(p))
    seen = set()
    for rx in (INLINE, PAREN, BRACK):
        for mm in rx.finditer(src):
            for cm in CITE.finditer(mm.group(0)):
                key = cm.group(0)
                if key in seen:
                    continue
                seen.add(key)
                print("   MATH cite:", repr(cm.group(1)), repr(cm.group(2)))
