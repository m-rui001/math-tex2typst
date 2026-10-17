# -*- coding: utf-8 -*-
"""闸门前后对照：把当前笔记按决策表反向还原成「改动前」的那一版，
写进 _work/precheck/<原名> ，用同一个 gate.chk 读数，与改动后的读数对比。
只读笔记本体，不回写笔记。
用法： python _work/gate_pre.py D25 D32 ...
"""
import io, os, sys, glob, shutil
sys.path.insert(0, r'.tools')
sys.path.insert(0, r'E:\math\_work')
import gate
import pipe_fix as PF

IDS = sys.argv[1:]
os.makedirs(r'E:\math\_work\precheck', exist_ok=True)
for pid in IDS:
    p = PF.note_path(pid)
    text = io.open(p, 'rb').read().decode('utf-8')
    post = dict((m, text.count(m)) for m in ('\\lVert', '\\rVert', '\\lvert', '\\rvert', '\\Vert'))
    n = 0
    for (_ln, _nb, _exp, frags) in PF.PLAN[pid]:
        for (o, nw) in frags:
            assert text.count(nw) >= 1, '%s: new form missing %r' % (pid, nw[:40])
            text = text.replace(nw, o, 1)
            n += 1
    reg = PF.REGISTER.get(pid, [])
    cp = os.path.join(r'E:\math\_work\precheck', os.path.basename(p))
    b = text.encode('utf-8')
    # 与落盘日志里记录的 before 字节数核对，确认反向还原完全可逆
    log = io.open(r'E:\math\_work\pipe_fix_log.txt', 'rb').read().decode('utf-8').split('\n')
    before = None
    seen = False
    for ln in log:
        if ln.startswith('################ %s ' % pid):
            seen = True
        elif seen and ln.startswith('before: bytes='):
            before = int(ln.split('bytes=')[1].split()[0])
            break
    sys.stdout.buffer.write(('%s 片段数=%d 反向还原 bytes=%d  log-before=%d  match=%s\n' %
                             (pid, n, len(b), before, len(b) == before)).encode('utf-8'))
    io.open(cp, 'wb').write(b)
    try:
        rpre = gate.chk(cp, quiet=True)
    except TypeError:
        rpre = gate.chk(cp)
    try:
        rpost = gate.chk(p, quiet=True)
    except TypeError:
        rpost = gate.chk(p)
    lines = ['  PRE  %s' % (rpre,), '  POST %s' % (rpost,),
             '  文件 %s  pre_bytes=%d post_bytes=%d' % (os.path.basename(p), os.path.getsize(cp), os.path.getsize(p))]
    sys.stdout.buffer.write(('\n'.join(lines) + '\n').encode('utf-8'))
