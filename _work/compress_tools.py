r"""Trim community.md section 3 to the instruments the live document still points at.

Section 3 is 165 rows of one-off probes; most of them served a round whose derivation now lives in
`_work/community_axes.md`.  A row stays when its filename is named somewhere else in the document
(an axis, a §7 residue, §4, §5) or when it is a general-purpose tool.  The rest move, verbatim, to
`_work/community_tools.md`.  Dry run by default; pass `--write` to apply.
"""
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
HERE = os.path.dirname(os.path.abspath(__file__))
DOC = os.path.join(HERE, "community.md")
GENERIC = ("crop_band.py", "crop_words.py", "crop_near_text.py", "shot_pages.py", "shot_clip.py",
           "render_pair.py", "find_figure_pages.py", "probe_find_page.py", "dump_canvas.py",
           "dump_one_canvas.py", "probe_page_overflow.py", "word_overlap_report.py",
           "probe_typst_warnings.py", "probe_gate_all.py", "residue.py", "dangling_report.py",
           "probe_product_snapshot.py", "regen_rest.py", "regen_list.py", "regen_extras.py",
           "caption_page_report.py", "probe_tikzcd_census.py", "probe_tikzcd_defects.py")


def main():
    text = open(DOC, encoding="utf-8").read()
    lines = text.split("\n")
    start = next(i for i, l in enumerate(lines) if l.startswith("## 3. "))
    end = next(i for i, l in enumerate(lines) if l.startswith("## 4. "))
    body = [l for l in lines[start + 2:end] if l.startswith("| ")]
    rest = "\n".join(lines[:start] + lines[end:])
    keep, moved = [], []
    for row in body:
        name = re.match(r"\| `([^`]+)`", row)
        base = os.path.basename(name.group(1)) if name else ""
        stem = re.sub(r"\{.*\}", "", base).replace(".py", "").replace(".typ", "")
        hit = stem and stem in rest
        if (hit or base in GENERIC or base.startswith("tools/") or "*" in base
                or base.startswith("typst/") or not base):
            keep.append(row)
        else:
            moved.append(row)
    print("rows %d -> keep %d / move %d" % (len(body), len(keep), len(moved)))
    print("chars %d -> %d" % (len(text), len(text) - sum(len(m) for m in moved)))
    if "--write" not in sys.argv:
        for m in moved[:8]:
            print("  move: " + m[:80])
        return
    with open(os.path.join(HERE, "community_tools.md"), "w", encoding="utf-8") as fh:
        fh.write("# community.md §3 移出的量具（原文，未改动）\n\n"
                 "| 文件 | 角色 |\n|---|---|\n" + "\n".join(moved) + "\n")
    out = (lines[:start] + ["## 3. 关键文件清单", "| 文件 | 角色 |", "|---|---|"] + keep
           + ["", "只服务已归档轮次的一次性量具移到了 `_work/community_tools.md`（原文未改，按 §2 的轴号可回查）。",
              ""] + lines[end:])
    open(DOC, "w", encoding="utf-8").write("\n".join(out))
    print("written")


if __name__ == "__main__":
    main()
