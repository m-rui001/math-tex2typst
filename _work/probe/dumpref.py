import json

out = json.load(open('E:/math/_work/probe/ref.json', encoding='utf-8'))
for b in out['blocks']:
    if b['t'] in ('Para', 'Plain'):
        for x in b['c']:
            t = x['t']
            if t == 'Str':
                print('   Str', repr(x['c']))
            elif t == 'Space':
                pass
            else:
                print(t, json.dumps(x.get('c'), ensure_ascii=False)[:200])
