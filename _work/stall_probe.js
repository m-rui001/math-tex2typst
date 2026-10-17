// For the notes whose span scan stalls, print WHY: every candidate closer after the
// stalling opener, tagged with the rule that rejected it (whitespace before the closer,
// digit after it, double-dollar form). This turns 「unclosed」 from a count into three
// adjudicable cases, without touching any delimiter parity.
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

const targets = process.argv.slice(2);
for (const f of fs.readdirSync(ROOT).filter((x) => /^D.*\.md$/.test(x)).sort()) {
  if (targets.length && !targets.some((t) => f.startsWith(t))) continue;
  const text = fs.readFileSync(path.join(ROOT, f), 'utf8');
  const masked = fenceMask(text);
  const n = masked.length;
  let i = 0, stalled = null;
  while (i < n) {
    if (masked[i] !== D) { i++; continue; }
    if (masked[i + 1] === D) {
      let j = i + 2;
      while (j < n && !(masked[j] === D && masked[j + 1] === D)) j++;
      if (j >= n) { stalled = { a: i, kind: 'DISPLAY' }; break; }
      i = j + 2; continue;
    }
    if (i + 1 >= n || ' \t\n'.includes(masked[i + 1])) { i++; continue; }
    let j = i + 1, closer = -1;
    while (j < n) {
      if (masked[j] === D) {
        const prev = masked[j - 1], next = masked[j + 1] || '';
        if (' \t\n'.includes(prev)) { j++; continue; }
        if (next === D) { j++; continue; }
        if (DIG.includes(next)) { j++; continue; }
        closer = j; break;
      }
      j++;
    }
    if (closer < 0) { stalled = { a: i, kind: 'INLINE' }; break; }
    i = closer + 1;
  }
  if (!stalled) { console.log('OK ' + f.slice(0, 14) + ' scan closed'); continue; }
  const lines = text.split('\n');
  const ls = [0];
  for (let k = 0; k < masked.length; k++) if (masked[k] === '\n') ls.push(k + 1);
  let ln = 0;
  while (ln + 1 < ls.length && ls[ln + 1] <= stalled.a) ln++;
  console.log('STALL ' + f.slice(0, 16) + ' kind=' + stalled.kind + ' line=' + (ln + 1) +
    ' col=' + (stalled.a - ls[ln]) + ' line_dollars=' + (lines[ln].split(D).length - 1));
  console.log('  OPENER+120: ' + JSON.stringify(masked.slice(stalled.a, stalled.a + 120)));
  // the next few dollars after the opener, each tagged
  let shown = 0;
  for (let k = stalled.a + 1; k < n && shown < 6; k++) {
    if (masked[k] !== D) continue;
    const prev = masked[k - 1], next = masked[k + 1] || '';
    let why = 'ACCEPTED';
    if (' \t\n'.includes(prev)) why = 'REJ-space-before';
    else if (next === D) why = 'DOUBLE';
    else if (DIG.includes(next)) why = 'REJ-digit-after:' + next;
    console.log('   $@' + k + ' line=' + (lineOf(ls, k) + 1) + ' ' + why +
      ' raw=' + JSON.stringify((lines[lineOf(ls, k)] || '').slice(Math.max(0, k - lineOf(ls, k) - 22), k + 22)));
    shown++;
  }
}
function lineOf(ls, off) { let c = 0; while (c + 1 < ls.length && ls[c + 1] <= off) c++; return c; }
