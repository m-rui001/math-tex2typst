r"""#90 where did the 155 written pen keys go?

The change-surface probe (`_work/probe123_cap_churn.py`) reports that not ONE emitted canvas gained a
`cap:` or a `join:`, while the face (`_work/probe122_pen_option_face.py`) counts 155 `line cap=` and 77
`line join=` written on picture heads.  Either the converter refuses every picture that writes one, or
the key is written somewhere the census called a head and `_opts_at` does not read it there.  This
walks the pictures that write a pen key and prints, per picture: whether `build` emits it, what the
emitter says for the first stroke, and the head's own option list as the converter parses it.
"""
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
KEY = re.compile(r"line (?:cap|join)\s*=")

from t2t import cetz

emitted = refused = 0
for fn in sorted(os.listdir(FLAT)):
    if not fn.endswith(".tex"):
        continue
    text = io.open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
    for pic in PIC.findall(text):
        if not KEY.search(pic):
            continue
        got = cetz.build(pic)
        m = re.match(r"\\begin\{tikzpicture\}", pic)
        head, _pos = cetz._opts_at(pic[m.end():].lstrip(), 0)
        writes = re.findall(r"line (?:cap|join)\s*=\s*\S+", pic)
        pen = sorted(set(writes))
        if got is None:
            refused += 1
            if refused <= 6:
                print("REFUSED %-58s head=%s writes=%s" %
                      (fn[:-4][:58], sorted(head or {}), pen[:3]))
            continue
        emitted += 1
        has = 'cap: "' in got or 'join: "' in got
        first = [l.strip() for l in got.splitlines() if "stroke: (" in l]
        print("%s %-58s head=%s writes=%s" % ("OK  " if has else "MISS", fn[:-4][:58],
                                              sorted(head or {}), pen[:3]))
        if first:
            print("      " + first[0][:150])
print("pictures writing a pen key: emitted=%d refused=%d" % (emitted, refused))
