# -*- coding: utf-8 -*-
# Per-note macro credential census: which undefined-command tokens have a local
# \newcommand / \def in the SAME note (ORDER-class expansion) and which do not.
import io, os, re, glob, collections

ROOT = r'E:\math' + '\\' + r'研究笔记'
notes = sorted(glob.glob(os.path.join(ROOT, 'D*.md')))
DECL = re.compile(r'\\(?:newcommand|renewcommand|providecommand|def)\s*\{?\s*\\\\([A-Za-z]+)')
tokens = collections.Counter()          # cmd -> total token count corpus-wide
declared = collections.Counter()        # cmd -> tokens in notes that declare it locally
undecl = collections.Counter()
notes_decl = collections.Counter()      # cmd -> number of notes declaring it
notes_hit_undecl = collections.defaultdict(set)

for p in notes:
    t = io.open(p, encoding='utf-8', errors='replace').read()
    cmds = set(DECL.findall(t))
    for c in set(re.findall(r'\\([A-Za-z]+)', t)):
        n = len(re.findall(r'\\' + c + r'(?![A-Za-z])', t))
        if c in cmds:
            declared[c] += n
            notes_decl[c] += 1
        else:
            tokens[c] += n
            undecl[c] += n
            notes_hit_undecl[c].add(os.path.basename(p)[:6])

out = []
out.append('notes=%d' % len(notes))
out.append('cmd  undecl_tokens  decl_tokens  notes_declaring  example_notes')
for c, n in undecl.most_common(40):
    ex = ' '.join(sorted(notes_hit_undecl[c])[:6])
    out.append('%-12s u=%-5d d=%-5d declNotes=%-4d %s' % (c, n, declared[c], notes_decl[c], ex))
tot_u = sum(undecl.values())
tot_d = sum(declared.values())
out.append('TOTAL undecl=%d declared-locally=%d' % (tot_u, tot_d))
io.open(os.path.join(ROOT, '..', '_work', 'macro_credential.txt'), 'wb').write(
    ('\n'.join(out) + '\n').encode('utf-8'))
print('ok')
