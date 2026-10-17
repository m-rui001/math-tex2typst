import io, glob, re
p = glob.glob('研究笔记/D114-*.md')[0]
t = io.open(p, encoding='utf-8').read()
B = chr(92) + ')'
A = chr(92) + '('
print('open', t.count(A), 'close', t.count(B))
doubled = len(re.compile(r'\)\)' + re.escape(B)).findall(t)) + len(re.compile(re.escape(B) + r'\)' + re.escape(B)).findall(t))
print('preceded by plain paren', t.count(')' + B))
print('followed by backtick', t.count(B + '`'))
print('followed by dollar', t.count(B + '$'))
print('inside dollar span?', )
# contexts not followed by backtick
idx = [m.start() for m in re.finditer(re.escape(B), t)]
cnt = 0
for i in idx:
    nxt = t[i+2:i+3]
    if nxt != '`':
        cnt += 1
        if cnt <= 12:
            print('CTX', repr(t[max(0,i-45):i+15]))
print('non-backtick-adjacent total', cnt)
