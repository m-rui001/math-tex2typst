# -*- coding: utf-8 -*-
# Parse ONLY the ORDER sites out of _work/katex_undef_plan.txt.
# Read-only on the plan; writes _work/order_sites.json + _work/order_sites.txt.
# Replacement strings are cut from the plan file itself (no hand typing).
import io, re, json, glob, os, collections

PLAN = r'E:\math\_work\katex_undef_plan.txt'
LINES = io.open(PLAN, encoding='utf-8').read().split('\n')

PART_A_START = None
PART_B_START = None
for i, l in enumerate(LINES):
    if l.startswith('PART A'):
        PART_A_START = i
    if l.startswith('PART B'):
        PART_B_START = i
assert PART_A_START is not None and PART_B_START is not None

hdr_re = re.compile(r'^### (\S+)\s+count=(\d+)\s+class=(\w+)\s*$')
rep_re = re.compile(r'^\s*精确替换:\s*(.*?)\s*->\s*(.*?)\s*$')   # 精确替换 (Part A: X -> Y)
repB_re = re.compile(r'^\s*精确替换:\s?(.*)$')                  # Part B: new span body only
site_re = re.compile(r'^\s*-\s+(D\d+):(\d+)(.*)$')
bsite_re = re.compile(r'^\s*-\s+\[(\w+)\]\s+(D\d+):(\d+)(.*)$')
body_re = re.compile(r'^\s*body:\s?(.*)$')

order_sites = []   # dicts: family, kind(macro|span), bad, good, note, line, flag, ctx

# ---------- PART A: per-macro ----------
i = PART_A_START
while i < PART_B_START:
    l = LINES[i]
    m = hdr_re.match(l)
    if m:
        macro, count, cls = m.group(1), int(m.group(2)), m.group(3)
        bad = good = None
        sites = []
        j = i + 1
        while j < PART_B_START and not hdr_re.match(LINES[j]):
            lj = LINES[j]
            rr = rep_re.match(lj)
            if rr and bad is None:
                bad, good = rr.group(1), rr.group(2)
            sm = site_re.match(lj)
            if sm and not lj.lstrip().startswith('- ['):
                flag = sm.group(3).strip()
                sites.append((sm.group(1), int(sm.group(2)), flag))
            j += 1
        if cls == 'ORDER':
            assert bad is not None and good is not None, 'no 精确替换 for %s' % macro
            assert bad == macro, 'macro header %r != 替换源 %r' % (macro, bad)
            for (note, ln, flag) in sites:
                order_sites.append(dict(family=macro, kind='macro', bad=bad, good=good,
                                        note=note, line=ln, flag=flag,
                                        declared_count=count))
        i = j
        continue
    i += 1

# ---------- PART B: per-error-class, site lines carry [CLASS] ----------
PART_C_START = None
for i in range(PART_B_START, len(LINES)):
    if LINES[i].startswith('PART C'):
        PART_C_START = i
        break
i = PART_B_START
while i < PART_C_START:
    l = LINES[i]
    if l.startswith('### ['):
        mh = re.match(r'^### \[(.*?)\]\s+count=(\d+)\s+classes=(.*)$', l)
        fam = mh.group(1) if mh else l[:60]
        classes = {}
        if mh:
            for tok in mh.group(3).split(','):
                tok = tok.strip()
                if ':' in tok:
                    k, v = tok.split(':')
                    classes[k.strip()] = int(v)
        sites = []
        j = i + 1
        while j < PART_C_START and not LINES[j].startswith('### '):
            bm = bsite_re.match(LINES[j])
            if bm:
                cls, note, ln, rest = bm.group(1), bm.group(2), int(bm.group(3)), bm.group(4).strip()
                body = None
                good = None
                k = j + 1
                while k < PART_C_START and not bsite_re.match(LINES[k]) and not LINES[k].startswith('### '):
                    bb = body_re.match(LINES[k])
                    if bb and body is None:
                        body = bb.group(1)
                    rg = repB_re.match(LINES[k])
                    if rg and good is None:
                        good = rg.group(1)
                    k += 1
                if cls == 'ORDER':
                    sites.append((note, ln, rest, body, good))
                j = k
                continue
            j += 1
        if 'ORDER' in classes:
            assert classes['ORDER'] == len(sites), 'fam %s ORDER declared %d parsed %d' % (fam[:40], classes['ORDER'], len(sites))
        for (note, ln, rest, body, good) in sites:
            # good string is 'body2' per plan: 精确替换: <new>  (single arrow at first '->')
            assert body is not None and good is not None, 'missing body/替换 in %s %s:%d' % (fam[:30], note, ln)
            order_sites.append(dict(family='DELIM-GROUP', kind='span', bad=body.strip(), good=good.strip(),
                                    note=note, line=ln, flag=rest, declared_count=classes.get('ORDER', 0)))
        i = k
        continue
    i += 1

io.open(r'E:\math\_work\order_sites.json', 'w', encoding='utf-8').write(json.dumps(order_sites, ensure_ascii=False, indent=1))

fam = collections.Counter(s['family'] for s in order_sites)
notec = collections.Counter(s['note'] for s in order_sites)
flagged = [s for s in order_sites if s['flag']]
txt = []
txt.append('parsed ORDER sites total = %d' % len(order_sites))
txt.append('families:')
for k, v in sorted(fam.items(), key=lambda x: (-x[1], x[0])):
    txt.append('  %-16s %d' % (k, v))
txt.append('notes touched = %d' % len(notec))
txt.append('per note:')
for k, v in sorted(notec.items(), key=lambda x: (-x[1], int(x[0][1:]))):
    txt.append('  %-8s %d' % (k, v))
txt.append('flagged (in-flight / unverified) sites = %d' % len(flagged))
for s in flagged:
    txt.append('  %s:%s %s %r' % (s['note'], s['line'], s['family'], s['flag']))
# filename resolution
txt.append('filename resolution:')
miss = []
for n in sorted(notec, key=lambda x: int(x[1:])):
    hits = glob.glob(os.path.join(r'E:\math', '研究笔记', n + '-*.md'))
    if len(hits) != 1:
        miss.append((n, hits))
txt.append('  unresolved/ambiguous = %d' % len(miss))
for n, hits in miss:
    txt.append('   %s -> %s' % (n, hits))
io.open(r'E:\math\_work\order_sites.txt', 'w', encoding='utf-8').write('\n'.join(txt) + '\n')
print('OK %d sites -> _work/order_sites.json' % len(order_sites))
