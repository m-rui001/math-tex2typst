// Locate the KaTeX error families that are NOT undefined control sequences, with a
// file:line for each so they can be repaired one case at a time.
// Usage: node katex_other.js [IDprefix]
const fs = require('fs');
const path = require('path');
const katex = require('katex');
const B = String.fromCharCode(92);
const D = String.fromCharCode(36);
const BT = String.fromCharCode(96);
const ROOT = 'E:' + B + B + 'math' + B + B + '研究笔记';
const WORK = 'E:' + B + B + 'math' + B + B + '_work';
const DIG = '0123456789';
const PREFIX = process.argv.slice(2).find((a) => !a.startsWith('--')) || '';

function fenceMask(text) {
  const lines = text.split('\n');
  const out = [];
  let infence = false;
  let tok = null;
  for (const l of lines) {
    const s = l.trim();
    if (/^(?:`{3,}|~{3,})/.test(s)) {
      if (!infence) { infence = true; tok = s[0] + s[0] + s[0]; out.push(' '.repeat(l.length)); continue; }
      if (tok && s.startsWith(tok)) { infence = false; tok = null; out.push(' '.repeat(l.length)); continue; }
    }
    out.push(infence ? ' '.repeat(l.length)
      : l.replace(new RegExp(BT + '+[^' + BT + B + 'n]*' + BT + '+', 'g'), (m) => ' '.repeat(m.length)));
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
      if (j >= n) { res.push({ kind: 'X', a: i, b: i }); break; }
      res.push({ kind: 'DISPLAY', body: masked.slice(i + 2, j), a: i + 2, b: j });
      i = j + 2;
      continue;
    }
    if (i + 1 >= n || ' \t\n'.includes(masked[i + 1])) { i++; continue; }
    let j = i + 1, closer = -1;
    while (j < n) {
      if (masked[j] === D && !' \t\n'.includes(masked[j - 1]) &&
          !(masked[j + 1] && masked[j + 1] !== D && DIG.includes(masked[j + 1]))) { closer = j; break; }
      j++;
    }
    if (closer < 0) { res.push({ kind: 'X', a: i, b: i }); break; }
    res.push({ kind: 'INLINE', body: masked.slice(i + 1, closer), a: i + 1, b: closer });
    i = closer + 1;
  }
  return res;
}

const files = fs.readdirSync(ROOT).filter((f) => /^D.*\.md$/.test(f))
  .filter((f) => !PREFIX || f.startsWith(PREFIX)).sort();
const byClass = new Map();
const counts = new Map();
const linesUpTo = [];
for (const f of files) {
  const text = fs.readFileSync(path.join(ROOT, f), 'utf8');
  const masked = fenceMask(text);
  let acc = 0;
  const mark = text.split('\n').map((l) => { const prev = acc; acc += l.length + 1; return prev; });
  for (const s of spans(masked)) {
    if (s.kind === 'X') continue;
    let err = null;
    try {
      katex.renderToString(s.body, { throwOnError: true, strict: false, displayMode: s.kind === 'DISPLAY' });
    } catch (e) { err = e; }
    if (!err) continue;
    const msg = String(err.message).replace(/Error: /, '').split(' at position')[0];
    if (/^Undefined control sequence/.test(msg)) continue;
    const key = msg.slice(0, 60);
    if (!byClass.has(key)) byClass.set(key, []);
    counts.set(key, (counts.get(key) || 0) + 1);
    const arr = byClass.get(key);
    if (arr.length < 4) {
      let ln = 0;
      while (ln + 1 < mark.length && mark[ln + 1] <= s.a) ln++;
      arr.push(f.slice(0, 20) + ':' + (ln + 1) + '  ' + s.body.slice(0, 70));
    }
  }
}
const out = [];
let tot = 0;
for (const [k, v] of [...byClass.entries()].sort((a, b) => counts.get(b[0]) - counts.get(a[0]))) {
  out.push('### ' + counts.get(k) + '  ' + k);
  for (const e of v) out.push('    ' + e);
  tot += v.length;
}
fs.writeFileSync(path.join(WORK, 'katex_other_report.txt'), out.join('\n'));
console.log('classes=' + byClass.size + ' examples=' + tot);
console.log(out.slice(0, 60).join('\n'));
