# -*- coding: utf-8 -*-
# 派单前取参数：python _work/dispatch_probe.py D235
import io, glob, os, re, sys, json

NOTE = u"研究笔记"
ID = sys.argv[1] if len(sys.argv) > 1 else u"D235"
f = glob.glob(u"E:/math/" + NOTE + u"/" + ID + u"-*.md")[0]
raw = io.open(f, "rb").read()
s = raw.decode("utf-8")
lines = s.split(u"\n")
heads = [(i + 1, l) for i, l in enumerate(lines) if l.startswith(u"## ")]
out = [u"file = " + f,
       u"bytes=%d lines=%d CR=%d heads=%d  B/sec=%.0f" % (
           len(raw), len(lines), raw.count(b"\r"), len(heads), len(raw) / max(1, len(heads))),
       u"first_heads = " + json.dumps([h[1][:44] for h in heads[:2]], ensure_ascii=False),
       u"last_heads = " + json.dumps([h[1][:44] for h in heads[-3:]], ensure_ascii=False),
       u"tail3 = " + json.dumps(lines[-3:], ensure_ascii=False),
       u"sep_rows=%d std_hdr=%d" % (s.count(u"| --- | --- | --- | --- | --- |"),
                                    len(re.findall(u"(?m)^\\| *符号 *\\|", s)))]
# 素材目录只从 §0 前 5,000 字符里取
m = re.search(r"preprints[/\\\\][^`'’”\s)）,，]{6,200}", s[:5000])
out.append(u"dir_raw = " + (m.group(0) if m else "NONE"))
if m:
    d = m.group(0).replace(u"\\", u"/")
    root = u"E:/math/" + d
    if not os.path.isdir(root):
        cands = [x for x in glob.glob(u"E:/math/preprints/*") if os.path.basename(x).split(u"-September")[0].split(u"-October")[0] in d]
        out.append(u"NOT A DIR; nearest = " + json.dumps([os.path.basename(c) for c in cands[:3]], ensure_ascii=False))
    tex = sorted(glob.glob(os.path.join(root, u"**", u"*.tex"), recursive=True))
    out.append(u"tex=%d total=%dB" % (len(tex), sum(os.path.getsize(t) for t in tex)))
    cited = set()
    for l in lines:
        cited |= set(re.findall(r"[0-9A-Za-z_][0-9A-Za-z_.\-]{0,60}\.tex", l))
    for t in tex:
        b = os.path.basename(t)
        if b not in cited:
            out.append(u"  UNCITED %8dB %4dL  %s" % (
                os.path.getsize(t), io.open(t, encoding="utf-8", errors="replace").read().count(u"\n") + 1,
                t[len(root) + 1:].replace(os.sep, u"/")))
io.open(u"E:/math/_work/dispatch_probe.txt", u"wb").write(u"\n".join(out).encode(u"utf-8"))
print(u"wrote", len(out))
