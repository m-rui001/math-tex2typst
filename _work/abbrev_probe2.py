# -*- coding: utf-8 -*-
import glob, io, os, re

PRE = u"preprints"


def NL(k):
    p = glob.glob(u"研究笔记/%s-*.md" % k)[0]
    return p, io.open(p, "rb").read().decode("utf-8").split("\n")


def dump(path, lo, hi, tag):
    b = io.open(path, "rb").read()
    L = b.split(b"\n")
    print(u"### %s\n%s  bytes=%d ends_nl=%s split=%d" % (
        tag, path, len(b), b.endswith(b"\n"), len(L)))
    for i in range(lo - 1, min(hi, len(L))):
        print(u"%5d| %s" % (i + 1, L[i].decode("utf-8", "replace").rstrip("\r")[:170]))


d95 = os.path.join(PRE, u"Replacing-Gaussian-observations-in-memory-constrained-inference-September-27-2026")
hits = []
for root, dirs, files in os.walk(d95):
    for f in files:
        if f in (u"07b-hybrid-endpoint.tex", u"03-critical-radius.tex"):
            hits.append(os.path.join(root, f))
for h in sorted(hits):
    print(os.path.relpath(h, PRE).encode("utf-8"))
