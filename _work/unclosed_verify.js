// Verify candidate delimiter-only repairs WITHOUT writing to the notes.
// Applies the before->after replacement in memory, re-runs the census grammar's
// first-unclosed detector, and prints invariant deltas.
const fs = require('fs');
const path = require('path');
const B = String.fromCharCode(92);
const D = String.fromCharCode(36);
const BT = String.fromCharCode(96);
const ROOT = path.join('E:' + B + B + 'math', '\u7814\u7a76\u7b14\u8bb0');
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
function firstUnclosed(masked) {
  const n = masked.length; let i = 0;
  while (i < n) {
    if (masked[i] !== D) { i++; continue; }
    if (masked[i + 1] === D) {
      let j = i + 2; while (j < n && !(masked[j] === D && masked[j + 1] === D)) j++;
      if (j >= n) return 'DUNCLOSED'; i = j + 2; continue;
    }
    if (i + 1 >= n || ' \t\n'.includes(masked[i + 1])) { i++; continue; }
    let j = i + 1, closer = -1;
    while (j < n) { if (masked[j] === D && !' \t\n'.includes(masked[j - 1]) && !DIG.includes(masked[j + 1] === D ? '' : masked[j + 1] || '')) { closer = j; break; } j++; }
    if (closer < 0) return 'IUNCLOSED'; i = closer + 1;
  }
  return null;
}
function inv(text) { return { lines: text.split('\n').length, dollar: text.split(D).length - 1, backtick: text.split(BT).length - 1, cr: (text.match(/\r/g) || []).length }; }

const targets = [
  { t: 'D222', edits: [{ b: '$p = $ \u539f\u70b9', a: '$p =$ \u539f\u70b9' }] },      // 在 $p = $ 原点 -> $p =$ 原点
  { t: 'D752', edits: [{ b: '\\alpha\\delta< $ ', a: '\\alpha\\delta<$ ' }] },        // $\alpha\delta< $  -> $\alpha\delta<$
  { t: 'D245', edits: [
      { b: '889-891$"', a: '889-891"' },                                            // drop stray closing $ in cell1 quote
      { b: '392-396$"', a: '392-396"' },                                            // drop stray closing $ in cell2 quote
  ] },
];

const files = fs.readdirSync(ROOT).filter((f) => /^D.*\.md$/.test(f)).sort();
for (const cfg of targets) {
  const f = files.find((x) => x.startsWith(cfg.t + '-'));
  const text = fs.readFileSync(path.join(ROOT, f), 'utf8');
  const before = inv(text);
  const u0 = firstUnclosed(fenceMask(text));
  let cur = text, ok = true, notes = [];
  for (const e of cfg.edits) {
    const cnt = cur.split(e.b).length - 1;
    notes.push('match(' + JSON.stringify(e.b) + ')=' + cnt);
    if (cnt !== 1) { ok = false; }
    cur = cur.replace(e.b, e.a);
  }
  const after = inv(cur);
  const u1 = firstUnclosed(fenceMask(cur));
  console.log('=== ' + cfg.t + ' ' + f);
  console.log('  ' + notes.join(' ; '));
  console.log('  unique-all-edits=' + ok);
  console.log('  unclosed BEFORE=' + u0 + '  AFTER=' + u1);
  console.log('  lines   ' + before.lines + ' -> ' + after.lines + '  (delta ' + (after.lines - before.lines) + ')');
  console.log('  dollar  ' + before.dollar + ' -> ' + after.dollar + '  (delta ' + (after.dollar - before.dollar) + ')');
  console.log('  backtick' + before.backtick + ' -> ' + after.backtick + '  (delta ' + (after.backtick - before.backtick) + ')');
  console.log('  CR      ' + before.cr + ' -> ' + after.cr);
}
