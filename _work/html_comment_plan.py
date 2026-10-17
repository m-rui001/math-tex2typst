# -*- coding: utf-8 -*-
# 判类 + 断言预检 + 原稿快照（只读笔记，只写 _work 下的文件）。
# 执行修复前必须先跑本脚本，人工核对 _work/html_comment_plan.txt。
import glob
import io
import os
import re

OPEN_MARK = chr(60) + chr(33) + chr(45) + chr(45)
CLOSE_MARK = chr(45) + chr(45) + chr(62)
NL = chr(10)
TICK = chr(96)

DIR = u"E:/math/\u7814\u7a76\u7b14\u8bb0"

# ---- 判类表：REPAIR = 整行遗留探针；KEEP = 稿件自申报引用了坏标记本身 ----
REPAIR = {
    u"D177": [417],
    u"D195": [83],
    u"D198": [336],
    u"D202": [81],
    u"D205": [85],
    u"D214": [80, 133, 248, 285, 299],
    u"D224": [21],
    u"D227": [69],
    u"D234": [256],
    u"D242": [327],
    u"D256": [189],
    u"D264": [205, 207],
    u"D266": [81],
    u"D274": [333, 334],
    u"D295": [55],
    u"D298": [67],
    u"D314": [151],
    u"D330": [61],
    u"D339": [56],
    u"D382": [40],
    u"D389": [49],
    u"D431": [226],
    u"D436": [362],
    u"D437": [362],
    u"D457": [59],
}
KEEP = [
    (u"D30", 6, u"marker quoted inside a code span (backtick count 4) as part of the source-file description; quoting line is never cleaned"),
    (u"D374", 65, u"protected by this note's own declaration at L274 (protocol residue, kept and not deleted); ambiguous -> keep and register"),
    (u"D374", 274, u"defect declaration line quoting the marker in backticks (protocol residue registration)"),
    (u"D45", 1, u"recovery-provenance banner, not a self-check probe; carries substantive rebuild info, no probe/verify wording"),
    (u"D217", 16, u"anchor-protocol line whose own text declares permanent retention in place and wording; not a byte probe -> ambiguous, keep and register"),
]

plan = []
errs = []
snapdir = u"E:/math/_work/pre_edit"
if not os.path.isdir(snapdir):
    os.makedirs(snapdir)

repair_sites = 0
for nid in sorted(REPAIR, key=lambda x: (len(x), x)):
    hits = glob.glob(DIR + u"/" + nid + u"-*.md")
    if len(hits) != 1:
        errs.append((nid, u"glob not unique: %d" % len(hits)))
        continue
    path = hits[0]
    raw = io.open(path, "rb").read()
    text = raw.decode("utf-8")
    lines = text.split(NL)
    cr = raw.count(bytes([13]))
    plan.append(u"### %s  file=%s" % (nid, os.path.basename(path)))
    plan.append(u"    lines=%d  cr=%d  markers=%d" % (len(lines), cr, text.count(OPEN_MARK)))
    if cr:
        errs.append((nid, u"CR present"))
    io.open(snapdir + u"/" + nid + u".md", "wb").write(raw)
    for ln in REPAIR[nid]:
        if ln > len(lines):
            errs.append((nid, u"L%d out of range" % ln))
            continue
        line = lines[ln - 1]
        stripped = line.strip()
        ok_open = stripped.startswith(OPEN_MARK)
        ok_close = stripped.endswith(CLOSE_MARK)
        ok_whole = (line == stripped)
        sub = text.count(line)
        plan.append(u"    L%-4d REPAIR whole=%s open=%s close=%s substring_count=%d len=%d" % (
            ln, ok_whole, ok_open, ok_close, sub, len(line)))
        plan.append(u"         TEXT: %s" % line)
        if not (ok_open and ok_close and ok_whole):
            errs.append((nid, u"L%d not a clean whole-line balanced marker" % ln))
        if sub != 1:
            errs.append((nid, u"L%d not unique in file (count=%d)" % (ln, sub)))
        if line.count(OPEN_MARK) != 1 or line.count(CLOSE_MARK) != 1:
            errs.append((nid, u"L%d multiple markers on line" % ln))
        repair_sites += 1

for nid, ln, why in KEEP:
    hits = glob.glob(DIR + u"/" + nid + u"-*.md")
    path = hits[0]
    text = io.open(path, encoding="utf-8").read()
    lines = text.split(NL)
    line = lines[ln - 1]
    plan.append(u"### %s  (KEEP only note unless also in REPAIR list)" % nid)
    plan.append(u"    L%-4d KEEP  ticks=%d  %s" % (ln, line.count(TICK), why))
    plan.append(u"         TEXT: %s" % line[:200])

tot = io.open(u"E:/math/_work/html_comment_sites.txt", encoding="utf-8").read()
measured = sum(int(x.split(chr(9))[2]) for x in tot.split(NL)[2:] if x.strip())
plan.append(u"")
plan.append(u"measured sites total = %d ; REPAIR = %d ; KEEP = %d ; sum = %d" % (
    measured, repair_sites, len(KEEP), repair_sites + len(KEEP)))
plan.append(u"notes repaired = %d ; notes kept-only = %d" % (len(REPAIR), 4))
plan.append(u"ASSERT ERRORS: %s" % (errs if errs else u"none"))
io.open(u"E:/math/_work/html_comment_plan.txt", "wb").write((NL.join(plan) + NL).encode("utf-8"))
io.open(u"E:/math/_work/html_comment_plan_errs.txt", "wb").write(
    (NL.join(u"%s | %s" % e for e in errs) + NL if errs else u"no assertion errors" + NL).encode("utf-8"))
