import io, os, re, sys
sys.stdout.reconfigure(encoding="utf-8")
ROOT = u"\u7814\u7a76\u7b14\u8bb0"
HDR = u"| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |"
HDR2 = u"| \u8bb0\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |"
SEP = u"| --- | --- | --- | --- | --- |"
out = []
for name in sorted(os.listdir(ROOT)):
    if re.match(u"^D\\d+-.*\\.md$", name) is None:
        continue
    t = io.open(os.path.join(ROOT, name), encoding="utf-8").read()
    L = [l for l in t.split(u"\n") if l.strip().startswith(u"| \u7b26\u53f7") or l.strip().startswith(u"| \u8bb0\u53f7")]
    S = [l for l in t.split(u"\n") if l.strip() == SEP]
    if len(L) > 1 or len(S) > 1:
        d = name[1:name.find(u"-")]
        hs = [(i + 1, l[:34]) for i, l in enumerate(t.split(u"\n")) if l.startswith(u"## ") and (u"\u53f0\u8d26" in l)]
        out.append((d, len(L), len(S), hs))
print("multi_hdr_notes = %d" % len(out))
for r in out:
    print(r[0], "hdr=%d sep=%d" % (r[1], r[2]), r[3])
