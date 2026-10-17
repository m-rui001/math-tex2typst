import glob, os, collections, re
ROOT = r'E:/math/typst'
by_hardcode = 0
by_auto = 0
by_both = 0
by_neither = 0
sample_hard = []
for f in sorted(glob.glob(os.path.join(ROOT, '*/main.typ'))):
    text = open(f, encoding='utf-8', errors='replace').read()
    has_auto = '#set math.equation(numbering' in text
    hard = re.search(r'\$ \"\([0-9][0-9a-zA-Z.]*\)\"', text)
    has_hard = bool(hard)
    if has_auto and has_hard:
        by_both += 1
    elif has_auto:
        by_auto += 1
    elif has_hard:
        by_hardcode += 1
    else:
        by_neither += 1
    if has_hard and len(sample_hard) < 8:
        sample_hard.append(os.path.basename(os.path.dirname(f)))
print('用自动 numbering(=右侧编号) 的论文:', by_auto)
print('只用硬编码编号(在公式左侧)的论文:', by_hardcode)
print('两者都有的论文:', by_both)
print('都没有的论文:', by_neither)
print()
print('硬编码编号的样例(前8):')
for s in sample_hard:
    print('  ', s)
