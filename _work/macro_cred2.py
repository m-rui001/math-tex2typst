# -*- coding: utf-8 -*-
# Per-note macro credential census: which LaTeX-command tokens have a local
# \newcommand / \def in the SAME note (ORDER-class expansion) and which do not.
import io, os, re, glob, collections

B = chr(92)
ROOT = os.path.join('E:' + B + B, 'math', u'\u7814\u7a76\u7b14\u8bb0')
notes = sorted(glob.glob(os.path.join(ROOT, 'D*.md')))
DECL = re.compile(B + B + r'(?:newcommand|renewcommand|providecommand|def)\s*\{?\s*' + B + B + r'([A-Za-z]+)')
CMD = re.compile(B + B + r'([A-Za-z]+)')
declared = collections.Counter()
undecl = collections.Counter()
notes_decl = collections.Counter()
notes_hit_undecl = collections.defaultdict(set)

for p in notes:
    t = io.open(p, encoding='utf-8', errors='replace').read()
    cmds = set(DECL.findall(t))
    for c in set(CMD.findall(t)):
        n = len(re.findall(B + B + c + r'(?![A-Za-z])', t))
        if c in cmds:
            declared[c] += n
            notes_decl[c] += 1
        else:
            undecl[c] += n
            notes_hit_undecl[c].add(os.path.basename(p)[:6])

out = ['notes=%d' % len(notes),
       'cmd  undecl_tokens  decl_tokens  notes_declaring  example_notes']
for c, n in undecl.most_common(40):
    ex = ' '.join(sorted(notes_hit_undecl[c])[:6])
    out.append('%-12s u=%-5d d=%-5d declNotes=%-4d %s' % (c, n, declared[c], notes_decl[c], ex))
out.append('TOTAL undecl=%d declared-locally=%d' % (sum(undecl.values()), sum(declared.values())))
txt = '\n'.join(out) + '\n'
io.open(os.path.join('E:' + B + B, 'math', '_work', 'macro_cred2.txt'), 'wb').write(txt.encode('utf-8'))
print('ok bytes=%d' % len(txt.encode('utf-8')))
