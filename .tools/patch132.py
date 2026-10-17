import io
p = '.tools/d132_fix.py'
lines = io.open(p, encoding='utf-8').read().split('\n')
BS, NB = chr(92), chr(96) + 'N' + chr(96)
for i, l in enumerate(lines):
    if l.strip().startswith('(') and NB[1:2] in l:
        pass
for i, l in enumerate(lines):
    if l.strip().startswith("('" + BS + '{-1'):
        lines[i] = "  (r'" + BS + "{-1,1" + BS + "}" + BS + "N$ \u800c\u4e0d\u662f\u5355\u679a\u786c\u5e01', r'" + BS + "{-1,1" + BS + "}" + BS + "N$\uff0c\u5355\u679a\u786c\u5e01\u4e0d\u591f'),"
        print('patched', i + 1)
for i, l in enumerate(lines):
    if l.strip().startswith("('\uff0c\u628a\u534a\u5f00\u533a\u95f4"):
        lines[i] = "  (r'\uff0c\u628a\u534a\u5f00\u533a\u95f4 $[" + BS + "theta+nD," + BS + "theta+(n+1)D)$\uff0c\u5c42\u4e4b\u95f4\u51fa', r'\uff0c\u628a\u534a\u5f00\u533a\u95f4 $[" + BS + "theta+nD," + BS + "theta+(n+1)D)$ \u6362\u6210\u5b83\uff0c\u5c42\u4e4b\u95f4\u51fa'),"
        print('patched2', i + 1)
io.open(p, 'w', encoding='utf-8', newline='').write('\n'.join(lines))
