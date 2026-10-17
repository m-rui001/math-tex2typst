# -*- coding: utf-8 -*-
import io, glob, os, re, json

PAIR = {
    "D225": "A-high-arity-counterexample-to-Pixton-completeness-in-Chow-September-24-2026",
    "D713": "Uniform-effective-log-Iitaka-fibrations-for-fourfolds-September-26-2026",
}
out = io.open("E:/math/_work/slot_params.txt", "w", encoding="utf-8", newline="\n")
for k, d in PAIR.items():
    p = glob.glob("E:/math/研究笔记/%s-*.md" % k)[0]
    s = io.open(p, encoding="utf-8").read()
    L = s.split("\n")
    out.write("\n===== %s =====\nnote=%s\nbytes=%d lines=%d CR=%d\n" % (
        k, p, len(s.encode("utf-8")), len(L), s.count("\r")))
    heads = [(i + 1, l) for i, l in enumerate(L) if re.match(r"^#{2,3} ", l)]
    out.write("heads=%d first=%s last=%s\n" % (len(heads), heads[0], heads[-1]))
    out.write("head_shapes=%s\n" % json.dumps([h[1][:60] for h in heads[-6:]], ensure_ascii=False))
    syms = [i + 1 for i, l in enumerate(L) if l.startswith("|") and len(l.split("|")) > 2 and l.split("|")[1].strip() in ("符号", "记号")]
    out.write("symbol_headers=%s sep=%d\n" % (syms, sum(1 for l in L if l.strip() == "| --- | --- | --- | --- | --- |")))
    # 引用记法
    full_paths = len(re.findall(r"build/[A-Za-z0-9_./\-]+\.tex:\d+", s))
    base_refs = len(re.findall(r"(?<![/\w])[A-Za-z0-9_\-]+\.tex:\d+", s))
    out.write("cite_form full_path_refs=%d basename_refs=%d\n" % (full_paths, base_refs))
    out.write("ref_examples=%s\n" % json.dumps(re.findall(r"[^\s|]{0,40}\.tex:\d+[^\s|]{0,12}", s)[:6], ensure_ascii=False))
    root = "E:/math/preprints/" + d + "/build"
    inv = []
    for dp, dn, fn in os.walk(root):
        for x in fn:
            if x.endswith(".tex"):
                fp = os.path.join(dp, x)
                rel = os.path.relpath(fp, root).replace("\\", "/")
                body = io.open(fp, encoding="utf-8", errors="replace").read()
                refs = len(re.findall(re.escape(x) + r":\d+", s))
                inv.append((rel, os.path.getsize(fp), body.count("\n") + 1, refs))
    out.write("inventory (rel bytes lines refs):\n")
    for z in sorted(inv, key=lambda q: -q[1]):
        out.write("  %-46s %7dB %5dL refs=%d\n" % z)
    out.write("  TOTAL %dB files=%d\n" % (sum(z[1] for z in inv), len(inv)))
out.close()
print("ok")
