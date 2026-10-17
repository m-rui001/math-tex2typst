r"""run141 之后：交换图画布在**产物页**上的互压面，逐张配上作者自己那一页（轴 67）。

收一轮要的数是**页上现在还剩多少**：56 篇重跑后每张 cd 画布渲染一页，交 `probe81.decide` 同一把尺，
报 over-3pt 的对数并按环境（`tikzcd`／`CD`）分开点总数；再替**有对的那几张**跑 pdflatex＋`tikz-cd`／
`amscd` 控制（standalone 带该篇正文字号、带该篇前言的宏，控制画的就是作者真正画的那个形状），把两版的对
并排打出来。旗标本身不说明是谁的缺陷：控制侧同深度也有，就是源页本来就拥挤，这一轮的换律只是把它放回原处；
控制侧干净，才要回去修尺。

渲染文件名必须每张唯一——`probe81.render` 动手先删同名 pdf，`stem[:16]` 有 41 对撞名（`Log-abundance-in0`
就是其中一对，三篇同名前缀），并发下 A 会读到 B 的页或直接没有页。

  python _work/probe105_cd_face_control.py
"""
import concurrent.futures
import glob
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, WORK)
sys.path.insert(0, os.path.join(ROOT, "tools"))
import compare_figure  # noqa: E402
import probe101_cd_batch_pictures as B  # noqa: E402
import probe81_label_box_face as g  # noqa: E402
import probe84_control_face as C  # noqa: E402
import probe87b_control_identity as I  # noqa: E402

DEPTH = 3.0
CD_ENVS = ("tikzcd", "CD")
FLAT = os.path.join(WORK, "flat")


def main():
    jobs = []
    for (stem, k), (head, block) in sorted(g.canvases().items()):
        pics, _p = B.batch(stem)
        env = I.env_of(pics[k]) if k < len(pics) else None
        if env in CD_ENVS:
            jobs.append((stem, k, head, block, env))
    print("cd canvases on the pages: %d in %d papers" % (len(jobs), len({j[0] for j in jobs})))

    def run(job):
        idx, (stem, k, head, block, env) = job
        got = g.render(block, "105%d" % idx, head)
        if not got:
            return (stem, k, env, None, None)
        found, both = g.decide(got[2], *got[:2])
        return (stem, k, env, [t for t in both if t[0] > DEPTH], head)

    totals = {"tikzcd": [0, 0], "CD": [0, 0]}
    flagged = []
    unreadable = 0
    with concurrent.futures.ThreadPoolExecutor(max_workers=6) as pool:
        for stem, k, env, got, head in pool.map(run, list(enumerate(jobs))):
            if got is None:
                unreadable += 1
                print("  NO PAGE %-46s#%d %s" % (stem[:46], k, env))
                continue
            totals[env][0] += len(got)
            totals[env][1] += 1 if got else 0
            if got:
                flagged.append((stem, k, env, got, head))
    papers = {t[0] for t in flagged}
    print("\nover %.1fpt on ink: %d pairs over %d canvases in %d papers (unreadable %d)"
          % (DEPTH, sum(v[0] for v in totals.values()), len(flagged), len(papers), unreadable))
    for env, (npairs, canvases) in totals.items():
        print("  %-8s %d pairs / %d canvases flagged" % (env, npairs, canvases))
    for stem, k, env, got, head in flagged:
        pics, _p = B.batch(stem)
        path = glob.glob(os.path.join(FLAT, stem + "*.tex"))[0]
        size = C.body_size(head)
        pdf, _ = compare_figure.control(path, k, [], size)
        print("\n=== %s#%d  %s  %d 对  最深 %.2fpt  size=%s"
              % (stem[:46], k, env, len(got), max(t[0] for t in got), size))
        print("  product : %s" % [(round(t[0], 2), t[3][:22]) for t in got])
        if pdf is None:
            print("  CONTROL pdflatex produced nothing")
            continue
        doc_boxes, raw, ink, cfound, cboth, text = C.measure(pdf)
        print("  control : boxes=%d raw=%d ink=%d  %s%s"
              % (doc_boxes, raw, ink,
                 [(round(t[0], 2), t[3][:22]) for t in cboth if t[0] > DEPTH],
                 "  [SOURCE SET AS TEXT]" if C.syntax_left(pics[k], text) else ""))
    return 0


if __name__ == "__main__":
    sys.exit(main())
