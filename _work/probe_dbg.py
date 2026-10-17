# -*- coding: utf-8 -*-
"""Debug target_found / sig_tokens on the D370 calibration items."""
import io, os, re, glob, sys
sys.path.insert(0, r"E:\math\_work")
import workorder_census as W

p = glob.glob(os.path.join(W.NOTES, "D370*.md"))[0]
lines = io.open(p, encoding="utf-8", errors="replace").read().split("\n")
secs = W.sections(lines)
out = io.open(r"E:\math\_work\_probe6.txt", "w", encoding="utf-8")
for hl, ht, a, b in secs:
    its = W.items_of(lines[a:b])
    for k, it in enumerate(its, 1):
        tg = W.target_found(it)
        cat, kind, _ = W.classify(it)
        out.write(u"== L%d I%02d cat=%s kind=%s\n   TEXT %s\n   TG %s\n   TOK %s\n"
                  % (hl, k, cat, kind, it.replace("\n", " ")[:300], tg, W.sig_tokens(it)[:8]))
out.close()
print("done")
