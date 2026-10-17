r"""Page-side Typst syntax audit: what does a rendered page actually PRINT?

The gate and `summarize_typst` only say a document compiled; the #65 round showed Typst will print
its own source (`table( columns: 2,`) as prose and compile green. This census walks every
`typst/*/main.pdf` with fitz and counts the tokens that are Typst *syntax*, so a hit means the page
is showing markup instead of typesetting it. Judgement is by reading the printed line, not by the
count -- `--` and `~` are already recorded negatives in `_work/community.md` §0, which is why the
probe prints samples for every family it finds.
"""
import io
import os
import re
import sys
from collections import Counter, defaultdict

# The page text carries math glyphs (𝐷, −, ∑) that the Windows console codepage cannot encode;
# a census that dies on its own 8th family is worse than no census.
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TYPST = os.path.join(ROOT, "typst")

FAMILIES = [
    ("call", "函数调用原样印出", re.compile(r"#[a-zA-Z][a-zA-Z0-9_.\-]*\(")),
    ("dollar", "数学定界符 $ 上页", re.compile(r"\$")),
    ("angle", "标签 <name> 上页", re.compile(r"<[A-Za-z][A-Za-z0-9:_\-.]*>")),
    ("bs2", "双反斜杠 \\\\ 上页", re.compile(r"\\\\")),
    ("bscmd", "反斜杠控制词上页", re.compile(r"\\[A-Za-z]{2,}")),
    ("bsbrk", "字面 \\[ \\] \\( \\)", re.compile(r"\\[\[\]()]")),
    ("brace", "花括号包着的调用参数", re.compile(r"\b(?:inset|columns|align|stroke|numbering|kind)\s*:")),
    ("void", "引用取不到值", re.compile(r"\?\?")),
    ("tilde", "硬空格 ~ 上页", re.compile(r"~")),
    ("hash", "裸井号 # 上页", re.compile(r"#")),
    ("rawtex", "井号转义写法 #\\;", re.compile(r"#\\")),
]

SAMPLES = int(sys.argv[1]) if len(sys.argv) > 1 else 3


def words_line(page):
    return page.get_text("text")


def main():
    import pymupdf

    hits = defaultdict(Counter)
    lines = defaultdict(list)
    papers = sorted(d for d in os.listdir(TYPST) if os.path.isdir(os.path.join(TYPST, d)))
    n = 0
    for name in papers:
        pdf = os.path.join(TYPST, name, "main.pdf")
        if not os.path.exists(pdf):
            continue
        n += 1
        doc = pymupdf.open(pdf)
        for pno, page in enumerate(doc, 1):
            text = words_line(page)
            for line in text.split("\n"):
                s = line.strip()
                if not s:
                    continue
                for key, _label, pat in FAMILIES:
                    if pat.search(s):
                        hits[key][name] += 1
                        if len(lines[key]) < 400:
                            lines[key].append((name, pno, s[:160]))
        doc.close()
    print("papers read:", n)
    for key, label, _pat in FAMILIES:
        per = hits[key]
        occ = sum(per.values())
        print("\n%s (%s): %d 处 / %d 篇" % (key, label, occ, len(per)))
        for name, pno, s in lines[key][:SAMPLES]:
            print("   %s p%d | %s" % (name[:44], pno, s))


main()
