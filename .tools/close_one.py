# -*- coding: utf-8 -*-
# 一条命令跑完"收到某个号的交稿通知之后"的全部收稿动作：
#   python .tools/close_one.py <ID> --acked
# 顺序是 sweep 两趟到不动点 -> gate 复量 -> 表头/分隔行/定界符逐行奇偶 -> --collect 记
# READY 首样 -> 打印二量还要等的秒数（第二量交给 `sleep 665 && --collect` 那趟后台）。
# --acked 是显式确认"该号写手已终止"。缺它就直接退出：本体动在飞稿子会让写手下一次
# Edit 因文件已变而失败，丢掉后续整段。
import io, json, glob, os, subprocess, sys, time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import gate  # noqa: E402

if len(sys.argv) < 2 or '--acked' not in sys.argv:
    sys.stdout.buffer.write(u'用法: python .tools/close_one.py <ID> --acked\n'.encode('utf-8'))
    sys.exit(2)
kid = sys.argv[1]

hits = glob.glob(u'研究笔记/%s-*.md' % kid)
if len(hits) != 1:
    sys.stdout.buffer.write((u'%s: 目标稿命中 %d 份，只在恰好 1 份时收尾\n' % (kid, len(hits))).encode('utf-8'))
    sys.exit(1)
path = hits[0]

for _ in (1, 2):
    subprocess.call([sys.executable, u'.tools/sweep.py', kid])

res = gate.chk(path, quiet=True)
text = io.open(path, encoding='utf-8').read()
lines = text.split(u'\n')
HDR = u'| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |'
SEP = u'| --- | --- | --- | --- | --- |'
odd = [i + 1 for i, l in enumerate(lines) if l.count(u'$') % 2 == 1]
out = [u'gate: size=%d secs=%d contig=%s rows=%d math=%d problems=%s'
       % (res['size'], res['secs'], res['contig'], res['rows'], res['math'], res['problems'] or ['CLEAN']),
       u'hdr=%d sep=%d tabular_lines=%d dollar_odd_lines=%d%s'
       % (text.count(HDR), text.count(SEP),
          len([l for l in lines if l.startswith(u'|') and l.count(u'|') >= 4]),
          len(odd), (' ' + str(odd[:6]) if odd else ''))]

subprocess.call([sys.executable, u'.tools/other_cover.py', '--collect'])
state = json.load(io.open(u'.tools/collect_state.json', encoding='utf-8')).get(kid)
if state and state.get('ok'):
    out.append(u'READY seeded at %s; second sample in %.0fs'
               % (time.strftime('%H:%M:%S', time.localtime(state['ts'])),
                  max(0.0, 600 - (time.time() - state['ts']))))
else:
    out.append(u'collect_state[%s]=%s —— 没记上 READY 首样，先补掉上面列的 defects' % (kid, state))
sys.stdout.buffer.write((u'\n'.join(out) + u'\n').encode('utf-8'))
