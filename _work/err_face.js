// 通用族面尺：把 sites 台账逐跨重喂 KaTeX（全局宏表 + strict:'ignore' + display 按 kind），
// 按报错原文筛族，打印 站／body／行窗。用法：
//   node _work/err_face.js "_work/dollarmath_sites19.jsonl" "Double subscript|Double superscript"
const fs = require('fs');
const katex = require('katex');
const MAC = require('./katex_macros.js').load();

const LEDGER = process.argv[2] || '_work/dollarmath_sites19.jsonl';
const RX = new RegExp(process.argv[3] || 'Double subscript|Double superscript');

const rows = fs.readFileSync(LEDGER, 'utf8').split('\n').filter(s => s.trim()).map(s => JSON.parse(s));
const fam = [];
for (const r of rows) {
  let m = null;
  try { katex.renderToString(r.body, { throwOnError: true, strict: 'ignore', macros: MAC, displayMode: r.kind === 'DISPLAY' }); }
  catch (e) { m = e.message.split('\n')[0]; }
  if (m && RX.test(m)) fam.push([r, m]);
}
console.log(LEDGER + '  总跨=' + rows.length + '  筛出=' + fam.length +
  '  篇=' + new Set(fam.map(([r]) => r.file)).size);
for (const [r, m] of fam) {
  console.log('\n=== ' + r.file.slice(0, 4) + ':' + r.line + '  kind=' + r.kind + '  tok=' + r.tok);
  console.log('  err  : ' + m);
  console.log('  body : ' + JSON.stringify(r.body));
  console.log('  line : ' + r.lineText.slice(0, 300));
}
