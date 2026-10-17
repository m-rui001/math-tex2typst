r"""`cetz.py:1753` 有一张 MATH_SPACING（`\,`→空格、`\;`→空格、`\!`→删），可产物里还有 217 处 `\,`。

两种可能只能靠这一支分开：**发射器今天还在发 `\,`**（那这张表没覆盖到它声称覆盖的东西），或者
**这 37 张画布是旧产物**（那 `#85` 的 stale 面比 `probe86_stale_face` 数到的那 4 张更大）。
做法：先直接叫 `_math_body` 看它今天给什么，再把带 `\,` 的画布按管线重建一遍，与产物逐字节比。

  python _work/probe86_spacing_path.py
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.path.insert(0, WORK)
import probe81m_churn_read as m81  # noqa: E402   (it exec's the gauge, so it has to come first)
from t2t import cetz  # noqa: E402

g = m81.g81

MATH = re.compile(r"\$[^$]*\$")


def main():
    for src in (r"P(R \, n)", r"R \sim T", r"a\,b\;c\!", r"x \ y", r"n=-s,\ v=s$"):
        print("  _math_body(%-16r) -> %r" % (src, cetz._math_body(src)))

    flat = os.path.join(ROOT, "_work", "flat")
    # the product's canvas index and the source's picture index drift apart, so the only honest
    # question is whether ANY canvas rebuilt from that paper still carries the token
    for tag, pat in (("\\,", re.compile(r"\\,")), ("\\ ", re.compile(r"\\ "))):
        spans = []
        for (stem, k), (head, block) in g.canvases().items():
            if any(pat.search(m) for m in MATH.findall(block)):
                spans.append((stem, k))
        keeps = drops = missing = 0
        for stem, k in spans:
            path = os.path.join(flat, stem + ".tex")
            if not os.path.exists(path):
                missing += 1
                continue
            joined = "\n".join("\n".join(t) if isinstance(t, list) else t for t in m81.live(path) if t)
            if pat.search(joined):
                keeps += 1
            else:
                drops += 1
        print("  %-3s on %3d canvases -> rebuild keeps it: %d   none does (stale): %d   no flat source: %d"
              % (tag, len(spans), keeps, drops, missing))
    return 0


if __name__ == "__main__":
    sys.exit(main())
