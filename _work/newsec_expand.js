// Intake companion to newsec_macro.js: expand the shorthands that survive inside a freshly
// appended section, using only the definitions the paper's own preamble publishes in
// preamble_tables.json, so the replacement string is never a guess. A control word is
// replaced only when the next byte is not a letter (that is what makes `\SuppF` a use of
// `\Supp` rather than a longer word), and because every expansion ends in `}` no trailing
// space has to be re-inserted to stop TeX from swallowing the next token.
//   node newsec_expand.js D605 414 [--apply]
const fs = require('fs');
const path = require('path');

const B = String.fromCharCode(92);
const NOTES = path.join('E:' + B + B + 'math', '研究笔记');
const TBL = JSON.parse(fs.readFileSync('preamble_tables.json', 'utf8'));
const key = process.argv[2];
const from = Number(process.argv[3]);
const APPLY = process.argv.includes('--apply');

const file = fs.readdirSync(NOTES).filter((f) => f.startsWith(key + '-'));
if (file.length !== 1) throw new Error('glob ambiguity ' + file.length);
const p = path.join(NOTES, file[0]);
const text = fs.readFileSync(p, 'utf8');
const lines = text.split('\n');
if (lines.join('\n') !== text) throw new Error('line split not reversible');

// Edit the region below `from` only: everything above it is a previously collected batch.
const head = lines.slice(0, from - 1).join('\n') + (from > 1 ? '\n' : '');
const segLines = lines.slice(from - 1);
let seg = segLines.join('\n');

// A definition is never applied inside code: an errata register or a verbatim quotation of
// the preamble must keep the macro name intact, and the byte guard below cannot see that
// damage because an expansion neither adds nor removes a backtick. Classification matches
// macro_site_probe.js: fenced blocks toggle on any line whose trimmed form starts with ```
// (toggled before that line's own sites are judged), and inline code is an odd number of
// backticks strictly to the left of the site.
const TICK = String.fromCharCode(96);
function codeMask(regionLines) {
  const mask = [];
  let inFence = false;
  for (const L of regionLines) {
    if (L.trim().startsWith(TICK + TICK + TICK)) inFence = !inFence;
    let ticks = 0;
    for (let i = 0; i < L.length; i++) {
      mask.push(inFence || ticks % 2 === 1);
      if (L[i] === TICK) ticks++;
    }
    mask.push(false);
  }
  return mask;
}
const stripCode = (s) => {
  const mk = codeMask(s.split('\n'));
  return s.split('').filter((c, i) => !mk[i]).join('');
};
const mask = codeMask(segLines);

const edits = [];
let skipped = 0;
for (const [mac, def] of Object.entries(TBL[key].defs || {})) {
  const re = new RegExp(mac.replace(/[.*+?^${}()|[\]\\]/g, B + '$&') + '(?![A-Za-z])', 'g');
  let m;
  while ((m = re.exec(seg))) {
    if (mask[m.index]) { skipped++; continue; }
    edits.push({ at: m.index, len: m[0].length, to: def, from: m[0] });
  }
}
if (!edits.length) {
  console.log(key + ' from=' + from + ' sites=0 skipped=' + skipped + ' NO-SITE');
  process.exit(0);
}
// Digits and letters inside the definition are the paper's own business; the guard here is
// that the region must not gain or lose lines, dollars, backticks or CR bytes.
edits.sort((a, b) => b.at - a.at);
let out = seg;
for (const E of edits) out = out.slice(0, E.at) + E.to + out.slice(E.at + E.len);
const news = head + out;
const before = { lines: lines.length, dollar: (text.match(/\$/g) || []).length,
  tick: (text.match(/`/g) || []).length, cr: text.indexOf('\r') };
const after = { lines: news.split('\n').length, dollar: (news.match(/\$/g) || []).length,
  tick: (news.match(/`/g) || []).length, cr: news.indexOf('\r') };
if (before.lines !== after.lines || before.dollar !== after.dollar ||
    before.tick !== after.tick || after.cr >= 0) {
  console.log('GUARD-FAIL ' + JSON.stringify({before: before, after: after}));
  process.exit(1);
}
const outNoCode = stripCode(out);
for (const E of edits) {
  const re = new RegExp(E.from.replace(/[.*+?^${}()|[\]\\]/g, B + '$&') + '(?![A-Za-z])');
  if (re.test(outNoCode)) { console.log('RESIDUE ' + E.from); process.exit(1); }
}
const ob = Buffer.byteLength(text), nb = Buffer.byteLength(news);
console.log(key + ' from=' + from + ' sites=' + edits.length + ' skipped=' + skipped +
  ' bytes=' + ob + '->' + nb +
  ' +' + (nb - ob) + ' ' + edits.map((E) => E.from + '->' + E.to).join(' '));
if (APPLY) {
  fs.writeFileSync(path.join('_work_backup_' + key + '.pre-expand.md'), text);
  fs.writeFileSync(p, news);
  console.log('APPLIED ' + fs.statSync(p).size);
} else {
  console.log('APPLY=False');
}
