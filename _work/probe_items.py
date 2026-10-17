# -*- coding: utf-8 -*-
"""Scale probe 2: enumerate candidate sections and their item paragraphs."""
import io, os, re, glob

NOTES = r"E:\math" + "\\" + u"\u7814\u7a76\u7b14\u8bb0"
OUT = r"E:\math\_work\_probe2.txt"
KEYS = [u"\u52d8\u8bef", u"\u7533\u62a5", u"\u8865\u8bb0", u"\u81ea\u68c0", u"\u4ea4\u672c\u4f53\u4fa7"]

CN = u"\u4e00\u4e8c\u4e09\u56db\u4e94\u516d\u4e03\u516b\u4e5d\u5341\u767e\u96f6"
# item enumerator at line start: 一、 / （一） / 1. / 1、 / (1)
ITEM = re.compile(u"^[\uff08(]?(?:[" + CN + u"]{1,4}|\d{1,3})[\uff09)\u3001.\uff1a:]")

files = sorted(glob.glob(os.path.join(NOTES, "D*.md")))
rep = []
tot_items = 0
notes_with = 0
styles = {}
for p in files:
    t = io.open(p, encoding="utf-8", errors="replace").read()
    ls = t.split("\n")
    heads = [(i, l) for i, l in enumerate(ls, 1)
             if re.match(r"^#{1,6}\s", l) and any(k in l for k in KEYS)]
    if not heads:
        continue
    notes_with += 1
    # section bodies: from heading until next heading of same-or-higher level
    n_items = 0
    for hi, (hl, htext) in enumerate(heads):
        lvl = len(htext) - len(htext.lstrip("#"))
        end = len(ls)
        for j in range(hl, len(ls)):
            l = ls[j]
            if re.match(r"^#{1,6}\s", l) and (len(l) - len(l.lstrip("#"))) <= lvl:
                end = j
                break
        body = ls[hl:end]
        cnt = 0
        for b in body:
            bs = b.strip()
            if not bs or bs.startswith("#"):
                continue
            if ITEM.match(bs):
                cnt += 1
                styles[bs[:2]] = styles.get(bs[:2], 0) + 1
        n_items += cnt
        rep.append(u"%s\tL%d\t%s\titems=%d" % (os.path.basename(p)[:44], hl, htext.strip()[:70], cnt))
    tot_items += n_items
    rep.append(u"### %s total_items=%d" % (os.path.basename(p)[:44], n_items))

with io.open(OUT, "w", encoding="utf-8") as f:
    f.write(u"files=%d notes_with_sections=%d items=%d\n" % (len(files), notes_with, tot_items))
    f.write(u"enumerator-first-chars: " + u" ".join(u"%s:%d" % (k, v) for k, v in sorted(styles.items(), key=lambda x: -x[1])[:30]) + u"\n\n")
    f.write(u"\n".join(rep))
print("files=%d notes=%d items=%d" % (len(files), notes_with, tot_items))
