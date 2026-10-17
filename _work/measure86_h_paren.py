r"""`#h(<x>em)` 紧跟一个左括号时 Typst 把它当成二次调用——怎么写才既编得过又留得住价。

run139 的闸门把 8 张画布打成 compile-failed、产物里成了 8 段 quoted：源是 `$y;\ (A,B)$`，
发射器把 `\ ` 换成 `#h(0.3333em)` 后紧跟作者的 `(A,B)`，Typst 读成 `h(...)(...)` 的调用链。

修法候选是「调用后面隔一个空格」（pandoc 自己的产物就是这么写的，`#h(-0.16667em) (` 在库里
1,343 处且全编得过）。但**发在全库就是 46 张画布的写法都变**，所以要先证明那个空格在 Typst 数学里
不要钱：量两张网格——后随字符取作者的 `(` 与作者的 `v`（普通字母），后缀取「紧跟」与「隔一个空格」，
x 取四个 em 值，读 `;` 墨右缘到**下一个墨左缘**。每格各拟一条直线，**斜率＝这一格每 em 收多少 pt**，
截距＝`;` 与下一个墨之间的公共底数。只有「隔空格与紧跟两行的斜率都是 10pt/em（10pt 字号下的 em 价）
且截距相等」，才允许把空格发在所有 `#h` 后面。

控制真值：pdflatex 同一句 10pt 下 `\ ` 那一行墨到墨 **3.317pt**、`\,` **1.667pt**
（`_work/measure86_space_tokens.py` 的 mu 表）。

用法：python _work/measure86_h_paren.py
"""
import os
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
TMP = os.path.join(WORK, "_m86p")
sys.path.insert(0, ROOT)
import fitz  # noqa: E402

HEAD = "#set page(width: 30cm, height: 6cm)\n#set text(size: 10pt)\n"
SIZES = ["0", "0.1667", "0.3333", "1"]
FOLLOW = [("paren", "("), ("letter", "v")]
SUFFIX = [("tight", ""), ("space", " ")]
BASELINES = [
    ("base-paren", r"$y;(A,B)$"),
    ("base-paren-sp", r"$y; (A,B)$"),
    ("base-letter", r"$y;v$"),
    ("base-letter-sp", r"$y; v$"),
]


def cases():
    for name, body in BASELINES:
        yield name, body
    for ftag, fch in FOLLOW:
        for stag, suffix in SUFFIX:
            for x in SIZES:
                tail = fch if fch == "v" else "(A,B)"
                yield ("%s-%s-%s" % (ftag, stag, x), "$y;#h(%sem)%s%s$" % (x, suffix, tail))


def compile_case(typ, pdf):
    r = subprocess.run(["typst", "compile", typ, pdf],
                       capture_output=True, text=True, encoding="utf-8", errors="replace")
    if r.returncode or not os.path.exists(pdf):
        return None, (r.stderr or r.stdout).strip().splitlines()
    doc = fitz.open(pdf)
    ink = []
    for block in doc[0].get_text("rawdict")["blocks"]:
        for line in block.get("lines", []):
            for span in line["spans"]:
                for ch in span["chars"]:
                    c = ch.get("c") or "".join(x["c"] for x in ch["uni"] if x["c"] != "\x00")
                    if c.strip():
                        ink.append((c, ch["bbox"][0], ch["bbox"][2]))
    doc.close()
    idx = [i for i, (c, _a, _b) in enumerate(ink) if c == ";"]
    if not idx:
        return "?", ["no ink for ;"]
    nxt = ink[idx[0] + 1:]
    if not nxt:
        return "?", ["no ink after ;"]
    return nxt[0][1] - ink[idx[0]][2], []


def main():
    if not os.path.isdir(TMP):
        os.makedirs(TMP)
    got = {}
    for name, body in cases():
        typ = os.path.join(TMP, "%s.typ" % name)
        pdf = os.path.join(TMP, "%s.pdf" % name)
        with open(typ, "w", encoding="utf-8") as fh:
            fh.write(HEAD + body + "\n")
        gap, err = compile_case(typ, pdf)
        if gap is None or gap == "?":
            print("  %-20s ERR  %s" % (name, " ".join(err)[:88]))
            continue
        got[name] = gap
        print("  %-20s gap=%7.3fpt" % (name, gap))
    print("  --- fitted lines (slope = pt per em, intercept = shared base) ---")
    for ftag, _fch in FOLLOW:
        for stag, _suffix in SUFFIX:
            pts = [(float(x), got["%s-%s-%s" % (ftag, stag, x)]) for x in SIZES
                   if "%s-%s-%s" % (ftag, stag, x) in got]
            if len(pts) < 2:
                continue
            (x0, y0), (x1, y1) = pts[0], pts[-1]
            slope = (y1 - y0) / (x1 - x0)
            print("  %-6s %-5s  n=%d  slope %7.4f pt/em   base %6.3fpt"
                  % (ftag, stag, len(pts), slope, y0 - slope * x0))
    print("  control: pdflatex at 10pt -- `\\ ` 3.317pt, `\\,` 1.667pt")


if __name__ == "__main__":
    main()
