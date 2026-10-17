
import re

with open('E:/math/被引笔记/C36-正规化体积函数极小者的唯一性.md', 'rb') as fp:
    data = fp.read()
text = data.decode('utf-8')

# count occurrences of each backtick by character
total = data.count(b'`')
print('backtick byte count:', total)

# Count all $ characters
dollar_count = data.count(b'$')
print('dollar byte count:', dollar_count)
