# -*- coding: utf-8 -*-
# 复核：对队列行的题名片段在全部笔记里做宽松检索，输出命中笔记及其自身取材目录。
import io, glob, os, re

queue = [l.strip() for l in io.open(u'.tools/lean_queue.txt', encoding='utf-8').read().split('\n') if l.strip()]
qdirs = [x.split('/')[0] for x in queue]
srcpat = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._\-]*)')


def norm(s):
    return re.sub(r'[^a-z0-9]', '', s.lower())

notes = {}
for p in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md'):
    k = os.path.basename(p).split(u'-')[0]
    t = io.open(p, encoding='utf-8', errors='replace').read()
    notes[k] = (t, norm(t))
FRAG = {
    82: ['integralandfractionalexpectationthresholds', 'expectationthresholdsareequivalent'],
    85: ['memoryandprecisioninnoiselessgaussian', 'noiselessgaussianregression'],
    98: ['posteriorreplicasandconditionalinformation', 'posteriorreplicas'],
    110: ['routingdensitiesandrepresentationcontraction', 'routingdensities'],
    116: ['smoothcounterexamplestoya', 'smoothcounterexamples'],
    121: ['subpolynomialquerycomplexityforwellconditioned', 'subpolynomialquery'],
    129: ['thecompletecrouzeixtheorem', 'completecrouzeix'],
    146: ['thesecondkahnkalai', 'secondkahnkalai'],
    147: ['thesharpfactorofiidthreshold', 'factorofiidthreshold'],
}
for ln in sorted(FRAG):
    stem = re.sub(r'-September-\d+-20\d\d$', '', qdirs[ln - 1])
    hits = []
    for k in sorted(notes):
        for f in FRAG[ln]:
            if f in notes[k][1]:
                hits.append((k, f))
                break
    print('L%-4d %-52s %s' % (ln, stem[:52], hits or 'NOHIT'))
