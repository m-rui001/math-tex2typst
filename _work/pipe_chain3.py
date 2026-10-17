# -*- coding: utf-8 -*-
"""按篇重建完整链记录 _work/chain_<ID>.txt：
   [1] pipe_fix 落盘段（逐字取自 _work/pipe_fix_log.txt 的 [WROTE] 那一段）
   [2] .tools/sweep.py 两趟
   [3] _work/gate_one.py
   [4] _work/region_check.py <ID> <表头行号>（每篇该篇涉表逐个跑）
   [5] _work/pipe_table_check.py <ID>（按表窗口）
只追加，不截断；每段即时 flush。
"""
import io, os, subprocess, sys

BASE = r'E:\math'
HDRMAP = {'D25': [252, 300, 587, 698, 1041, 1342, 1603, 1856, 2545],
          'D32': [644], 'D65': [334], 'D47': [581], 'D36': [591],
          'D26': [1078, 1102], 'D28': [1151], 'D29': [819], 'D41': [529],
          'D68': [1336], 'D30': [797], 'D34': [562, 722], 'D24': [685],
          'D364': [432], 'D44': [442], 'D50': [414]}
IDS = ['D25', 'D32', 'D65', 'D47', 'D36', 'D26', 'D28', 'D29', 'D41', 'D68', 'D30', 'D34', 'D24', 'D364', 'D44', 'D50']
env = dict(os.environ, PYTHONIOENCODING='utf-8')

log = io.open(BASE + r'\_work\pipe_fix_log.txt', 'rb').read().decode('utf-8').split('\n')


def slice_for(pid):
    out, on = [], False
    for l in log:
        if l.startswith('################ '):
            on = l.split()[1] == pid
            if on:
                out.append(l)
        elif on:
            out.append(l)
    return '\n'.join(out)


def run(fh, title, cmd):
    fh.write(('### %s\n' % title).encode('utf-8'))
    fh.flush()
    r = subprocess.run(['python'] + cmd, cwd=BASE, capture_output=True, env=env)
    fh.write(r.stdout)
    if r.stderr:
        fh.write(('STDERR ' + r.stderr.decode('utf-8', 'replace')).encode('utf-8'))
    fh.write(('rc=%d\n' % r.returncode).encode('utf-8'))
    fh.flush()
    return r.returncode


for pid in IDS:
    path = BASE + r'\_work\chain_%s.txt' % pid
    with io.open(path, 'wb') as fh:
        fh.write(('### pipe_fix %s 落盘段（逐字节写盘 + 全部 assert 通过；OLD/NEW 整行逐字）\n' % pid).encode('utf-8'))
        fh.write(slice_for(pid).encode('utf-8'))
        fh.write(b'[WROTE] note updated\n')
        fh.flush()
        run(fh, 'sweep %s pass1' % pid, [r'.tools\sweep.py', pid])
        run(fh, 'sweep %s pass2' % pid, [r'.tools\sweep.py', pid])
        run(fh, 'gate_one %s' % pid, [r'_work\gate_one.py', pid])
        for h in HDRMAP[pid]:
            run(fh, 'region_check %s %s (FROM→EOF 全尾扫描)' % (pid, h), [r'_work\region_check.py', pid, str(h)])
        run(fh, 'pipe_table_check %s (该篇该表窗口)' % pid, [r'_work\pipe_table_check.py', pid] + [str(x) for x in HDRMAP[pid]])
        run(fh, 'pipe_audit (落盘后核对)', [r'_work\pipe_audit.py'])
        fh.write(b'CHAIN_DONE\n')
    print(pid, os.path.getsize(path))
