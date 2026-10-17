import io, os, re, sys
sys.stdout.reconfigure(encoding="utf-8")
ROOT = u"\u7814\u7a76\u7b14\u8bb0"
SECSTYLE = re.compile(u"^## \u00a7(\\d+)")
REF = re.compile(u"\u00a7(\\d+)(?![\\.\\d])")
res = []
for name in sorted(os.listdir(ROOT)):
    if re.match(u"^D\\d+-.*\\.md$", name) is None:
        continue
    t = io.open(os.path.join(ROOT, name), encoding="utf-8").read()
    lines = t.split(u"\n")
    heads = [int(m.group(1)) for l in lines for m in [SECSTYLE.match(l)] if m]
    if not heads:
        continue
    s = set(heads)
    hits = []
    for i, l in enumerate(lines):
        if l.startswith(u"#"):
            continue
        for m in REF.finditer(l):
            if int(m.group(1)) not in s:
                hits.append((i + 1, int(m.group(1)), l.strip()[:70]))
    if hits:
        res.append((name[1:name.find(u"-")], sorted(set(h[1] for h in hits)), hits))
print("secstyle_notes_with_dangling = %d" % len(res))
for d, nums, hits in res:
    print("D%s dangling %s (%d hits)" % (d, nums, len(hits)))
    for h in hits[:2]:
        print("    L%d ref=%d | %s" % h)
