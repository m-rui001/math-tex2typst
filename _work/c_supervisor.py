# -*- coding: utf-8 -*-
# C 稿写手看门人：并发恒 3 档，一张单交回就收稿+回引，然后补派队列里的下一张。
# 用法：nohup python _work/c_supervisor.py > _work/c_super.out 2>&1 &
# 判活只看两件事：自己 Popen 的退出码 + 目标稿字节；node.exe 计数用作全局占用（档=3）。
import io, os, re, subprocess, sys, time, glob

sys.stdout.reconfigure(encoding='utf-8')
os.chdir(r'E:\math')
BASH = r'E:\Git\bin\bash.exe'
CAP = 3
FLOOR = 22000
LOG = r'E:\math\_work\c_super.log'
QUEUE = [u'_work/prompt_C16_C17.txt'] + sorted(
    f for f in set(glob.glob(r'_work/prompt_C*_C*.txt'))
    if re.search(r'C(3[1-9]|[4-5][0-9])_C', f))
jobs = []  # dict(prompt, ids, log, proc)


def say(msg):
    line = u'%s %s' % (time.strftime('%H:%M:%S'), msg)
    with io.open(LOG, 'a', encoding='utf-8') as f:
        f.write(line + u'\n')
    print(line.encode('utf-8', 'replace').decode('utf-8'))


def run(cmd):
    r = subprocess.run(cmd, shell=True, capture_output=True, text=True,
                       encoding='utf-8', errors='replace')
    return ((r.stdout or '') + (r.stderr or '')).strip()


def node_count():
    out = run('tasklist /FI "IMAGENAME eq node.exe"')
    return len([l for l in out.splitlines() if u'node.exe' in l])


def note_bytes(cid):
    g = glob.glob(u'被引笔记/%s-*.md' % cid)
    return (g[0], os.path.getsize(g[0]), time.time() - os.path.getmtime(g[0])) if g else (None, 0, 9e9)


def collect(job):
    ready = []
    for cid in job['ids']:
        p, b, age = note_bytes(cid)
        if p is None:
            say(u'欠账：%s 未落盘（单 %s）' % (cid, os.path.basename(job['prompt'])))
        elif b < FLOOR:
            say(u'欠账：%s 未达下限 %d B（单 %s，续写单待人判）' % (cid, b, os.path.basename(job['prompt'])))
        elif age < 120:
            say(u'%s 落盘 %d B 但 %0.f 秒前还在写，下一轮再收' % (cid, b, age))
        else:
            ready.append((cid, b))
    if not ready:
        return
    ids = [c for c, _ in ready]
    say(u'收稿 %s（%s）' % (' '.join(ids), u' / '.join(u'%s %d B' % kb for kb in ready)))
    say(u'c_collect: ' + run('python _work/c_collect.py ' + ' '.join(ids)).replace('\n', ' ⏎ ')[-2500:])
    say(u'citeback: ' + run(u'python _work/citeback_plan.py --apply').replace('\n', ' ⏎ ')[-1800:])
    done = len([1 for f in glob.glob(r'被引笔记/C*-*.md') if os.path.getsize(f) >= FLOOR])
    say(u'过下限 C 稿=%d｜全库字节=%d｜node=%d｜队列剩=%d' % (
        done, sum(os.path.getsize(f) for f in glob.glob(r'被引笔记/C*-*.md')), node_count(), len(QUEUE)))


def fire(prompt):
    ids = sorted(set(re.findall(r'C\d+', os.path.basename(prompt))))
    log = u'_work/cb_%s.log' % re.sub(r'^prompt_|\.txt$', '', os.path.basename(prompt)).lower()
    cmd = u'M="$(cat %s)"; codebuddy -p -y --model fast-model "$M" > "%s" 2>&1' % (prompt.replace('\\', '/'), log)
    proc = subprocess.Popen([BASH, '-c', cmd])
    jobs.append({'prompt': prompt, 'ids': ids, 'log': log, 'proc': proc})
    say(u'派单 %s -> %s（log %s，pid %d）' % (os.path.basename(prompt), '/'.join(ids), log, proc.pid))


say(u'看门人起：队列 %d 张 %s｜当前 node=%d' % (len(QUEUE), ','.join(os.path.basename(q) for q in QUEUE), node_count()))
while QUEUE or jobs:
    for job in list(jobs):
        if job['proc'].poll() is not None:
            jobs.remove(job)
            say(u'交回 %s（退出码 %d，log %d B）' % (
                os.path.basename(job['prompt']), job['proc'].returncode, os.path.getsize(job['log'])))
            collect(job)
    free = CAP - node_count()
    if QUEUE and free > 0 and len(jobs) < free:
        fire(QUEUE.pop(0))
    time.sleep(60)
say(u'队列尽，看门人停')
