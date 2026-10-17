# -*- coding: utf-8 -*-
# PROBE 8: structure of the cjk==0 "material-voice" lines; heading-macro old account (D106/D137);
# quote styles used in the corpus; D101/D100 line context.
import io, re, glob, os, json, collections
o = io.open("E:/math/_work/probe8.txt", "w", encoding="utf-8", newline="\n")
CJK = re.compile(r"[一-鿿]")

occ = json.load(io.open("E:/math/_work/refleak_occ.json", encoding="utf-8"))
cv = [x for x in occ if x["pat"] == "verbatim-material-voice-line" and x["inc"]]
o.write("cjk==0 occurrences=%d notes=%s\n" % (len(cv), json.dumps(collections.Counter(x["id"] for x in cv))))
# indentation / blockquote / previous-line survey
ind = collections.Counter()
for x in cv:
    p = glob.glob(os.path.join("E:/math/研究笔记", x["id"] + "-*.md"))[0]
    lines = io.open(p, encoding="utf-8", errors="replace").read().split("\n")
    raw = lines[x["line"] - 1]
    lead_ws = len(raw) - len(raw.lstrip())
    prev = lines[x["line"] - 2].strip() if x["line"] >= 2 else ""
    ind[(lead_ws > 0, prev.startswith("```"), prev == "", prev.startswith(">"))] += 1
o.write("(indented, prev-is-fence, prev-blank, prev-blockquote)=%s\n" % json.dumps({json.dumps(k): v for k, v in ind.items()}))
for x in cv[:8]:
    p = glob.glob(os.path.join("E:/math/研究笔记", x["id"] + "-*.md"))[0]
    lines = io.open(p, encoding="utf-8", errors="replace").read().split("\n")
    o.write("\n@@ %s:%d ctx\n" % (x["id"], x["line"]))
    for j in range(max(0, x["line"] - 4), min(len(lines), x["line"] + 2)):
        o.write("   %d|%s\n" % (j + 1, lines[j][:160]))

# quote characters survey
qs = collections.Counter()
for p in sorted(glob.glob("E:/math/研究笔记/D*.md"))[:120]:
    t = io.open(p, encoding="utf-8", errors="replace").read()
    for ch in ['"', "“", "”", "「", "」", "‘"]:
        qs[ch] += t.count(ch)
o.write("\nquote char usage over 120 notes=%s\n" % json.dumps(qs, ensure_ascii=False))

# heading-macro old account
for nid in ["D106", "D137"]:
    p = glob.glob(os.path.join("E:/math/研究笔记", nid + "-*.md"))[0]
    lines = io.open(p, encoding="utf-8", errors="replace").read().split("\n")
    hd = [l for l in lines if re.match(r"^#{2,4} ", l)]
    with_macro = [l for l in hd if re.search(r"[A-Za-z]{3,}\s*~\s*[a-zA-Z]+:[A-Za-z0-9\-]+", l)]
    with_refcmd = [l for l in hd if re.search(r"\\(?:eq)?ref\{|\\label\{", l)]
    o.write("\n%s headings=%d with 'Word~name:tag' macro=%d with ref/label cmd=%d head-lines-with-refcmd=%d\n" % (
        nid, len(hd), len(with_macro), len(with_refcmd), len(with_refcmd)))
    for l in with_macro[:30]:
        o.write("   M %s\n" % l[:120])
o.close()
print("cjk0=%d" % len(cv))
