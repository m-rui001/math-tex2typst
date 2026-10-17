# -*- coding: utf-8 -*-
# PROBE 6: ptab coverage, S-ref self-reference form, full dump of unresolved cases
import io, re, glob, os, json, collections
code_span = re.compile(r"`[^`\n]*`")
inline = re.compile(r"\$[^$]*\$")
hit = re.compile(r"\\(?:eq)?ref\{|\\label\{")
lead = re.compile(r"([A-Za-z]{3,})\s*~?\s*\\(?:eq)?ref\{")
ptab = json.load(io.open("E:/math/_work/preamble_tables.json", encoding="utf-8"))
o = io.open("E:/math/_work/probe6.txt", "w", encoding="utf-8", newline="\n")
notes = [os.path.basename(x).split("-")[0] for x in glob.glob("E:/math/研究笔记/D*.md")]
o.write("notes=%d ptab keys=%d\n" % (len(notes), len(ptab)))
o.write("notes not in ptab=%s\n" % json.dumps(sorted(set(notes) - set(ptab))))
o.write("ptab keys with falsy dir=%s\n" % json.dumps(sorted([k for k, v in ptab.items() if not v.get("dir")])))
o.write("ptab keys not among notes=%s\n" % json.dumps(sorted(set(ptab) - set(notes))))
# D259 record
o.write("D259 record=%s\n" % json.dumps(ptab.get("D259"), ensure_ascii=False))
o.write("preprints matching 'split':\n")
for d in glob.glob("E:/math/preprints/*"):
    if os.path.isdir(d) and ("Splitt" in os.path.basename(d) or "Weil" in os.path.basename(d)):
        o.write("   %s\n" % os.path.basename(d))

# --- S / section-sign prefixed refs anywhere in the corpus (all notes, raw) ---
cnt = collections.Counter()
det = []
for p in sorted(glob.glob("E:/math/研究笔记/D*.md")):
    nid = os.path.basename(p).split("-")[0]
    txt = io.open(p, encoding="utf-8", errors="replace").read()
    for m in re.finditer(r"\\(?:eq)?ref\{([^{}]*)\}", txt):
        pre = txt[max(0, m.start() - 12):m.start()]
        if "\\S" in pre or "§" in pre or re.search(r"第\s*$", pre):
            ln = txt[:m.start()].count("\n") + 1
            cnt[nid] += 1
            det.append((nid, ln, m.group(0)[:40], pre.replace("\n", "\\n")[-40:]))
o.write("\nS-prefixed ref occurrences: total=%d notes=%d %s\n" % (sum(cnt.values()), len(cnt), json.dumps(cnt, ensure_ascii=False)))
for d in det[:40]:
    o.write("   %s:%d %s <<%s\n" % d)

# --- unresolved-arg dump (non-fence) with full lines ---
rows = json.load(io.open("E:/math/_work/probe1.json", encoding="utf-8"))
labelset = json.load(io.open("E:/math/_work/probe2_labels.json", encoding="utf-8"))["labelset"]
o.write("\nFULL DUMP of non-fence occurrences whose arg is not in the material label set:\n")
for r in rows:
    if r["fence"]:
        continue
    if r["arg"] in labelset.get(r["id"], set()):
        continue
    p = glob.glob(os.path.join("E:/math/研究笔记", r["id"] + "-*.md"))[0]
    lines = io.open(p, encoding="utf-8", errors="replace").read().split("\n")
    o.write("\n@@@ %s:%d [%s] arg=%r cmd=%s\n%s\n" % (r["id"], r["line"], r["kind"], r["arg"], r["cmd"], lines[r["line"] - 1][:900]))
o.close()
print("Srefs=%d" % sum(cnt.values()))
