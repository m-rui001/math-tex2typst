import re, glob, os, collections
import sys
sys.path.insert(0, r'E:/math/tools')

patterns = {
  'begin{equation}': r'\\begin\{equation\}',
  'begin{align}': r'\\begin\{align\}',
  'begin{aligned}': r'\\begin\{aligned\}',
  'begin{array}': r'\\begin\{array\}',
  'begin{gather}': r'\\begin\{gather\}',
  'begin{tikzpicture}': r'\\begin\{tikzpicture\}',
  'begin{picture}': r'\\begin\{picture\}',
  'begin{cases}': r'\\begin\{cases\}',
  'label{': r'\\label\{',
  'frac{': r'\\frac\{',
  'mathrm{': r'\\mathrm\{',
  'mathbb{': r'\\mathbb\{',
  'text{': r'\\text\{',
  'operatorname': r'\\operatorname',
  'phi': r'\\phi',
  'hspace': r'\\hspace',
  'left': r'\\left',
  'right': r'\\right',
  'Cref': r'\\Cref',
  'ref{': r'\\ref\{',
  'cite{': r'\\cite\{',
  'sum_': r'\\sum_',
  'mathbf': r'\\mathbf',
  'mathcal': r'\\mathcal',
  'quad': r'\\quad',
}
# Backslash line-continuation inside string literals
counts = collections.Counter()
files_with = collections.defaultdict(set)
for f in glob.glob('*/main.typ'):
    text = open(f, encoding='utf-8', errors='replace').read()
    for label, pat in patterns.items():
        m = re.findall(pat, text)
        if m:
            counts[label] += len(m)
            files_with[label].add(f)
print('=== 残留 LaTeX 模式统计（全局次数 / 涉及文件数）===')
for label in patterns:
    print(f'{label:24s}  {counts[label]:6d}  files={len(files_with[label])}')
