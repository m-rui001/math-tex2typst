import json, io, collections

rows = [json.loads(l) for l in io.open('E:/math/_work/katex_sites_now.jsonl', encoding='utf-8')]
out = io.open('E:/math/_work/probe_census_tail.json', 'w', encoding='utf-8')

targets = ['\\rangleG', '\\math', '\\two', '\\root']
sel = [r for r in rows if r.get('tok') in targets]

json.dump({'total_rows': len(rows), 'fields': sorted(rows[0].keys()),
           'matched': sel}, out, ensure_ascii=False, indent=2)
out.close()

# also tally all distinct toks
c = collections.Counter(r.get('tok') for r in rows)
with io.open('E:/math/_work/probe_tok_counts.txt', 'w', encoding='utf-8') as f:
    for k, v in sorted(c.items(), key=lambda x: (-x[1], str(x[0]))):
        f.write('%s\t%d\n' % (k, v))
print('matched', len(sel))
