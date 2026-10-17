# -*- coding: utf-8 -*-
# 统一选型量具：按"内容文件零引用字节"排序（排除 references/main/preamble/figures/proof-map 一类壳）
import io, glob, os, re, json

SHELL = re.compile(r"(references|bibliography|main|paper|preamble|\.tex$)")
SHELLNAME = re.compile(r"^(references|bibliography|main|paper|preamble|proof-map|combined-base|companion-locators)\.tex$")

# 任务号 -> 素材目录（来自两代探针的登记，逐条核对存在性）
CAND = {
    "D476": "Stacks-of-K-theory-on-toric-varieties",
    "D225": "",
}
# 直接从队列台账取 dir 不可（禁读）；改用笔记 §0 里登记的 dir
notes = {}
for p in glob.glob("E:/math/研究笔记/D*.md"):
    key = os.path.basename(p).split("-")[0]
    notes[key] = p

WANT = ["D476", "D225", "D713", "D325", "D710", "D627", "D499", "D358", "D463", "D118", "D137", "D718"]
out = io.open("E:/math/_work/slot_scan.txt", "w", encoding="utf-8", newline="\n")
for k in WANT:
    p = notes.get(k)
    if not p:
        out.write("%s NO NOTE\n" % k)
        continue
    s = io.open(p, encoding="utf-8").read()
    m = re.findall(r"preprints/([A-Za-z0-9._\-]+)", s[:9000])
    dirs = [d for d in m if os.path.isdir("E:/math/preprints/" + d)]
    if not dirs:
        out.write("%s NO_DIR\n" % k)
        continue
    d = max(set(dirs), key=dirs.count)
    root = "E:/math/preprints/" + d
    if not os.path.isdir(os.path.join(root, "build")):
        out.write("%s NO_BUILD %s\n" % (k, d))
        continue
    L = s.split("\n")
    heads = [l for l in L if re.match(r"^#{2,3} ", l)]
    rows = []
    for dp, dn, fn in os.walk(os.path.join(root, "build")):
        for x in fn:
            if not x.endswith(".tex"):
                continue
            fp = os.path.join(dp, x)
            rel = os.path.relpath(fp, os.path.join(root, "build")).replace("\\", "/")
            sz = os.path.getsize(fp)
            refs = len(re.findall(re.escape(x) + r":\d+", s))
            if SHELLNAME.match(x) or rel.startswith("figures/"):
                continue
            if refs == 0:
                rows.append((rel, sz))
    tot = sum(z[1] for z in rows)
    out.write("%s dir=%s heads=%d bytes=%d uncited_content=%dB files=%d %s\n" % (
        k, d, len(heads), len(s.encode("utf-8")), tot, len(rows),
        json.dumps(rows, ensure_ascii=False)[:400]))
out.close()
print("ok")
