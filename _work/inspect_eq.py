import re, glob, os, collections

ROOT = r'E:/math/typst'
path = os.path.join(ROOT, 'A-C1-Counterexample-to-the-Entropy-Conjecture-September-25-2026/main.typ')
text = open(path, encoding='utf-8').read()

# Find all display equations that start with a quoted number like "(1)" 
# pattern: $ "(N)" quad  or  $ "(N)"  at the start of a display math
pat = re.compile(r'\$ "(\([0-9][0-9A-Za-z.]*\))"( quad)? ')
print('=== 带编号的显示公式（前缀）===')
for m in pat.finditer(text):
    line_no = text[:m.start()].count('\n') + 1
    print(f'L{line_no}: quote={m.group(1)}  has_quad={bool(m.group(2))}')

print()
print('=== 显示公式总数（以行首"$ "开头的）===')
line_starts = re.findall(r'(?m)^\$\s', text)
print('行首 $ 显示公式行数:', len(line_starts))
