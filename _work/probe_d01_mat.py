import os, io, glob

KEYS = {
    u"D01": "mahler",
    u"D02": "kaplansky",
    u"D03": "vlasov",
    u"D04": "multiplicative",
    u"D05": "quasi",
    u"D06": "irrationality measure",
    u"D07": "heisenberg",
    u"D10": "factor",
}
dirs = os.listdir(u"preprints")
for k, w in KEYS.items():
    hits = [d for d in dirs if w in d.lower()]
    print(u"%s keyword=%s -> %s" % (k, w, hits))
    for h in hits:
        b = os.path.join(u"preprints", h, "build")
        if not os.path.isdir(b):
            print(u"   NO BUILD dir, top-level files=%s" % sorted(os.listdir(os.path.join(u"preprints", h)))[:8])
            continue
        tex = []
        for root, sfd, fs in os.walk(b):
            for fn in fs:
                if fn.endswith(".tex"):
                    tex.append(os.path.join(root, fn))
        tot = sum(os.path.getsize(p) for p in tex)
        print(u"   tex=%d bytes=%d" % (len(tex), tot))
