# -*- coding: utf-8 -*-
# 全库笔记正文里的 LaTeX 标签泄漏普查：\ref{ / \eqref{ / \label{ / \cite 形态
import io, glob, re, os

pat = {
    "ref": re.compile(r"\\(?:eq)?ref\{"),
    "label": re.compile(r"\\label\{"),
    "tilde_ref": re.compile(r"(?:Proposition|Theorem|Lemma|Corollary|Section|Remark|Definition|Figure|Table)\s*~?\\(?:eq)?ref"),
}
rows = []
tot = {"ref": 0, "label": 0, "tilde_ref": 0}
for p in glob.glob("E:/math/研究笔记/D*.md"):
    s = io.open(p, encoding="utf-8", errors="replace").read()
    # 只数表格/标题之外的正文？先全量，再单列标题命中
    c = {k: len(v.findall(s)) for k, v in pat.items()}
    heads = [l for l in s.split("\n") if re.match(r"^#{2,3} ", l)]
    h_ref = [l for l in heads if pat["ref"].search(l)]
    if c["ref"] or c["label"]:
        rows.append((os.path.basename(p), c["ref"], c["label"], c["tilde_ref"], len(h_ref)))
    for k in tot:
        tot[k] += c[k]
rows.sort(key=lambda z: -z[1])
out = io.open("E:/math/_work/ref_census.txt", "w", encoding="utf-8", newline="\n")
out.write("notes_with_hits=%d corpus_total=%s\n" % (len(rows), tot))
out.write("FILE | ref | label | tilde_ref | heads_with_ref\n")
for r in rows:
    out.write("%-70s %4d %5d %5d %4d\n" % r)
out.close()
print("ok hits=%d" % len(rows))
