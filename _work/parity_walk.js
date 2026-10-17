// _work/parity_walk.js — for one note, walk the CORRECTED-mask delimiters and report
// (a) every line whose own delimiter count is odd, and (b) every span whose opener and
// closer sit on different lines.  An unclosed flag at the END of a file is an upstream
// parity defect, so this names the first line where the parity actually breaks.
// Usage: node _work/parity_walk.js D234-
'use strict';
const fs = require('fs');
const L = require('./dm_lib.js');
const P = process.argv[2] || '';
const f = fs.readdirSync(L.ROOT).filter((x) => /^D.*\.md$/.test(x) && x.startsWith(P)).sort();
for (const name of f) {
  const text = L.readNote(name);
  const m = L.corrected(text);
  const per = {};
  for (let i = 0; i < m.s.length; i++) {
    if (!m.delim[i]) continue;
    const ln = L.lineOf(text, i);
    per[ln] = (per[ln] || 0) + 1;
  }
  const odd = Object.keys(per).filter((k) => per[k] % 2).map(Number).sort((a, b) => a - b);
  const cross = [];
  for (const s of L.spans(m, {})) {
    if (s.kind === 'IUNCLOSED' || s.kind === 'DUNCLOSED') { cross.push([s.kind, L.lineOf(text, s.a)]); continue; }
    const a = L.lineOf(text, s.a), b = L.lineOf(text, s.b);
    if (a !== b) cross.push(['CROSS', a, b, m.s.slice(s.a, Math.min(s.b + 1, s.a + 70)).replace(/\n/g, '\\n')]);
  }
  if (!odd.length && !cross.length) continue;
  console.log('==== ' + name.slice(0, 40));
  console.log('  odd-$ lines: ' + (odd.length ? odd.slice(0, 12).join(',') : 'none') +
    '  (masked delimiters total=' + Object.values(per).reduce((x, y) => x + y, 0) + ')');
  for (const c of cross.slice(0, 8)) console.log('  ' + JSON.stringify(c));
}
console.log('scanned ' + f.length + ' file(s)');
