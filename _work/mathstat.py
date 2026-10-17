import re

files = [
    'E:/math/被引笔记/C34-多重调和函数Kiselman最小值原理新证.md',
    'E:/math/被引笔记/C35-最小化赋值是准单项的.md',
    'E:/math/被引笔记/C36-正规化体积函数极小者的唯一性.md',
]

for f in files:
    with open(f, 'rb') as fp:
        data = fp.read()
    total_bytes = len(data)
    text = data.decode('utf-8')
    display_blocks = re.findall(r'\$\$(.+?)\$\$', text, re.DOTALL)
    display_count = len(display_blocks)
    inline_pairs = re.findall(r'\$([^\$\n]+?)\$', text)
    inline_count = len(inline_pairs)
    inline_bytes = sum(len(x.encode('utf-8')) for x in inline_pairs)
    display_bytes = sum(len(x.encode('utf-8')) for x in display_blocks)
    math_bytes = inline_bytes + display_bytes
    print(f)
    print('  total bytes:', total_bytes)
    print('  inline $ pairs:', inline_count, 'bytes:', inline_bytes)
    print('  display $$ blocks:', display_count, 'bytes:', display_bytes)
    print('  math total pairs/blocks:', inline_count + display_count)
    print('  math bytes:', math_bytes)
    if total_bytes > 0:
        print('  math %:', round(100*math_bytes/total_bytes, 2))
    print()