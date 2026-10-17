import io, os, re, glob, collections

pat = re.compile(u"\\\\(?:New|Renew|Provide|Declare)DocumentCommand\\s*\\{?\\\\([A-Za-z]+)\\}?\\s*\\{([^{}]*)\\}")
hit = collections.Counter()
files = 0
samples = []
for root, dirs, fs in os.walk(u"preprints"):
    if u"typst" in root:
        continue
    for fn in fs:
        if not fn.endswith((u".tex", u".sty", u".cls")):
            continue
        p = os.path.join(root, fn)
        try:
            t = io.open(p, encoding=u"utf-8", errors=u"replace").read()
        except Exception:
            continue
        ms = pat.findall(t)
        if ms:
            files += 1
            for name, spec in ms:
                hit[name] += 1
                if len(samples) < 8:
                    i = t.find(u"DocumentCommand")
                    samples.append(p + u"  ::  " + t[i - 3:i + 70].replace(u"\n", u"\\n"))
print(u"files_with_doccmd=%d  defs=%d  distinct=%d" % (files, sum(hit.values()), len(hit)))
for k, v in hit.most_common(25):
    print(u"  %-12s %d" % (k, v))
for s in samples:
    print(u"S " + s)
