# -*- coding: utf-8 -*-
# Census the self-declared "untranslated English residue with expected replacement"
# workorders inside the notes' own audit sections. That shape is mechanically
# executable (position + expected word), so it is the next ORDER-class leg.
import io
import os

BS = chr(92)
NOTES = os.path.join('E:', BS, BS, 'math', u'\u7814\u7a76\u7b14\u8bb0')
OUT = os.path.join('E:', BS, BS, 'math', '_work', 'untranslated_census.txt')

KEY_EXPECT = u'\u671f\u671b\u4f5c'        # "expected replacement is"
KEY_UNTRAN = u'\u672a\u8bd1'              # "untranslated"
KEY_ENG = u'\u82f1\u6587\u7247\u6bb5'      # "English fragment"

rows = []
notes = sorted(f for f in os.listdir(NOTES) if f.endswith('.md') and f.startswith('D'))
expect_notes = []
site_lines = []
for f in notes:
    p = os.path.join(NOTES, f)
    raw = io.open(p, 'rb').read()
    t = raw.decode('utf-8')
    ne = t.count(KEY_EXPECT)
    if ne:
        nid = f.split('-')[0]
        expect_notes.append((nid, ne))
        for i, l in enumerate(t.split('\n')):
            if KEY_EXPECT in l:
                site_lines.append('%s L%d %s' % (nid, i + 1, l.strip()[:260]))
rows.append('notes=%d with_expect=%d total_expect_sites=%d' % (len(notes), len(expect_notes), sum(n for _, n in expect_notes)))
rows.append('untranslated_kw_notes=%d' % sum(1 for f in notes if KEY_UNTRAN in io.open(os.path.join(NOTES, f), encoding='utf-8').read()))
rows.append('english_fragment_notes=%d' % sum(1 for f in notes if KEY_ENG in io.open(os.path.join(NOTES, f), encoding='utf-8').read()))
rows.append('')
for nid, ne in sorted(expect_notes, key=lambda x: -x[1]):
    rows.append('%s expect=%d' % (nid, ne))
rows.append('')
rows.append('---- sites (first 60) ----')
rows.extend(site_lines[:60])
io.open(OUT, 'wb').write((u'\n'.join(rows) + u'\n').encode('utf-8'))
print('wrote', OUT, 'sites', len(site_lines))
