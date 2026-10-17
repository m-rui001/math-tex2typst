# -*- coding: utf-8 -*-
# PROBE 5: diagnostics before the final classification.
import io, re, glob, os, json, collections

FENCE_OP = re.compile(r"^\s*(`{3,}|~{3,})(.*)$")
FENCE_CL = re.compile(r"^\s*(`{3,}|~{3,})\s*$")
code_span = re.compile(r"`[^`\n]*`")
inline = re.compile(r"\$[^$]*\$")
hit = re.compile(r"\\(?:eq)?ref\{|\\label\{")
o = io.open("E:/math/_work/probe5.txt", "w", encoding="utf-8", newline="\n")

def fence_flags(lines):
    st = None
    flags = []
    for l in lines:
        flags.append(st is not None)
        m = FENCE_OP.match(l)
        if m:
            run = m.group(1)
            info = m.group(2).strip()
            if st is None:
                st = (run[0], len(run))
            elif not info and run[0] == st[0] and len(run) >= st[1]:
                st = None
    return flags, st

# D63 with proper rules
p63 = glob.glob("E:/math/研究笔记/D63-*.md")[0]
l63 = io.open(p63, encoding="utf-8", errors="replace").read().split("\n")
fl, st = fence_flags(l63)
o.write("D63 open-at-EOF=%s\n" % json.dumps(bool(st)))
for i, l in enumerate(l63):
    if i + 1 >= 370 and hit.search(inline.sub(" ", code_span.sub(" ", l))) and not (re.findall(r"\$\$", l)):
        pass
inf = [i + 1 for i, f in enumerate(fl) if f]
o.write("D63 in-fence line span: first=%s last=%s count=%d\n" % (inf[0] if inf else None, inf[-1] if inf else None, len(inf)))
# where are D63 hits and their new fence state
prev = None
for i, l in enumerate(l63):
    m = l
    if re.findall(r"\$\$", l):
        continue
    m = code_span.sub(" ", m)
    m = inline.sub(" ", m)
    n = len(hit.findall(m))
    if n and (i + 1) > 370:
        o.write("  D63:%d infence=%s n=%d %s\n" % (i + 1, fl[i], n, l[:120]))

# whole-corpus: unclosed fence at EOF + old-vs-new fence delta
rows_old = json.load(io.open("E:/math/_work/probe1.json", encoding="utf-8"))
diff = collections.Counter()
unclosed = []
for p in sorted(glob.glob("E:/math/研究笔记/D*.md")):
    nid = os.path.basename(p).split("-")[0]
    if nid in ("D476", "D71"):
        continue
    lines = io.open(p, encoding="utf-8", errors="replace").read().split("\n")
    fl, st = fence_flags(lines)
    if st:
        unclosed.append(nid)
    for i, f in enumerate(fl):
        pass
newmap = {}
for p in sorted(glob.glob("E:/math/研究笔记/D*.md")):
    nid = os.path.basename(p).split("-")[0]
    if nid in ("D476", "D71"):
        continue
    lines = io.open(p, encoding="utf-8", errors="replace").read().split("\n")
    fl, st = fence_flags(lines)
    newmap[nid] = fl
o.write("\nnotes with fence open at EOF=%s\n" % json.dumps(unclosed))
chg = 0
for r in rows_old:
    nf = newmap[r["id"]][r["line"] - 1]
    if nf != r["fence"]:
        chg += 1
o.write("occurrences whose fence flag changes under strict rules=%d\n" % chg)
cc = collections.Counter((r["id"], r["fence"], newmap[r["id"]][r["line"] - 1]) for r in rows_old
                         if r["fence"] != newmap[r["id"]][r["line"] - 1])
for k, v in cc.most_common(30):
    o.write("  %s\n" % json.dumps(k))

# ---- material label search: whole dir (not only build) for the 16 unresolved args ----
ptab = json.load(io.open("E:/math/_work/preamble_tables.json", encoding="utf-8"))
nf16 = [r for r in rows_old if not r["fence"]]
labelset_build = json.load(io.open("E:/math/_work/probe2_labels.json", encoding="utf-8"))["labelset"]
o.write("\nD113 in ptab=%s dir=%s\n" % ("D113" in ptab, ptab.get("D113", {}).get("dir")))
for nid in ["D113"]:
    o.write("  D113 occurrences=%d\n" % sum(1 for r in nf16 if r["id"] == nid))
    o.write("  preprints candidates=%s\n" % json.dumps([os.path.basename(x) for x in glob.glob("E:/math/preprints/*三维*")]))
targets = [("D244", 68), ("D346", 102), ("D473", 60), ("D517", 185), ("D124", 804),
           ("D259", 818), ("D380", 215), ("D117", 231), ("D370", 65)]
for nid, ln in targets:
    d = ptab.get(nid, {}).get("dir")
    o.write("\n--- %s line %d dir=%s\n" % (nid, ln, d))
    for r in nf16:
        if r["id"] == nid and r["line"] == ln:
            o.write("   arg=%r cmd=%s inbuild=%s | %s\n" % (
                r["arg"], r["cmd"], r["arg"] in labelset_build.get(nid, []), r["line_head"][:300]))
    if d:
        root = os.path.join("E:/math/preprints", d)
        allt = glob.glob(os.path.join(root, "**", "*.tex"), recursive=True)
        o.write("   tex files in whole dir=%d build-only=%d\n" % (
            len(allt), len(glob.glob(os.path.join(root, "build", "**", "*.tex"), recursive=True))))
        for t in allt:
            txt = io.open(t, encoding="utf-8", errors="replace").read()
            for m in re.finditer(r"\\label\{([^{}\\]*)\}", txt):
                if m.group(1) in ("spread:period-selection", "eq:source-N", "lem:lem:pair-bound",
                                  "H", "3", "local-question", "wrong-turns"):
                    o.write("     FOUND %s in %s\n" % (m.group(1), os.path.relpath(t, root)))
o.close()
print("chg=%d unclosed=%d" % (chg, len(unclosed)))
