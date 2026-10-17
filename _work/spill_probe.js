// Classify the residual KaTeX-refused spans by LINE CONTEXT, so the two families
// (verbatim source quotes whose prose spilled into math vs. real notation shorthands)
// get counted separately instead of being guessed at from command names.
// A refused span is called 「外溢」 when the text around it on the same line reads as
// English/LaTeX source: a long Latin run, or a source-quote marker, and no CJK at all.
const fs = require('fs');
const path = require('path');
const katex = require('katex');

const B = String.fromCharCode(92);
const D = String.fromCharCode(36);
const BT = String.fromCharCode(96);
const ROOT = path.join('E:' + B + B + 'math', '研究笔记');
const CJK = new RegExp('[' + String.fromCharCode(0x4e00) + '-' + String.fromCharCode(0x9fff) + ']');
const RUN = new RegExp('[A-Za-z]' + B + '?[A-Za-z]{14,}');
const MARKER = new RegExp('~' + B + B + '(?:eq)?ref|' + B + B + 'cite|' + B + B + 'label|' +
  B + B + 'tag|' + B + B + 'begin|' + B + B + 'item|\\.tex:|\\.tex,');

function fenceMask(text) {
  const lines = text.split('\n');
  const out = [];
  let infence = false;
  let tok = null;
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
  const DIG = '0123456789';
  let i = 0;
  while (i < n) {
    if (masked[i] !== D) { i++; continue; }
    if (masked[i + 1] === D) {
      let j = i + 2;
      while (j < n && !(masked[j] === D && masked[j + 1] === D)) j++;
      if (j >= n) { res.push({ kind: 'DUNCLOSED', a: i }); break; }
      res.push({ kind: 'DISPLAY', body: masked.slice(i + 2, j), a: i, b: j + 1 });
      i = j + 2; continue;
    }
    if (i + 1 >= n || ' \t\n'.includes(masked[i + 1])) { i++; continue; }
    let j = i + 1, closer = -1;
    while (j < n) {
      if (masked[j] === D && !' \t\n'.includes(masked[j - 1]) &&
          !DIG.includes(masked[j + 1] === D ? '' : masked[j + 1] || '')) { closer = j; break; }
      j++;
    }
    if (closer < 0) { res.push({ kind: 'IUNCLOSED', a: i }); break; }
    res.push({ kind: 'INLINE', body: masked.slice(i + 1, closer), a: i, b: closer });
    i = closer + 1;
  }
  return res;
}

const files = fs.readdirSync(ROOT).filter((f) => /^D.*\.md$/.test(f)).sort();
let spill = 0, real = 0, refused = 0;
const byFile = new Map();
const samples = [];
for (const f of files) {
  const text = fs.readFileSync(path.join(ROOT, f), 'utf8');
  const lines = text.split('\n');
  const masked = fenceMask(text);
  const mo = masked.split('\n');
  const lineStart = [0];
  for (let k = 0; k < masked.length; k++) if (masked[k] === '\n') lineStart.push(k + 1);
  let cur = 0;
  for (const s of spans(masked)) {
    if (s.kind === 'IUNCLOSED' || s.kind === 'DUNCLOSED') continue;
    let err = null;
    try {
      katex.renderToString(s.body, { throwOnError: true, strict: false, displayMode: s.kind === 'DISPLAY' });
    } catch (e) { err = e; }
    if (!err) continue;
    refused++;
    while (cur + 1 < lineStart.length && lineStart[cur + 1] <= s.a) cur++;
    const ln = cur;
    const raw = lines[ln] === undefined ? '' : lines[ln];
    const outside = (raw.slice(0, s.a - lineStart[ln]) + raw.slice(s.b - lineStart[ln] + 1));
    const isSpill = !CJK.test(outside) && (RUN.test(outside) || MARKER.test(outside));
    if (isSpill) {
      spill++;
      byFile.set(f, (byFile.get(f) || 0) + 1);
      if (samples.length < 14 && raw.length > 40) samples.push(f.slice(0, 14) + ':' + (ln + 1) + ' ' + raw.slice(0, 150));
    } else real++;
  }
}
console.log('refused=' + refused + ' spill_family=' + spill + ' other=' + real +
  ' files_with_spill=' + byFile.size);
const t = [...byFile.entries()].sort((a, b) => b[1] - a[1]).slice(0, 18);
for (const [k, v] of t) console.log(String(v).padStart(4) + '  ' + k.slice(0, 46));
for (const s of samples) console.log('SAMPLE ' + s);
