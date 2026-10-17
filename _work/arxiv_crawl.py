# -*- coding: utf-8 -*-
# 抓取「被 >=5 篇语料笔记引用」的 arXiv 原文源码包，解压到 被引素材/<id>/
import io, os, re, sys, json, subprocess, tarfile, time
sys.stdout.reconfigure(encoding='utf-8')

IDS = [l.strip() for l in io.open('_work/cite_w2.txt', encoding='utf-8') if l.strip()]
os.makedirs('被引素材', exist_ok=True)
log = io.open('_work/crawl_log.txt', 'w', encoding='utf-8')


def san(a):
    return re.sub(r'[^A-Za-z0-9.]', '_', a)


def get(url, dst, tries=3):
    for i in range(tries):
        r = subprocess.run(['curl', '-sL', '--max-time', '120', '-o', dst, '-w', '%{http_code} %{size_download}', url],
                           stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        out = r.stdout.decode('utf-8', 'replace').strip()
        code, size = (out.split() + ['0'])[:2]
        if code == '200' and int(size) > 2000:
            return int(size)
        time.sleep(4 + 4 * i)
    return 0


rows = []
for a in IDS:
    d = '被引素材/' + san(a)
    reg = 'https://export.arxiv.org/e-print/' + a
    tg = '_work/_dl.tgz'
    n = get(reg, tg)
    if not n:
        rows.append((a, 'DOWNLOAD_FAIL', 0, 0))
        log.write('%s DOWNLOAD_FAIL\n' % a); log.flush()
        continue
    os.makedirs(d, exist_ok=True)
    tex = 0
    try:
        with tarfile.open(tg, 'r:*') as tf:
            tf.extractall(d)
    except Exception as e:
        with io.open(os.path.join(d, 'raw.single.tex'), 'wb') as fh:
            fh.write(io.open(tg, 'rb').read())
        log.write('%s not-a-tar (%s), saved as single tex\n' % (a, e))
    texs = []
    for root, sub, files in os.walk(d):
        for f in files:
            if f.endswith('.tex'):
                texs.append(os.path.join(root, f))
    total = sum(os.path.getsize(p) for p in texs)
    rows.append((a, 'OK', len(texs), total))
    log.write('%-20s OK tex=%d bytes=%d tar=%d\n' % (a, len(texs), total, n)); log.flush()
    time.sleep(3)

json.dump(rows, io.open('_work/crawl_result.json', 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
print('crawled=%d ok=%d fail=%d' % (len(rows), sum(1 for r in rows if r[1] == 'OK'), sum(1 for r in rows if r[1] != 'OK')))
for r in rows:
    print(r[0], r[1], 'tex=%d' % r[2] if r[1] == 'OK' else '', 'bytes=%d' % r[3] if r[1] == 'OK' else '')
