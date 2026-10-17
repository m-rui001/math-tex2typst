import io, os, re, sys, fnmatch
sys.stdout.reconfigure(encoding="utf-8")
ROOT = u"\u7814\u7a76\u7b14\u8bb0"
HDR = u"| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |"
SEP = u"| --- | --- | --- | --- | --- |"
APPLY = u"--apply" in sys.argv


def path(i):
    f = [x for x in os.listdir(ROOT) if fnmatch.fnmatch(x, u"D%s-*.md" % i)][0]
    return os.path.join(ROOT, f)


def write(p, raw, lines):
    if APPLY:
        io.open(os.path.join(u"_work", u"D%s.pre-merge.md" % p.split(u"D")[1].split(u"-")[1]), "w",
                encoding="utf-8", newline="").write(raw)
        io.open(p, "w", encoding="utf-8", newline="").write(u"\n".join(lines))
        return True
    return False


# ---------- D621: merge headerless second ledger into the first ----------
p = path(u"621")
raw = io.open(p, encoding="utf-8", newline="").read()
L = raw.split(u"\n")
i21 = next(i for i, l in enumerate(L) if l.startswith(u"## \u00a721 "))
i22 = next(i for i, l in enumerate(L) if l.startswith(u"## \u00a722 "))
i26 = next(i for i, l in enumerate(L) if l.startswith(u"## \u00a726 "))
rows = [l for l in L[i26:] if l.strip().startswith(u"|") and l.strip() != SEP]
head_tbl = L[i21:i22]
assert sum(1 for l in head_tbl if l.strip() == HDR) == 1
new_first = head_tbl[:-1]
while new_first and new_first[-1].strip() == u"":
    new_first.pop()
merged = new_first + rows + [u""]
ref26 = sum(1 for l in L if re.search(u"\u00a726(?![.\\d])", l) and not l.startswith(u"## "))
print("D621 rows26=%d first_rows=%d merged_rows=%d refs_to_26=%d" % (len(rows), len(head_tbl), len(merged), ref26))
out = L[:i21] + merged + L[i22:i26]
print("   hdr after=%d sep after=%d" % (sum(1 for l in out if l.strip() == HDR), sum(1 for l in out if l.strip() == SEP)))
body = u"\n".join(out)
n2 = [int(m.group(1)) for l in out for m in [re.match(u"^## \u00a7(\\d+)", l)] if m]
print("   seq contig=%s size %d->%d multiset_kept_rows=%s" % (n2 == list(range(len(n2))), len(raw.encode("utf-8")), len(body.encode("utf-8")),
                                                                all(r in out for r in rows)))
write(p, raw, out)

# ---------- D79: retitle the stale 'continuation (7.4)' heading ----------
p = path(u"79")
raw = io.open(p, encoding="utf-8", newline="").read()
L = raw.split(u"\n")
k = [i for i, l in enumerate(L) if l.startswith(u"## \u00a710 \u7eed (7.4)")]
assert len(k) == 1
L[k[0]] = u"## \u00a710 Lean \u53d6\u8bc1\u8865\u4e25\uff1a\u591a\u51fa\u6765\u7684\u6587\u4ef6\u5728\u4e3a\u54ea\u4e00\u6b65\u8865\u4e25"
print("D79 retitle ->", L[k[0]].encode("unicode_escape")[:60], "size delta",
      len(u"\n".join(L).encode("utf-8")) - len(raw.encode("utf-8")))
write(p, raw, L)
