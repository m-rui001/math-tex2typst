import io
p = '.tools/accept_note.py'
t = io.open(p, encoding='utf-8').read()
old = "('ershi', t.count("
i = t.index(old)
print(repr(t[i:i+240]))
