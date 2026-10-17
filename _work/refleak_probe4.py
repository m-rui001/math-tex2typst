# -*- coding: utf-8 -*-
# PROBE 4: sanity on fences (D63 odd count), blockquote/declaration surfaces,
# self-anchor (catA) population, and Chinese-ratio check on fenced hits.
import io, re, glob, os, json, collections

code_span = re.compile(r"`[^`\n]*`")
inline = re.compile(r"\$[^$]*\$")
hit = re.compile(r"\\(?:eq)?ref\{|\\label\{")
lead = re.compile(r"([A-Za-z]{3,})\s*~?\s*\\(?:eq)?ref\{")
FENCE = re.compile(r"^\s*(?:```|~~~)")
o = io.open("E:/math/_work/probe4.txt", "w", encoding="utf-8", newline="\n")

# --- D63 fence lines ---
p63 = glob.glob("E:/math/研究笔记/D63-*.md")[0]
lines = io.open(p63, encoding="utf-8", errors="replace").read().split("\n")
o.write("D63 fence lines:\n")
for i, l in enumerate(lines):
    if FENCE.match(l):
        o.write("  %d %s\n" % (i + 1, l[:60]))

# --- self anchors across corpus + heading numbering styles ---
anchor_hits = 0
notes_with_anchor = 0
notes_with_hash_heading = 0
anchor_map = {}
for q in sorted(glob.glob("E:/math/研究笔记/D*.md")):
    nid = os.path.basename(q).split("-")[0]
    if nid in ("D476", "D71"):
        continue
    txt = io.open(q, encoding="utf-8", errors="replace").read()
    ids = set()
    for m in re.finditer(r"^\s*#{1,6}.*?\{#([A-Za-z0-9_\-:.]+)\}", txt, re.M):
        ids.add(m.group(1))
    if ids:
        notes_with_anchor += 1
        anchor_map[nid] = ids
    if re.search(r"^\s*#{2,4}\s*§", txt, re.M):
        notes_with_hash_heading += 1
o.write("\nnotes with {#anchor} headings=%d ; notes with '## §' headings=%d\n"
        % (notes_with_anchor, notes_with_hash_heading))
o.write("anchor notes sample=%s\n" % json.dumps(sorted(anchor_map)[:40]))
for nid, ids in sorted(anchor_map.items()):
    o.write("  %s anchors=%s\n" % (nid, json.dumps(sorted(ids))))

# --- how many non-fence occurrence args match a self anchor of the same note ---
rows = json.load(io.open("E:/math/_work/probe1.json", encoding="utf-8"))
nf = [r for r in rows if not r["fence"]]
selfref = [r for r in nf if r["arg"] and r["arg"] in anchor_map.get(r["id"], set())]
o.write("\nnon-fence occurrences=%d ; self-anchor(catA candidates)=%d notes=%s\n"
        % (len(nf), len(selfref), json.dumps(collections.Counter(r["id"] for r in selfref), ensure_ascii=False)))
for r in selfref[:60]:
    o.write("  %s:%d [%s] arg=%s | %s\n" % (r["id"], r["line"], r["kind"], r["arg"], r["line_head"][:130]))

# --- blockquote + declaration-word surfaces among non-fence occurrences ---
DECL = re.compile("(原文|逐字|素材写|引文|逐条抄|抄录|一字未改|原文如下)")
bq = [r for r in nf if re.match(r"^\s*>", r["line_head"])]
o.write("\nnon-fence lines starting with '>' (blockquote)=%d notes=%d\n"
        % (len(bq), len(set(r["id"] for r in bq))))
bq2 = [r for r in nf if r["kind"] == "body" and not re.match(r"^\s*>", r["line_head"]) and DECL.search(r["line_head"])]
o.write("non-fence body non-blockquote with declaration words=%d\n" % len(bq2))
for r in bq2[:40]:
    o.write("  %s:%d %s\n" % (r["id"], r["line"], r["line_head"][:130]))

# --- chinese ratio check on fenced vs non-fenced ---
CJK = re.compile(r"[\u4e00-\u9fff]")
def cr(s):
    s = code_span.sub(" ", s)
    tot = max(1, len(re.sub(r"\s", "", s)))
    return len(CJK.findall(s)) / tot
frows = [r for r in rows if r["fence"]]
nfb = [r for r in nf if r["kind"] == "body"]
o.write("\nmean CJK ratio: fenced lines=%.4f non-fenced body lines=%.4f\n" % (
    sum(cr(r["line_head"]) for r in frows) / len(frows),
    sum(cr(r["line_head"]) for r in nfb) / max(1, len(nfb))))
lo = [r for r in frows if cr(r["line_head"]) > 0.25]
o.write("fenced occurrences on lines with CJK ratio>0.25 = %d\n" % len(lo))
for r in lo[:25]:
    o.write("  %s:%d %s\n" % (r["id"], r["line"], r["line_head"][:140]))
# blockquote CJK
o.write("\nblockquote occurrence CJK ratio>0.25 = %d\n" % sum(1 for r in bq if cr(r["line_head"]) > 0.25))
for r in [z for z in bq if cr(z["line_head"]) > 0.25][:25]:
    o.write("  %s:%d %s\n" % (r["id"], r["line"], r["line_head"][:140]))
o.close()
json.dump({k: sorted(v) for k, v in anchor_map.items()},
          io.open("E:/math/_work/probe4_anchors.json", "w", encoding="utf-8"), ensure_ascii=False)
print("selfref=%d bq=%d declbody=%d" % (len(selfref), len(bq), len(bq2)))
