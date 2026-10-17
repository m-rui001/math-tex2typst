import sys, re, os, io
sys.path.insert(0, "_work/pic-authmacros")
from t2t import prep, macros

out = io.open("_work/pic-authmacros/_scan_out.txt", "w", encoding="utf-8")
FLAT = "_work/flat/"
SPAN = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
for fn in sorted(os.listdir(FLAT)):
    if not fn.endswith(".tex"):
        continue
    src = open(FLAT + fn, encoding="utf-8", errors="replace").read()
    pre, body = prep.split_document(src)
    spans = list(SPAN.finditer(body))
    if not spans:
        continue
    pos = 0
    for k, m in enumerate(spans):
        region = body[pos:m.start()]
        pos = m.end()
        tab, sk = macros.parse_definitions(region)
        col = re.findall(r"\\(colorlet|definecolor)\s*\{([^}]*)\}", region)
        ts = re.findall(r"\\tikzset(?![A-Za-z])", region)
        if tab or col or ts:
            out.write("%s pic#%d\n   defs=%s skipped=%d\n   colors=%s tikzset=%d\n"
                      % (fn[:78], k, sorted(tab), len(sk), col[:4], len(ts)))
out.close()
print(open("_work/pic-authmacros/_scan_out.txt", encoding="utf-8").read())
