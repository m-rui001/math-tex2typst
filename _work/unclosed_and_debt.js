// Two things that need no note writes:
// 1) the few spans that never close under the strict grammar -- each one is a real
//    rendering defect and small enough to adjudicate by eye, so print file:line and the
//    surrounding text instead of auto-compensating any delimiter parity;
// 2) the 浅版债 still waiting for a slot: which .tex filenames each note cites and how
//    often, measured against the rescued build dir, so a dispatch can state its debt.
const fs = require('fs');
const path = require('path');
const B = String.fromCharCode(92);
const D = String.fromCharCode(36);
const BT = String.fromCharCode(96);
const ROOT = path.join('E:' + B + B + 'math', '研究笔记');
const PRE = path.join('E:' + B + B + 'math', 'preprints');
const rescue = JSON.parse(fs.readFileSync('dir_rescue.json', 'utf8'));

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
  const n = masked.length, DIG = '0123456789';
  let i = 0;
  while (i < n) {
    if (masked[i] !== D) { i++; continue; }
    if (masked[i + 1] === D) {
      let j = i + 2;
      while (j < n && !(masked[j] === D && masked[j + 1] === D)) j++;
      if (j >= n) return { a: i, kind: 'DISPLAY-unclosed' };
      i = j + 2; continue;
    }
    if (i + 1 >= n || ' \t\n'.includes(masked[i + 1])) { i++; continue; }
    let j = i + 1, closer = -1;
    while (j < n) {
      if (masked[j] === D && !' \t\n'.includes(masked[j - 1]) &&
          !DIG.includes(masked[j + 1] === D ? '' : masked[j + 1] || '')) { closer = j; break; }
      j++;
    }
    if (closer < 0) return { a: i, kind: 'INLINE-unclosed' };
    i = closer + 1;
  }
  return null;
}

const files = fs.readdirSync(ROOT).filter((f) => /^D.*\.md$/.test(f)).sort();
const text = new Map();
let found = 0;
for (const f of files) {
  const t = fs.readFileSync(path.join(ROOT, f), 'utf8');
  text.set(f, t);
  const masked = fenceMask(t);
  const lines = t.split('\n');
  const ls = [0];
  for (let k = 0; k < masked.length; k++) if (masked[k] === '\n') ls.push(k + 1);
  let probe = masked, guard = 0;
  while (guard++ < 6) {
    const u = firstUnclosed(probe);
    if (!u) break;
    found++;
    let ln = 0;
    while (ln + 1 < ls.length && ls[ln + 1] <= u.a) ln++;
    const raw = lines[ln] || '';
    const off = u.a - ls[ln];
    console.log('UNCLOSED ' + f.slice(0, 20) + ' line=' + (ln + 1) + ' ' + u.kind +
      ' dollar_col=' + off + ' line_dollars=' + (raw.split(D).length - 1));
    console.log('   ' + raw.slice(Math.max(0, off - 40), off + 130).replace(/\n/g, ' '));
    probe = probe.slice(u.a + 1);
    break;
  }
}
console.log('unclosed_files_reported=' + found);

for (const id of ['D03', 'D07']) {
  const f = files.filter((x) => x.startsWith(id + '-'))[0];
  const dir = rescue[id] && rescue[id].dir;
  if (!f || !dir) { console.log(id + ' no rescue entry'); continue; }
  const t = text.get(f);
  const bdir = path.join(PRE, dir, 'build');
  const texs = [];
  const walk = (p) => {
    for (const e of fs.readdirSync(p, { withFileTypes: true })) {
      const q = path.join(p, e.name);
      if (e.isDirectory()) walk(q);
      else if (/\.tex$/.test(e.name)) texs.push(q);
    }
  };
  if (fs.existsSync(bdir)) walk(bdir);
  console.log('=== ' + id + ' dir=' + dir.slice(0, 58) + ' bytes=' + fs.statSync(path.join(ROOT, f)).size +
    ' heads=' + (t.match(/^## /gm) || []).length + ' tex=' + texs.length);
  const rows = texs.map((q) => {
    const src = fs.readFileSync(q, 'utf8');
    const base = path.basename(q);
    const cites = (t.match(new RegExp(base.replace(/\./g, '\\.'), 'g')) || []).length;
    return { base: base, lines: src.split('\n').length, bytes: fs.statSync(q).size, cites: cites };
  }).sort((a, b) => a.cites - b.cites || a.bytes - b.bytes);
  for (const r of rows) console.log('   ' + r.base.padEnd(26) + String(r.lines).padStart(5) + ' lines' +
    String(r.bytes).padStart(7) + ' B  cited=' + r.cites);
}
