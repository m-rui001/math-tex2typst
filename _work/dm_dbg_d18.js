// _work/dm_dbg_d18.js — why does dm_lib's shipped口径 differ from katex_census.js on
// D18? Rebuilds fenceMask() verbatim from katex_census.js and diffs it against
// dm_lib.shipped() for one note, then prints the spans around the reported line.
const path = require('path');
const fs = require('fs');
const L = require('./dm_lib.js');
const B = String.fromCharCode(92);
const D = String.fromCharCode(36);
const BT = String.fromCharCode(96);

function fenceMask(text) {   // verbatim from katex_census.js
  const lines = text.split('\n');
  const out = [];
  const flags = [];
  let infence = false;
  let tok = null;
  for (const l of lines) {
    const s = l.trim();
    if (/^(?:`{3,}|~{3,})/.test(s)) {
      if (!infence) { infence = true; tok = s[0] + s[0] + s[0]; out.push(''); flags.push(1); continue; }
      if (tok && s.startsWith(tok)) { infence = false; tok = null; out.push(''); flags.push(1); continue; }
    }
    if (infence) { out.push(''); flags.push(1); }
    else {
      const cleaned = l.replace(new RegExp(BT + '+[^' + BT + B + 'n]*' + BT + '+', 'g'), (m) => ' '.repeat(m.length));
      out.push(cleaned); flags.push(0);
    }
  }
  return { masked: out.join('\n'), flags, lines };
}

function spansJS(masked) {   // verbatim from katex_census.js
  const res = [];
  const n = masked.length;
  const DIG = '0123456789';
  let i = 0;
  while (i < n) {
    if (masked[i] !== D) { i++; continue; }
    if (masked[i + 1] === D) {
      let j = i + 2;
      while (j < n && !(masked[j] === D && masked[j + 1] === D)) j++;
      if (j >= n) { res.push({ kind: 'DUNCLOSED', a: i }); break; }
      res.push({ kind: 'DISPLAY', body: masked.slice(i + 2, j), a: i });
      i = j + 2; continue;
    }
    if (i + 1 >= n || ' \t\n'.includes(masked[i + 1])) { i++; continue; }
    let j = i + 1; let closer = -1;
    while (j < n) {
      if (masked[j] === D && !' \t\n'.includes(masked[j - 1]) && !DIG.includes(masked[j + 1] === D ? '' : masked[j + 1] || '')) { closer = j; break; }
      j++;
    }
    if (closer < 0) { res.push({ kind: 'IUNCLOSED', a: i }); break; }
    res.push({ kind: 'INLINE', body: masked.slice(i + 1, closer), a: i });
    i = closer + 1;
  }
  return res;
}

const f = process.argv[2];
const text = L.readNote(f);
const fm = fenceMask(text);
const lib = L.shipped(text);
console.log('fenceMask length=' + fm.masked.length + ' lib.shipped length=' + lib.s.length);
console.log('identical=' + (fm.masked === lib.s));
if (fm.masked !== lib.s) {
  let k = 0, shown = 0;
  for (let i = 0; i < Math.min(fm.masked.length, lib.s.length); i++) {
    if (fm.masked[i] !== lib.s[i]) {
      console.log('first diff at ' + i + ':\n  js : ' + JSON.stringify(fm.masked.slice(i - 40, i + 40)) +
        '\n  lib: ' + JSON.stringify(lib.s.slice(i - 40, i + 40)));
      shown++;
      if (shown >= 3) break;
    }
  }
}
const js = spansJS(fm.masked).filter((s) => s.body && s.body.includes(D));
console.log('fenceMask口径 sites with interior $ = ' + js.length);
for (const s of js) console.log('  line ' + L.lineOf(fm.masked, s.a) + ' kind ' + s.kind + ' body ' + JSON.stringify(s.body.slice(0, 80)));
