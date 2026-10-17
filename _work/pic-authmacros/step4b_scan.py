r"""The real affected set: papers whose expanded picture text differs.

Scanning macro tables misses the interesting case, and Polynomial-PEPS is it: its `\\geometryrow` is
defined in the body right before the picture, the old `macros.parse_definitions(src)` finds it when
handed the whole file, and the picture still quoted because `convert_paper` only ever expands a
picture against `prep.parse_preamble`'s table. What the patch changes is the *string handed to CeTz*,
so that is what gets compared: one run with the preamble table alone (the shipped path), one with the
figure's own scope and declarations (the patched path). `cetz.build` is never called here; this is the
cheap half that decides which papers the full matrix has to compile.
"""
import hashlib
import json
import os
import re
import sys

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
sys.path.insert(0, os.path.join(ROOT, "_work", "pic-authmacros"))
from t2t import convert, prep  # noqa: E402

flat = os.path.join(ROOT, "_work", "flat")
diff, total = [], 0
for fn in sorted(os.listdir(flat)):
    if not fn.endswith(".tex"):
        continue
    total += 1
    name = fn[:-4]
    src = open(os.path.join(flat, fn), encoding="utf-8", errors="replace").read()
    pre_text, body = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    body = prep.unwrap_boxes(body)
    scopes = convert.picture_scopes(body, p.macros)
    spans = list(convert.TIKZ_SPAN.finditer(body))
    changed = []
    for i, m in enumerate(spans):
        pic = m.group(0)
        old = prep.expand_macros(pic, p.macros)
        table, decls = scopes[i]
        new = prep.expand_macros(convert.with_declarations(pic, decls) if decls else pic, table)
        if hashlib.sha1(old.encode()).hexdigest() != hashlib.sha1(new.encode()).hexdigest():
            changed.append(i)
    if changed:
        diff.append((name, len(spans), changed))

print("papers scanned: %d | with an expanded picture that changes: %d" % (total, len(diff)))
for name, n, changed in diff:
    print("  %-80s %d pics, changed %s" % (name[:80], n, changed))
json.dump([d[0] for d in diff], open(os.path.join(ROOT, "_work", "pic-authmacros",
                                                  "_affected.json"), "w", encoding="utf-8"), indent=1)
