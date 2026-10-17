// 把 sites17 的每一跨重新喂 KaTeX，按报错原文筛出 `Expected group after '_'／'^'` 一族，
// 逐站打印 修前 body、报错、以及所在行的上下文窗口。
const fs = require('fs');
const katex = require('katex');
const MAC = require('./katex_macros.js').load();

const rows = fs.readFileSync('_work/dollarmath_sites17.jsonl', 'utf8')
  .split('\n').filter(s => s.trim()).map(s => JSON.parse(s));

function msg(body, kind) {
  try { katex.renderToString(body, { throwOnError: true, strict: 'ignore', macros: MAC, displayMode: kind === 'DISPLAY' }); return null; }
  catch (e) { return e.message.split('\n')[0]; }
}

const fam = [];
for (const r of rows) {
  const m = msg(r.body, r.kind);
  if (m && /group after '_|group after '\^/.test(m)) fam.push([r, m]);
}
console.log('族站点数=' + fam.length + '  篇=' + new Set(fam.map(([r]) => r.file)).size);
for (const [r, m] of fam) {
  console.log('\n=== ' + r.file.slice(0, 4) + ':' + r.line + '  kind=' + r.kind);
  console.log('  err  : ' + m);
  console.log('  body : ' + JSON.stringify(r.body));
  console.log('  line : ' + r.lineText.slice(0, 260));
}
