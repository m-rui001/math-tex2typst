import io, re, glob

REF = re.compile(r"\\(?:eq)?ref\{[^}]*\}")
out = io.open("_work/head_ref.txt", "w", encoding="utf-8")
rows = []
for p in sorted(glob.glob("研究笔记/D*.md")):
    L = io.open(p, encoding="utf-8").read().split("\n")
    for i, l in enumerate(L):
        if not l.startswith("#"):
            continue
        has_ref = bool(REF.search(l))
        if has_ref or ("~\\ref" in l) or re.search(r"\b(Lemma|Theorem|Proposition|Corollary|Equation|Definition|Remark|Section|Appendix|Figure|Table)~", l):
            rows.append((p.split("\\")[-1], i + 1, has_ref, l))
out.write("head_hits=%d notes=%d\n" % (len(rows), len(set(r[0] for r in rows))))
for name, ln, hr, txt in rows:
    out.write("%s|%d|ref=%d|%s\n" % (name, ln, int(hr), txt[:200]))
out.close()
print("done", len(rows))
