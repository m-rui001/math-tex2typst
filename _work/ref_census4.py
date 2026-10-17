# -*- coding: utf-8 -*-
# 标签泄漏第四版量具（修好状态推进）：围栏与行间式的开关必须每行都推进，
# 无命中的行也要走状态，否则围栏整体漏判、被英文行掩码吸收。
import io, glob, re, os, json
from collections import Counter

code_span = re.compile(r"`[^`\n]*`")
inline = re.compile(r"\$[^$]*\$")
hit = re.compile(r"\\(?:eq)?ref\{|\\label\{")
dquote = re.compile(u'"[^"\n]*"')
corner = re.compile(u'「[^」\n]*」')
cjk = re.compile(u'[一-鿿]')
FENCE = u'```'

c_mask = Counter()
c_loc = Counter()
per_note = []
sites = []

for p in sorted(glob.glob(u"E:/math/研究笔记/D*.md")):
    lines = io.open(p, encoding="utf-8", errors="replace").read().split("\n")
    in_disp = False
    in_fence = False
    n_leak = 0
    prev_blank = True
    for i, raw in enumerate(lines):
        was_fence = in_fence
        was_disp = in_disp
        if raw.startswith(FENCE):
            in_fence = not in_fence
        nd = len(re.findall(r"\$\$", raw))
        if nd % 2 == 1:
            in_disp = not in_disp

        m0 = len(hit.findall(code_span.sub(lambda z: " " * len(z.group(0)),
                            inline.sub(lambda z: " " * len(z.group(0)), raw))))
        if not m0:
            prev_blank = not raw.strip()
            continue

        skip = None
        if raw.startswith(FENCE):
            skip = "fence"
        elif was_fence:
            skip = "fence"
        elif was_disp or nd > 0:
            skip = "display"
        elif raw.lstrip().startswith(">"):
            skip = "blockquote"
        elif raw.startswith("    ") and i and lines[i - 1].startswith("    "):
            skip = "indent"
        elif cjk.search(raw) is None:
            skip = "englishline"
        if skip is None:
            m = code_span.sub(lambda z: " " * len(z.group(0)), raw)
            m = dquote.sub(lambda z: " " * len(z.group(0)), m)
            m = corner.sub(lambda z: " " * len(z.group(0)), m)
            m = inline.sub(lambda z: " " * len(z.group(0)), m)
            if len(hit.findall(m)) < m0:
                skip = "quoterange"
        if skip is not None:
            c_mask[skip] += m0
            prev_blank = not raw.strip()
            continue

        n_leak += m0
        kind = ("head" if re.match(r"^#{2,4} ", raw) else
                "table" if raw.strip().startswith("|") else "body")
        c_loc[kind] += m0
        sites.append("%s\t%d\t%s\t%s" % (
            os.path.basename(p).split("-")[0], i + 1, kind, raw.strip()[:90]))
        prev_blank = False
    if n_leak:
        per_note.append((os.path.basename(p)[:44], n_leak))

per_note.sort(key=lambda z: -z[1])
tot = sum(z[1] for z in per_note)
masked = sum(c_mask.values())
out = io.open(u"E:/math/_work/ref_census4.txt", "wb")
body = u"notes=%d real_total=%d masked_total=%d by_location=%s masks=%s\n\nTOP NOTES:\n" % (
    len(per_note), tot, masked, json.dumps(c_loc, ensure_ascii=False),
    json.dumps(dict(c_mask), ensure_ascii=False))
out.write(body.encode("utf-8"))
for r in per_note[:40]:
    out.write((u"%-46s %4d\n" % r).encode("utf-8"))
out.close()
io.open(u"E:/math/_work/ref_sites4.tsv", "wb").write(
    (u"\n".join(sites) + u"\n").encode("utf-8"))
print("notes=%d real=%d masked=%d sum=%d %s" % (
    len(per_note), tot, masked, tot + masked, json.dumps(dict(c_mask), ensure_ascii=False)))
