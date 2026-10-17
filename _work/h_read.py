# _work/h_read.py — print the '\H' refusal sites from _work/h_sites.jsonl with enough
# surrounding text to decide between a material-credential expansion and a registration.
# Read-only.  Sites are grouped by note and by the shape the control sequence sits in.
import io, json, os, re, collections

B = chr(92)
H = B + 'H'
ROOT = os.path.join(u'E:' + os.sep + u'研究笔记')
rows = [json.loads(l) for l in io.open(u'_work/h_sites.jsonl', encoding='utf-8') if l.strip()]

# the four shapes a bare \H can sit in inside a math span
SHAPES = [
    (H + '^n', 'H^n (Hausdorff measure, superscript n)'),
    (H + '^',  'H^<other>'),
    (H + B + 'restrict', 'H \restrict'),
    (H + '_',  'H_'),
]

by = collections.defaultdict(list)
for r in rows:
    by[r['file']].append(r)

for f in sorted(by):
    print(u'==== ' + f + u'  sites=' + str(len(by[f])))
    shapes = collections.Counter()
    for r in by[f]:
        body = r['body']
        # classify every \H occurrence in the body by its two following chars
        for mm in re.finditer(r'\\H(?![a-zA-Z])', body):
            tail = body[mm.end():mm.end() + 3]
            key = tail if tail else '<EOL>'
            shapes[key] += 1
        print(u'  %5d %-6s %-9s %s' % (r['line'], r['ctx'], r['kind'], body[:110]))
    print(u'  following-chars: ' + ', '.join(
        u'%r x%d' % (k, v) for k, v in shapes.most_common()))
