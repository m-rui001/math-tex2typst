// Probe: reuse katex_census.js grammar (fenceMask + spans) but WITHOUT the katex dep.
// For each target note, reproduce the FIRST unclosed span the census reports, and print:
//   kind, original line number, column, and masked + original context.
// Also print baseline invariants: line count, total '$', total backtick, total CR bytes.
const fs = require('fs');
const path = require('path');
const B = String.fromCharCode(92);
const D = String.fromCharCode(36);
const BT = String.fromCharCode(96);
const ROOT = path.join('E:' + B + B + 'math', '\u7814\u7a76\u7b14\u8bb0'); // 研究笔记
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

// span walk exactly like katex_census.spans(), but stops at FIRST unclosed and reports it.
function firstUnclosed(masked) {
  const n = masked.length;
  let i = 0;
  while (i < n) {
    if (masked[i] !== D) { i++; continue; }
    if (masked[i + 1] === D) {
      let j = i + 2;
      while (j < n && !(masked[j] === D && masked[j + 1] === D)) j++;
      if (j >= n) return { kind: 'DUNCLOSED', a: i };
      i = j + 2; continue;
    }
    if (i + 1 >= n || ' \t\n'.includes(masked[i + 1])) { i++; continue; }
    let j = i + 1, closer = -1;
    while (j < n) {
      if (masked[j] === D && !' \t\n'.includes(masked[j - 1]) &&
          !DIG.includes(masked[j + 1] === D ? '' : masked[j + 1] || '')) { closer = j; break; }
      j++;
    }
    if (closer < 0) return { kind: 'IUNCLOSED', a: i };
    i = closer + 1;
  }
  return null;
}

function lineOf(text, off) {
  let c = 0;
  for (let i = 0; i < off; i++) if (text[i] === '\n') c++;
  return c + 1; // 1-based
}

const targets = ['D222', 'D245', 'D752'];
const files = fs.readdirSync(ROOT).filter((f) => /^D.*\.md$/.test(f)).sort();

for (const t of targets) {
  const f = files.find((x) => x.startsWith(t + '-'));
  const fp = path.join(ROOT, f);
  const text = fs.readFileSync(fp, 'utf8');
  const masked = fenceMask(text);
  const u = firstUnclosed(masked);
  const lines = text.split('\n');
  const crCount = (text.match(/\r/g) || []).length;
  console.log('==============================================================');
  console.log('FILE ' + f);
  console.log('  path=' + fp);
  console.log('  invariant lines=' + lines.length +
    ' dollar_total=' + (text.split(D).length - 1) +
    ' backtick_total=' + (text.split(BT).length - 1) +
    ' CR_bytes=' + crCount);
  if (!u) { console.log('  NO unclosed span under census grammar'); continue; }
  const ln = lineOf(masked, u.a); // 1-based line in masked == original (all lines joined with \n)
  // column within that masked line:
  const maskedLines = masked.split('\n');
  const col = u.a - (maskedLines.slice(0, ln - 1).reduce((s, x) => s + x.length + 1, 0));
  console.log('  KIND=' + u.kind + '  maskedOffset=' + u.a +
    '  line=' + ln + '  col(0-based)=' + col);
  console.log('  ORIGINAL line[' + ln + ']: ' + JSON.stringify(lines[ln - 1]));
  console.log('  MASKED   line[' + ln + ']: ' + JSON.stringify(maskedLines[ln - 1]));
  // show 3 lines before and after
  for (let k = Math.max(0, ln - 3); k <= Math.min(lines.length - 1, ln + 2); k++) {
    const mark = (k === ln - 1) ? '>>' : '  ';
    console.log('   ' + mark + ' L' + (k + 1) + ': ' + lines[k]);
  }
  // masked window around the opener: 80 chars
  console.log('  masked window [-40..+80] around opener: ' +
    JSON.stringify(masked.slice(Math.max(0, u.a - 40), u.a + 80)));
  // For DUNCLOSED: count how many '$$' token positions exist after, to explain odd parity.
  if (u.kind === 'DUNCLOSED') {
    // find all display '$$' 2-char opener positions in masked (naive scan for consecutive $$)
    let positions = [];
    for (let k = 0; k < masked.length; k++) if (masked[k] === D && masked[k + 1] === D) positions.push(k);
    console.log('  total consecutive "$$" pairs found in masked = ' + positions.length);
  }
}
