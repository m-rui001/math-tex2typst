// For each surviving brace site: where the span sits in the file, how many times its body
// occurs there, and the ±12 characters around the brace KaTeX choked on. That is the whole
// input a 定点修补 needs -- the fix itself is decided by hand, not by this probe.
const fs = require('fs');
const path = require('path');
const katex = require('katex');
const { load } = require('./katex_macros.js');
const MACROS = load();
const B = String.fromCharCode(92);
const ROOT = path.join('E:' + B + B + 'math', '研究笔记');

const rows = fs.readFileSync('dollarmath_sites10.jsonl', 'utf8').split('\n').filter(Boolean)
  .map((l) => JSON.parse(l))
  .filter((r) => r.errClass && /Expected 'EOF', got '\}'/.test(r.errClass));

for (const r of rows) {
  const p = path.join(ROOT, r.file);
  const text = fs.readFileSync(p, 'utf8');
  const occ = text.split(r.body).length - 1;
  let pos = null;
  try {
    katex.renderToString(r.body, {
      macros: MACROS, throwOnError: true, strict: 'ignore', displayMode: r.kind === 'DISPLAY',
    });
  } catch (e) {
    const m = /at position (\d+)/.exec(e.message);
    pos = m ? Number(m[1]) : null;
  }
  const around = pos === null ? '(no position)'
    : JSON.stringify(r.body.slice(Math.max(0, pos - 14), pos)) + ' ⟪' +
      JSON.stringify(r.body.slice(pos, pos + 2)) + '⟫ ' +
      JSON.stringify(r.body.slice(pos + 2, pos + 16));
  console.log('\n' + r.file.slice(0, 28) + ':' + r.line + ' body在篇中出现=' + occ +
    ' 卡点=' + pos + '/' + r.body.length);
  console.log('  ' + around);
  console.log('  OLD候选 ' + JSON.stringify(occ === 1 ? r.body : r.body.slice(0, 60)));
}
