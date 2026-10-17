"""Byte-exact repair of the corrupted regex line in cetz.py (no heredoc escaping)."""
import pathlib

BS = b'\x5c'
p = pathlib.Path('E:/math/tools/t2t/cetz.py')
data = p.read_bytes()
old = b'if re.match(r"' + BS + b'(node|coordinate)\x08", stmt):'
new = b'if re.match(r"' + BS + BS + b'(node|coordinate)' + BS + b'b", stmt):'
assert data.count(old) == 1, data.count(old)
data = data.replace(old, new)
old2 = b'                pt = point(m2.group(2), None)'
new2 = b'                pt = point(m2.group(2), None, names)'
assert data.count(old2) >= 1
data = data.replace(old2, new2)
p.write_bytes(data)
print('repaired')
