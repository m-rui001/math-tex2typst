# -*- coding: utf-8 -*-
import io, json, collections
B = chr(92)
sites = [json.loads(l) for l in io.open('katex_sites.jsonl', encoding='utf-8') if l.strip()]
mac = [s for s in sites if s['errClass'] and 'Unexpected end of input in a macro argu' in s['errClass']]
accents = ['\\overline', '\\widehat', '\\widetilde', '\\underline', '\\vec', '\\hat', '\\tilde']
symkws = ['\\mathbb', '\\mathcal', '\\mathrm', '\\mathbf', '\\mathsf', '\\mathfrak', '\\operatorname']
def has_acc_nogroup(b):
    for a in accents:
        i = 0
        while True:
            j = b.find(a, i)
            if j < 0:
                break
            after = b[j + len(a):]
            # accent must be immediately followed by a symbol command (no '{')
            stripped = after.lstrip(' ')
            for k in symkws:
                if stripped.startswith(k):
                    return True
            i = j + len(a)
    return False
clean = trunc = 0
other = collections.Counter()
for s in mac:
    b = s['body']
    if has_acc_nogroup(b):
        clean += 1
    elif b.rstrip().endswith('{') or ('$' in b) or b.rstrip().endswith(B + 'text'):
        trunc += 1
    else:
        other[b[:64].replace('\n', '\\n')] += 1
print("total macro-arg-EOF:", len(mac))
print("accent-no-group (ORDER):", clean)
print("truncated (WAIVER/JUDGMENT):", trunc)
print("residual:", sum(other.values()))
for b, c in other.most_common(30):
    print("  %d\t%s" % (c, b))
