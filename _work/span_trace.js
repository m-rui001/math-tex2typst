// Trace the strict span grammar over ONE note and print the spans around the first
// unclosed one, so the mis-pairing site is identified by the matcher itself, not by eye.
const fs = require('fs');
const path = require('path');
const B = String.fromCharCode(92);
const D = String.fromCharCode(36);
const BT = String.fromCharCode(96);
const ROOT = path.join('E:' + B + B + 'math', '研究笔记');
const DIG = '0123456789';

function fenceMask(text) {
  const lines = text.split('\n');
  const out = [];
  let infence = false, tok = null;
  for (const l of lines) {
    const s = l.trim();
    if (/^(?:`{3,}|~{3,})/.test(s)) {
      if (!infence) { infence = true; tok = s[0] + s[0] + s[0]; out.push(''); continue; }
      if (tok && s.startsWith(tok)) { infence = false; tok = null; out.push(''); continue; }
    }
    if (infence) { out.push(''); continue; }
    out.push(l.replace(new RegExp(BT + '+[^' + BT + B + 'n]*' + BT + '+', 'g'), (m) => ' '.repeat(m.length)));
  }
  return out.join('\n');
}

function spans(masked) {
  const res = [];
  const n = masked.length;
  let i = 0;
  while (i < n) {
    if (masked[i] !== D) { i++; continue; }
    if (masked[i + 1] === D) {
      let j = i + 2;
      while (j < n && !(masked[j] === D && masked[j + 1] === D)) j++;
      if (j >= n) { res.push({ kind: 'DUNCLOSED', a: i, b: n }); break; }
      res.push({ kind: 'DISPLAY', a: i, b: j, body: masked.slice(i + 2, j) });
      i = j + 2;
      continue;
    }
    if (i + 1 >= n || ' \t\n'.includes(masked[i + 1])) { i++; continue; }
    let j = i + 1, closer = -1;
    while (j < n) {
      if (masked[j] === D && !' \t\n'.includes(masked[j - 1]) &&
          !DIG.includes(masked[j + 1] === D ? '' : masked[j + 1] || '')) { closer = j; break; }
      j++;
    }
    if (closer < 0) { res.push({ kind: 'IUNCLOSED', a: i, b: n }); break; }
    res.push({ kind: 'INLINE', a: i, b: closer, body: masked.slice(i + 1, closer) });
    i = closer + 1;
  }
  return res;
}

function lineOf(text, off) {
  let c = 1;
  for (let i = 0; i < off; i++) if (text[i] === '\n') c++;
  return c;
}
function colOf(text, off) {
  let last = -1;
  for (let i = 0; i < off; i++) if (text[i] === '\n') last = i;
  return off - last - 1;
}

const key = process.argv[2];
const before = Number(process.argv[3] || 4);
const file = fs.readdirSync(ROOT).find((f) => f.startsWith(key + '-'));
const text = fs.readFileSync(path.join(ROOT, file), 'utf8');
const masked = fenceMask(text);
const sp = spans(masked);
const badIdx = sp.findIndex((s) => s.kind === 'DUNCLOSED' || s.kind === 'IUNCLOSED');
console.log('file=' + file + ' spans=' + sp.length + ' firstUnclosedIdx=' + badIdx);
if (badIdx < 0) { console.log('NO UNCLOSED'); process.exit(0); }
const s = sp[badIdx];
console.log('UNCLOSED kind=' + s.kind + ' openerLine=' + lineOf(masked, s.a) + ' openerCol=' + colOf(masked, s.a));
console.log('  openerContext=' + JSON.stringify(masked.slice(s.a - 70, s.a + 70)));
for (let k = Math.max(0, badIdx - before); k < badIdx; k++) {
  const p = sp[k];
  console.log('  prev#' + k + ' ' + p.kind +
    ' open=' + lineOf(masked, p.a) + ':' + colOf(masked, p.a) +
    ' close=' + lineOf(masked, p.b) + ':' + colOf(masked, p.b) +
    ' bodyLen=' + (p.body || '').length + ' body=' + JSON.stringify((p.body || '').slice(0, 60)) +
    ' bodyTail=' + JSON.stringify((p.body || '').slice(-40)) +
    ' crossesNL=' + ((p.body || '').includes('\n')));
}
