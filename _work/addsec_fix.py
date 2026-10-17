import io, os, re, sys
sys.stdout.reconfigure(encoding="utf-8")
ROOT = u"\u7814\u7a76\u7b14\u8bb0"


def load(i):
    f = [x for x in os.listdir(ROOT) if x.startswith(u"D%s-" % i)][0]
    p = os.path.join(ROOT, f)
    raw = io.open(p, encoding="utf-8", newline="").read()
    return p, raw, raw.split(u"\n")


def save(p, lines, raw):
    out = u"\n".join(lines)
    bak = os.path.join(u"_work", u"reorder-bak", os.path.basename(p) + u".pre-addsec.md")
    io.open(bak, "w", encoding="utf-8", newline="").write(raw)
    io.open(p, "w", encoding="utf-8", newline="").write(out)
    return out


# D38 / D82: trailing '## 0 补记' duplicates the real section 0 -> give it max+1
for i in [u"38", u"82"]:
    p, raw, lines = load(i)
    nums = [int(m.group(1)) for l in lines for m in [re.match(u"^## *(?:\u00a7 ?)?(\\d+)(?=[. \u3001])", l)] if m]
    nxt = max(nums) + 1
    k = [n for n, l in enumerate(lines) if re.match(u"^## (?:\u00a7 )?0 (?:\u8865\u8bb0|\u00a7)", l) or l.startswith(u"## 0 \u8865\u8bb0") or l.startswith(u"## \u00a70 \u8865\u8bb0")]
    assert len(k) == 1, (i, k)
    old = lines[k[0]]
    lines[k[0]] = u"## %d \u8865\u8bb0" % nxt
    out = save(p, lines, raw)
    print("%s heading %r -> %r ; size %d->%d" % (i, old, lines[k[0]], len(raw.encode("utf-8")), len(out.encode("utf-8"))))

# D83: '## 0.1 补记' sits mid-file -> move to end as ## 15
p, raw, lines = load(u"83")
h = [n for n, l in enumerate(lines) if l.startswith(u"## 0.1 ")]
assert len(h) == 1, h
start = h[0]
end = start + 1
while end < len(lines) and not lines[end].startswith(u"## "):
    end += 1
blk = lines[start:end]
blk[0] = u"## 15 \u8865\u8bb0\uff1a\u7d20\u6750\u8def\u5f84\u6838\u5bf9\u4e0e\u961f\u5217\u5b9a\u4f4d\uff082026-10 \u590d\u8dd1\uff09"
rest = lines[:start] + lines[end:]
while rest and rest[-1].strip() == u"":
    rest.pop()
new = rest + [u""] + blk
out = save(p, new, raw)
same = sorted(new) == sorted(lines)
print("D83 moved %d lines to end; multiset_equal=%s size %d->%d" % (len(blk), same, len(raw.encode("utf-8")), len(out.encode("utf-8"))))
