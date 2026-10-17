// Find which macro causes "tokens is not iterable" and show an example span.
const fs = require('fs');
const path = require('path');
const katex = require('katex');
const B = String.fromCharCode(92);
const D = String.fromCharCode(36);
const BT = String.fromCharCode(96);
const ROOT = path.join('E:' + B + B + 'math', '研究笔记');
const WORK = path.join('E:' + B + B + 'math', '_work');
const MACROS = JSON.parse(fs.readFileSync(path.join(WORK, 'katex_macros.json'), 'utf8'));
const DIG = '0123456789';

function fenceMask(text) {
  const lines = text.split('\n'); const out = []; let infence = false; let tok = null;
  for (const l of lines) {
    const s = l.trim();
    if (/^(?:`{3,}|~{3,})/.test(s)) {
      if (!infence) { infence = true; tok = s[0] + s[0] + s[0]; out.push(''); continue; }
      if (tok && s.startsWith(tok)) { infence = false; tok = null; out.push(''); continue; }
    }
    if (infence) out.push('');
    else out.push(l.replace(new RegExp(BT + '+[^' + BT + B + 'n]*' + BT + '+', 'g'), (m) => ' '.repeat(m.length)));
  }
  return out.join('\n');
}
function spans(masked) {
  const res = []; const n = masked.length; let i = 0;
  while (i < n) {
    if (masked[i] !== D) { i++; continue; }
    if (masked[i + 1] === D) { let j = i + 2; while (j < n && !(masked[j] === D && masked[j + 1] === D)) j++; if (j >= n) break; res.push({ k: 'DISPLAY', b: masked.slice(i + 2, j) }); i = j + 2; continue; }
    if (i + 1 >= n || ' \t\n'.includes(masked[i + 1])) { i++; continue; }
    let j = i + 1, c = -1; while (j < n) { if (masked[j] === D && !' \t\n'.includes(masked[j - 1]) && !DIG.includes(masked[j + 1] === D ? '' : masked[j + 1] || '')) { c = j; break; } j++; }
    if (c < 0) break; res.push({ k: 'INLINE', b: masked.slice(i + 1, c) }); i = c + 1;
  }
  return res;
}
const files = fs.readdirSync(ROOT).filter((f) => /^D.*\.md$/.test(f)).sort();
let shown = 0;
for (const f of files) {
  const text = fs.readFileSync(path.join(ROOT, f), 'utf8');
  const masked = fenceMask(text);
  for (const s of spans(masked)) {
    try { katex.renderToString(s.b, { throwOnError: true, strict: false, displayMode: s.k === 'DISPLAY', macros: MACROS }); }
    catch (e) {
      if (String(e.message).includes('tokens is not iterable')) {
        const m = String(e.message);
        console.log('FILE', f);
        console.log('SPAN', s.b.slice(0, 120));
        // find which macro token is present
        for (const key of Object.keys(MACROS)) {
          if (s.b.includes(key)) { console.log('HAS MACRO', key, '=>', JSON.stringify(MACROS[key])); }
        }
        if (++shown >= 6) process.exit(0);
      }
    }
  }
}
console.log('done, shown=', shown);
