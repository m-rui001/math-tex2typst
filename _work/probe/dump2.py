import json

d = json.load(open('E:/math/_work/probe/q.json', encoding='utf-8'))


def walk(x, path=''):
    if isinstance(x, dict):
        t = x.get('t')
        if t in ('Math', 'DisplayMath'):
            print('MATH', json.dumps(x.get('c'), ensure_ascii=False)[:120])
        if t == 'Div':
            print('DIV', x['c'][0])
        if t == 'RawBlock':
            print('RAWBLOCK', x['c'][0], json.dumps(x['c'][1])[:200])
        if t == 'Cite':
            print('CITE', json.dumps(x['c'], ensure_ascii=False)[:160])
        for k, v in x.items():
            walk(v, path + '/' + str(t))
    elif isinstance(x, list):
        for v in x:
            walk(v, path)


walk(d)
