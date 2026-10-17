import io, glob, os, re, sys

sys.stdout.reconfigure(encoding="utf-8")
for k in (u"D298", u"D91"):
    f = glob.glob(u"研究笔记/%s-*.md" % k)[0]
    t = io.open(f, encoding="utf-8").read()
    print(u"=== %s %s size=%d" % (k, os.path.basename(f), len(t.encode("utf-8"))))
    for l in t.split(u"\n")[:26]:
        if u"preprints" in l or u"行号" in l or u"素材" in l:
            print(u"   %s" % l[:200])
    d = set(re.findall(r"preprints[/\\]([A-Za-z0-9._\-]+)", t))
    print(u"   dirs=%s" % list(d)[:3])
    for cand in list(d):
        for sub in (u"build", u"build/source", u"build/sections"):
            b = os.path.join(u"preprints", cand, sub)
            if os.path.isdir(b):
                tex = []
                for root, sfd, fs in os.walk(b):
                    tex += [os.path.join(root, fn) for fn in fs if fn.endswith(".tex")]
                print(u"   %s/%s tex=%d bytes=%d" % (cand, sub, len(tex),
                                                    sum(os.path.getsize(p) for p in tex)))
