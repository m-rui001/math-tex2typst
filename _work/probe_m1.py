import io, os, re, glob

IDS = {
    u"D01": "The-symmetric-Mahler-conjecture-and-its-equality-cases-September-22-2026",
    u"D06": "The-irrationality-exponent-of-pi-is-2-September-24-2026",
    u"D07": "Spontaneous-magnetization-in-the-quantum-Heisenberg-ferromagnet-September-24-2026",
    u"D10": "An-isomorphism-of-the-free-group-factors-September-23-2026",
}
SULU = u"研究笔记/素材"
su = os.listdir(SULU)
rt = os.listdir(u"reasoning_traces") if os.path.isdir(u"reasoning_traces") else []
KW = {
    u"D01": ["mahler", "Mahler"],
    u"D06": ["pi", "irrational"],
    u"D07": ["heisenberg", "Heisenberg", "magnet"],
    u"D10": ["free", "factor"],
}
for k, d in IDS.items():
    f = glob.glob(u"研究笔记/%s-*.md" % k)[0]
    t = io.open(f, encoding="utf-8").read()
    b = os.path.join(u"preprints", d, "build")
    tex = []
    if os.path.isdir(b):
        for root, sfd, fs in os.walk(b):
            for fn in fs:
                if fn.endswith(".tex"):
                    tex.append(os.path.join(root, fn))
    tot = sum(os.path.getsize(p) for p in tex)
    heads = [l for l in t.split(u"\n") if l.startswith(u"## ")]
    print(u"== %s file=%s" % (k, os.path.basename(f)))
    print(u"   bytes=%d secs=%d last_head=%s" % (len(t.encode("utf-8")), len(heads), heads[-1][:34]))
    print(u"   tui=%d dash=%d dollar=%d" % (t.count(u"[推测]"), len(re.findall(u"\u2014", t)), t.count(u"$")))
    print(u"   dir=%s tex=%d bytes=%d" % (d, len(tex), tot))
    ks = KW[k]
    m = [x for x in su if any(y.lower() in x.lower() for y in ks)]
    print(u"   sucai=%s" % [(x, os.path.getsize(os.path.join(SULU, x))) for x in m])
    r = [x for x in rt if any(y.lower() in x.lower() for y in ks)]
    print(u"   reasoning=%s" % r)
    # ledger header spelling in note
    hl = [l for l in t.split(u"\n") if l.startswith(u"|")][:2]
    print(u"   tbl_head=%s" % [h[:80] for h in hl])
