r"""把 run141 里还有互压的 cd 画布，连同这一轮修掉的那一张，裁成 300 dpi 的图供人读页。

`_work/probe105_cd_face_control.py` 按 `sorted(canvases())` 的次序把 124 张 cd 画布各排成一页，落在
`_work/_m81render/105<序号>.pdf`；这一支用同一份次序认出旗标那 6 张的序号，再按内容包围盒裁出来，外加
`Global-quantum-geometric-Langlands…#0`——它立案时是 7 对，这一轮的列宽律该把它清干净，是看图时要确认的
那一张。裁完看完就删，不留 `_work/*.png`。

  python _work/probe106_cd_shots.py
"""
import os
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, WORK)
sys.path.insert(0, os.path.join(ROOT, "tools"))
import probe101_cd_batch_pictures as B  # noqa: E402
import probe81_label_box_face as g  # noqa: E402
import probe87b_control_identity as I  # noqa: E402

TMP = os.path.join(WORK, "_m81render")
CD_ENVS = ("tikzcd", "CD")
# `probe105` prints the stems truncated to 46, so these keys are prefixes rather than directory names
# (preprint dirs carry a date suffix and are only ever reachable by glob).
FLAGGED = [("A-universal-group-of-type-F-infinity", 0),
           ("Constructible-tame-Hecke-eigensheaves", 3),
           ("Irrational-cubic-fourfolds-with-geometric-K3", 0),
           ("Tame-Hecke-Eigensheaves-with-Several-Marked-Po", 1),
           ("Tame-Hecke-Eigensheaves-with-Several-Marked-Po", 2),
           ("Unrestricted-pro-modularity-at-the-prime-two", 0),
           ("Global-quantum-geometric-Langlands-at-irr", 0)]


def main():
    order = []
    for (stem, k), (_head, block) in sorted(g.canvases().items()):
        pics, _p = B.batch(stem)
        if k < len(pics) and I.env_of(pics[k]) in CD_ENVS:
            order.append((stem, k))
    for prefix, k in FLAGGED:
        hits = [(stem, idx) for idx, (stem, j) in enumerate(order) if stem.startswith(prefix) and j == k]
        if len(hits) != 1:
            print("  AMBIGUOUS %r#%d -> %d" % (prefix, k, len(hits)))
            continue
        stem = hits[0][0]
        pdf = os.path.join(TMP, "105%d.pdf" % hits[0][1])
        if not os.path.exists(pdf):
            print("  NO PAGE %s" % pdf)
            continue
        doc = fitz.open(pdf)
        page = doc[0]
        box = None
        for d in page.get_drawings():
            box = d["rect"] if box is None else box | d["rect"]
        for b in page.get_text("blocks"):
            r = fitz.Rect(b[:4])
            box = r if box is None else box | r
        box = fitz.Rect(box) + (-4, -4, 4, 4) & page.rect
        name = os.path.join(WORK, "shot106_%s_%d.png" % (stem[:20], k))
        page.get_pixmap(clip=box, dpi=300).save(name)
        print("%-42s#%d  %.0fx%.0fpt -> %s" % (stem[:42], k, box.width, box.height,
                                               os.path.relpath(name, ROOT)))
        doc.close()
    return 0


if __name__ == "__main__":
    sys.exit(main())
