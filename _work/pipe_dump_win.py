# -*- coding: utf-8 -*-
# dump enclosing table windows for the bare-cell / ambiguous notes (read-only)
import io, os
BASE = r'E:\math\研究笔记'
WANT = [
    ('D36', 588, 606),
    ('D28', 1148, 1188),
    ('D44', 440, 452),
    ('D50', 412, 440),
    ('D41', 527, 544),
    ('D25', 1854, 1890),
    ('D25', 1870, 1890),
    ('D68', 1334, 1372),
]
out = []
for f in sorted(os.listdir(BASE)):
    for pid, a, b in WANT:
        if f.startswith(pid + '-'):
            p = os.path.join(BASE, f)
            data = io.open(p, 'rb').read().decode('utf-8')
            lines = data.split('\n')
            out.append('==== %s  lines %d-%d  (file %s)' % (pid, a, b, f))
            for i in range(a, min(b, len(lines)) + 1):
                out.append('L%d| %s' % (i, lines[i - 1]))
            out.append('')
io.open(r'E:\math\_work\dump_windows_out.txt', 'wb').write(('\n'.join(out)).encode('utf-8'))
print('written', len(out))
