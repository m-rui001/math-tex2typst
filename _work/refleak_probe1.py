# -*- coding: utf-8 -*-
# PROBE 1: collect every occurrence under the exact ref_census3 yardstick,
# attach context (loc kind, fence state, lead word, label arg), dump to file.
import io, glob, re, os, json, collections

# ---- verbatim reuse of the four regexes from _work/ref_census3.py ----
code_span = re.compile(r"`[^`\n]*`")
inline = re.compile(r"\$[^$]*\$")
hit = re.compile(r"\\(?:eq)?ref\{|\\label\{")
lead = re.compile(r"([A-Za-z]{3,})\s*~?\s*\\(?:eq)?ref\{")
# ---------------------------------------------------------------------

EXCLUDE = {"D476", "D71"}
FENCE = re.compile(r"^\s*(?:```|~~~)")
ARG = re.compile(r"\\(?:eq)?ref\{([^{}\\]*)\}|\\label\{([^{}\\]*)\}")

rows = []
fence_state_counter = collections.Counter()
for p in sorted(glob.glob("E:/math/研究笔记/D*.md")):
    base = os.path.basename(p)
    nid = base.split("-")[0]
    if nid in EXCLUDE:
        continue
    lines = io.open(p, encoding="utf-8", errors="replace").read().split("\n")
    in_disp = False
    infence = False
    for i, raw in enumerate(lines):
        is_fence_line = bool(FENCE.match(raw))
        nd = len(re.findall(r"\$\$", raw))
        skip_line = in_disp or nd > 0
        if nd % 2 == 1:
            in_disp = not in_disp
        was_fence = infence
        if is_fence_line:
            infence = not infence
        if skip_line:
            continue
        m = code_span.sub(lambda z: " " * len(z.group(0)), raw)
        m = inline.sub(lambda z: " " * len(z.group(0)), m)
        ms = list(hit.finditer(m))
        if not ms:
            continue
        kind = ("head" if re.match(r"^#{2,4} ", raw) else
                "table" if raw.strip().startswith("|") else "body")
        leads = [g.group(1) for g in lead.finditer(m)]
        for j, z in enumerate(ms):
            # recover the argument from the RAW line at the same offset
            rest = raw[z.start():]
            a = ARG.match(rest)
            arg = (a.group(1) if a and a.group(1) is not None else
                   (a.group(2) if a else None))
            cmd = "label" if raw.startswith("\\label{", z.start()) or "\\label{" == z.group(0) else "ref"
            rows.append({
                "id": nid, "line": i + 1, "col": z.start(), "kind": kind,
                "fence": was_fence, "cmd": cmd, "arg": arg,
                "matched": z.group(0), "line_head": raw.strip()[:240],
            })

io.open("E:/math/_work/probe1.json", "w", encoding="utf-8", newline="\n").write(
    json.dumps(rows, ensure_ascii=False))
o = io.open("E:/math/_work/probe1_stats.txt", "w", encoding="utf-8", newline="\n")
o.write("total occurrences=%d notes=%d\n" % (len(rows), len(set(r["id"] for r in rows))))
o.write("by kind=%s\n" % json.dumps(collections.Counter(r["kind"] for r in rows)))
o.write("by cmd=%s\n" % json.dumps(collections.Counter(r["cmd"] for r in rows)))
o.write("in-fence total=%d\n" % sum(1 for r in rows if r["fence"]))
o.write("in-fence by kind=%s\n" % json.dumps(collections.Counter(r["kind"] for r in rows if r["fence"])))
o.write("fence & table=%d\n" % sum(1 for r in rows if r["fence"] and r["kind"] == "table"))
o.write("head lines notes=%s\n" % json.dumps(collections.Counter(r["id"] for r in rows if r["kind"] == "head"), ensure_ascii=False))
o.write("unique args=%d\n" % len(set(r["arg"] for r in rows)))
c = collections.Counter(r["arg"] for r in rows if r["arg"] is not None)
o.write("TOP ARG:\n")
for a, n in c.most_common(60):
    o.write("%4d  %s\n" % (n, a))
o.write("ARG none=%d\n" % sum(1 for r in rows if r["arg"] is None))
o.write("\nSAMPLE fence rows:\n")
k = 0
for r in rows:
    if r["fence"] and k < 25:
        o.write("%s:%d [%s] %s\n" % (r["id"], r["line"], r["kind"], r["line_head"][:180]))
        k += 1
o.write("\nSAMPLE head rows:\n")
k = 0
for r in rows:
    if r["kind"] == "head" and k < 25:
        o.write("%s:%d %s\n" % (r["id"], r["line"], r["line_head"][:180]))
        k += 1
o.write("\nSAMPLE table rows:\n")
k = 0
for r in rows:
    if r["kind"] == "table" and k < 25:
        o.write("%s:%d %s\n" % (r["id"], r["line"], r["line_head"][:180]))
        k += 1
o.close()
print("done total=%d fence=%d" % (len(rows), sum(1 for r in rows if r["fence"])))
