import io, re, glob

PAT = re.compile(r"\b(Lemma|Theorem|Proposition|Corollary|Definition|Remark|Equation|Section|Figure|Table|Appendix)~")
out = io.open("_work/word_tilde_split.txt", "w", encoding="utf-8")
for id in ["D106", "D137", "D317"]:
    p = glob.glob("研究笔记/%s-*.md" % id)[0]
    L = io.open(p, encoding="utf-8").read().split("\n")
    head = body = tbl = 0
    keys = {}
    for l in L:
        c = len(PAT.findall(l))
        if not c:
            continue
        if l.startswith("#"):
            head += c
        elif l.startswith("|"):
            tbl += c
        else:
            body += c
        for m in PAT.finditer(l):
            keys[m.group(1)] = keys.get(m.group(1), 0) + 1
    refs = sum(l.count("\\ref{") + l.count("\\eqref{") for l in L)
    out.write("%s head=%d body=%d table=%d backslash_ref=%d words=%s\n" % (id, head, body, tbl, refs, sorted(keys.items(), key=lambda z: -z[1])[:6]))
out.close()
print("ok")
