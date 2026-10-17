// span_grammar_probe.js — 量「跨度配对」这一级的修法：`node _work/span_grammar_probe.js <spec.json>`
//
// 现有两把尺都看不见这一族：fix_probe 只渲染台账给定的那一跨，delim_probe 只数整行定界符枚数。
// 而 `"$ …$"`（开符 `$` 紧跟空格）这种形，改的是**哪个 `$` 当开符**——枚数一根不动、
// 台账里那一跨的边界却整个换掉，只有拿量具自己的跨度语法重算才算验真。
// 这里复用 `_work/dm_lib.js`（与 dollarmath_census2.js 同一口径：mask=corrected、digit=plain），
// 按规格在内存里 old→new，逐篇报修前／修后的拒渲跨度清单与集合差。
const fs = require('fs');
const path = require('path');
const katex = require('katex');
const L = require('./dm_lib.js');
const { load: loadMacros } = require('./katex_macros.js');
const MACROS = loadMacros();
const B = String.fromCharCode(92);

const fixes = JSON.parse(fs.readFileSync(process.argv[2], 'utf8'));
const byFile = new Map();
for (const f of fixes) {
  const fn = fs.readdirSync(L.ROOT).filter((x) => x.startsWith(f.cid + '-'))[0];
  if (!fn) { console.log(f.cid + '  NOFILE'); continue; }
  if (!byFile.has(fn)) byFile.set(fn, []);
  byFile.get(fn).push(f);
}

function refused(text) {
  const m = L.corrected(text);
  const out = [];
  for (const s of L.spans(m, { digitQuirk: false })) {
    if (s.kind === 'IUNCLOSED' || s.kind === 'DUNCLOSED') continue;
    const body = L.bodyOf(m, s);
    let err = null;
    try {
      katex.renderToString(body, {
        throwOnError: true, strict: false,
        displayMode: s.kind === 'DISPLAY', macros: MACROS,
      });
    } catch (e) { err = e; }
    if (err) out.push(L.lineOf(text, s.a) + '|' + s.kind + '|' +
      String(err.message).replace(/at position.*/, '').replace(/^KaTeX parse error: /, '').slice(0, 44));
  }
  return out;
}

let bad = 0;
for (const [fn, units] of byFile) {
  const before = fs.readFileSync(path.join(L.ROOT, fn), 'utf8');
  let after = before;
  for (const u of units) {
    const hits = after.split(u.old).length - 1;
    if (hits !== u.expect) {
      console.log('  预数不符 ' + u.cid + ':' + u.line + ' 命中=' + hits + '/' + u.expect);
      bad++;
    }
    after = after.split(u.old).join(u.new);
  }
  const rb = refused(before), ra = refused(after);
  const setB = new Set(rb), setA = new Set(ra);
  const removed = rb.filter((x) => !setA.has(x));
  const added = ra.filter((x) => !setB.has(x));
  console.log('\n=== ' + fn.slice(0, 12) + '  拒渲跨 ' + rb.length + ' -> ' + ra.length +
    '  消 ' + removed.length + '／新增 ' + added.length);
  for (const x of removed) console.log('  - ' + x);
  for (const x of added) console.log('  + ' + x);
  if (added.length) bad++;
}
console.log('\n规格 ' + fixes.length + ' 单／' + byFile.size + ' 篇，异常 ' + bad);
