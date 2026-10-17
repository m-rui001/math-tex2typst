# -*- coding: utf-8 -*-
# 逐篇断言：行数不变、CR=0、markers 精确递减、其余字节完全一致。
import glob
import io
import os

OPEN_MARK = chr(60) + chr(33) + chr(45) + chr(45)
NL = chr(10)
DIR = u"E:/math/\u7814\u7a76\u7b14\u8bb0"

REPAIR = {
    u"D177": [417], u"D195": [83], u"D198": [336], u"D202": [81], u"D205": [85],
    u"D214": [80, 133, 248, 285, 299], u"D224": [21], u"D227": [69], u"D234": [256],
    u"D242": [327], u"D256": [189], u"D264": [205, 207], u"D266": [81],
    u"D274": [333, 334], u"D295": [55], u"D298": [67], u"D314": [151], u"D330": [61],
    u"D339": [56], u"D382": [40], u"D389": [49], u"D431": [226], u"D436": [362],
    u"D437": [362], u"D457": [59],
}
KEEP_NOTES = {u"D30": 1, u"D45": 1, u"D217": 1, u"D374": 2}

out, fails = [], []
tot_removed_bytes = 0
tot_sites = 0
for nid in sorted(REPAIR, key=lambda x: (len(x), x)):
    path = glob.glob(DIR + u"/" + nid + u"-*.md")[0]
    snap = io.open(u"E:/math/_work/pre_edit/" + nid + u".md", "rb").read()
    cur = io.open(path, "rb").read()
    st, ct = snap.decode("utf-8"), cur.decode("utf-8")
    sl, cl = st.split(NL), ct.split(NL)
    sites = REPAIR[nid]
    exp = list(sl)
    nbytes = 0
    for ln in sites:
        target = exp[ln - 1]
        if not (target.startswith(OPEN_MARK) and target.endswith(chr(45) + chr(45) + chr(62))):
            fails.append(u"%s L%d snapshot line is not a marker line" % (nid, ln))
        nbytes += len(target.encode("utf-8"))
        exp[ln - 1] = u""
    expected_text = NL.join(exp)
    checks = []
    checks.append((u"lines", len(sl) == len(cl), u"%d->%d" % (len(sl), len(cl))))
    checks.append((u"cr0", cur.count(bytes([13])) == 0, u"%d" % cur.count(bytes([13]))))
    checks.append((u"markers", ct.count(OPEN_MARK) == st.count(OPEN_MARK) - len(sites),
                   u"%d->%d (want -%d)" % (st.count(OPEN_MARK), ct.count(OPEN_MARK), len(sites))))
    checks.append((u"bytesidentical", cur == expected_text.encode("utf-8"),
                   u"delta=%d expected=%d" % (len(st.encode("utf-8")) - len(cur), nbytes)))
    checks.append((u"size_delta", len(st.encode("utf-8")) - len(cur) == nbytes,
                   u"%d" % (len(st.encode("utf-8")) - len(cur))))
    line = u"%s " % nid
    for name, ok, detail in checks:
        line += u" %s=%s(%s)" % (name, u"OK" if ok else u"FAIL", detail)
        if not ok:
            fails.append(u"%s %s %s" % (nid, name, detail))
    out.append(line)
    tot_removed_bytes += nbytes
    tot_sites += len(sites)

for nid, want in sorted(KEEP_NOTES.items()):
    path = glob.glob(DIR + u"/" + nid + u"-*.md")[0]
    ct = io.open(path, encoding="utf-8").read()
    got = ct.count(OPEN_MARK)
    out.append(u"KEEP %s markers=%d want=%d %s" % (nid, got, want, u"OK" if got == want else u"FAIL"))
    if got != want:
        fails.append(u"KEEP %s markers=%d want=%d" % (nid, got, want))

allnotes = glob.glob(DIR + u"/D*.md")
grand = sum(io.open(p, encoding="utf-8").read().count(OPEN_MARK) for p in allnotes)
gn = sum(1 for p in allnotes if OPEN_MARK in io.open(p, encoding="utf-8").read())
out.append(u"")
out.append(u"sites repaired=%d  notes touched=%d  bytes removed=%d" % (tot_sites, len(REPAIR), tot_removed_bytes))
out.append(u"corpus recount: markers=%d  notes hit=%d  files=%d" % (grand, gn, len(allnotes)))
out.append(u"FAILURES: %s" % (fails if fails else u"none"))
io.open(u"E:/math/_work/html_comment_verify.txt", "wb").write((NL.join(out) + NL).encode("utf-8"))
