# -*- coding: utf-8 -*-
# 标签泄漏第三版量具：掩掉代码跨度、行内式、行间式区域之后再数
import io, glob, re, os, json
from collections import Counter

code_span = re.compile(r"`[^`\n]*`")
inline = re.compile(r"\$[^$]*\$")
hit = re.compile(r"\\(?:eq)?ref\{|\\label\{")
lead = re.compile(r"([A-Za-z]{3,})\s*~?\s*\\(?:eq)?ref\{")

c_loc = Counter()
c_lead = Counter()
per_note = []
samples = []
for p in sorted(glob.glob("E:/math/研究笔记/D*.md")):
    lines = io.open(p, encoding="utf-8", errors="replace").read().split("\n")
    in_disp = False
    n_leak = 0
    for i, raw in enumerate(lines):
        nd = len(re.findall(r"\$\$", raw))
        skip_line = in_disp or nd > 0            # 整行属于行间式区域
        if nd % 2 == 1:
            in_disp = not in_disp
        if skip_line:
            continue
        m = code_span.sub(lambda z: " " * len(z.group(0)), raw)
        m = inline.sub(lambda z: " " * len(z.group(0)), m)
        n = len(hit.findall(m))
        if not n:
            continue
        n_leak += n
        kind = ("head" if re.match(r"^#{2,4} ", raw) else
                "table" if raw.strip().startswith("|") else "body")
        c_loc[kind] += n
        for g in lead.finditer(m):
            c_lead[g.group(1)] += 1
        if len(samples) < 20 and kind == "body":
            samples.append("%s:%d| %s" % (os.path.basename(p).split("-")[0], i + 1, raw.strip()[:170]))
    if n_leak:
        per_note.append((os.path.basename(p), n_leak))

per_note.sort(key=lambda z: -z[1])
tot = sum(z[1] for z in per_note)
out = io.open("E:/math/_work/ref_census3.txt", "w", encoding="utf-8", newline="\n")
out.write("notes=%d prose_hits_total=%d by_location=%s\n\nLEAD(top15)=%s\n\nTOP NOTES:\n" % (
    len(per_note), tot, json.dumps(c_loc, ensure_ascii=False),
    json.dumps(c_lead.most_common(15), ensure_ascii=False)))
for r in per_note[:40]:
    out.write("%-70s %4d\n" % r)
out.write("\nSAMPLES:\n" + "\n".join(samples) + "\n")
out.close()
print("ok notes=%d total=%d" % (len(per_note), tot))
