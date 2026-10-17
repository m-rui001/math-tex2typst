r"""`\,` 那 37 张的产物行和今天的重建到底差在哪：逐张打印两边，只做一张的对照。

`probe86_spacing_owner.py` 报 37 张全「对不上」，但对不上的原因没读出来。产物里那行的形状是
`content((6.4, 0), [$P_(R \, n)$])`——**没有 `#text(size: 9pt)` 包裹**，而今天的发射器给节点文字
都要包一层，所以这更像整代旧产物，不是 token 的事。这一支把两侧都打出来，眼看过一遍再定性。

  python _work/probe86_spacing_pair.py <stem-fragment>
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
# the gauge wraps stdout and rewrites sys.argv when it is exec'd, so the argument is read first
FRAG = sys.argv[1] if len(sys.argv) > 1 else "A-counterexample-to-Tachikawas"
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.path.insert(0, WORK)
import probe81m_churn_read as m81  # noqa: E402   (it exec's the gauge, so it comes first)

g = m81.g81


def main(frag):
    stem = next((name for name in {s for (s, _) in g.canvases()} if name.startswith(frag)), None)
    if not stem:
        print("no canvas for %r" % frag)
        return 1
    for k in sorted(idx for (s, idx) in g.canvases() if s == stem):
        block = g.canvases()[(stem, k)][1]
        if not re.search(r"\\,", block):
            continue
        print("-- product canvas #%d" % k)
        for ln in block.splitlines():
            if re.search(r"\\,", ln):
                print("   %s" % ln.strip()[:130])
        got = m81.live(os.path.join(ROOT, "_work", "flat", stem + ".tex"))
        print("-- rebuilt from the flat source: %d canvases" % len(got))
        for i, text in enumerate(got):
            joined = "\n".join(text) if isinstance(text, list) else text
            for ln in joined.splitlines():
                if "P_" in ln or "n)" in ln or re.search(r"\\,", ln):
                    print("   #%d  %s" % (i, ln.strip()[:130]))
        print()
    return 0


if __name__ == "__main__":
    sys.exit(main(FRAG))
