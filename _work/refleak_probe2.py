# -*- coding: utf-8 -*-
# PROBE 2: fence parity sanity, material dir resolution, label-set indexing,
# and a dump of the NON-fence occurrence population (the real work surface).
import io, glob, re, os, json, collections

code_span = re.compile(r"`[^`\n]*`")
inline = re.compile(r"\$[^$]*\$")
hit = re.compile(r"\\(?:eq)?ref\{|\\label\{")
lead = re.compile(r"([A-Za-z]{3,})\s*~?\s*\\(?:eq)?ref\{")
EXCLUDE = {"D476", "D71"}
FENCE = re.compile(r"^\s*(?:```|~~~)")
ARG = re.compile(r"\\(?:eq)?ref\{([^{}\\]*)\}|\\label\{([^{}\\]*)\}")

rows = json.load(io.open("E:/math/_work/probe1.json", encoding="utf-8"))
ptab = json.load(io.open("E:/math/_work/preamble_tables.json", encoding="utf-8"))
o = io.open("E:/math/_work/probe2.txt", "w", encoding="utf-8", newline="\n")

# ---- fence parity per note ----
fencecnt = {}
for p in sorted(glob.glob("E:/math/研究笔记/D*.md")):
    nid = os.path.basename(p).split("-")[0]
    if nid in EXCLUDE:
        continue
    c = 0
    for raw in io.open(p, encoding="utf-8", errors="replace").read().split("\n"):
        if FENCE.match(raw):
            c += 1
    fencecnt[nid] = c
odd = {k: v for k, v in fencecnt.items() if v % 2 == 1}
o.write("notes with odd fence-line count=%d %s\n" % (len(odd), json.dumps(odd)))
o.write("notes with any fence=%d\n" % sum(1 for v in fencecnt.values() if v))

# ---- material dirs ----
miss_dir = []
labelset = {}
texcount = {}
for nid, meta in ptab.items():
    d = meta.get("dir")
    root = os.path.join("E:/math/preprints", d or "")
    if not d or not os.path.isdir(root):
        miss_dir.append(nid)
        continue
    tex = glob.glob(os.path.join(root, "build", "**", "*.tex"), recursive=True)
    texcount[nid] = len(tex)
    s = set()
    for t in tex:
        try:
            txt = io.open(t, encoding="utf-8", errors="replace").read()
        except Exception:
            continue
        for m in re.finditer(r"\\label\{([^{}\\]*)\}", txt):
            s.add(m.group(1))
    labelset[nid] = s
o.write("notes with dir resolved=%d missing=%d %s\n" % (
    len(labelset), len(miss_dir), json.dumps(sorted(miss_dir))))
o.write("notes with zero build tex=%s\n" % json.dumps(
    sorted([k for k, v in texcount.items() if v == 0])))
o.write("total labels built=%d\n" % sum(len(v) for v in labelset.values()))

# ---- non-fence population ----
nf = [r for r in rows if not r["fence"]]
o.write("\nNON-FENCE occurrences=%d notes=%d\n" % (len(nf), len(set(r["id"] for r in nf))))
o.write("non-fence by kind=%s\n" % json.dumps(collections.Counter(r["kind"] for r in nf)))
o.write("non-fence by cmd=%s\n" % json.dumps(collections.Counter(r["cmd"] for r in nf)))
inmat = sum(1 for r in nf if r["arg"] in labelset.get(r["id"], set()))
o.write("non-fence arg in material labelset=%d\n" % inmat)
o.write("non-fence arg NOT in material labelset=%d\n" % (len(nf) - inmat))
secarg = [r for r in nf if r["arg"] and re.match(r"^sec[:.:]", r["arg"])]
o.write("non-fence args starting sec: =%d\n" % len(secarg))
o.write("TOP non-fence args:\n")
for a, n in collections.Counter(r["arg"] for r in nf).most_common(50):
    o.write("%4d %-40s inmat=%s\n" % (n, str(a)[:40], any(r["arg"] == a for r in nf)))
o.write("\nNON-FENCE not-in-material SAMPLE (60):\n")
k = 0
for r in nf:
    if r["arg"] not in labelset.get(r["id"], set()) and k < 60:
        o.write("%s:%d [%s] %s | %s\n" % (r["id"], r["line"], r["kind"], str(r["arg"])[:30],
                                          r["line_head"][:150]))
        k += 1
o.write("\nSEC: ARGS SAMPLE (40):\n")
k = 0
for r in secarg:
    if k < 40:
        o.write("%s:%d %s | %s\n" % (r["id"], r["line"], str(r["arg"])[:30], r["line_head"][:140]))
        k += 1
o.close()
json.dump({"labelset": {k: sorted(v) for k, v in labelset.items()}},
          io.open("E:/math/_work/probe2_labels.json", "w", encoding="utf-8"), ensure_ascii=False)
print("nonfence=%d inmat=%d oddfence=%d" % (len(nf), inmat, len(odd)))
