// `node _work/sites_diff.js <before.jsonl> <after.jsonl> [spec.json]`
// 拒渲站点的集合差。键＝（文件, 行, errClass）——台账没有 message 字段，errClass 就是类名。
// 只读集合差不读总数：在飞稿每写一节都往读数里加自己的行，总数差没有信息量。
// 给了规格就额外判两条：REMOVED 逐位是否落在执行位清单上（同篇覆盖多站时按 expect 记账），
// 以及 ADDED 有哪些（打印出来，逐条归因由人读）。
const fs = require('fs');

const rd = p => fs.readFileSync(p, 'utf8').trim().split('\n').filter(Boolean).map(l => JSON.parse(l));
const key = r => [r.file, r.line, r.errClass || ''].join('|');
const a = new Map(rd(process.argv[2]).map(r => [key(r), r]));
const b = new Map(rd(process.argv[3]).map(r => [key(r), r]));
const rem = [...a.keys()].filter(k => !b.has(k));
const add = [...b.keys()].filter(k => !a.has(k));
console.log(`前=${a.size} 后=${b.size} REMOVED=${rem.length} ADDED=${add.length}`);

if (process.argv[4]) {
  const spec = JSON.parse(fs.readFileSync(process.argv[4], 'utf8'));
  const byCid = new Map();
  for (const f of spec) {
    if (!byCid.has(f.cid)) byCid.set(f.cid, { lines: new Set(), expect: 0 });
    byCid.get(f.cid).lines.add(f.line);
    byCid.get(f.cid).expect += f.expect;
  }
  const offList = [];
  const hits = [];
  for (const k of rem) {
    const [file, line] = k.split('|');
    const cid = file.split('-')[0];
    const e = byCid.get(cid);
    if (!e) { offList.push(`${cid}:${line} 该篇不在规格里`); continue; }
    if (e.lines.has(+line)) hits.push(`${cid}:${line}`);
    else hits.push(`${cid}:${line}(同篇另一站)`);
    e.lines.add(+line);
  }
  const over = [...byCid].filter(([cid, e]) => {
    const n = rem.filter(k => k.split('|')[0].split('-')[0] === cid).length;
    return n !== e.expect;
  }).map(([cid, e]) => `${cid} 消 ${rem.filter(k => k.startsWith(cid + '-')).length} 期望 ${e.expect}`);
  console.log(`执行位(REMOVED 全部可归到规格篇)=${hits.length}/${rem.length}`);
  if (offList.length) console.log('  非规格篇:\n   ' + offList.join('\n   '));
  if (over.length) console.log('  逐篇计数与 expect 不符:\n   ' + over.join('\n   '));
}
for (const k of add) {
  const r = b.get(k);
  console.log('ADDED  ' + r.file.split('-')[0] + ':' + r.line + '  ' + (r.errClass || '') +
    '  ' + String(r.body).replace(/\s+/g, ' ').slice(0, 60));
}
