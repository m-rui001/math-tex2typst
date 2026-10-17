"""Page-side proof that a `\hspace{<length>}` now costs its own length.

`typst/A-directional-zero-one-law...` (compiled 10-14 22:21, same stamp as its
`main.typ`) writes two consecutive align rows: row 211 opens its second column with
`\, med` (1.822 + 2.424 pt), row 212 opens the same column with `#h(12mm)`.  Both
columns start at the same `&` position, so the offset between the first word of each
row should be 34.016 - 4.246 = 29.77pt.  Under the old spelling `#h(12mm)` reached
the page as `\,` and the same offset was 4.246 - 1.822 = 2.42pt.
"""
import pymupdf

PAPER = ("typst/A-directional-zero-one-law-for-finite-range-dependent-random-"
         "environments-October-5-2026/main.pdf")
NEEDLES = (["then", "the", "script,"], ["then", "a", "translated"])

doc = pymupdf.open(PAPER)
found = {}
for pno in range(doc.page_count):
    words = doc[pno].get_text("words")
    order = sorted(words, key=lambda w: (round(w[1], 1), w[0]))
    for needle in NEEDLES:
        key = tuple(needle)
        for i in range(len(order) - len(needle)):
            group = order[i:i + len(needle)]
            if [w[4] for w in group] == needle and abs(group[0][1] - group[-1][1]) < 2:
                # the needle is the row's CONTENT, not its left edge: on the current page the
                # 12mm row's needle sits mid-line (after `P0{prefix g0,`), so reading the
                # needle word's x0 measures the wrong thing.  Anchor on the LINE start --
                # the leftmost word at the needle's own y.  (B, 10-15: needle-anchored read
                # gave -33.489; line-anchored gives the real 12mm.)
                y = group[0][1]
                left = min(w[0] for w in words if abs(w[1] - y) <= 1.5)
                found.setdefault(key, (pno, left))
doc.close()

for needle in NEEDLES:
    key = tuple(needle)
    if key not in found:
        print("MISSING:", " ".join(needle))
    else:
        print("%-24s page %d  x0=%.3f" % (" ".join(needle), found[key][0], found[key][1]))

a = found.get(tuple(NEEDLES[0]))
b = found.get(tuple(NEEDLES[1]))
if a and b and a[0] == b[0]:
    print("offset between the two line starts: %.3f pt (12mm = 34.016; old spelling was ~1.7)"
          % (b[1] - a[1]))
