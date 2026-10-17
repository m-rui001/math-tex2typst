// Parameterized-macro leak census: only the macros the expander could NOT resolve (they take
// #1/#2 arguments), counted over the note body with fenced code blocks and the note's own
// \newcommand quotations skipped, because those are verbatim source quotations, not uses.
const fs = require('fs');
const path = require('path');
const B = String.fromCharCode(92);
const NOTES = path.join('E:' + B + B + 'math', '研究笔记');
const TBL = JSON.parse(fs.readFileSync('preamble_tables.json', 'utf8'));
const EXCL = new Set(fs.readFileSync(path.join('E:' + B + B + 'math', '.tools', 'inflight.txt'), 'utf8').trim().split(/\s+/));
// KaTeX 本身就认识的命令不算泄漏，与 param_macro_expand.py 的 KNOWN 同一份名单。
const KNOWN = new Set(['\\mathscr', '\\mathbb', '\\mathrm', '\\mathbf', '\\boldsymbol',
  '\\operatorname', '\\text', '\\boxed', '\\substack', '\\displaystyle']);
const files = fs.readdirSync(NOTES).filter((f) => /^D\d+.*\.md$/.test(f)).sort();
const per = new Map();
const rows = [];
const sample = [];
for (const f of files) {
  const key = (f.match(/^D\d+(?=-)/) || [''])[0];
  if (EXCL.has(key)) continue;
  const e = TBL[key];
  if (!e || !(e.unresolved || []).length) continue;
  const lines = fs.readFileSync(path.join(NOTES, f), 'utf8').split('\n');
  let fence = false;
  const cnt = new Map();
  for (let i = 0; i < lines.length; i++) {
    if (/^```/.test(lines[i])) { fence = !fence; continue; }
    if (fence) continue;
    if (/newcommand|renewcommand|\\def\b|DeclareMath/.test(lines[i])) continue;
    for (const mac of e.unresolved) {
      if (KNOWN.has(mac)) continue;
      const re = new RegExp(mac.replace(/[.*+?^${}()|[\]\\]/g, B + '$&') + '(?![A-Za-z])', 'g');
      const n = (lines[i].match(re) || []).length;
      if (!n) continue;
      cnt.set(mac, (cnt.get(mac) || 0) + n);
      per.set(mac, (per.get(mac) || 0) + n);
      if (sample.length < 14) sample.push(key + ':' + (i + 1) + ' ' + lines[i].trim().slice(0, 130));
    }
  }
  const tot = Array.from(cnt.values()).reduce((a, b) => a + b, 0);
  if (tot) rows.push([key, tot, Array.from(cnt).map((x) => x[0] + 'x' + x[1]).join(' ')]);
}
rows.sort((a, b) => b[1] - a[1]);
console.log('notes-with-leak=' + rows.length + ' occurrences=' +
  rows.reduce((a, r) => a + r[1], 0));
const pm = Array.from(per).sort((a, b) => b[1] - a[1]);
console.log('macros=' + pm.length + ' ' + pm.slice(0, 24).map((x) => x[0] + ':' + x[1]).join(' '));
console.log('top notes:');
for (const r of rows.slice(0, 18)) console.log('  ' + r[0] + ' x' + r[1] + '  ' + r[2].slice(0, 110));
console.log('samples:');
for (const s of sample) console.log('  ' + s);
