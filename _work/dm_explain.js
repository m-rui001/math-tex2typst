// _work/dm_explain.js — for one site, print what the corrected mask blanks that the
// shipped mask leaves live, and what the DIG.includes('') quirk vetoes.
const fs = require('fs');
const path = require('path');
const L = require('./dm_lib.js');
const D = L.D, BT = L.BT;
const WORK = 'E:' + String.fromCharCode(92) + String.fromCharCode(92) + 'math/_work';

const file = process.argv[2];
const line = parseInt(process.argv[3], 10);
const text = fs.readFileSync(path.join(L.ROOT, file), 'utf8');
const sh = L.shipped(text);
const co = L.corrected(text);

const lines = text.split('\n');
let off = 0;
for (let i = 0; i < line - 1; i++) off += lines[i].length + 1;
const a = Math.max(0, off - 200);
const b = Math.min(text.length, off + lines[line - 1].length + 200);

console.log('HOST LINE: ' + JSON.stringify(lines[line - 1]));
console.log('');
const marks = [];
for (let p = a; p < b; p++) {
  const sDollar = sh.s[p] === D;
  const cDollar = co.s[p] === D;
  if (sDollar !== cDollar) marks.push({ p, raw: text[p], prov: co.prov ? co.prov[p] : '?', shipped: sh.s[p], corrected: co.s[p] });
}
console.log('characters that are a "$" in one口径 but blanked in the other:');
for (const m of marks) {
  console.log('  off=' + m.p + ' raw=' + JSON.stringify(m.raw) + ' prov=' + JSON.stringify(m.prov) +
    ' shipped=' + JSON.stringify(m.shipped) + ' corrected=' + JSON.stringify(m.corrected) +
    '  ctx=' + JSON.stringify(text.slice(Math.max(0, m.p - 45), m.p + 45)));
}
console.log('');
for (const mode of ['shipped', 'corrected']) {
  for (const q of [false, true]) {
    const m = mode === 'shipped' ? sh : co;
    const sp = L.spans(m, { digitQuirk: q });
    const fam = sp.filter((s) => s.interior > 0 && L.lineOf(text, s.a) === line);
    console.log(mode + ' + digit' + (q ? '=quirk' : '=plain') + ' -> sites on this line: ' + fam.length +
      (fam.length ? ' | bodies: ' + fam.map((s) => JSON.stringify(L.bodyOf(m, s).slice(0, 60))).join(' ;; ') : ''));
  }
}
