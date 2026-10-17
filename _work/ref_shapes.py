# -*- coding: utf-8 -*-
# 标签泄漏的形态分类：前导词、所在行类型、是否带 ~
import io, glob, re, os, json
from collections import Counter

code_span = re.compile(r"`[^`\n]*`")
hit = re.compile(r"(\\(?:eq)?ref\{[^}]*\}|\\label\{[^}]*\})")
lead = re.compile(r"([A-Za-z]{3,}(?:\s*~)?)\\(?:eq)?ref\{")

c_loc = Counter()
c_lead = Counter()
c_env = Counter()
samples = []
notes = 0
for p in sorted(glob.glob("E:/math/研究笔记/D*.md")):
    s = io.open(p, encoding="utf-8", errors="replace").read()
    if not hit.search(code_span.sub(lambda m: " " * len(m.group(0)), s)):
        continue
    notes += 1
    for i, line in enumerate(s.split("\n")):
        masked = code_span.sub(lambda m: " " * len(m.group(0)), line)
        n = len(hit.findall(masked))
        if not n:
            continue
        kind = ("head" if re.match(r"^#{2,4} ", line) else
                "table" if line.strip().startswith("|") else
                "display_math" if line.strip().startswith("$$") else "body")
        c_loc[kind] += n
        for m in lead.finditer(masked):
            c_lead[m.group(1).strip()] += 1
        if len(samples) < 14 and kind in ("body", "table") and n <= 2:
            samples.append("%s:%d|%s" % (os.path.basename(p)[:14], i + 1, line.strip()[:150]))
        # 环境名（\begin{...} 邻近无法在此判）：改看 \ref 参数字符串的前缀
        for m in re.finditer(r"\\(?:eq)?ref\{([^}]*)\}", masked):
            c_env[m.group(1).split(":")[0] if ":" in m.group(1) else "(no-colon)"] += 1

out = io.open("E:/math/_work/ref_shapes.txt", "w", encoding="utf-8", newline="\n")
out.write("notes=%d\nBY_LOCATION=%s\n\nLEAD_WORDS(top20)=%s\n\nREF_PREFIX(top20)=%s\n\nSAMPLES:\n%s\n" % (
    notes, json.dumps(c_loc, ensure_ascii=False),
    json.dumps(c_lead.most_common(20), ensure_ascii=False),
    json.dumps(c_env.most_common(20), ensure_ascii=False),
    "\n".join(samples)))
out.close()
print("ok")
