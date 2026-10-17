r"""Scope of the region-wide label alias: for each flat paper, count names the caption-chain rule
missed but the whole-float rule finds, and how many of those are actually `\ref`'d in the body.
"""
import os
import re
import sys

sys.path.insert(0, r"E:/math/tools")
sys.stdout.reconfigure(errors="replace")
from t2t import prep  # noqa: E402

FLAT = r"E:/math/_work/flat"
# the fixed source convert.py hands pandoc, so this is the text label_aliases really reads
WORK = os.path.join(FLAT, "_work_tex")
CAPTION_AT = prep.CAPTION_AT
LABEL_AT = prep.LABEL_AT
REF_AT = re.compile(r"\\(?:ref|eqref|autoref|pageref)\{([^{}]*)\}")

rows = []
for fn in sorted(os.listdir(WORK)):
    if not fn.endswith(".tex"):
        continue
    name = fn[:-4]
    text = open(os.path.join(WORK, fn), encoding="utf-8", errors="replace").read()
    new = prep.label_aliases(text)
    old = {}
    for region in prep.FLOAT_REGION.finditer(text):
        t = region.group(0)
        caps = list(CAPTION_AT.finditer(t))
        if len(caps) != 1:
            continue
        _e, labels = prep._caption_group(t, caps[0].end())
        if len(labels) > 1:
            for _s, _x, nm in labels[:-1]:
                old[nm] = labels[-1][2]
    extra = {k: v for k, v in new.items() if k not in old}
    if not extra:
        continue
    refs = set()
    for m in REF_AT.finditer(text):
        refs.update(k.strip() for k in re.split(r"[,;]", m.group(1)))
    used = sorted(k for k in extra if k in refs)
    rows.append((name[:-4], len(old), len(extra), used))

print("papers with new aliases: %d" % len(rows))
for name, o, e, used in rows:
    print("  %-60s chain=%d new=%d used=%d %s" % (name[:60], o, e, len(used), used[:3]))
