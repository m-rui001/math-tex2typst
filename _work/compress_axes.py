r"""Compress axes 1-35 of community.md section 2 into a table.

Each axis heading is already a complete one-line law: `### 轴 N：<law>（#NN 已修，<numbers>）`.  The
bullets beneath it are the derivation, and for the rounds up to #51 that derivation is mirrored in the
project memory (`tikz-semantics-measure-with-pdflatex.md`, `typst-refusal-leg-closed.md`,
`typst-caption-loss-mechanisms.md`, `tex-expansion-space-swallowing.md`).  The last fourteen axes stay
in full because their reasoning is still being consumed by open work.

Run with `--dry` to print the byte delta and the resulting table without writing.
"""
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
HERE = os.path.dirname(os.path.abspath(__file__))
DOC = os.path.join(HERE, "community.md")
CUT = 35
HEAD = re.compile(r"^### 轴 (\d+)：(.*)$")


def split_law(title):
    m = re.match(r"^(.*?)（([^（）]*)）$", title)
    return (m.group(1), m.group(2)) if m else (title, "")


def main():
    lines = open(DOC, encoding="utf-8").read().split("\n")
    start = next(i for i, l in enumerate(lines) if l.startswith("## 2. "))
    end = next(i for i, l in enumerate(lines) if l.startswith("## 3. "))
    body = lines[start + 1:end]
    blocks, cur = [], None
    for l in body:
        m = HEAD.match(l)
        if m:
            cur = {"n": int(m.group(1)), "title": m.group(2), "lines": []}
            blocks.append(cur)
        elif cur is not None:
            cur["lines"].append(l)
    keep = [b for b in blocks if b["n"] > CUT]
    rows = ["| 轴 | 轮次与数 | 律 |", "|---|---|---|"]
    for b in blocks:
        if b["n"] > CUT:
            continue
        law, meta = split_law(b["title"])
        rows.append("| %d | %s | %s |" % (b["n"], meta or "—", law))
    note = ["", "轴 1–%d 的推导在 `_work/community_axes.md`（本节压下来的原文，一字未改）与项目记忆里"
            "（`tikz-semantics-measure-with-pdflatex`、`typst-refusal-leg-closed`、"
            "`typst-caption-loss-mechanisms`、`tex-expansion-space-swallowing`、"
            "`typst-residue-closing-checklist`）；**轴 %d 起留正文**，因为那几轮的判据还在被 §7 的残留用。"
            % (CUT, CUT + 1), ""]
    archive = ["# community.md 轴 1–%d 的原文（压缩时移出，未改动）" % CUT, ""]
    for b in blocks:
        if b["n"] > CUT:
            continue
        archive.append(HEAD_LINE(b))
        archive += b["lines"]
    out = lines[:start] + [lines[start]] + note + rows + [""] + [l for b in keep
                                                                 for l in ([HEAD_LINE(b)] + b["lines"])] + lines[end:]
    new = "\n".join(out)
    old = "\n".join(lines)
    print("axes %d / kept in full %d / rows %d" % (len(blocks), len(keep), len(blocks) - len(keep)))
    print("chars %d -> %d (-%d)" % (len(old), len(new), len(old) - len(new)))
    if "--dry" in sys.argv:
        print("\n".join(rows[:6]))
        return
    open(DOC, "w", encoding="utf-8").write(new)
    with open(os.path.join(HERE, "community_axes.md"), "w", encoding="utf-8") as fh:
        fh.write("\n".join(archive).rstrip("\n") + "\n")
    print("written; archive %d chars" % len("\n".join(archive)))


def HEAD_LINE(b):
    return "### 轴 %d：%s" % (b["n"], b["title"])


if __name__ == "__main__":
    main()
