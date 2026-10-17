# -*- coding: utf-8 -*-
# btick400_refine.py  —  robust per-line defect detection for D400+ (set-based).
# Defect signature: backtick, then a non-empty run of CODEISH chars, then '$'
#   where '$' is at EOL or followed by a non-CODEISH char.
# Parity-independent, so it finds every mistyped closer even on dense lines.
import glob
import io
import os
import re
from collections import defaultdict

BT = chr(96)
DL = chr(36)
CODEISH = set(u"0123456789"
              u"abcdefghijklmnopqrstuvwxyz"
              u"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
              u"_:.-/")                    # hyphen added below
CODEISH.add(chr(45))                       # '-' minus/hyphen
KEEPWORDS = [u"应读作", u"登记", u"申报", u"实测", u"不回改",
             u"勘误", u"误写", u"错位"]
CID = re.compile(u"[:0-9./_-]")             # citation-ish content marker


def note_id(path):
    m = re.match(r"D(\d+)-", os.path.basename(path))
    return int(m.group(1)) if m else None


def occs(line):
    res = []
    i = 0
    n = len(line)
    while i < n:
        if line[i] != BT:
            i += 1
            continue
        # i is a backtick; read content run
        j = i + 1
        k = j
        while k < n and line[k] in CODEISH:
            k += 1
        # candidate defect if run non-empty and next char is '$' at boundary
        if k > j and k < n and line[k] == DL:
            after = line[k + 1] if k + 1 < n else None
            if after is None or after not in CODEISH:
                res.append((j, k, line[j:k]))   # content_start, dollar_pos, content
        i += 1
    return res


rows = []
files = sorted([(note_id(p), p) for p in glob.glob(u"研究笔记/D*.md")
                if note_id(p) is not None and note_id(p) >= 400],
               key=lambda x: x[0])
notes_hit = set()
for nid, path in files:
    text = io.open(path, encoding="utf-8").read()
    lines = text.split(u"\n")
    for ln, line in enumerate(lines, 1):
        o = occs(line)
        if not o:
            continue
        dl = line.count(DL)
        bt = line.count(BT)
        keep_kw = [w for w in KEEPWORDS if w in line]
        for (cs, dp, content) in o:
            reason = []
            verdict = "REPAIR"
            if len(o) != 1:
                verdict = "KEEP"
                reason.append(u"dense-line:%d-defects" % len(o))
            if dl % 2 != 1:
                verdict = "KEEP"
                reason.append(u"line-$-even")
            if bt % 2 != 1:
                verdict = "KEEP"
                reason.append(u"flip-backtick-parity")
            if not CID.search(content):
                verdict = "KEEP"
                reason.append(u"content-not-citation")
            if keep_kw:
                verdict = "KEEP"
                reason.append(u"self-report-kw:" + u",".join(keep_kw))
            rows.append(dict(nid=nid, path=path, lineno=ln, dp=dp, cs=cs,
                             content=content, dl=dl, bt=bt, nocc=len(o),
                             verdict=verdict, reason=u";".join(reason), raw=line))
            notes_hit.add(nid)

rep = [r for r in rows if r["verdict"] == "REPAIR"]
keep = [r for r in rows if r["verdict"] == "KEEP"]
byn = defaultdict(set)
for r in rep:
    byn[r["nid"]].add(r["lineno"])

with io.open(u"_work/btick400_refine.txt", "wb") as f:
    f.write((u"total_occurrences=%d distinct_lines=%d notes_hit=%d REPAIR=%d KEEP=%d\n"
             % (len(rows), len(set((r["path"], r["lineno"]) for r in rows)),
                len(notes_hit), len(rep), len(keep))).encode("utf-8"))
    for nid in sorted(byn):
        f.write((u"REPAIR nid=%d lines=%s\n" % (nid, sorted(byn[nid]))).encode("utf-8"))
    f.write(u"\n==== ALL OCCURRENCES ====\n".encode("utf-8"))
    for r in sorted(rows, key=lambda x: (x["nid"], x["lineno"])):
        rec = (u"[%s] nid=%d line=%d nocc=%d dl=%d bt=%d content=%s reason=%s\n    %s\n"
               % (r["verdict"], r["nid"], r["lineno"], r["nocc"], r["dl"], r["bt"],
                  r["content"], r["reason"] or u"ok", r["raw"]))
        f.write(rec.encode("utf-8"))

print("occurrences=%d distinct_lines=%d notes_hit=%d REPAIR=%d KEEP=%d" % (
    len(rows), len(set((r["path"], r["lineno"]) for r in rows)),
    len(notes_hit), len(rep), len(keep)))
print("repair_by_note_lines=" + str({k: sorted(v) for k, v in sorted(byn.items())}))
