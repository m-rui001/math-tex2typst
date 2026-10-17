# _work/star_forms.py — which adjoint-star spelling does the corpus already use, and how
# often does one inline math span carry TWO asterisks (the markdown-emphasis question that
# decides D31's `^\H` -> ? replacement).  Read-only; counts per form.
import io, os, re, glob, collections

B = chr(92)
FORMS = {
    u'^{*} bare-star-with-braces': re.compile(re.escape(B + '*') + u''),
}
DOLLAR = chr(36)
pats = {
    u'^{\\*}': re.compile(re.escape(u'^{' + B + '*}')),
    u'^\\ast': re.compile(re.escape(u'^' + B + 'ast')),
    u'^{\\ast}': re.compile(re.escape(u'^{' + B + 'ast}')),
    u'^* (bare)': re.compile(re.escape(u'^*')),
    u'^{\\dagger}': re.compile(re.escape(u'^{' + B + 'dagger}')),
    u'^\\top': re.compile(re.escape(u'^' + B + 'top')),
    u'^\\H (this family)': re.compile(re.escape(u'^' + B + 'H') + u'(?![A-Za-z])'),
}
ROOT = u'E:/math/' + u'研究笔记'
tot = collections.Counter()
span2 = []
files = sorted(glob.glob(os.path.join(ROOT, 'D*.md')))
for p in files:
    text = io.open(p, encoding='utf-8', newline='').read()
    for k, rx in pats.items():
        tot[k] += len(rx.findall(text))
    for line_no, line in enumerate(text.split('\n'), 1):
        # inline spans on one line: split on '$' pairs the shipped grammar uses
        segs = line.split(DOLLAR)
        for i in range(1, len(segs), 2):
            if segs[i].count(u'*') >= 2:
                span2.append((os.path.basename(p)[:26], line_no, segs[i][:70]))
print(u'files=%d' % len(files))
for k in pats:
    print(u'%-22s %d' % (k, tot[k]))
print(u'inline spans carrying >=2 asterisks: %d' % len(span2))
for f, ln, s in span2[:12]:
    print(u'   %s:%d  %s' % (f, ln, s))
