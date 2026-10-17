import io
p = '.tools/accept_note.py'
t = io.open(p, encoding='utf-8').read()
E, B = chr(32789) + chr(26159), chr(32789) + chr(19981) + chr(26159)   # 而是 / 而不是
old = "re.findall(r'\u4e0d\u662f[^\n]{0,40}" + E
i = t.find("'ershi'")
seg = t[i:i + 200]
assert "('contrast'" in seg
add = "('bc', t.count('" + B + "')), "
t = t.replace("('contrast', ", add + "('contrast', ", 1)
io.open(p, 'w', encoding='utf-8', newline='').write(t)
print('ok', t.count(add))
