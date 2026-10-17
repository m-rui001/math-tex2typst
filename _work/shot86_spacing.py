r"""这一轮改的画布在页上到底长什么样：逐张单独渲染、读行盒、裁 300 dpi 的带。

`#86` 的缺陷是**行**上的（`\ ` 被 Typst 读成换行、`\,` 印成逗号），闸门只看编不编得过，所以收口
要在页上问两件事：① 一句 `$n=-s,\ v=s$` 现在是不是**一行**；② 换成的 `#h(<x>em)` 词距在不在。
本工具不做新判据，只把带 token 的画布交给 #81 那把尺的 `render()`（同一份 CeTz 头、单独一页），
读它的文本行，再按整张画布的墨盒裁一条 300 dpi 的带给人看。

  python _work/shot86_spacing.py            # 全带 token 的画布：行数＋首行文本
  python _work/shot86_spacing.py crop 6     # 前 6 张另裁 PNG 到 _work/shot86_*.png
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, WORK)
import fitz  # noqa: E402
import probe81_label_box_face as g  # noqa: E402

TOKEN = re.compile(r"#h\((?:0\.3333|0\.2778|-0\.1667)em\)")
MODE = sys.argv[1] if len(sys.argv) > 1 else "lines"
LIMIT = int(sys.argv[2]) if len(sys.argv) > 2 else 6


def main():
    canv = g.canvases()
    picked = sorted(item for item in canv.items() if TOKEN.search(item[1][1]))
    print("canvases carrying this round's token: %d over %d papers"
          % (len(picked), len({stem for (stem, _k), _v in picked})))
    rows = []
    for i, ((stem, k), (head, canvas)) in enumerate(picked):
        got = g.render(canvas, "s86_%04d_%d" % (i, k), head)
        if not got:
            print("  %-52s #%d  RENDER FAILED" % (stem[:52], k))
            continue
        _rects, _ink, pdf = got
        doc = fitz.open(pdf)
        page = doc[0]
        lines = []
        for block in page.get_text("dict")["blocks"]:
            for line in block.get("lines", []):
                text = "".join(sp["text"] for sp in line["spans"]).strip()
                if text:
                    lines.append((round(line["bbox"][1], 1), text))
        lines.sort()
        clip = fitz.Rect(fitz.INFINITE_RECT())
        for block in page.get_text("dict")["blocks"]:
            clip |= fitz.Rect(block["bbox"])
        for draw in page.get_drawings():
            clip |= fitz.Rect(draw["rect"])
        clip = (clip & page.rect) if not clip.is_empty else page.rect
        doc.close()
        rows.append((stem, k, pdf, clip))
        print("  %-52s #%d  %d lines | %s"
              % (stem[:52], k, len(lines), " // ".join(t for _y, t in lines)[:96]))
    if MODE != "crop":
        return
    for stem, k, pdf, clip in rows[:LIMIT]:
        doc = fitz.open(pdf)
        pix = doc[0].get_pixmap(matrix=fitz.Matrix(300 / 72.0, 300 / 72.0),
                                clip=clip + (-6, -6, 6, 6))
        name = os.path.join(WORK, "shot86_%s_%d.png" % (re.sub(r"[^A-Za-z0-9]", "", stem)[:24], k))
        pix.save(name)
        doc.close()
        print("  crop -> %s" % os.path.basename(name))


if __name__ == "__main__":
    main()
