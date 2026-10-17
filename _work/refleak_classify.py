# -*- coding: utf-8 -*-
# FINAL v2: classify every ref_census3 occurrence into A/B/C/D/E; emit
#   E:/math/_work/refleak_plan.tsv          (per note, 9 columns)
#   E:/math/_work/refleak_catB_advice.tsv   (per occurrence, with advice)
#   E:/math/_work/refleak_diag.txt          (audit numbers)
# Read-only on 研究笔记/. Yardstick = ref_census3's four regexes, verbatim.
import io, re, glob, os, json, collections

code_span = re.compile(r"`[^`\n]*`")
inline = re.compile(r"\$[^$]*\$")
hit = re.compile(r"\\(?:eq)?ref\{|\\label\{")
lead = re.compile(r"([A-Za-z]{3,})\s*~?\s*\\(?:eq)?ref\{")
# ---- end verbatim yardstick (below is classification-only machinery) ----

ARG = re.compile(r"\\(?:eq)?ref\{([^{}]*)\}|\\label\{([^{}]*)\}")
CJK = re.compile(r"[一-鿿]")
FENCE_OP = re.compile(r"^\s*(`{3,}|~{3,})(.*)$")
POS = re.compile(r"([\w./\-]*\.(?:tex|lean|yaml|bbl))\s*:\s*(\d+)(?:\s*[-–—]{1,2}\s*(\d+))?")
OPENC = {'"': '"', "“": "”", "「": "」"}
CLOSER = set('"”」')
DECL = re.compile("(原文|逐字|素材写|引文|抄录|一字未改)")
EXCLUDE = {"D476", "D71"}      # being appended by another sessions right now
ptab = json.load(io.open("E:/math/_work/preamble_tables.json", encoding="utf-8"))


def fence_flags(lines):
    st = None
    fl = []
    for l in lines:
        fl.append(st is not None)
        m = FENCE_OP.match(l)
        if m:
            run, info = m.group(1), m.group(2).strip()
            if st is None:
                st = (run[0], len(run))
            elif not info and run[0] == st[0] and len(run) >= st[1]:
                st = None
    return fl


def quote_spans(vis):
    """all (start,end) spans delimited by a quote pair whose interior is <15% CJK"""
    sp = []
    qpos = [(i, c) for i, c in enumerate(vis) if c in OPENC or c in CLOSER]
    for k, (i, c) in enumerate(qpos):
        if c not in OPENC:
            continue
        close = OPENC[c]
        for j, d in qpos[k + 1:]:
            if d == close or (c == '"' and d == '"'):
                inner = vis[i + 1:j]
                if len(inner) >= 12 and len(CJK.findall(inner)) / float(len(inner)) < 0.15:
                    sp.append((i, j))
                break
    return sp


def label_index(nid):
    d = (ptab.get(nid) or {}).get("dir")
    idx = {}
    if not d:
        return idx, None
    root = os.path.join("E:/math/preprints", d, "build")
    if not os.path.isdir(root):
        return idx, d
    for t in glob.glob(os.path.join(root, "**", "*.tex"), recursive=True):
        rel = os.path.relpath(t, os.path.join("E:/math/preprints", d)).replace("\\", "/")
        try:
            txt = io.open(t, encoding="utf-8", errors="replace").read()
        except Exception:
            continue
        for m in re.finditer(r"\\label\{([^{}\\]*)\}", txt):
            ln = txt[:m.start()].count("\n") + 1
            idx.setdefault(m.group(1), []).append((rel, ln))
    return idx, d


occ = []
for p in sorted(glob.glob("E:/math/研究笔记/D*.md")):
    nid = os.path.basename(p).split("-")[0]
    lines = io.open(p, encoding="utf-8", errors="replace").read().split("\n")
    fl = fence_flags(lines)
    idx, matdir = label_index(nid)
    anchors = set(re.findall(r"^\s*#{1,6}.*?\{#([A-Za-z0-9_\-:.]+)\}", "\n".join(lines), re.M))
    headtoks = set()
    for h in lines:
        if re.match(r"^#{2,4} ", h):
            headtoks.update(re.findall(r"[a-z][a-z0-9\-]{4,}", h.lower()))
    in_disp = False
    for i, raw in enumerate(lines):
        nd = len(re.findall(r"\$\$", raw))
        skip_line = in_disp or nd > 0
        if nd % 2 == 1:
            in_disp = not in_disp
        if skip_line:
            continue
        m = code_span.sub(lambda z: " " * len(z.group(0)), raw)
        m = inline.sub(lambda z: " " * len(z.group(0)), m)
        if not hit.search(m):
            continue
        kind = ("head" if re.match(r"^#{2,4} ", raw) else
                "table" if raw.strip().startswith("|") else "body")
        cjk = len(CJK.findall(re.sub(r"\s+", " ", m)))
        spans = quote_spans(m)
        leads = [(g.start(), g.end(), g.group(1)) for g in lead.finditer(m)]
        for z in hit.finditer(m):
            rest = raw[z.start():]
            a = ARG.match(rest)
            if a:
                arg, nested = (a.group(1) if a.group(1) is not None else a.group(2)), False
            else:
                arg, nested = None, bool(re.match(r"\\(?:eq)?ref\{[^{}]*\{", rest))
            lw = None
            for s, e, g in leads:
                if s <= z.start() < e:
                    lw = g
                    break
            occ.append(dict(
                id=nid, line=i + 1, col=z.start(), kind=kind, fence=fl[i], arg=arg, nested=nested,
                cmd=("label" if z.group(0) == "\\label{" else "ref"), lead=lw,
                inc=nid not in EXCLUDE, cjk=cjk,
                inquote=any(s < z.start() < e for s, e in spans),
                bq=bool(re.match(r"^\s*>", raw)), ind=bool(re.match(r"^\s{4,}\S", raw)),
                decl=bool(DECL.search(raw)), anchor=bool(arg and arg in anchors),
                tok_in_head=bool(arg and arg.split(":")[-1].lower() in headtoks),
                mat=idx.get(arg) if arg else None, dir=matdir,
                posstr=[x.group(0) for x in POS.finditer(raw)],
                posfile={x.group(1).split("/")[-1]: (int(x.group(2)), int(x.group(3) or x.group(2)))
                         for x in POS.finditer(raw)},
                snip=raw[z.start():z.start() + 9],
                text=raw.strip()[:300]))


def classify(o):
    if o["kind"] == "table":
        return "D", "table-cell"
    if o["fence"]:
        return "C", "fence-verbatim"
    if o["bq"]:
        return "C", "blockquote-verbatim"
    if o["ind"]:
        return "C", "indented-verbatim"
    if o["inquote"]:
        return "C", "inline-quote-verbatim"
    if o["cjk"] == 0:
        return "C", "material-voice-line"
    if o["anchor"]:
        return "A", "self-heading-anchor"
    if o["mat"]:
        return "B", ("heading-leak" if o["kind"] == "head" else
                     ("label-name-mention" if o["cmd"] == "label" else "prose-leak"))
    if not o["dir"]:
        return "E", "no-material-dir"
    if o["nested"] or o["arg"] is None:
        return "E", "nested-brace-arg"
    if o["arg"] == "...":
        return "E", "ellipsis-placeholder"
    if re.match(r"^\d+$", o["arg"] or ""):
        return "E", "numeric-arg"
    if re.match(r"^(lem|thm|prop|cor|eq):.*(lem|thm|prop|cor|eq):", o["arg"] or ""):
        return "E", "double-prefixed-arg"
    return "E", "arg-not-a-material-label"


def form(o):
    if o["cat"] in ("C", "D"):
        return o["pat"]
    if o["cat"] == "A":
        return "S-ref-self-section"
    if o["cmd"] == "label":
        return "bare-\\label{}"
    return ((o["lead"] + "~\\ref{}") if o["lead"] else
            ("\\eqref{}" if "\\eqref{" in o["snip"] else "\\ref{}"))


for o in occ:
    o["cat"], o["pat"] = classify(o)
    o["form"] = form(o)


def advice(o):
    if o["cat"] != "B":
        return ""
    rel, ln = o["mat"][0]
    base = rel.split("/")[-1]
    cands = [o["mat"][0]] + [x for x in o["mat"][1:] if x[0].split("/")[-1] == base]
    for f, (lo, hi) in o["posfile"].items():
        if f == base and lo <= ln <= hi:
            if o["cmd"] == "label":
                return "keep-as-code(`%s`)+本行已有位置串 %s:%d-%d" % (o["arg"], f, lo, hi)
            return "delete-token(本行位置串 %s:%d-%d 已覆盖该 label)" % (f, lo, hi)
    if o["cmd"] == "label":
        return "keep-as-code(`%s`)+补位置串 %s:%d" % (o["arg"], rel, ln)
    if len(set(x[0] for x in o["mat"])) > 1:
        return "rewrite-as-pos(同名 label 出现在 %d 个素材文件：%s)——必读" % (
            len(set(x[0] for x in o["mat"])), ";".join(sorted({x[0] for x in o["mat"]}))[:80])
    if base in o["posfile"]:
        return "rewrite-as-pos %s:%d(本行同文件另有行号，须核对)" % (rel, ln)
    return "rewrite-as-pos %s:%d" % (rel, ln)


for o in occ:
    o["adv"] = advice(o)

ins = [o for o in occ if o["inc"]]
outl = [o for o in occ if not o["inc"]]
d = io.open("E:/math/_work/refleak_diag.txt", "w", encoding="utf-8", newline="\n")
d.write("census3 yardstick reproduced: notes=164 total=4395 (this run all-notes total=%d notes=%d)\n" % (
    len(occ), len({o["id"] for o in occ})))
d.write("D476 hits=%d ; D71 hits=%d ; in-scope total=%d notes=%d\n" % (
    sum(1 for o in outl if o["id"] == "D476"), sum(1 for o in outl if o["id"] == "D71"), len(ins),
    len({o["id"] for o in ins})))
d.write("CAT occ=%s\nCAT notes=%s\n" % (
    json.dumps(collections.Counter(o["cat"] for o in ins), ensure_ascii=False),
    json.dumps({c: len({o["id"] for o in ins if o["cat"] == c}) for c in "ABCDE"}, ensure_ascii=False)))
d.write("CAT occ incl D476/D71=%s\n" % json.dumps(collections.Counter(o["cat"] for o in occ), ensure_ascii=False))
d.write("PAT occ=%s\n" % json.dumps(collections.Counter(o["pat"] for o in ins).most_common(), ensure_ascii=False))
d.write("fence-in-scope=%d fence-all=%d\n" % (sum(1 for o in ins if o["fence"]), sum(1 for o in occ if o["fence"])))
d.write("table rows=%d (of which also inside a fence: %s)\n" % (
    sum(1 for o in ins if o["kind"] == "table"),
    json.dumps([(o["id"], o["line"]) for o in ins if o["kind"] == "table" and o["fence"]])))
d.write("declared-verbatim words on C lines=%d ; on B lines=%d ; on E lines=%d\n" % (
    sum(1 for o in ins if o["decl"] and o["cat"] == "C"),
    sum(1 for o in ins if o["decl"] and o["cat"] == "B"),
    sum(1 for o in ins if o["decl"] and o["cat"] == "E")))
d.write("head occurrences=%d in %d notes: %s\n" % (
    sum(1 for o in ins if o["kind"] == "head"),
    len({o["id"] for o in ins if o["kind"] == "head"}),
    json.dumps(sorted({(o["id"], o["line"]) for o in ins if o["kind"] == "head"}))))
d.write("B advice buckets=%s\n" % json.dumps(collections.Counter(
    a["adv"].split("(")[0].split(" ")[0] for a in ins if a["cat"] == "B"), ensure_ascii=False))
d.write("B by lead top=%s\n" % json.dumps(collections.Counter(o["lead"] for o in ins if o["cat"] == "B").most_common(14), ensure_ascii=False))
d.write("audit: B occurrences whose arg token also appears in the note's OWN headings=%d notes=%s\n" % (
    sum(1 for o in ins if o["cat"] == "B" and o["tok_in_head"]),
    json.dumps(collections.Counter(o["id"] for o in ins if o["cat"] == "B" and o["tok_in_head"]))))
d.write("\nTOP15 NOTES (in-scope hits, with cat breakdown):\n")
by = collections.defaultdict(list)
for o in ins:
    by[o["id"]].append(o)
for nid, rs in sorted(by.items(), key=lambda z: -len(z[1]))[:15]:
    c = collections.Counter(r["cat"] for r in rs)
    d.write("  %-6s %4d  A=%d B=%d C=%d D=%d E=%d  dominant=%s\n" % (
        nid, len(rs), c["A"], c["B"], c["C"], c["D"], c["E"],
        collections.Counter(r["form"] for r in rs).most_common(1)[0][0]))
d.write("\nE CASES:\n")
for o in ins:
    if o["cat"] == "E":
        d.write("  %s:%d arg=%r %s | %s\n" % (o["id"], o["line"], o["arg"], o["pat"], o["text"][:200]))
for tag in ["inline-quote-verbatim", "material-voice-line", "indented-verbatim"]:
    d.write("\nSAMPLE %s (30, note: how many carry CJK>40):\n" % tag)
    sel = [o for o in ins if o["pat"] == tag]
    d.write("  count=%d with cjk>40=%d with decl-word=%d\n" % (
        len(sel), sum(1 for o in sel if o["cjk"] > 40), sum(1 for o in sel if o["decl"])))
    for o in sel[:30]:
        d.write("  %s:%d cjk=%d | %s\n" % (o["id"], o["line"], o["cjk"], o["text"][:130]))
d.write("\nSAMPLE B prose-leak on lines that also carry a declaration word (20):\n")
k = 0
for o in ins:
    if o["cat"] == "B" and o["decl"] and k < 20:
        d.write("  %s:%d | %s\n" % (o["id"], o["line"], o["text"][:140]))
        k += 1
d.write("\nC/material-voice-line sample:\n")
for o in [x for x in ins if x["pat"] == "material-voice-line"][:15]:
    d.write("  %s:%d ind=%s prevfence? | %s\n" % (o["id"], o["line"], o["ind"], o["text"][:120]))
d.close()

w = io.open("E:/math/_work/refleak_plan.tsv", "w", encoding="utf-8", newline="\n")
w.write("ID\thits\tcatA\tcatB\tcatC\tcatD\tcatE\tfirst_line\tdominant_pattern\n")
for nid in sorted(by, key=lambda x: (-len(by[x]), int(x[1:]))):
    rs = by[nid]
    c = collections.Counter(r["cat"] for r in rs)
    dom = collections.Counter(r["form"] for r in rs).most_common(1)[0][0]
    w.write("%s\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%s\n" % (
        nid, len(rs), c["A"], c["B"], c["C"], c["D"], c["E"], min(r["line"] for r in rs), dom))
w.close()
w = io.open("E:/math/_work/refleak_catB_advice.tsv", "w", encoding="utf-8", newline="\n")
w.write("ID\tline\tcol\tcat\tcmd\targ\tform\tmaterial_position\tadvice\n")
for o in sorted(ins, key=lambda z: (z["id"], z["line"], z["col"])):
    w.write("%s\t%d\t%d\t%s\t%s\t%s\t%s\t%s\t%s\n" % (
        o["id"], o["line"], o["col"], o["cat"], o["cmd"], json.dumps(o["arg"], ensure_ascii=False),
        o["form"], ";".join("%s:%d" % x for x in (o["mat"] or [])[:3]), o["adv"].replace("\t", " ")))
w.close()
io.open("E:/math/_work/refleak_occ.json", "w", encoding="utf-8", newline="\n").write(
    json.dumps([{k: v for k, v in o.items() if k != "text"} for o in occ], ensure_ascii=False))
print("in-scope=%d cats=%s forms=%s" % (len(ins), json.dumps(collections.Counter(o["cat"] for o in ins)),
                                        json.dumps(collections.Counter(o["form"] for o in ins).most_common(12), ensure_ascii=False)))
