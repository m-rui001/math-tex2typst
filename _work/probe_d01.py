import io, glob, re

IDS = [u"D01", u"D02", u"D03", u"D04", u"D05", u"D06", u"D07", u"D10"]
for k in IDS:
    f = glob.glob(u"研究笔记/%s-*.md" % k)[0]
    t = io.open(f, encoding="utf-8").read()
    L = t.split(u"\n")
    print(u"=== %s %s size=%d lines=%d" % (k, f.split("/")[-1][:40], len(t.encode("utf-8")), len(L)))
    heads = [l for l in L if l.startswith(u"## ")]
    print(u"  nheads=%d first=%s" % (len(heads), [h[:30] for h in heads[:4]]))
    print(u"  tail-heads=%s" % [h[:30] for h in heads[-3:]])
    for l in L[:40]:
        if u"行号" in l or u"队列" in l or u"preprints" in l:
            print(u"  reg: %s" % l[:200])
            break
    d = set(re.findall(r"preprints/[^\s、，。;；)]+", t))
    print(u"  dirs=%s" % list(d)[:2])
    print(u"  dollar=%d backslash_paren=%d" % (t.count(u"$"), t.count(u"\\(")))
