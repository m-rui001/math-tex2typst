import io, glob, re, sys
ID, S, E, AFT = sys.argv[1], int(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4])
APPLY = len(sys.argv) > 5
p = [x for x in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/' + ID + '*') if x.endswith('.md')][0]
t = io.open(p, encoding='utf-8', newline='\n').read()
L = t.split('\n')
block = L[S - 1:E]
rest = L[:S - 1] + L[E:]
cut = AFT if AFT < S else AFT - len(block)
out = rest[:cut] + block + rest[cut:]
assert len(out) == len(L) and sum(len(x) for x in out) == sum(len(x) for x in L)
H = re.compile(u'^## +[^0-9]{0,3}(\\d+)')
heads = [(int(m.group(1)), i + 1) for i, l in enumerate(out) for m in [H.match(l)] if m]
print('block_lines', len(block), 'insert_after_orig_line', AFT, 'heads', len(heads),
      'order_ok', all(b[0] - a[0] == 1 for a, b in zip(heads, heads[1:])),
      'bytes', len(t.encode('utf-8')), len('\n'.join(out).encode('utf-8')))
for i in range(len(heads) - 1):
    if heads[i + 1][0] - heads[i][0] != 1:
        print('BREAK', heads[i], '->', heads[i + 1])
if APPLY:
    io.open(p, 'w', encoding='utf-8', newline='\n').write('\n'.join(out))
    print('APPLIED')
