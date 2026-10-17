# -*- coding: utf-8 -*-
# 把 prescribed region_check（FROM→EOF）与按表窗口的 pipe_table_check 追加到各篇链日志
import io, os, subprocess

def cut(path):
    """去掉上一次未跑成的残段，从第一个 ### region_check 起截断。"""
    t = io.open(path, 'rb').read().decode('utf-8', 'replace')
    i = t.find('### region_check')
    return t[:i] if i >= 0 else t

HDRMAP = {'D32': [644], 'D65': [334], 'D47': [581], 'D36': [591], 'D26': [1078, 1102],
          'D28': [1151], 'D29': [819], 'D41': [529], 'D68': [1336], 'D30': [797],
          'D34': [562, 722], 'D24': [685], 'D364': [432], 'D44': [442], 'D50': [414]}
env = dict(os.environ, PYTHONIOENCODING='utf-8')
for pid in ['D32', 'D65', 'D47', 'D36', 'D26', 'D28', 'D29', 'D41', 'D68', 'D30', 'D34', 'D24', 'D364', 'D44', 'D50']:
    hs = HDRMAP[pid]
    path = r'E:\math\_work\chain_%s.txt' % pid
    io.open(path, 'wb').write(cut(path).encode('utf-8'))
    with io.open(path, 'ab') as fh:
        for h in hs:
            r = subprocess.run(['python', r'_work\region_check.py', pid, str(h)], cwd=r'E:\math', capture_output=True, env=env)
            fh.write(('### region_check %s %s\n' % (pid, h)).encode('utf-8'))
            fh.write(r.stdout)
            if r.stderr:
                fh.write(('STDERR ' + r.stderr.decode('utf-8', 'replace')).encode('utf-8'))
            fh.write(('rc=%d\n' % r.returncode).encode('utf-8'))
        r = subprocess.run(['python', r'_work\pipe_table_check.py', pid] + [str(x) for x in hs],
                           cwd=r'E:\math', capture_output=True, env=env)
        fh.write(('### pipe_table_check %s (该篇该表窗口，表头竖线数=该表续行应有竖线数)\n' % pid).encode('utf-8'))
        fh.write(r.stdout)
        if r.stderr:
            fh.write(('STDERR ' + r.stderr.decode('utf-8', 'replace')).encode('utf-8'))
        fh.write(('rc=%d\n' % r.returncode).encode('utf-8'))
    print(pid, 'ok', r.returncode)
