r"""这一轮的交换图换律跑在**全部** cd 画布上：同一把尺读「页上的产品」与「live 重建」两版，worse 几张？

`_work/probe88e_cd_rebuilt_face.py` 只看普查已经在表上的那一张（tikzcd 7 对／1 张／1 篇），它能证明动机
那一张被清掉，却不能证明这一轮没在别处新增互压——#81 的教训：全库前后差不是回归测试，「worse 0」要同一把
尺读同一源图的两版。这一支把探针的种群换成源图环境是 `tikzcd`/`CD` 的**每一张**画布（`_work/flat` 上图序
＝画布序，与普查同源），产品版与重建版各渲染一页，都交给 `probe81_label_box_face.decide` 同一把尺，按张
报 better／same／worse。

重建走 `cetz.convert(pic, refs=None)`：交叉引用在重建页上是 `??`，比产品少一个字符的宽度，所以判据是对数
不是深度；两版的墨盒差别只要来自这一轮的几何就仍会露出来。

  python _work/probe95_cd_face_all.py
"""
import concurrent.futures
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, WORK)
sys.path.insert(0, os.path.join(ROOT, "tools"))
import probe81_label_box_face as g  # noqa: E402
import probe84_control_face as C  # noqa: E402
import probe87b_control_identity as I  # noqa: E402
from t2t import cetz  # noqa: E402

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
    canvases = g.canvases()
    jobs = []
    for (stem, k), (head, block) in sorted(canvases.items()):
        path, pics = C.pictures(stem)
        if not pics or k >= len(pics) or I.env_of(pics[k]) not in CD_ENVS:
            continue
        jobs.append((stem, k, head, block, pics[k]))
    print("cd canvases on the pages: %d in %d papers" % (len(jobs), len({j[0] for j in jobs})))

    def run(job):
        stem, k, head, block, pic = job
        n = "%s_%d" % (stem[:18], k)
        rebuilt = cetz.convert(pic, refs=None)
        return (stem, k, I.env_of(pic), pairs(block, head, "95p" + n),
                pairs(rebuilt, head, "95r" + n) if rebuilt else None, rebuilt is not None)

    better = same = worse = unreadable = 0
    prod_total = reb_total = 0
    rows = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=6) as pool:
        for stem, k, env, prod, reb, built in pool.map(run, jobs):
            if prod is None or reb is None:
                unreadable += 1
                rows.append("  SKIP %-46s#%d %s (%s)"
                            % (stem[:46], k, env,
                               "product page will not compile" if prod is None else "rebuilt page does not"))
                continue
            prod_total += len(prod)
            reb_total += len(reb)
            if len(reb) < len(prod):
                better += 1
            elif len(reb) > len(prod):
                worse += 1
                rows.append("  WORSE %-45s#%d %s: %d -> %d  %s"
                            % (stem[:45], k, env, len(prod), len(reb),
                               "  ".join("%.2f %r" % (t[0], t[3][:14]) for t in reb[:3])))
            else:
                same += 1
            if len(prod) or len(reb):
                rows.append("      %-45s#%d %-7s product %d -> rebuilt %d"
                            % (stem[:45], k, env, len(prod), len(reb)))
    print("\nbetter %d / same %d / worse %d / unreadable %d" % (better, same, worse, unreadable))
    print("\n".join(rows))
    print("\ntotals: product %d pairs -> rebuilt %d pairs over %.1fpt"
          % (prod_total, reb_total, DEPTH))
    return 0


if __name__ == "__main__":
    sys.exit(main())
