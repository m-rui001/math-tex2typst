r"""那 37 张带 `\,` 的画布到底是「旧产物」还是「我的重建没走到那张」？

`probe86_spacing_path.py` 只问了一个整篇有没有 `\,`，答不出归属：`live()` 重建的是源里能读出的
`tikzpicture`，一篇的画布序号与产物块序号还会错位。这一支把两边按**行**对齐——拿产物块里带
`\,` 的那一行，在同一篇的重建画布集里找**只差这个 token** 的那一行（去掉 `\,` 后逐字相等）。
找到＝发射器今天发的确实没有它（旧产物）；找不到＝这支量具没覆盖到那张，归属仍未知。

  python _work/probe86_spacing_owner.py
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.path.insert(0, WORK)
import probe81m_churn_read as m81  # noqa: E402   (it exec's the gauge, so it comes first)

g = m81.g81
MATH = re.compile(r"\$[^$]*\$")


def main():
    flat = os.path.join(ROOT, "_work", "flat")
    stale = unknown = 0
    for (stem, k), (head, block) in sorted(g.canvases().items()):
        rows = [ln for ln in block.splitlines() if any(re.search(r"\\,", m) for m in MATH.findall(ln))]
        if not rows:
            continue
        path = os.path.join(flat, stem + ".tex")
        if not os.path.exists(path):
            print("  no flat source: %s" % stem)
            continue
        rebuilt = []
        for text in m81.live(path):
            joined = "\n".join(text) if isinstance(text, list) else text
            rebuilt.extend(joined.splitlines())
        hit = 0
        for ln in rows:
            # the emitter collapses the run of spaces a dropped token leaves behind, so the two
            # spellings are equal only once whitespace is flattened
            want = re.sub(r"\s+", " ", ln.replace(r"\,", "")).strip()
            if any(re.sub(r"\s+", " ", r).replace(r"\,", "").strip() == want for r in rebuilt):
                hit += 1
        if hit == len(rows):
            stale += 1
        else:
            unknown += 1
            if unknown <= 3:
                print("  UNKNOWN %-44s#%-2d  %d/%d rows matched" % (stem[:44], k, hit, len(rows)))
                print("      product: %s" % rows[0].strip()[:110])
    print("canvases: every `\\,` row matched by a rebuild without it = %d   unexplained = %d"
          % (stale, unknown))
    return 0


if __name__ == "__main__":
    sys.exit(main())
