r"""pdflatex 给画布数学里的 TeX 间距 token 各定什么价？

发射器现在把这些 token 原样送进 Typst 的数学，而 Typst 的词法与 TeX 不同（实测
`_work/probe86_control_space_face.py test`）：

  `$n=-s,\ v=s$`   Typst **断成两行**，pdflatex 是一行加一个词距
  `$n=-s,\,v=s$`   Typst 印出**两个逗号**（`\,` 被当成转义的逗号），pdflatex 是 thin space
  `$n=-s,\;v=s$`   Typst 印出 `,;`，pdflatex 是 thick space
  `$n=-s,~v=s$`    Typst 印出 `,∼`
  `$n=-s,\\v=s$`   Typst 印出 `,\`

量法：每种写法各用一个**首字母做哨兵**（c/t/m/i/p），同一句在 9pt 与 10pt 各排一遍，读哨兵
那一行里 `,` 的墨右缘到下一个墨左缘。墨到墨里混着逗号右边距与 `v` 的 italic correction，所以
**绝对值不能直接抄**；能抄的是**同一字号下相对「无间距的普通空格」以外的公共底数**——两种字号
各读一遍就是为这一步：`(gap(10pt) - gap(9pt))` 是纯宽度按字号的线性部分，公共底数（边距）不随
字号变，于是 **token 的 em 价 = (gap10 - gap9) / (10 - 9)**。`plain`（数学里被 TeX 忽略的那个
真空格）给出底数本身。

  python _work/measure86_space_tokens.py
"""
import os
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
TMP = os.path.join(WORK, "_m86space")

SPELLINGS = [
    ("c", "cs", r"\ "),
    ("t", "thin", r"\,"),
    ("m", "med", r"\;"),
    ("i", "tilde", "~"),
    ("p", "plain", " "),
    ("x", "neg", r"\!"),
]


def tex():
    rows = []
    for size in (9, 10):
        for sent, _name, tok in SPELLINGS:
            rows.append(r"\node[font=\fontsize{%(s)d}{%(b)d}\selectfont] at (0,-%(k).1f) "
                        r"{$%(sen)s=-s,%(tok)sv=s$};"
                        % {"s": size, "b": size + 2, "k": len(rows) * 0.4,
                           "sen": sent, "tok": tok})
    return (r"\documentclass[10pt]{article}\usepackage{tikz}\begin{document}"
            r"\begin{tikzpicture}[x=1cm]" + "\n".join(rows)
            + r"\end{tikzpicture}\end{document}" + "\n")


def read(pdf):
    """{sentinel letter: gap} at each y, taking every line on the page."""
    import fitz
    doc = fitz.open(pdf)
    out = []
    for block in doc[0].get_text("rawdict")["blocks"]:
        for line in block.get("lines", []):
            chars = [(c["c"], fitz.Rect(c["bbox"])) for sp in line["spans"] for c in sp["chars"]]
            sent = next((c for c, _ in chars if c in "ctmipx"), "")
            comma = [(i, r) for i, (c, r) in enumerate(chars) if c == ","]
            if not sent or not comma:
                continue
            i, r = comma[0]
            nxt = [(ch, bx) for ch, bx in chars[i + 1:] if ch.strip()]
            if nxt:
                out.append((round(line["bbox"][1], 2), sent, nxt[0][1].x0 - r.x1))
    doc.close()
    return sorted(out)


def main():
    os.makedirs(TMP, exist_ok=True)
    open(os.path.join(TMP, "space.tex"), "w", encoding="utf-8").write(tex())
    r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", TMP,
                        "space.tex"], cwd=TMP, capture_output=True)
    pdf = os.path.join(TMP, "space.pdf")
    if not os.path.exists(pdf):
        print("pdflatex failed")
        print(r.stdout.decode("utf-8", "replace")[-1200:])
        return 1
    got = read(pdf)
    print("rows read: %d (expect 12)" % len(got))
    by = {}
    for y, sent, gap in got:
        by.setdefault(sent, []).append(gap)
    base = (by.get("p") or [0, 0])[:2]
    name = {"c": "cs", "t": "thin", "m": "med", "i": "tilde", "p": "plain", "x": "neg"}
    for sent in "ctmipx":
        v = by.get(sent)
        if not v or len(v) < 2:
            print("  %-5s incomplete: %s" % (name[sent], v))
            continue
        print("  %-5s 9pt %6.3f  10pt %6.3f   slope %6.4f pt/em  above plain %+.3f"
              % (name[sent], v[0], v[1], v[1] - v[0], (v[1] - v[0]) - (base[1] - base[0])))
    return 0


if __name__ == "__main__":
    sys.exit(main())
