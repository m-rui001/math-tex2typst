import io
p = '.tools/accept_note.py'
t = io.open(p, encoding='utf-8').read()
old = """    bad = [i for i, l in enumerate(rows) if l.count('|') != 6]
    if bad:
        problems.append('badPipeRows=%s' % bad[:6])
    empt = [i for i, l in enumerate(rows) if l.rstrip().endswith('| |') or ' |  | ' in l]
    if empt:
        problems.append('emptyCells=%s' % empt[:6])"""
new = """    hdr_i = None
    for i, l in enumerate(lines):
        if l == HDR:
            hdr_i = i
    ledger = []
    if hdr_i is not None:
        j = hdr_i + 2
        while j < len(lines) and lines[j].startswith('| '):
            ledger.append(lines[j]); j += 1
    bad = [i for i, l in enumerate(ledger) if l.count('|') != 6]
    if bad:
        problems.append('badLedgerRows=%s' % bad[:6])
    empt = [i for i, l in enumerate(ledger) if l.rstrip().endswith('| |') or ' |  | ' in l]
    if empt:
        problems.append('emptyCells=%s' % empt[:6])
    if len(ledger) < 28:
        problems.append('ledgerRows=%d' % len(ledger))"""
assert t.count(old) == 1
t = t.replace(old, new)
old2 = "    if len(rows) - 1 < 28:\n        problems.append('datarows=%d' % (len(rows) - 1))\n"
assert t.count(old2) == 1
t = t.replace(old2, '')
io.open(p, 'w', encoding='utf-8', newline='').write(t)
print('patched')
