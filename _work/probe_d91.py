import io, glob, re

for k in (u"D91", u"D298"):
    f = glob.glob(u"研究笔记/%s-*.md" % k)[0]
    t = io.open(f, encoding="utf-8").read()
    L = t.split(u"\n")
    heads = []
    for i, l in enumerate(L, 1):
        m = re.match(u"^## *(?:\u00a7 ?)?(\d+)(?:[. \u3000]|$|\uff1a)", l)
        if m:
            heads.append((int(m.group(1)), i, l[:40]))
    print(u"== %s heads=%d nums=%s" % (k, len(heads), [h[0] for h in heads]))
    prev = None
    for n, i, txt in heads:
        if prev is not None and n != prev + 1:
            print(u"   jump %d -> %d at line %d" % (prev, n, i))
        prev = n
    print(u"   file heads raw sample=%s" % [l[:26] for l in L if l.startswith(u"## ")][:4])
    for m in re.finditer(u"\u00a7(7|9|19|18|20)(?![0-9])", t):
        s = max(0, m.start() - 90)
        seg = t[s:m.end() + 150].replace(u"\n", u" ")
        print(u"   HIT %s" % seg[:220])
