# -*- coding: utf-8 -*-
import io, glob, os, re, json

B = chr(92)
NOTE = u"研究笔记"
ID = u"D04"
f = glob.glob(u"E:/math/" + NOTE + u"/" + ID + u"-*.md")[0]
raw = io.open(f, "rb").read()
s = raw.decode("utf-8")
lines = s.split(u"\n")
heads = [(i + 1, l) for i, l in enumerate(lines) if l.startswith(u"## ")]
out = [u"file = " + f,
       u"bytes = %d  lines = %d  CR = %d" % (len(raw), len(lines), raw.count(b"\r")),
       u"heads = %d" % len(heads),
       u"first3 = " + json.dumps([h[1][:40] for h in heads[:3]], ensure_ascii=False),
       u"last5 = " + json.dumps([h[1][:40] for h in heads[-5:]], ensure_ascii=False),
       u"tail = " + json.dumps(lines[-4:], ensure_ascii=False),
       u"secs_per = %.0f" % (len(raw) / max(1, len(heads))),
       u"dollars = %d" % s.count(B + B and u"$")]

q = io.open(u"E:/math/.tools/other_queue.txt", encoding="utf-8").read().split(u"\n")
rows = [l.split() for l in q if l.strip()]
hit = [r for r in rows if r[0] == ID]
out.append(u"queue row = " + json.dumps(hit, ensure_ascii=False))
dline = None
for l in io.open(u"E:/math/.tools/dispatched.txt", encoding="utf-8").read().split(u"\n"):
    if l.startswith(ID + u"\t") or l.split(u"\t")[0] == ID:
        dline = l
out.append(u"dispatched = " + json.dumps(dline, ensure_ascii=False))
if hit:
    d = hit[0][1]
    root = u"E:/math/preprints/" + d
    tex = sorted(glob.glob(os.path.join(root, u"**", u"*.tex"), recursive=True))
    out.append(u"dir exists = %s  tex files = %d" % (os.path.isdir(root), len(tex)))
    out.append(u"dir = " + d)
    tot = 0
    for t in tex:
        n = os.path.getsize(t)
        tot += n
        out.append(u"  %8d  %s" % (n, t[len(root) + 1:].replace(os.sep, "/")))
    out.append(u"tex total = %d" % tot)
    covered = []
    for l in lines:
        covered += re.findall(r"[0-9A-Za-z_./-]+\.tex", l)
    from collections import Counter
    c = Counter(covered)
    out.append(u"cited tex = " + json.dumps(dict(c), ensure_ascii=False))
io.open(u"E:/math/_work/d04_stats.txt", u"wb").write(u"\n".join(out).encode(u"utf-8"))
print(u"ok", len(out))
