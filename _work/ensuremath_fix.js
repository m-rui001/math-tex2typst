// `\ensuremath{X}` inside a math span is a LaTeX no-op: in math mode it expands to X.
// KaTeX has no such command, so every span carrying it renders as an error. Unwrapping
// keeps the author's own group and invents nothing. The brace-less form (`\ensuremath\mu`)
// is only counted, not rewritten, because how much of what follows belongs to it is
// exactly the kind of thing a name-guess gets wrong.
// Usage: node ensuremath_fix.js [IDprefix] [--apply]
const fs = require('fs');
const path = require('path');
const M = require('./mdmath.js');
const B = M.B, D = M.D, BT = M.BT;
const ROOT = 'E:' + B + B + 'math' + B + B + '研究笔记';
const WORK = 'E:' + B + B + 'math' + B + B + '_work';
const APPLY = process.argv.includes('--apply');
const PREFIX = process.argv.slice(2).find((a) => !a.startsWith('--')) || '';
const CMD = B + 'ensuremath';
const BARE = new RegExp(B + B + 'ensuremath(?!\\s*\\{)', 'g');

const files = fs.readdirSync(ROOT).filter((f) => /^D.*\.md$/.test(f))
  .filter((f) => !PREFIX || f.startsWith(PREFIX)).sort();
const log = [];
let ops = 0, filesTouched = 0, bare = 0;
for (const f of files) {
  const p = path.join(ROOT, f);
  const text = fs.readFileSync(p, 'utf8');
  if (text.includes('\r')) { console.log('SKIP-CR ' + f.slice(0, 12)); continue; }
  const masked = M.fenceMask(text);
  const offs = M.lineOffsets(text);
  const edits = [];
  for (const s of M.spans(masked)) {
    if (s.kind === 'X') continue;
    let i = 0;
    while ((i = s.body.indexOf(CMD, i)) >= 0) {
      let j = i + CMD.length;
      while (j < s.body.length && (s.body[j] === ' ' || s.body[j] === '\t')) j++;
      if (s.body[j] !== '{') {
        BARE.lastIndex = 0;
        i += CMD.length;
        continue;
      }
      let depth = 0, k = j;
      for (; k < s.body.length; k++) {
        if (s.body[k] === '{') depth++;
        else if (s.body[k] === '}') { depth--; if (!depth) break; }
      }
      if (k >= s.body.length) { i += CMD.length; continue; }
      edits.push([s.a + i, s.a + k + 1, s.body.slice(j + 1, k), M.lineOf(offs, s.a + i)]);
      i = k + 1;
    }
    BARE.lastIndex = 0;
    let bm;
    while ((bm = BARE.exec(s.body))) bare++;
  }
  if (!edits.length) continue;
  let out = '', pos = 0;
  for (const e of edits) { out += text.slice(pos, e[0]) + e[2]; pos = e[1]; }
  out += text.slice(pos);
  const cnt = (s, ch) => s.split(ch).length - 1;
  if (out.split('\n').length !== text.split('\n').length ||
      cnt(out, D) !== cnt(text, D) || cnt(out, BT) !== cnt(text, BT) ||
      out.includes('\r') ||
      (out.split(CMD).length - text.split(CMD).length) !== -edits.length) {
    console.log('REFUSE-INVARIANT ' + f.slice(0, 12));
    continue;
  }
  filesTouched++;
  ops += edits.length;
  console.log(f.slice(0, 12) + ' ops=' + edits.length + ' lines=' + edits.map((e) => e[3]).join(','));
  for (const e of edits) log.push(f + '\t' + e[3] + '\t' + e[2].slice(0, 60));
  if (APPLY) {
    fs.copyFileSync(p, path.join(WORK, f.slice(0, 12) + '.pre-emath.md'));
    fs.writeFileSync(p, out);
  }
}
if (APPLY && log.length) {
  fs.writeFileSync(path.join(WORK, 'ensuremath_fix_log.txt'), log.join('\n') + '\n');
}
console.log('TOTAL files=' + filesTouched + ' ops=' + ops + ' bare_untouched=' + bare +
  (APPLY ? ' APPLIED' : ' dry'));
