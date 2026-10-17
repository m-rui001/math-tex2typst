import io, glob, re, sys
ID = sys.argv[1]
APPLY = len(sys.argv) > 2
p = [x for x in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/' + ID + '*') if x.endswith('.md')][0]
t = io.open(p, encoding='utf-8', newline='\n').read()
BLACK = (u'section', u'subsection', u'input', u'begin', u'end', u'documentclass', u'usepackage',
         u'label', u'ref', u'cite', u'bibitem', u'item', u'caption', u'includegraphics',
         u'tikz', u'draw', u'node', u'figure', u'table', u'theorem', u'proposition', u'lemma',
         u'equation', u'align', u'date', u'title', u'author', u'maketheorem')
BAD = (u'.tex', u'.bib', u'.typ', u'build/', u'/')
cnt = [0]


def sub(m):
    s = m.group(1)
    if not (u'\\' in s or u'^' in s or u'_' in s):
        return m.group(0)
    if any(b in s for b in BAD):
        return m.group(0)
    if any((u'\\' + b) in s or b in s for b in BLACK):
        return m.group(0)
    cnt[0] += 1
    return u'$' + s + u'$'


new = re.sub(u'`([^`\\n]+)`', sub, t)
print(ID, 'converted', cnt[0], 'dollars', t.count(u'$'), '->', new.count(u'$'),
      'bytes', len(t.encode('utf-8')), '->', len(new.encode('utf-8')))
if APPLY:
    io.open(p, 'w', encoding='utf-8', newline='\n').write(new)
    print('APPLIED')
