# -*- coding: utf-8 -*-
import io, re, glob, os, time, json

MAP = {6: 'D162', 29: 'D167', 54: 'D165', 59: 'D164', 73: 'D166', 74: 'D149',
       77: 'D148', 79: 'D154', 80: 'D152', 81: 'D155', 83: 'D150', 86: 'D153',
       87: 'D156', 88: 'D151', 89: 'D157', 96: 'D158', 111: 'D159', 117: 'D163',
       123: 'D160', 155: 'D161'}

queue = [l.strip() for l in io.open(r'.tools/lean_queue.txt', encoding='utf-8') if l.strip()]
srcpat = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._\-]*)')
declpat = re.compile(u'\u961f' + r'[^\n]{0,8}?' + u'\u884c\u53f7' + r'[^\d]{0,4}(\d{1,3})')
DATE = re.compile(r'-September-\d+-20\d\d$')

for ln in sorted(MAP):
    pfx = MAP[ln]
    hits = sorted(glob.glob(u'\u7814\u7a76\u7b14\u8bb0/%s-*.md' % pfx))
    stem = DATE.sub('', queue[ln - 1].split('/')[0])
    if not hits:
        print('%s line%-4d NOFILE  stem=%s' % (pfx, ln, stem[:50]))
        continue
    p = hits[0]
    t = io.open(p, encoding='utf-8', errors='replace').read()
    srcs = {DATE.sub('', x) for x in srcpat.findall(t)}
    decls = sorted({int(x) for x in declpat.findall(t[:5000])})
    age = (time.time() - os.path.getmtime(p)) / 60.0
    print('%s line%-4d size=%7d age=%6.1f dir=%s decl=%s  stem=%s' % (
        pfx, ln, len(t.encode('utf-8')), age, stem in srcs, decls, stem[:44]))
