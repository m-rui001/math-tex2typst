# 行内代码闭合符被误打成 $ 的批量回改：只动奇数 $ 行上的 STRICT 命中
import io, os, re, sys, glob
from collections import Counter
sys.stdout.reconfigure(encoding="utf-8")

# 在飞的号必须由命令行给，绝不写死：写死的那份常量停在 2026-10-12 的 11 个号上，
# 后来派出去的每一单都不在里面，一旦哪天恰好有在飞稿命中这一族，工具就会去动别人的稿子。
#   python _work/btick_bulk.py D107 D531 D716 [--apply]
FLIGHT = set(a for a in sys.argv[1:] if re.match(u"^D[0-9]+$", a))
APPLY = u"--apply" in sys.argv
STRICT = re.compile(u"`([A-Za-z0-9_./-]+\\.(?:tex|bib|sty|lean):[0-9]+(?: *(?:--|-|to|到) *[0-9]+)?)\\$")

tot_notes = tot_flips = 0
for p in sorted(glob.glob(u"研究笔记/D*.md")):
    base = os.path.basename(p)
    k = base[1:base.find(u"-")]
    if k in FLIGHT:
        continue
    raw = io.open(p, encoding="utf-8").read()
    L = raw.split(u"\n")
    hits = 0
    new = list(L)
    for i, l in enumerate(L):
        if l.count(u"$") % 2 != 1:
            continue
        ms = list(STRICT.finditer(l))
        if not ms:
            continue
        if (l.count(u"$") - len(ms)) % 2 != 0:
            continue
        for m in reversed(ms):
            s, e = m.start(), m.end()
            new[i] = new[i][:e - 1] + u"`" + new[i][e:]
        hits += len(ms)
    if not hits:
        continue
    ob = raw.encode(u"utf-8")
    nb = u"\n".join(new).encode(u"utf-8")
    assert len(ob) == len(nb), (k, len(ob), len(nb))
    assert ob.count(b"$") - nb.count(b"$") == hits
    assert nb.count(b"`") - ob.count(b"`") == hits
    assert nb.count(b"\r") == ob.count(b"\r")
    # 逐行奇偶复量
    odd_after = [i for i, l in enumerate(new) if l.count(u"$") % 2 == 1]
    print(u"%s flips=%d odd_after=%d size=%d" % (k, hits, len(odd_after), len(nb)))
    tot_notes += 1
    tot_flips += hits
    if APPLY:
        io.open(u"_work/%s.pre-btick.md" % k, u"w", encoding="utf-8").write(raw)
        io.open(p, u"wb").write(nb)
print(u"NOTES=%d FLIPS=%d APPLY=%s" % (tot_notes, tot_flips, APPLY))
