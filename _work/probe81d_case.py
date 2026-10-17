r"""Print the product's canvas block and the source picture behind it, for attribution by eye.

The census says two labels sit on each other; the mechanism is in the two spellings -- ours and the
author's. `python _work/probe81d_case.py <stem-prefix> <canvas-index>`
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "_work"))
import probe81_label_box_face as P  # noqa: E402


def main(stem, k):
    path = glob.glob(os.path.join(ROOT, "typst", stem + "*", "main.typ"))[0]
    text = open(path, encoding="utf-8", errors="replace").read()
    blocks = P.canvas_blocks(text)
    print("=== product canvas #%d of %s" % (k, os.path.basename(os.path.dirname(path))))
    print(blocks[k])
    src = glob.glob(glob.glob(os.path.join(ROOT, "preprints", stem + "*"))[0] + "/build/**/*.tex",
                    recursive=True)
    words = re.findall(r'"([^"]{4,})"', blocks[k])
    for f in src:
        body = open(f, encoding="utf-8", errors="replace").read()
        for pic in re.findall(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", body, re.S):
            if any(w[:12] in pic for w in words):
                print("\n=== source picture in %s" % os.path.relpath(f, ROOT))
                print(pic)
                return
    print("\n(no source picture matched the canvas' quoted strings)")


if __name__ == "__main__":
    main(sys.argv[1], int(sys.argv[2]))
