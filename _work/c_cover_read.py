# -*- coding: utf-8 -*-
# 覆盖率读数：57 篇 C 稿能覆盖多少篇语料稿 / 多少条引用行
import io, os, sys, json, glob, re, collections
sys.stdout.reconfigure(encoding='utf-8')
plan = json.load(io.open('_work/cited_plan.json', encoding='utf-8'))
cov = set()
for p in plan:
    cov |= set(p['notes'])
notes_all = len(glob.glob('研究笔记/D*.md'))
print('C papers planned = %d (writable %d)' % (len(plan), sum(1 for p in plan if p['texs'])))
print('corpus notes covered >=1 C note = %d / %d' % (len(cov), notes_all))
rows = json.load(io.open('_work/cited_by_notes.json', encoding='utf-8'))
n1 = [r for r in rows if len(r['notes']) == 1]
print('arxiv ids attributable = %d ; n==1 tier = %d' % (len(rows), len(n1)))
c1 = set()
for r in n1:
    c1 |= set(r['notes'])
print('notes that would gain coverage if n==1 tier written = %d (union with current %d)' % (len(c1 | cov), len(cov)))
