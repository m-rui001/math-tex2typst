r"""#98 改动面: every picture in `_work/flat` through the loop law and through the stub, in one run.

`_work/probe98_make_stub.py` writes the pre-round module into `_work/old98/t2t_old98`; this calls
`build` on exactly the string the batch hands each picture with both modules and prints the canvases
whose emission differs, which papers they belong to, and which of them used to be refused.

  python _work/probe98_loop_stub_diff.py
"""
import io
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(HERE, "_work", "old98"))
sys.path.insert(0, os.path.join(HERE, "tools"))

from t2t import cetz as new_mod  # noqa: E402
from t2t_old98 import cetz as old_mod  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
OUT = os.path.join(HERE, "_work", "label98_loop_stub_diff.json")


def main():
    changed, refused_now, drawn_now, total = [], [], 0, 0
    canvases = {}
    for name in sorted(os.listdir(os.path.join(HERE, "_work", "flat"))):
        if not name.endswith(".tex"):
            continue
        stem = name[:-4]
        text = io.open(os.path.join(HERE, "_work", "flat", name),
                       encoding="utf-8", errors="replace").read()
        for i, pic in enumerate(PIC.findall(text)):
            key = "%s#%d" % (stem, i)
            total += 1
            before = old_mod.build(pic)
            after = new_mod.build(pic)
            canvases[key] = after
            if before != after:
                changed.append(key)
                if before is not None and after is None:
                    refused_now.append(key)
                elif before is None:
                    drawn_now += 1
    io.open(OUT, "w", encoding="utf-8").write(json.dumps(canvases, ensure_ascii=False))
    papers = sorted({k.split("#")[0] for k in changed})
    print("pictures=%d changed=%d over %d papers" % (total, len(changed), len(papers)))
    print("  newly refused=%d  previously refused now drawn=%d" % (len(refused_now), drawn_now))
    for key in changed:
        print("  %s" % key)
    for stem in papers:
        print("  paper %s" % stem[:60])


if __name__ == "__main__":
    main()
