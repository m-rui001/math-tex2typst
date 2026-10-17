# -*- coding: utf-8 -*-
# 浅版债收稿一趟量完：独立复量（字节两读／CR／竖线直方图／逐行 $ 奇偶／标题序列）
# ＋跨队列行号假登记对账＋sweep 两趟＋只读 gate 复量。只打印，不改内容（sweep 除外）。
import glob
import io
import os
import re
import subprocess
import sys
import time
from collections import Counter

sys.path.insert(0, ".tools")
sys.stdout.reconfigure(encoding="utf-8")
HDR = u"| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | " \
      u"\u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |"
ROW = re.compile(u"(?:\u5176\u4ed6|Lean )?\u961f\u5217\\s*\u7b2c\\s*(\\d{1,3})\\s*\u884c")
OTHER = re.compile(u"\u5176\u4ed6\u961f\u5217\\s*\u7b2c\\s*(\\d{1,3})\\s*\u884c")
SEPC = u"| --- | --- | --- | --- | --- |"
DOTH = re.compile(u"^## (\\d+)[. ]")


def texts(kid):
    p = glob.glob(u"\u7814\u7a76\u7b14\u8bb0/%s-*.md" % kid)[0]
    raw = io.open(p, "rb").read()
    return p, raw, raw.decode("utf-8")


def report(kid, tag):
    p, b, t = texts(kid)
    L = t.split(u"\n")
    nums = [int(m.group(1)) for l in L for m in [DOTH.match(l)] if m]
    hy = [l for l in L if l.startswith(u"## \u00a7")]
    hist = Counter(l.count(u"|") for l in L if l.startswith(u"| "))
    odd = [i + 1 for i, l in enumerate(L) if l.count(u"$") % 2]
    rows = ROW.findall(t)
    print(u"[%s] %s size=%d mtime=%s cr=%d heads=%d nums=%s..%s contig=%s "
          u"§heads=%d pipes=%s odd$=%s decls=%s hdr=%d"
          % (tag, kid, len(b), time.strftime("%H:%M:%S", time.localtime(os.path.getmtime(p))),
             b.count(b"\r"), len([l for l in L if l.startswith(u"## ")]),
             nums[0] if nums else u"-", max(nums) if nums else u"-",
             nums == list(range(len(nums))), len(hy),
             dict(hist), odd[:6], sorted(set(rows)), t.count(HDR)))
    return rows


def claim_check(kid):
    # 只比「其他队列第N行」这一形：主线1 的裸「队列第N行号」是 Lean 队列的行号（collect 打 L74），
    # 与主线2 同号不是冲突。
    for n in set(OTHER.findall(texts(kid)[2])):
        owners = []
        for p in glob.glob(u"\u7814\u7a76\u7b14\u8bb0/D*.md"):
            k = p.split(u"\\")[-1].split(u"-")[0]
            if k == kid:
                continue
            t = io.open(p, encoding="utf-8", errors="ignore").read()
            if n in ROW.findall(t):
                owners.append(k)
        if owners:
            print(u"  !! row %s 也被 %s 声明（跨队列/重号，需本体侧判读）" % (n, u" ".join(owners)))


import gate

for kid in sys.argv[1:]:
    a = report(kid, u"pre")
    if a:
        claim_check(kid)
    for _ in range(2):
        subprocess.call([sys.executable, u".tools/sweep.py", kid])
    b = report(kid, u"post")
    p = glob.glob(u"\u7814\u7a76\u7b14\u8bb0/%s-*.md" % kid)[0]
    r = gate.chk(p, quiet=True)
    _, bb, tt = texts(kid)
    LL = tt.split(u"\n")
    print(u"  gate size=%s secs=%s contig=%s rows=%s math=%s problems=%s"
          % (r.get("size"), r.get("secs"), r.get("contig"), r.get("rows"), r.get("math"),
             r.get("problems")))
    print(u"  mine hdr=%d sep=%d tab_lines=%d odd$=%s pipe!=6 rows=%s"
          % (tt.count(HDR), tt.count(SEPC), len([l for l in LL if l.startswith(u"|")]),
             [i + 1 for i, l in enumerate(LL) if l.count(u"$") % 2][:6],
             [i + 1 for i, l in enumerate(LL) if l.startswith(u"| ") and l.count(u"|") != 6][:6]))
