r"""cd 标签里的 TeX 间距 token 到底印成什么？

`build_cd` 的标签数学走 `mathconv.convert_formulas`（pandoc），`_math_body` 只是它失败时的保底
（`cetz.py:4768`），所以 #86 换掉的那张表**管不到 cd 这一支**。产物里 `\,` 有 217 处／37 张画布，
其中 35 张是 cd：先量 pandoc 对这个 token 发什么，再看页上有没有那个多余的逗号。

  python _work/probe86_cd_path.py mathconv   # 四个样本各回什么
  python _work/probe86_cd_path.py page       # 一张真 cd 画布的页，把带逗号的行打出来
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MODE = sys.argv[1] if len(sys.argv) > 1 else "mathconv"
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.path.insert(0, os.path.join(ROOT, "_work"))
import fitz  # noqa: E402
import probe81_label_box_face as g  # noqa: E402
from t2t import mathconv  # noqa: E402

SAMPLES = [r"P(R \, n)", r"n=-s,\ v=s", r"a \; b", r"c\,d", r"e \! f"]


def mathconv_face():
    got, missing, err = mathconv.convert_formulas(SAMPLES)
    print("  err=%r missing=%r" % (err, missing))
    for i, tex in enumerate(SAMPLES):
        print("  %-16r -> %r" % (tex, (got.get(i) or "").replace("\n", " ")))


def rows(pdf):
    doc = fitz.open(pdf)
    out = []
    for block in doc[0].get_text("dict")["blocks"]:
        for line in block.get("lines", []):
            text = "".join(s["text"] for s in line["spans"]).strip()
            if text:
                out.append(text)
    doc.close()
    return out


def page():
    hit = [(stem, k) for (stem, k), (_h, block) in sorted(g.canvases().items())
           if r"\," in block and "#text(size:" not in block]
    print("  cd canvases carrying `\\,`: %d" % len(hit))
    for stem, k in hit[:3]:
        head, block = g.canvases()[(stem, k)]
        spans = [m.group(0) for m in re.finditer(r"\$[^$]*\$", block) if r"\," in m.group(0)]
        print("  %s#%d   %s" % (stem[:44], k, "  ".join(spans[:3])))
        got = g.render(block, "86c_%d" % k, head)
        if not got:
            print("      render refused")
            continue
        for text in rows(got[2]):
            if "," in text:
                print("      row %r" % text[:60])


if __name__ == "__main__":
    (mathconv_face if MODE == "mathconv" else page)()
