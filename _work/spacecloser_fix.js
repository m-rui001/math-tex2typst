// Fix the residual 「闭符前多一个空格」 shape: an inline span whose closing $ is preceded by a
// space is rejected by the strict grammar, so the span runs on and swallows the next delimiter
// pair -- that is what makes D222 / D245 / D752 report an unclosed span. Same recipe as the
// accepted 16-site batch: delete the single space in front of the closer. Never adds or removes
// a $, never moves a line, and refuses the file unless the refusal count actually drops.
const fs = require('fs');
const path = require('path');
const katex = require('katex');
const B = String.fromCharCode(92);
const D = String.fromCharCode(36);
const BT = String.fromCharCode(96);
const ROOT = path.join('E:' + B + B + 'math', '研究笔记');
const DIG = '0123456789';
const APPLY = process.argv.includes('--apply');
const only = process.argv.slice(2).filter((a) => !a.startsWith('--'));

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

function refused(masked) {
  let bad = 0, unclosed = 0;
  const n = masked.length;
  let i = 0;
  while (i < n) {
    if (masked[i] !== D) { i++; continue; }
    if (masked[i + 1] === D) {
      let j = i + 2;
      while (j < n && !(masked[j] === D && masked[j + 1] === D)) j++;
      if (j >= n) { unclosed++; break; }
      const body = masked.slice(i + 2, j);
      if (body.trim()) { try { katex.renderToString(body, { throwOnError: true, strict: false, displayMode: true }); } catch (e) { bad++; } }
      i = j + 2; continue;
    }
    if (i + 1 >= n || ' \t\n'.includes(masked[i + 1])) { i++; continue; }
    let j = i + 1, closer = -1;
    while (j < n) {
      if (masked[j] === D) {
        const prev = masked[j - 1], next = masked[j + 1] || '';
        if (!' \t\n'.includes(prev) && next !== D && !DIG.includes(next)) { closer = j; break; }
      }
      j++;
    }
    if (closer < 0) { unclosed++; break; }
    const body = masked.slice(i + 1, closer);
    if (body.trim()) { try { katex.renderToString(body, { throwOnError: true, strict: false }); } catch (e) { bad++; } }
    i = closer + 1;
  }
  return { bad: bad, unclosed: unclosed };
}

// find the malformed closers: scan spans, and when a candidate closer is skipped only because
// the character before it is a space, and the same line holds an unmatched opener before it,
// record it as a deletable site
function sites(text) {
  const masked = fenceMask(text);
  const n = masked.length;
  const res = [];
  let i = 0;
  while (i < n) {
    if (masked[i] !== D) { i++; continue; }
    if (masked[i + 1] === D) {
      let j = i + 2;
      while (j < n && !(masked[j] === D && masked[j + 1] === D)) j++;
      if (j >= n) break;
      i = j + 2; continue;
    }
    if (i + 1 >= n || ' \t\n'.includes(masked[i + 1])) { i++; continue; }
    let j = i + 1, closer = -1, skipped = [];
    while (j < n) {
      if (masked[j] === D) {
        const prev = masked[j - 1], next = masked[j + 1] || '';
        if (' \t\n'.includes(prev)) { if (prev !== '\n') skipped.push(j); j++; continue; }
        if (next === D || DIG.includes(next)) { j++; continue; }
        closer = j; break;
      }
      j++;
    }
    if (closer < 0) {
      // the span never closes: the first skipped space-closer on the opener's own line is the fix
      const lineStart = masked.lastIndexOf('\n', i) + 1;
      const lineEnd = masked.indexOf('\n', i);
      const stop = lineEnd < 0 ? n : lineEnd;
      const s = skipped.filter((k) => k < stop);
      if (s.length) res.push(s[0]);
      break;
    }
    i = closer + 1;
  }
  return res;
}

let total = 0;
for (const f of fs.readdirSync(ROOT).filter((x) => /^D.*\.md$/.test(x)).sort()) {
  if (only.length && !only.some((p) => f.startsWith(p))) continue;
  const text = fs.readFileSync(path.join(ROOT, f), 'utf8');
  const r0 = refused(fenceMask(text));
  if (!r0.unclosed) continue;
  const st = sites(text);
  if (!st.length) { console.log('NO-SITE ' + f.slice(0, 16) + ' unclosed=' + r0.unclosed); continue; }
  let cur = text;
  for (const off of st.slice().reverse()) {
    if (cur[off] !== D || !' '.includes(cur[off - 1])) { console.log('SKIP-DRIFT'); continue; }
    cur = cur.slice(0, off - 1) + cur.slice(off);
    total++;
    console.log('SITE ' + f.slice(0, 16) + ' col=' + off + ' was=' +
      JSON.stringify(text.slice(off - 26, off + 12)));
  }
  const r1 = refused(fenceMask(cur));
  if (r1.unclosed >= r0.unclosed) { console.log('REFUSE-NOT-BETTER ' + f.slice(0, 14) + ' ' + r0.unclosed + '->' + r1.unclosed); continue; }
  if (cur.includes('\r')) { console.log('REFUSE-INVARIANT CR ' + f.slice(0, 14)); continue; }
  if (cur.split('\n').length !== text.split('\n').length) { console.log('REFUSE-INVARIANT newline ' + f.slice(0, 14)); continue; }
  if (cur.split(D).length !== text.split(D).length) { console.log('REFUSE-INVARIANT dollar ' + f.slice(0, 14)); continue; }
  if (cur.split(BT).length !== text.split(BT).length) { console.log('REFUSE-INVARIANT backtick ' + f.slice(0, 14)); continue; }
  if (APPLY) {
    fs.writeFileSync(path.join(ROOT, '.backup-' + f.replace(/\.md$/, '') + '.pre-spacecloser.md'), text);
    fs.writeFileSync(path.join(ROOT, f), cur);
  }
  console.log(f.slice(0, 16) + ' unclosed ' + r0.unclosed + '->' + r1.unclosed + ' refused ' +
    r0.bad + '->' + r1.bad + (APPLY ? ' APPLIED' : ' dry'));
}
console.log('TOTAL sites_edited=' + total + (APPLY ? ' APPLIED' : ' dry'));
