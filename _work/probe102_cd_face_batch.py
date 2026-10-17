r"""这一轮的交换图几何跑在**全部** cd 画布上，重建喂的是转换器真正画的那一串字符。

`_work/probe95_cd_face_all.py` 把种群读了两遍（页上的产品 + `cetz.convert` 的重建），报了 worse 5。
它的重建基是错的：喂进去的是 `_work/flat` 里**没展开宏**的图。转换器在把图交给 `cetz` 之前跑过
`prep.expand_macros`，所以 `R\Gamma_{\hthreects}(H,M_{B,C})`（`\newcommand{\hthreects}{\mathrm{cts}}`）
在批里是 `R\Gamma_{\mathrm{cts}}(...)`，而我读进去的还是 `\hthreects`——texmath 不认这个控制词，就把
**名字本身**排成 9 个字母，单元墨宽从 65pt 胀到 97pt，于是它碰到了邻居。那 5 张 worse 里有 3 张就是这么
来的（#78 的教训换了件衣服：喂量具的串必须是发射器看到的那一串）。

`_work/probe101_cd_batch_pictures.py` 已经把正确的基验过：124 张 cd 画布里 118 张的 `content()` 正文
与产品逐字相同，只差这一轮的坐标。剩 6 张里 5 张是 `\ref`（重建给 `refs=None`，产品给编号，`??` 比
`3.10` 短），另 1 张是画布序号对不上（`Log-abundance…#4` 页上 12 个正文、重建 5 个）。这一支把这两类
**分开记**，不混进 better／same／worse：正文不同就不是同一张图，同一把尺读不出前后。

判据仍是「对数」不是深度：`#88` 把标签缩到 `\scriptstyle`、这一轮把列间距换成量出来的律，两张都在改
墨的宽度，深度会在改好的那张上虚高。

run141 落地之后再跑这一支，量的就不是前后而是**验收**：产品已经是这一轮的规则，重建也是，两版对数应当
处处相等（same 满、better／worse 各 0）。渲染名换成作业序号——`stem[:18]` 在这个种群里有 2 对撞名
（`Counterexamples-to_0`、`_1`），而 `probe81.render` 编译前先删同名 pdf，6 个 worker 并发下会读到别人的页。

  python _work/probe102_cd_face_batch.py
"""
import concurrent.futures
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, WORK)
sys.path.insert(0, os.path.join(ROOT, "tools"))
import probe101_cd_batch_pictures as B  # noqa: E402
import probe81_label_box_face as g  # noqa: E402
import probe87b_control_identity as I  # noqa: E402
from t2t import cetz, convert  # noqa: E402

DEPTH = 3.0
CD_ENVS = ("tikzcd", "CD")


def pairs(canvas, head, name):
    """Over-DEPTH on-ink pairs on one canvas's own page, or None if the page will not compile."""
    got = g.render(canvas, name, head)
    if not got:
        return None
    found, both = g.decide(got[2], *got[:2])
    return [t for t in both if t[0] > DEPTH]


def main():
    canv = g.canvases()
    jobs = []
    for (stem, k), (head, block) in sorted(canv.items()):
        pics, p = B.batch(stem)
        if k >= len(pics) or I.env_of(pics[k]) not in CD_ENVS:
            continue
        rebuilt = cetz.convert(pics[k], p.colors, convert.line_cm(p), refs=None)
        jobs.append((stem, k, head, block, rebuilt, I.env_of(pics[k]),
                     B.bodies(rebuilt) == B.bodies(block)))
    same_maths = sum(1 for j in jobs if j[6])
    print("cd canvases on the pages: %d in %d papers" % (len(jobs), len({j[0] for j in jobs})))
    print("  maths identical to the product: %d   differing (refs / index): %d"
          % (same_maths, len(jobs) - same_maths))

    def run(job):
        idx, (stem, k, head, block, rebuilt, env, equal) = job
        # a stem-derived name is not enough: `stem[:18]` collides for two papers of this population,
        # and `probe81.render` deletes a same-named pdf before compiling, so under 6 workers one job
        # reads another's page
        return (stem, k, env, equal, pairs(block, head, "102p%d" % idx),
                pairs(rebuilt, head, "102r%d" % idx) if rebuilt else None)

    better = same = worse = unreadable = 0
    prod_total = reb_total = 0
    rows = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=6) as pool:
        for stem, k, env, equal, prod, reb in pool.map(run, list(enumerate(jobs))):
            if prod is None or reb is None:
                unreadable += 1
                rows.append("  SKIP  %-46s#%d %s%s"
                            % (stem[:46], k, env,
                               "  (maths differs)" if not equal else ""))
                continue
            if not equal:
                rows.append("  OTHER %-46s#%d %s: product %d pairs, rebuilt %d -- not the same maths"
                            % (stem[:46], k, env, len(prod), len(reb)))
                continue
            prod_total += len(prod)
            reb_total += len(reb)
            if len(reb) < len(prod):
                better += 1
                rows.append("  BETTER %-45s#%d %s: %d -> %d" % (stem[:45], k, env,
                                                                len(prod), len(reb)))
            elif len(reb) > len(prod):
                worse += 1
                rows.append("  WORSE  %-45s#%d %s: %d -> %d  %s"
                            % (stem[:45], k, env, len(prod), len(reb),
                               "  ".join("%.2f %r" % (t[0], t[3][:14]) for t in reb[:3])))
            else:
                same += 1
    print("\nbetter %d / same %d / worse %d / unreadable %d / other %d"
          % (better, same, worse, unreadable, len(jobs) - better - same - worse - unreadable))
    print("\n".join(rows))
    print("\ntotals over the comparable canvases: product %d pairs -> rebuilt %d pairs over %.1fpt"
          % (prod_total, reb_total, DEPTH))
    with open(os.path.join(WORK, "regen102.txt"), "w", encoding="utf-8") as fh:
        fh.write("\n".join(sorted({j[0] for j in jobs})))
    print("wrote _work/regen102.txt (%d papers)" % len({j[0] for j in jobs}))
    return 0


if __name__ == "__main__":
    sys.exit(main())
