// _work/d234_probe.js — why does the corrected mask still see an unclosed '$' on D234:476?
// Print, for that line, every '$' with its prov code (P plain / c code span / F fence / E after
// backslash) and every backtick run, so the masking decision is readable instead of guessed.
'use strict';
const L = require('./dm_lib.js');
const f = require('fs').readdirSync(L.ROOT).find((x) => x.startsWith('D234-'));
const text = L.readNote(f);
const m = L.corrected(text);
const lines = text.split('\n');
const target = parseInt(process.argv[2] || '476', 10);
let off = 0;
for (let i = 0; i < target - 1; i++) off += lines[i].length + 1;
const line = lines[target - 1];
const dl = [];
for (let i = 0; i < line.length; i++) {
  const c = line[i];
  if (c === L.D) dl.push('D@' + i + '(' + m.prov[off + i] + ')');
  if (c === L.BT) dl.push('T@' + i + '(' + m.prov[off + i] + ')');
}
console.log('line len=' + line.length + ' tokens: ' + dl.join(' '));
const sp = L.spans(m, {});
const bad = sp.filter((s) => s.kind === 'IUNCLOSED' || s.kind === 'DUNCLOSED');
for (const s of bad) console.log('unclosed at raw-off=' + s.a + ' line=' + L.lineOf(text, s.a) +
  ' text=<<' + text.slice(s.a, s.a + 70).replace(/\n/g, '\\n') + '>>');
