# -*- coding: utf-8 -*-
# 从各素材的 preamble 抽宏定义表，落 _work/macro_defs.json：{C 号: {宏名(不含反斜杠): 定义体}}
# 凭据只来自素材自己写下的定义；抽不到的宏一律不进表，回改侧就不发明。
# 定义体可以嵌套花括号（\newcommand{\Num}{\mathrm{N}\mathrm{u}\mathrm{m}}），所以用配平扫描而不是正则。
import io, os, re, sys, glob, json

sys.stdout.reconfigure(encoding='utf-8')
plan = json.load(io.open('_work/cited_plan.json', encoding='utf-8'))

CMD = re.compile(r'\\(?:newcommand|renewcommand|providecommand|DeclareMathOperator|def)\*?')


def group_at(t, i):
    """t[i] == '{'：返回 (体内文本, 右括号后的下标)；不配平返回 None。"""
    depth = 0
    j = i
    while j < len(t):
        c = t[j]
        if c == '\\':
            j += 2
            continue
        if c == '{':
            depth += 1
        elif c == '}':
            depth -= 1
            if depth == 0:
                return t[i + 1:j], j + 1
        j += 1
    return None


def skip_ws(t, i):
    while i < len(t) and t[i] in ' \t\n\r\f\v':
        i += 1
    return i


def parse_defs(text):
    defs = {}
    for m in CMD.finditer(text):
        i = m.end()
        i = skip_ws(text, i)
        starred = text[m.start():m.end()].endswith('*')
        braced = False
        if i < len(text) and text[i] == '{':
            g, i2 = group_at(text, i)
            name_off = skip_ws(g, 0)
            mm = re.match(r'\\([A-Za-z]+)', g[name_off:])
            if not mm:
                continue
            name = mm.group(1)
            braced = True
            i = i2
        else:
            mm = re.match(r'\\([A-Za-z]+)', text[i:])
            if not mm:
                continue
            name = mm.group(1)
            i += mm.end()
        i = skip_ws(text, i)
        if i < len(text) and text[i] == '[':
            k = text.find(']', i)
            if k < 0:
                continue
            i = skip_ws(text, k + 1)
        # \def 的参文本可以带界定符：\def\rfdown#1.{\lfloor{#1}\rfloor} 的实参以句点收尾
        # （1009.3188 与它的同族素材 macros.tex 里 79 处全这么写，旧解析在这里整个丢掉定义）。
        # 界定符只认实际出现的句点；逐位存在体尾的 \x00 标记里，回改侧据此取实参并吃掉句点。
        delims = []
        while i < len(text):
            if text[i] == '#':
                if i + 1 >= len(text) or not text[i + 1].isdigit():
                    delims = None
                    break
                delims.append(u'')
                i += 2
                if i < len(text) and text[i] == '.':
                    delims[-1] = '.'
                    i += 1
            elif text[i] in u' \t\n':
                i += 1
            else:
                break
        if delims is None or i >= len(text) or text[i] != '{':
            continue
        g, i2 = group_at(text, i)
        if g is None:
            continue
        body = g.strip()
        if not body:
            continue
        if delims and any(delims):
            body += u'\x00' + u''.join(d or u'-' for d in delims)
        key = ('*' + name) if (starred and not braced) else name
        if key not in defs:
            defs[key] = body
    return defs


out = {}
tot = 0
nohtml = 0
for p in plan:
    cid = p['cid']
    defs = {}
    for t in p['texs']:
        fp = t['path'] if os.path.exists(t['path']) else os.path.join(*t['path'].split('/'))
        if not os.path.exists(fp):
            nohtml += 1
            continue
        d = parse_defs(io.open(fp, encoding='utf-8', errors='replace').read())
        for k, v in d.items():
            defs.setdefault(k, v)
    out[cid] = defs
    tot += len(defs)
print('cid 数=%d 宏定义合计=%d 缺失 tex=%d' % (len(out), tot, nohtml))
for cid in ('C01', 'C02', 'C03', 'C05'):
    d = out[cid]
    print(cid, '宏数=%d' % len(d), dict(list(d.items())[:8]))
io.open('_work/macro_defs.json', 'wb').write(json.dumps(out, ensure_ascii=False, indent=0).encode('utf-8'))
print('written _work/macro_defs.json bytes=%d' % os.path.getsize('_work/macro_defs.json'))
