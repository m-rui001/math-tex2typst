// Corpus-wide macro-leak census: newsec_macro only scans the freshly appended segment, so a
// parameterized macro (a \def with #1/#2, which the expander cannot substitute) can sit in the
// body of an already-collected note unseen. Here every macro this paper's preamble defines --
// expanded or unresolved -- is counted over the WHOLE note text.
const fs = require('fs');
const path = require('path');
const B = String.fromCharCode(92);
const NOTES = path.join('E:' + B + B + 'math', '研究笔记');
const TBL = JSON.parse(fs.readFileSync('preamble_tables.json', 'utf8'));
const files = fs.readdirSync(NOTES).filter((f) => /^D\d+.*\.md$/.test(f));
let dirty = 0, notes = 0, uses = 0;
const rows = [];
for (const f of files.sort()) {
  const key = (f.match(/^D\d+(?=-)/) || [''])[0];
  const e = TBL[key];
  if (!e) continue;
  notes++;
  const text = fs.readFileSync(path.join(NOTES, f), 'utf8');
  const lines = text.split('\n');
  const found = [];
  const all = Object.assign({}, e.defs || {});
  for (const m of e.unresolved || []) if (!(m in all)) all[m] = '?';
  for (const mac of Object.keys(all)) {
    const re = new RegExp(mac.replace(/[.*+?^${}()|[\]\\]/g, B + '$&') + '(?![A-Za-z])', 'g');
    const at = [];
    for (let i = 0; i < lines.length; i++) {
      const n = (lines[i].match(re) || []).length;
      if (n) at.push((i + 1) + 'x' + n);
    }
    if (at.length) found.push([mac, all[mac], at.length, at.slice(0, 6).join(' ')]);
  }
  if (found.length) {
    dirty++;
    for (const x of found) uses += x[2];
    rows.push(key + ' ' + found.map((x) => x[0] + '(' + x[2] + 'ln,' +
      (x[1] === '?' ? 'unres' : 'exp') + ')').join(' '));
  }
}
console.log('notes=' + notes + ' dirty=' + dirty + ' macro-lines=' + uses);
for (const r of rows) console.log('  ' + r);
