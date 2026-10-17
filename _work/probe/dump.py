import json

d = json.load(open('E:/math/_work/probe/q.json', encoding='utf-8'))
for i, b in enumerate(d['blocks']):
    s = json.dumps(b, ensure_ascii=False)
    print(i, b['t'], s[:240])
