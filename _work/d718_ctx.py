# -*- coding: utf-8 -*-
import io, glob, re

p = glob.glob("E:/math/研究笔记/D718-*.md")[0]
s = io.open(p, encoding="utf-8").read()
L = s.split("\n")
out = io.open("E:/math/_work/d718_ctx.txt", "w", encoding="utf-8", newline="\n")
heads = [(i + 1, l) for i, l in enumerate(L) if re.match(r"^## ", l)]
out.write("heads=%d lines=%d\n" % (len(heads), len(L)))
for i, l in heads:
    out.write("%5d| %s\n" % (i, l))
nums = [(i, l, int(re.search(r"\d+", l).group(0))) for i, l in heads if re.search(r"\d+", l)]
first_new = min(i for i, l, n in nums if n >= 18)
out.write("\nfirst_new_section_line=%d\n" % first_new)

mac = re.compile(r"\\(?:re|Re|Im|ii|RR|CC|DD|eps|one|mid|colon|abs|norm|argmin|argmax|supp|Tr|Var|Cov|Lip|diam|dist|sgn|sign|bm|bb|mathbf|mathcal|operatorname)\b")
hits = [(i + 1, L[i]) for i in range(first_new - 1, len(L)) if mac.search(L[i])]
out.write("\nMACRO-LIKE in new region=%d\n" % len(hits))
for i, l in hits[:80]:
    out.write("%5d| %s\n" % (i, l.strip()[:170]))

bad = []
for i in range(first_new - 1, len(L)):
    line = L[i]
    if "$" not in line:
        continue
    seg = re.sub(r"`[^`\n]*`", "", line)
    lb = len(re.findall(r"(?<!\\)\{", seg))
    rb = len(re.findall(r"(?<!\\)\}", seg))
    if lb != rb:
        bad.append((i + 1, lb - rb, line.strip()[:190]))
out.write("\nBRACE-IMBALANCE=%d\n" % len(bad))
for b in bad[:50]:
    out.write("%5d| diff=%+d | %s\n" % b)
out.close()
print("ok first_new=%d macro=%d brace=%d" % (first_new, len(hits), len(bad)))
