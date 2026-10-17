r"""控制侧的 preamble 抄写：语料里有多少条宏定义是**跨行**的？（#85 修 `compare_figure.definition` 的面）

`control()` 过去按「到下一个换行」切 `\newcommand`／`\def` 行，跨行的嵌套定义因此被切成半条，pdflatex
报 runaway argument——#84 的 13 张控制图就是这么死的（日志指着 `amsopn.sty`，那包其实装得上）。
这一支只数两件事：语料里跨行定义有多少条／多少篇，以及换成按括号配平切之后每条是否**左右括号数相等**。

  python _work/probe86_definition_face.py
"""
import glob
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, HERE)
import compare_figure as cf  # noqa: E402

DEF = re.compile(r"\\(?:newcommand|renewcommand|providecommand|def|DeclareMathOperator)\b")

multi, single, unbalanced = 0, 0, 0
papers_multi, papers_unbal = set(), set()
samples = []
for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
    src = open(path, encoding="utf-8", errors="replace").read()
    pre = src[:src.index("\\begin{document}")] if "\\begin{document}" in src else ""
    taken, stem = 0, os.path.basename(path)[:-4]
    for m in DEF.finditer(pre):
        if m.start() < taken:
            continue
        text = cf.definition(pre, m.start())
        taken = m.start() + len(text)
        if "\n" in text:
            multi += 1
            papers_multi.add(stem)
            if len(samples) < 4:
                samples.append((stem, text.replace("\n", " ")[:150]))
        else:
            single += 1
        if text.count("{") != text.count("}"):
            unbalanced += 1
            papers_unbal.add(stem)
print("definitions copied by control(): multiline %d in %d papers   single-line %d   unbalanced %d in %d papers"
      % (multi, len(papers_multi), single, unbalanced, len(papers_unbal)))
for stem, text in samples:
    print("  %s: %s" % (stem[:44], text))
