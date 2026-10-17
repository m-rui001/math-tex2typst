import re

with open('E:/math/被引笔记/C36-正规化体积函数极小者的唯一性.md', 'rb') as fp:
    data = fp.read()
text = data.decode('utf-8')

# Find all backtick positions
positions = [(m.start(), m.end()) for m in re.finditer(r'`', text)]
print('total backtick positions:', len(positions))

# Group into pairs by character order
# Look for backticks that aren't part of `` (double backtick)
# Let's check if any line has odd number of backticks
lines = text.split('\n')
odd_lines = []
for i, line in enumerate(lines, 1):
    bt_count = line.count('`')
    if bt_count % 2 != 0:
        odd_lines.append((i, bt_count, line[:80]))

print('lines with odd backtick count:')
for line_num, bt_count, preview in odd_lines:
    print(f'  L{line_num} ({bt_count} bt): {preview}')