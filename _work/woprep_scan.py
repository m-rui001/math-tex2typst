# -*- coding: utf-8 -*-
# Read-only census: scan research notes for declaration phrases.
import io, os, json, sys, glob

NOTES = r"E:\math\研究笔记"
OUT = r"E:\math\_work\_woprep"
EXCL = {"D476", "D71"}

PATS = [
    u"不就地改动", u"就地改动", u"机械可修", u"属机械可修", u"不作任何就地",
    u"留给本体", u"本体侧", u"需本体", u"修法：", u"修法是", u"正确形式是",
    u"应改为", u"应予更正", u"登记不改", u"落盘后不改动", u"本笔记一律不", u"工单",
]

def load(p):
    b = io.open(p, "rb").read()
    t = b.decode("utf-8", "replace")
    return t.split("\n")

def main():
    hits = []
    files = sorted(glob.glob(os.path.join(NOTES, "D*.md")))
    nfiles_all = 0
    nfiles_used = 0
    for p in files:
        base = os.path.basename(p)
        dnum = base.split("-")[0]
        if not dnum[1:].isdigit():
            continue
        nfiles_all += 1
        if dnum in EXCL:
            continue
        nfiles_used += 1
        lines = load(p)
        for i, ln in enumerate(lines, 1):
            found = [w for w in PATS if w in ln]
            if found:
                hits.append({"d": dnum, "file": base, "line": i,
                             "pats": found, "text": ln})
    info = {"files_matching_glob": len(files), "note_files": nfiles_all,
            "note_files_used": nfiles_used, "total_hits": len(hits),
            "files_with_hits": len(set(h["d"] for h in hits))}
    sys.stdout.write(json.dumps(info) + "\n")
    per_pat = {}
    for h in hits:
        for w in h["pats"]:
            per_pat[w] = per_pat.get(w, 0) + 1
    sys.stdout.write(json.dumps({"per_pat": per_pat}, ensure_ascii=False) + "\n")
    if not os.path.isdir(OUT):
        os.makedirs(OUT)
    io.open(os.path.join(OUT, "hits.json"), "w", encoding="utf-8").write(
        json.dumps(hits, ensure_ascii=False, indent=1))

main()
