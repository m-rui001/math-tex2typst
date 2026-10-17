r"""Which papers can the patch possibly touch?

Two independent surfaces, both measured over the whole corpus rather than assumed:

1. the macro table. `macros.UNSAFE` used to test bodies as substrings, so a body containing `\\fill`
   was refused as a conditional. Any paper whose accepted definition set differs between the two
   trees is a paper whose prose *and* pictures expand differently.
2. the picture scope. A `\tikzset`/`\colorlet`/`\definecolor` or a `\\newcommand` standing in the body
   between two pictures now travels into the picture; a picture that already converted there is the
   one at risk.

Run once per tree (`--tree tools`, `--tree _work/pic-authmacros`) and diff the two dumps. This is the
cheap half of the matrix: no pandoc, no CeTz build.
"""
import hashlib
import json
import os
import re
import sys

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))


def dump(tree):
    sys.path.insert(0, os.path.join(ROOT, tree))
    from t2t import macros, prep
    out = {}
    flat = os.path.join(ROOT, "_work", "flat")
    span = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
    decl = re.compile(r"\\(?:tikzset|colorlet|definecolor)(?![A-Za-z])")
    for fn in sorted(os.listdir(flat)):
        if not fn.endswith(".tex"):
            continue
        src = open(os.path.join(flat, fn), encoding="utf-8", errors="replace").read()
        pre, body = prep.split_document(src)
        p = prep.parse_preamble(pre)
        whole, _sk = macros.parse_definitions(src)
        spans = list(span.finditer(body))
        pos, touched = 0, 0
        for m in spans:
            region = body[pos:m.start()]
            pos = m.end()
            touched += bool(decl.search(region))
        out[fn[:-4]] = {"pre": hashlib.sha1("|".join(sorted(p.macros)).encode()).hexdigest()[:12],
                        "all": hashlib.sha1("|".join(sorted(whole)).encode()).hexdigest()[:12],
                        "pics": len(spans), "declregions": touched}
    return out


if __name__ == "__main__":
    tree = sys.argv[1]
    path = sys.argv[2]
    json.dump(dump(tree), open(path, "w", encoding="utf-8"), indent=0, sort_keys=True)
    print(tree, "dumped", path)
