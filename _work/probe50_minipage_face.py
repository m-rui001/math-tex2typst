r"""What does pandoc hand us for two sibling minipages inside one float, and how many papers have that shape?

§7「并排 minipage 子图竖排」那一行说 12 篇，但修法要先把两件事量清楚：
① **AST 还剩什么**——`emit.b_div` 只按 `classes[0]` 分派，`minipage` 落进 `unhandled_div_class` 然后
   照常把子块**一块块排下去**，所以左右两栏在产物里上下堆叠。声明的份额（`{0.42\linewidth}`）在
   `prep.scale_linewidth_in_minipages`（convert.py:517）里已经被吃掉，到发射器手里还剩多少要**实测**；
② **面到底多大**——按「同一个 float 内 ≥2 个**并列**的最外层 minipage」数篇，顺带把每个 minipage 的
   份额与它自己的 `#grid` 需要的列数读出来。份额和为 1 与否决定列能不能等宽。

用法：
    python _work/probe50_minipage_face.py ast      # ①：喂 pandoc 一个多样本，逐层打 Div 的 ident/classes/attrs
    python _work/probe50_minipage_face.py face     # ②：全语料数面，写 _work/mp50_names.txt
"""
import io
import json
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.path.insert(0, ROOT)
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")

BEGIN = re.compile(r"\\begin\{minipage\}(?:\[[^\]]*\])?\s*\{([^{}]*)\}")
ENV = re.compile(r"\\begin\{(figure|table)\}(?:\[[^\]]*\])?", re.S)


def pandoc_json(tex):
    """Run pandoc over a string and hand back the block list."""
    tmp = os.path.join(ROOT, "_work", "_m50ast.tex")
    with open(tmp, "w", encoding="utf-8") as fh:
        fh.write(tex)
    proc = subprocess.run(
        [os.environ.get("PANDOC", "pandoc"), tmp, "-f", "latex", "-t", "json",
         "--wrap=none", "--mathjax=false"],
        capture_output=True, text=True, encoding="utf-8", errors="replace")
    if proc.returncode:
        print("pandoc failed:", proc.stderr[:400])
    os.remove(tmp)
    return json.loads(proc.stdout or "{}").get("blocks", [])


def walk(blocks, depth=0):
    for node in blocks:
        kind = node.get("t")
        if kind == "Div":
            (ident, classes, attrs), body = node["c"]
            print("%sDiv ident=%r classes=%r attrs=%r children=%d"
                  % ("  " * depth, ident, classes, attrs, len(body)))
            walk(body, depth + 1)
        elif kind == "Figure":
            attr, body, caption = node["c"]
            print("%sFigure attr=%r body=%d caption=%r"
                  % ("  " * depth, attr, len(body), caption[1] if caption else None))
            walk(body, depth + 1)
        elif kind in ("Para", "Plain"):
            inlines = node["c"][1] if len(node["c"]) > 1 else []
            print("%s%s %s" % ("  " * depth, kind, "".join(
                c.get("c", "") for c in inlines[:8] if c.get("t") == "Str")[:60]))
        elif kind in ("CodeBlock", "RawBlock"):
            print("%s%s %r" % ("  " * depth, kind, node["c"][-1][:50]))
        else:
            print("%s%s" % ("  " * depth, kind))



SAMPLES = {
    "two-figures": r"""\documentclass{article}\begin{document}
\begin{figure}[htbp]
\centering
\begin{minipage}[t]{0.42\linewidth}
\centering
\includegraphics[width=\linewidth]{a}
\caption{left}
\end{minipage}
\begin{minipage}[t]{0.55\linewidth}
\centering
\caption{right}
\end{minipage}
\end{figure}
\end{document}
""",
    "one-per-line-with-text": r"""\documentclass{article}\begin{document}
\begin{figure}[htbp]
\begin{minipage}[t]{0.48\textwidth}
text one
\end{minipage}\hfill
\begin{minipage}[t]{0.48\textwidth}
text two
\end{minipage}
\end{figure}
\end{document}
""",
    "outside-float": r"""\documentclass{article}\begin{document}
\noindent\begin{minipage}[t]{0.4\linewidth}
a
\end{minipage}
\begin{minipage}[t]{0.4\linewidth}
b
\end{minipage}
\end{document}
""",
}


def ast():
    for name, tex in SAMPLES.items():
        print("=== %s" % name)
        walk(pandoc_json(tex))
        print()


def groups(body):
    r"""Runs of sibling top-level minipages inside one float: [[share, share, …], …], runs of >=2.

    "Sibling" is measured on the source: the text between two top-level minipage blocks has to be
    only spacing the author wrote (`\centering`, `\hfill`, `\quad`, `\vspace{…}`, bare whitespace,
    `%`), because anything else -- a caption, a `\rule`, prose -- means the two boxes are not a row.
    """
    spans = []
    k = 0
    while True:
        m = BEGIN.search(body, k)
        if not m:
            break
        depth, j = 1, m.end()
        while j < len(body) and depth:
            nx = re.compile(r"\\(?:begin|end)\{minipage\}").search(body, j)
            if not nx:
                return [g for g in _runs(body, spans) if len(g) >= 2]  # unbalanced source, stop
            depth += 1 if nx.group().startswith("\\begin") else -1
            j = nx.end()
        spans.append((m.start(), j, m.group(1)))
        k = j
    return [g for g in _runs(body, spans) if len(g) >= 2]


GLUE = re.compile(r"(?:\s|\\centering|\\raggedright|\\hfill|\\hss|\\quad|\\qquad|\\relax|"
                  r"\\v(?:space|skip)\s*\{[^{}]*\}|\\hspace\s*\{[^{}]*\}|%[^\n]*\n)*", re.I)


def _runs(body, spans):
    """Split the top-level minipage spans into maximal runs whose gaps are only spacing."""
    runs, cur = [], []
    for idx, (start, end, share) in enumerate(spans):
        if cur:
            gap = body[cur[-1][1]:start]
            if not GLUE.fullmatch(gap):
                runs.append(cur)
                cur = []
        cur.append((start, end, share))
    if cur:
        runs.append(cur)
    return [[s[2] for s in r] for r in runs]



def face():
    papers, floats, shares, odd = 0, 0, [], []
    listing = os.path.join(ROOT, "_work", "mp50_names.txt")
    if os.path.exists(listing):
        os.remove(listing)
    for name in sorted(os.listdir(FLAT)):
        if not name.endswith(".tex"):
            continue
        src = open(os.path.join(FLAT, name), encoding="utf-8", errors="replace").read()
        hit = []
        for m in ENV.finditer(src):
            env = m.group(1)
            end = src.find("\\end{%s}" % env, m.end())
            if end < 0:
                continue
            for g in groups(src[m.end():end]):
                hit.append(g)
        if hit:
            papers += 1
            floats += len(hit)
            shares.extend(len(g) for g in hit)
            for g in hit:
                nums = []
                for s in g:
                    try:
                        nums.append(float(re.sub(r"\\(?:linewidth|textwidth)", "", s) or 1))
                    except ValueError:
                        nums.append(None)
                if any(v is None for v in nums) or not 0.75 <= sum(v for v in nums if v) <= 1.25:
                    odd.append((name[:44], g))
        if hit:
            with open(os.path.join(ROOT, "_work", "mp50_names.txt"), "a", encoding="utf-8") as fh:
                fh.write("%s | %d groups | %s\n" % (name[:-4], len(hit), "; ".join(
                    ",".join(g) for g in hit)))
    print("papers with >=2 sibling minipages in one float: %d ; groups: %d" % (papers, floats))
    print("columns per group: %s" % sorted(set(shares)))
    print("share sum outside 0.75..1.25 (or unreadable): %d" % len(odd))
    for name, g in odd[:12]:
        print("   %s %s" % (name, g))


CAP_RX = re.compile(r"\\caption\s*\{")
LABEL_RX = re.compile(r"\\label\s*\{([^{}]*)\}")


def caption_text(body, start, end):
    """The first `\caption{…}` inside a minipage span, and the labels that follow it."""
    seg = body[start:end]
    m = CAP_RX.search(seg)
    if not m:
        return None, []
    depth, k = 1, m.end()
    while k < len(seg) and depth:
        if seg[k] == "{":
            depth += 1
        elif seg[k] == "}":
            depth -= 1
        k += 1
    return seg[m.end():k - 1], LABEL_RX.findall(seg)


def loss():
    r"""Does each subfigure's caption reach the product, and does its `#label`?

    The sample AST says pandoc keeps ONE caption for the float and puts the second minipage in the
    figure's content, so the test is per caption: take the words a minipage declares and ask the
    built `main.typ` for that paper whether they are there at all.
    """
    typst = os.path.join(ROOT, "typst")
    lost_caps, lost_labels, ok_caps, papers_hit = [], [], 0, 0
    for name in sorted(os.listdir(FLAT)):
        if not name.endswith(".tex"):
            continue
        src = open(os.path.join(FLAT, name), encoding="utf-8", errors="replace").read()
        out_dirs = [d for d in sorted(os.listdir(typst)) if d.startswith(name[:-4][:40])]
        if not out_dirs:
            print("no product dir for %s" % name[:44])
            continue
        prod_path = os.path.join(typst, out_dirs[0], "main.typ")
        if not os.path.exists(prod_path):
            print("no main.typ for %s" % name[:44])
            continue
        prod = open(prod_path, encoding="utf-8", errors="replace").read()
        hit = False
        for m in ENV.finditer(src):
            end = src.find("\\end{%s}" % m.group(1), m.end())
            if end < 0:
                continue
            seg_start = m.end()
            for span in sibling_spans(src[seg_start:end]):
                caps = []
                for s, e, _share in span:
                    text, labels = caption_text(src[seg_start:end], s, e)
                    if text is not None:
                        caps.append((text, labels))
                if len(caps) < 2:
                    continue
                hit = True
                for idx, (text, labels) in enumerate(caps):
                    needle = " ".join(re.findall(r"[A-Za-z]{4,}", text)[:4])
                    if len(needle) < 4:
                        continue
                    if needle in prod:
                        ok_caps += 1
                    else:
                        lost_caps.append((name[:40], idx, needle))
                    for lab in labels:
                        if lab not in prod:
                            lost_labels.append((name[:40], lab))
        papers_hit += hit
    print("papers whose subfigure captions were tested: %d" % papers_hit)
    print("captions present on the product: %d ; lost: %d" % (ok_caps, len(lost_caps)))
    for row in lost_caps[:20]:
        print("   LOST %s sub#%d %r" % row)
    print("labels declared inside those minipages and absent from the product: %d" % len(lost_labels))
    for row in lost_labels[:12]:
        print("   %s %s" % row)


def sibling_spans(body):
    """Top-level minipage spans grouped into sibling runs (same rule as `groups`, spans kept)."""
    spans = []
    k = 0
    while True:
        m = BEGIN.search(body, k)
        if not m:
            break
        depth, j = 1, m.end()
        while j < len(body) and depth:
            nx = re.compile(r"\\(?:begin|end)\{minipage\}").search(body, j)
            if not nx:
                return []
            depth += 1 if nx.group().startswith("\\begin") else -1
            j = nx.end()
        spans.append((m.start(), j, m.group(1)))
        k = j
    runs, cur = [], []
    for span in spans:
        if cur and not GLUE.fullmatch(body[cur[-1][1]:span[0]]):
            runs.append(cur)
            cur = []
        cur.append(span)
    if cur:
        runs.append(cur)
    return [r for r in runs if len(r) >= 2]


COEF_RX = re.compile(r"([0-9.]*)\\(?:lin|text)width")


def half():
    r"""The §7 row's own prerequisite: does any canvas in these floats end up wider than half the column?

    `prep.scale_linewidth_in_minipages` folds a picture's `x=.205\\linewidth` by its minipage's share
    before the picture is lifted, so the width a canvas will occupy is `share × coef` of the column.
    Max that product over each sibling run: if it stays under 0.55 per cell, a two-column grid needs no
    extra scaling of the drawings.
    """
    worst = []
    for name in sorted(os.listdir(FLAT)):
        if not name.endswith(".tex"):
            continue
        src = open(os.path.join(FLAT, name), encoding="utf-8", errors="replace").read()
        for m in ENV.finditer(src):
            end = src.find("\\end{%s}" % m.group(1), m.end())
            if end < 0:
                continue
            seg = src[m.end():end]
            for span in sibling_spans(seg):
                for start, stop, share in span:
                    try:
                        s = float(re.sub(r"\\(?:linewidth|textwidth)", "", share) or 1)
                    except ValueError:
                        continue
                    # the span starts at the minipage's own `\begin … {share}`, whose width argument
                    # would otherwise be read as a picture coefficient
                    inner = BEGIN.sub("", seg[start:stop], count=1)
                    coefs = [float(c) if c else 1.0 for c in COEF_RX.findall(inner)]
                    if not coefs:
                        continue
                    worst.append((s * max(coefs), name[:40], share, max(coefs)))
    worst.sort(reverse=True)
    print("cells measured: %d ; widest effective share of the column:" % len(worst))
    for row in worst[:10]:
        print("   %.3f  %s  share=%s coef=%s" % row)
    print("cells over 0.55: %d ; over 0.5: %d"
          % (sum(1 for w in worst if w[0] > 0.55), sum(1 for w in worst if w[0] > 0.5)))


if __name__ == "__main__":
    mode = (sys.argv[1:] or ["face"])[0]
    {"ast": ast, "face": face, "loss": loss, "half": half}[mode]()


